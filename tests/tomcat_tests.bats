#!/bin/bash

@setup {
	TOMCAT="../tomcat.sh"
	PIDS=$(pidoff tomcat)
	for pid in PIDS do
		kill pid
		sleep 5
	done
	#OUTPUT=""
}

######## General Functions #######

# Print an error message on standard output.
# $1 Message to print.
#print_error() {
#	echo "ERROR: $1"
#}

# Print an success message on standard output.
# $1 Message to print.
#print_success() {
#	echo "SUCCESS: $1"
#}

# $1 commad to tomcat script.
#call_tomcat_script() {
#	OUTPUT=$($TOMCAT $1)
#	return $?
#}

# Run a test.
# $1: Test name.
# $2: tomcat command.
# $3: Error message.
# $4: Success message.
#test() {
#	echo $1
#	call_tomcat_script $2
#
#	if [ $? -ne 0 ]; then
#		print_error $3
#	else
#		print_success $4
#	fi
#}


######## evn config  #######

# Start in a clean enviroment.
#TEMP=$($TOMCAT stop)

#if [ $? -ne 0 ]; then
#	print_error "Can't set a clean enviroment."
#fi 

######## Tests #######

#test "Start tomcat" start \
#	"Tomcat failed to start, check SERVICE_START_WAIT_TIME value on /etc/default/tomcat" \
#	"Tomcat started"
@test Start tomcat {
	run $TOMCAT start
	[ "$status" -eq 0 ]
}

@test Double start tomcat {
	run $TOMCAT start
	[ "$status" -eq 0 ]
	
	run $TOMCAT start
	[ "$status" -eq 1 ]

}

#test "Stop tomcat" stop \
#	"Tomcat failed to stop." \
#	"Tomcat stoped"

#test "Restart tomcat" restart \
#	"Tomcat failed to restart" \
#	"Tomcat restarted"

#test "Reload tomcat" reload \
#	"Tomcat failed to reload" \
#	"Tomcat reloaded"

#test "Force-reload tomcat" force-reload \
#	"Tomcat failed to force-reload" \
#	"Tomcat foced to reload"

#test "Try restart tomcat" try-restart \
#	"Tomcat failed to try-restart" \
#	"Tomcat restarted"


