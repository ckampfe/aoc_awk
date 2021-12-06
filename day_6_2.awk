#!/usr/bin/env awk

{ split($0, initial_fish, ",") }

END {
    for(k in initial_fish) {
        fish[initial_fish[k]] += 1
    }

    days_elapsed = 0

    while(days_elapsed < 256) {
        zero = fish[0];

        fish[0] = fish[1];
        fish[1] = fish[2];
        fish[2] = fish[3];
        fish[3] = fish[4];
        fish[4] = fish[5];
        fish[5] = fish[6];
        fish[6] = fish[7] + zero;
        fish[7] = fish[8];
        fish[8] = zero;

        days_elapsed++
    }

    for(k in fish) {
        count += fish[k]
    }

    print count
}