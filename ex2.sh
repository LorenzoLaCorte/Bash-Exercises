#./bin/bash

# create a script that accepts an optional arg a. 
# if a is the string ‘empty’ shows all the Linux accounts without password or show others otherwise.

# $1 empty for accounts with empty password

# show all accounts wo pwd, all lines of with / or *

if [ $# != 1 ]; then
    exit 1
fi


sudo cat /etc/shadow | 
while read line
do
    username=$(echo $line | cut -d: -f 1)
    password=$(echo $line | cut -d: -f 2)

    if [ $1 == "empty" ]; then
        if [[ $password == "!" || $password == "*" ]]; then
            echo $username
        fi
    else
        if [[ $password != "!" && $password != "*" ]]; then
            echo "$username $password"
        fi
    fi

done