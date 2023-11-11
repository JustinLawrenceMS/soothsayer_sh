#!/bin/bash
read -p "What is your name: " name;
read -p "What knowledge do you seek? " saught;
sooth=$(curl -s https://soothsayer-api.com/api/v1/sooths/fortune);
printf "\n\n $saught \n\n $sooth \n\n";
