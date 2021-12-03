#!/usr/bin/env awk

{
    split($0, chars, "")
    for (i=1; i <= length($0); i++) {
        if(chars[i] == 1) {
            counts[i] += 1;
        }
    }
}

END {
    for(i=1; i<=length(counts); i++) {
        if(counts[i] > (NR / 2)) {
            gamma_bits[i] = 1
            epsilon_bits[i] = 0
        } else {
            gamma_bits[i] = 0
            epsilon_bits[i] = 1
        }
    }

    gamma = binary_to_decimal(gamma_bits)
    epsilon = binary_to_decimal(epsilon_bits)

    print "gamma " gamma
    print "epsilon " epsilon
    print "product " gamma * epsilon
}

# awk has no native routines to convert between decimal and binary...
function binary_to_decimal(bits) {
    decimal = 0
    for(i=length(bits); i>0; i--) {
        pow_of_2 = 2 ** (length(bits) - i)

        if(bits[i] == 1) {
            decimal += pow_of_2
        }

    }

    return decimal
}