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
    } 

    # ys are equal
    if(p1[2] == p2[2]) {
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