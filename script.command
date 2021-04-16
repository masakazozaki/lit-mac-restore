#!/bin/sh
    sudo -v
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &

    echo "Cleaning Xcode Files..."
    # instruments -s devices \
    #  | grep Simulator \
    #  | grep -o "[0-9A-F]\{8\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{12\}" \
    #  | while read -r line ; do
    #     echo "Reseting Simulator with UDID: $line"
    #     xcrun simctl erase $line
    # done
    if type "xcrun" &>/dev/null; then
        echo 'Cleaning up iOS Simulators...'
        osascript -e 'tell application "com.apple.CoreSimulator.CoreSimulatorService" to quit' &>/dev/null
        osascript -e 'tell application "iOS Simulator" to quit' &>/dev/null
        osascript -e 'tell application "Simulator" to quit' &>/dev/null
        xcrun simctl shutdown all &>/dev/null
        xcrun simctl erase all &>/dev/null
    fi

    sudo rm -rfv ~/Library/Developer/Xcode/DerivedData/*
    sudo rm -rfv ~/Library/Developer/Xcode/iOS\ DeviceSupport/*

    echo "Cleaning User Files..."
    sudo rm -rfv ~/Desktop/*
    sudo rm -rfv ~/Downloads/*
    sudo rm -rfv ~/.Trash/*
    echo "Cleaning KeyChains"
    sudo rm -rfv ~/Library/Keychains/*
    echo "Cleaning Google Chrome..."
    sudo rm -rfv ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/*
    sudo rm -rfv ~/Library/Application\ Support/Google/Chrome/*
    echo "Cleaning Saferi..."
    rm -rfv ~/Library/Safari/*
    echo "Cleaning Mozer..."
    sudo rm -rfv ~/Applications/MozerLessonApp.app
    sudo rm -rfv ~/Library/Application\ Support/MozerLessonApp
    sudo rm ~/Library/Preferences/io.mozer.mozer-lesson-app.helper.plist
    sudo rm ~/Library/Preferences/io.mozer.mozer-lesson-app.plist
    sudo rm -rfv ~/Library/Saved Application State/io.mozer.mozer-lesson-app.savedState
    echo "Cleaning Adobe Cache Files..."
    sudo rm -rf ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/*

echo Completed Restoring
