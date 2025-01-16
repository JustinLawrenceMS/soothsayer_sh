#!/bin/bash
brew bundle >/dev/null
display_menu() {
	echo "These are the fortunetellers:"
	echo "1. Don Quixote"
	echo "2. The Rubaiyyat"
}
handle_fortuneteller() {
	read -p "Which fortuneteller do you want to use? " fortuneteller
	if [ $fortuneteller == "1" ]; then
		sooth=$(curl -s https://fortune.at.chiclay.com/api/v1/donquixote/sentences?sentences=1)
		fortune=$(jq -r '.ipsum_text' <<<"$sooth")
	elif [ $fortuneteller == "2" ]; then
		sooth=$(curl -s https://fortune.at.chiclay.com/api/v1/sooths/fortune)
		fortune=$(jq -r '.data.sooth' <<<"$sooth")
	else
		echo "invalid option"
		recurse
	fi
}
read -p "What is your name: " name
read -p "What knowledge do you seek? " saught
display_menu
handle_fortuneteller
printf "\n\n Hello, $name, \n\n $saught \n\n $fortune \n\n"
