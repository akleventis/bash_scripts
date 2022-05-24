#!/bin/bash

function scripts() { code ~/scripts/.bash_scripts.sh }

function restart() { clear ; exec zsh -l }

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
        sleep 2 ; test ; vm 
}

function test() {
        local jazz="https://www.youtube.com/watch?v=mgBFGwsmdOQ"
        osascript -e 'tell application "System Events"
                do shell script quoted form of "/System/Applications/Mission Control.app/Contents/MacOS/Mission Control"
                click button 1 of group "Spaces Bar" of group 1 of group "Mission Control" of process "Dock"
                do shell script quoted form of "/System/Applications/Mission Control.app/Contents/MacOS/Mission Control"
                key code 124 using control down
                end tell'
        open --new -a "Google Chrome" --args --profile-directory="Profile 2"  $jazz ; sleep 2 ; 
        osascript -e 'tell application "System Events" to key code 123 using control down'
}

function tube() {
        if [[ $1 = "lofi" ]]; then
                local tab="https://youtu.be/5qap5aO4i9A"
        elif [[ $1 == "jazz" ]]; then
                local tab="https://youtu.be/fEvM-OUbaKs"
        else return
        fi
        open --new -a "Google Chrome" --args --profile-directory="Profile 2" $tab
}

function compress() {
        gifsicle -O3 --lossy=80 $1 -o $1
        echo "sweg"
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