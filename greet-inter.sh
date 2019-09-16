#!/bin/bash -xe

run_test () {
	datetime=$1
	expect="$2"

	date --set="$datetime"
	[ "$(./greet.sh)" = "$expect" ]

}


run_test 5:00 "Доброй ночи!"
run_test 6:00 "Доброе утро!"
run_test 13:00 "Добрый день!"
run_test 21:00 "Добрый вечер!"
