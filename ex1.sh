#./bin/bash

# create a script that accepts a filename f, a color c (red, blue, yellow, white or green) and an integer i as args
# and return true iff c appears i times in f (check if args are valid!).

# 1:filename, 2: color, 3: how many time it should appear

# controls
if [ $# != 3 ]; then
    scriptname=$(basename $0)
    echo "wrong number of parameters after $scriptname"
    exit 1
fi

# check if it's a file
if [ ! -f $1 ]; then
    echo "$1 is not a file"
    exit 1
fi

# check if it's an accepted color [to-do] - (red, blue, yellow, white or green)
if (($2 != "red" && $2 != "blue" && $2 != "yellow" && $2 != "white" && $2 != "green"))
then
    echo "$2 is not an accepted color"
    exit 1
fi

# check if i it's a number 
check=$(expr $3 '+' 1 2>/dev/null)
if [ ! $check ]
then
    echo "$3 is not a number"
    exit 1
fi

count=$(cat $1 | grep $2 | wc -l)

if [ $count == $3 ]; then
    echo "True"

else
    echo "False"
fi