#!/usr/bin/env awk

NR >= 3 { lastsum = sum; sum = $1 + last + lastlast }
NR > 3 && sum > lastsum { increases += 1 }
{ lastlast = last; last = $1 }
END { print increases }
