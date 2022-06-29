#!/bin/bash

alias scripts='code ~/scripts/.bash_scripts.sh'
alias restart='source ~/.zshrc'

function vm() {
        if ping -c 1 -W 1 "dev.bitly.org" | grep -q "1 packets received"; then
                ssh root@dev.bitly.org
        else
                pushd ~/devvm ; vagrant up ; vagrant ssh
        fi
}

function startwork() {
        local tab1="github.com/akleventis" tab2="gmail.com" tab3="calendar.google.com/"
        open --new -a "Google Chrome" --args --profile-directory="Profile 1"  $tab1 $tab2 $tab3
        open /Applications/Slack.app ; open /Applications/Visual\ Studio\ Code.app ; 
        sleep 2 ; tube "$1" ; vm 
}

function tube() {
    local tab="https://youtube.com"
    case $1 in 
      "lofi") tab="https://bit.ly/3MSt1tP" ;;
      "jazz") tab="https://bit.ly/3ar8fDd"
    esac
    osascript -e 'tell application "System Events"
        do shell script quoted form of "/System/Applications/Mission Control.app/Contents/MacOS/Mission Control"
        click button 1 of group "Spaces Bar" of group 1 of group "Mission Control" of process "Dock"
        do shell script quoted form of "/System/Applications/Mission Control.app/Contents/MacOS/Mission Control"
        key code 124 using control down
        end tell'
    open --new -a "Google Chrome" --args --profile-directory="Profile 2"  $tab ; sleep 2 ; 
    osascript -e 'tell application "System Events" to key code 123 using control down'
}

function compress() {
        gifsicle -O3 --lossy=80 $1 -o $1
        echo "done"
}

function gif() {
        ffmpeg -i $1 output.gif && gifsicle -O3 output.gif -o output.gif && echo "Video is ready!"
}

function itsadventuretime () {
        echo "                
                     []     
                o////||::==========================-
                     [] 
                         | (• ◡•)| ╯╰(❍ᴥ❍ʋ)
                                             []
                -==========================::||////o
                                             []
                "
}