#!/usr/bin/env awk

{
    print length($0)
    split($0, positions, ",")
    min = positions[1]
    max = positions[10]
    for(k in positions) {
        if(positions[k] < min) {
            min = positions[k]
        }
        if(positions[k] > max) {
            max = positions[k]
        }
    }

    min_energy = energy_required(100, positions)
    min_pos = 100
    for(pos=1; pos<=max; pos++) {
        er = energy_required(pos, positions)
        if(er < min_energy) {
            min_energy = er
            min_pos = pos
        }
    }

    print "min: " min
    print "max: " max
    print "min energy " min_energy
    print "min pos " min_pos
}

function energy_required(chosen_n, positions) {
    minenergy = 0
    for(k in positions) {
        minenergy += energy_overhead(abs_diff(positions[k], chosen_n))
    }

    return minenergy
}

function abs_diff(a, b) {
    if(a < b) {
        return b - a
    } else {
        return a - b
    }
}

# https://letstalkscience.ca/educational-resources/backgrounders/gauss-summation
function energy_overhead(e) {
    return e * (e + 1) / 2
}
