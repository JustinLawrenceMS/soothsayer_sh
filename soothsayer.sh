#!/bin/bash
brew bundle
read -p "What is your name: " name;
read -p "What knowledge do you seek? " saught;
sooth=$(curl -s https://soothsayer-api.com/api/v1/sooths/fortune);
fortune=$(jq -r '.data.sooth' <<< "$sooth")
printf "\n\n $saught \n\n $fortune \n\n";
