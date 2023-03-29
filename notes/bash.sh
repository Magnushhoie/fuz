## BASH commands ##

__your notes here__


__bash commandline hotkeys__
Arrow up/down: show previous/next commands from history
# Movement
Ctrl + A: go to beginning of lineope
Ctrl + E: end of line
Ctrl + K: delete to end of line
Ctrl + U: delete to beginning of line
# History
Ctrl + R: Search history backwards
Ctrl + S: Search history forward
Ctrl + O - Run command found using ctrl + R

__bash for loop__
array=$(ls)
for var in ${array[@]}
do
    echo "$var"
done
