#!/usr/bin/env awk

$1 > previous && NR > 1 { increases += 1 }
{ previous = $1 }
END { print increases }
