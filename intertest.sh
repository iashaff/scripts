#!bin/bash -xe

E="Равносторонний треугольник"
R="Равнобедренный треугольник"
O="Обычный треугольник"

success () {
	set -x -e
	[ "$(echo $1 $2 $3 | ./math.sh)" = "$4" ]	
	[ "$(echo $2 $1 $3 | ./math.sh)" = "$4" ]
	[ "$(echo $2 $3 $1 | ./math.sh)" = "$4" ]
	[ "$(echo $3 $1 $2 | ./math.sh)" = "$4" ]
	[ "$(echo $3 $2 $1 | ./math.sh)" = "$4" ]
	[ "$(echo $1 $3 $2 | ./math.sh)" = "$4" ]
}

fail () {
	set -x -e
        [ "$(echo $1 $2 $3 | ./math.sh)" = "$4" ]
        [ "$(echo $2 $1 $3 | ./math.sh)" = "$4" ]
        [ "$(echo $2 $3 $1 | ./math.sh)" = "$4" ]
        [ "$(echo $3 $1 $2 | ./math.sh)" = "$4" ]
        [ "$(echo $3 $2 $1 | ./math.sh)" = "$4" ]
        [ "$(echo $1 $3 $2 | ./math.sh)" = "$4" ]

}
 
success 5 5 5 "$E"
success 4 5 4 "$R"
success 5 4 6 "$O"
success 9223372036854775807 9223372036854775807 9223372036854775807 "$E"
success 9223372036854775807 9223372036854775807 9999999999999999 "$R"
success 18446744073709551614 18446744073709551618 18446744073709551616 "$O"

fail 1 10 20
fail 0 5 6
fail -25 36 25
fail b 8 9
fail / 18 24
fail '*' 8 9
fail '!@' 10 11
fail 4 5 '8 9'
fail 89 87
fail
