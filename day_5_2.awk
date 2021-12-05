#!/usr/bin/env awk

{
    split($1, p1, ",")
    split($3, p2, ",")

    # xs are equal
    if(p1[1] == p2[1]) {
        x = p1[1]

        if(p1[2] <= p2[2]) {
            for(y=p1[2]; y<=p2[2]; y++) {
                totals[x,y] += 1
            }
        } else {
            for(y=p2[2]; y<=p1[2]; y++) {
                totals[x,y] += 1
            }
        }
    # ys are equal
    } else if(p1[2] == p2[2]) {
        y = p1[2]
        if(p1[1] <= p2[1]) {
            for(x=p1[1]; x<=p2[1]; x++) {
                totals[x,y] += 1
            }
        } else {
            for(x=p2[1]; x<=p1[1]; x++) {
                totals[x,y] += 1
            }
        }
    # diagonal
    } else {
        if(p1[1] <= p2[1] && p1[2] <= p2[2]) {
            x = p1[1]
            xmax = p2[1]
            y = p1[2]
            ymax = p2[2]
            while(x <= xmax && y <= ymax) {
                totals[x,y] += 1
                x++
                y++
            }
        } else if (p1[1] <= p2[1] && p1[2] > p2[2]) {
            x = p1[1]
            xmax = p2[1]
            y = p1[2]
            ymin = p2[2]
            while(x <= xmax && y >= ymin) {
                totals[x,y] += 1
                x++
                y--
            }
        } else if (p1[1] >= p2[1] && p1[2] <= p2[2]) {
            x = p1[1]
            xmin = p2[1]
            y = p1[2]
            ymax = p2[2]
            while(x >= xmin && y <= ymax) {
                totals[x,y] += 1
                x--
                y++
            }
        } else if (p1[1] >= p2[1] && p1[2] >= p2[2]) {
            x = p1[1]
            xmin = p2[1]
            y = p1[2]
            ymin = p2[2]

            while(x >= xmin && y >= ymin) {
                totals[x,y] += 1
                x--
                y--
            }
        }
    }
}

END {
    for(k in totals) {
        if(totals[k] >= 2) {
            count += 1 
        }
    }

    print count
}