#!/bin/sh

time_for_greetings () {
a="Доброе утро!"
b="Добрый день!"
c="Добрый вечер!"
d="Доброй ночи!"
hour=$1
      if [ -z "$hour" ]; then
	  echo "Error! empty arg for time_for_greetings () func" >$2
	  return 1
      fi	

      if [ 0 -gt "$hour" ] || [ "$hour" -gt 23 ]; then
	  echo "Error! arg not in [0, 23]" >$2
	  return 2
      fi  

      if [ "$hour" -le 5 ] || [ "$hour" -gt 23 ]; then
	  echo "$d"
      elif [ "$hour" -le 12 ]; then
          echo "$a"
      elif [ "$hour" -le 17 ]; then
          echo "$b"
      elif [ "$hour" -le 22 ]; then
          echo "$c"
      else
          return 1
      fi
}


run_test () {
      set -x -e
      [ "$(time_for_greetings 0)" = "Доброй ночи!" ]  
      [ "$(time_for_greetings 9)" = "Доброе утро!" ]
      [ "$(time_for_greetings 15)" = "Добрый день!" ]
      [ "$(time_for_greetings 21)" = "Добрый вечер!" ]
      ! time_for_greetings -3
      ! time_for_greetings
}

main () {
	x=`date +%H`
        time_for_greetings $x

}

if [ "$1" = "--test" ]; then
        run_test
else
       main
fi       
