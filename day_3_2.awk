#!/usr/bin/env awk

{
    split($0, chars, "")

    for (i=1; i <= length($0); i++) {
        lines[NR] = $0
    }
}

END {
    clone_array_into(lines, ox_bits)

    bit_i = 1

    while (length(ox_bits) != 1) {
        for(k in ox_bits) {
            line = ox_bits[k]

            split(line, line_bits, "")

            if(line_bits[bit_i] == 0) {
                zeroes[k] = line
            } else {
                ones[k] = line
            }
        }

        zeroes_length = length(zeroes)
        ones_length = length(ones)

        if(zeroes_length == ones_length) {
            delete ox_bits
            for (k in ones) {
                ox_bits[k] = ones[k]
            }
        } else {
            if(zeroes_length < ones_length) {
                delete ox_bits
                for (k in ones) {
                    ox_bits[k] = ones[k]
                }
            }  else {
                delete ox_bits
                for (k in zeroes) {
                    ox_bits[k] = zeroes[k]
                }
            }
        }

        delete ones
        delete zeroes

        bit_i++
    }


    clone_array_into(lines, co2_bits)

    bit_i = 1

    while (length(co2_bits) != 1) {
        for(k in co2_bits) {
            line = co2_bits[k]

            split(line, line_bits, "")

            if(line_bits[bit_i] == 0) {
                zeroes[k] = line
            } else {
                ones[k] = line
            }
        }

        zeroes_length = length(zeroes)
        ones_length = length(ones)

        if(zeroes_length == ones_length) {
            delete co2_bits
            for (k in zeroes) {
                co2_bits[k] = zeroes[k]
            }
        } else {
            if(zeroes_length < ones_length) {
                delete co2_bits
                for (k in zeroes) {
                    co2_bits[k] = zeroes[k]
                }
            }  else {
                delete co2_bits
                for (k in ones) {
                    co2_bits[k] = ones[k]
                }
            }
        }

        delete ones
        delete zeroes

        bit_i++
    }

    for (k in ox_bits) {
        split(ox_bits[k], ox_line_bits, "")
        ox = binary_to_decimal(ox_line_bits)
    }

    for (k in co2_bits) {
        split(co2_bits[k], co2_line_bits, "")
        co2 = binary_to_decimal(co2_line_bits)
    }

    print "OX: " ox
    print "CO2: " co2
    print "PRODUCT: " ox * co2
}

function binary_to_decimal(bits) {
    decimal = 0
    for(i = length(bits); i > 0; i--) {
        pow_of_2 = 2 ** (length(bits) - i)

        if(bits[i] == 1) {
            decimal += pow_of_2
        }

    }

    return decimal
}

function clone_array_into(array, new_array) {
    for(k in array) {
        new_array[k] = array[k]
    }

    return new
}