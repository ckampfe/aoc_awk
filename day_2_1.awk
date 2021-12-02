#!/usr/bin/env awk

$0 ~ /forward/ { match($0, /[0-9]+/); horizontal_position += substr($0,RSTART,RLENGTH) } 
$0 ~/down/ { match($0, /[0-9]+/); depth += substr($0,RSTART,RLENGTH) }
$0 ~/up/ { match($0, /[0-9]+/); depth -= substr($0,RSTART,RLENGTH) }
END { print horizontal_position * depth }
