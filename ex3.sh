#./bin/bash

# create a script that accepts a program name n and a message m as args.
# It loops checking if n is running. If n is not running, logs for 3 times the message m. 

while pidof $1
do
    echo "Running"
    sleep 3
done

for i in 1 2 3
do
    logger "$1 is not running $i"
done

# puts is output in /var/log/syslog