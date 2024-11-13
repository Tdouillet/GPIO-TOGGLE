#!/bin/sh

### BEGIN INIT INFO
#Provides: esme-led
#Required-Start: $remote_fs $time
#Required-Stop: $remote_fs $time
#Default-Start: 3 4 5
#Default-Stop 0 1 2 6
#Short-Description: ESME LED GPIO#17 toggle service
### END INIT INFO

PROGRAM_PATH="/usr/bin/gpio"
PID_PATH="/tmp/esme-led.pid"

case "$1" in
	start)
		echo "Start"
		if [ -f "$PID_PATH" ]
		then
			echo "LED running"
		else
			$PROGRAM_PATH & 
			echo $? > "$PID_FILE"
			echo "LED started with PID"
		fi
	;;
	stop)
		echo "Stop"
		if [ -f "$PID_PATH" ]
		then
			kill "$(cat $PID_PATH)"
			rm "$PID_PATH"
			echo "LED stopped"
		else
			echo "Led not running"
		fi
	;;
	restart)
		echo "Restart"
		$0 stop
		$0 start
	;;
	status)
		if [ -f "$PID_PATH" ]
		then
			echo "LED is running"
		else
			echo "LED is not running"
		fi
	;;
	*)
		echo "Usage :"
		echo "start : start script"
		echo "stop : stop script"
		echo "restart : restart script"
		echo "status : get script status"
	;;
esac

exit 0
