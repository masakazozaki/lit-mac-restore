#!/bin/sh

    instruments -s devices \
     | grep Simulator \
     | grep -o "[0-9A-F]\{8\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{4\}-[0-9A-F]\{12\}" \
     | while read -r line ; do
        echo "Reseting Simulator with UDID: $line"
        xcrun simctl erase $line
    done

    rm -rf ~/Library/Developer/Xcode/DerivedData/*
    rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*
    rm -rf ~/Desktop/*
    rm -rf ~/Downloads/*
    rm -rf ~/.Trash
    rm -rf ~/Library/Keychains/*
    rm -rf ~/Library/Application\ Support/Google/Chrome/*
    rm -rf ~/Library/Safari/*
    rm -rf ~/Applications/MozerLessonApp.app
    rm -rf ~/Library/Application\ Support/MozerLessonApp
    rm ~/Library/Preferences/io.mozer.mozer-lesson-app.helper.plist
    rm ~/Library/Preferences/io.mozer.mozer-lesson-app.plist
    rm -rf ~/Library/Saved Application State/io.mozer.mozer-lesson-app.savedState

echo Completed Restoring
