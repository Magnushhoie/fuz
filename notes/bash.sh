## BASH commands ##

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

__bash commands tldr lookup__
# Download https://tldr.sh/
npm install -g tldr
# Run tldr <command>
tldr grep

__bash fzf, interactive bash history searches__
# https://github.com/junegunn/fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Interactively search history with FZF
Ctrl + R

__bash suspend, resume process
Control + Z # suspend
fg # resume

__bash find files, execute command__
find . -name projects -exec realpath {} \;
find . -name projects -exec ls -alh {} \;

__bash for loop__
array=$(ls)
for var in ${array[@]}
do
    echo "$var"
done

__bash loop over two arrays__
array=($(seq 1 1 20))
array2=(A C D E F G H I K L M N P Q R S T V W Y)

for index in ${!array[*]}; do
  echo "${array[$index]} is in ${array2[$index]}"
done

__bash find and kill process__
# Find ID for the given process, e.g. Chrome
pgrep chrome
kill -9 <ID>

# Kill all processes with given name, e.g. Chrome
pkill -f chrome