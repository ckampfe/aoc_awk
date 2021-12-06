#!/usr/bin/env awk

{ split($0, initial_fish, ",") }

END {
    for(k in initial_fish) {
        fish[initial_fish[k]] += 1
    }

    days_elapsed = 0

    while(days_elapsed < 80) {
        zero = fish[0];
        one = fish[1]
        two = fish[2]
        three = fish[3]
        four = fish[4]
        five = fish[5]
        six = fish[6]
        seven = fish[7]
        eight = fish[8]

        fish[8] = zero
        fish[7] = eight
        fish[6] = seven + zero
        fish[5] = six
        fish[4] = five
        fish[3] = four
        fish[2] = three
        fish[1] = two
        fish[0] = one

        days_elapsed++
    }

    for(k in fish) {
        count += fish[k]
    }

    print count
}