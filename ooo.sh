#!/bin/bash -e

# define some vars
mailto=$'department@example.com\tanother-dept@example.com'
cc='boss@example.com'

# schedule start date
start="$(pickdate -f '%A %-m/%-d')"
humanstart="$(date -d "$start" +'%a, %b %-e')"

# schedule end date
epochend="$(pickdate -f %s)"
end="$(date -d @$epochend +'%A %-m/%-d')"
humanend="$(date -d "$end" +'%a, %b %-e')"
humanback="$(date -d @$(($epochend + 24*3600)) +'%A')"

# print macro
cat <<EOF
$mailto			${cc}		Out of office $start thru $end	I will be out of the office from $humanstart to $humanend, returning $humanback.

Have a good one.
EOF

