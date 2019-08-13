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
    mkdir -p ~/Chrome\ Junk/
    mv ~/Library/Application\ Support/Google/Chrome ~/Chrome\ Junk
    rm -rf ~/Chrome\ Junk/
    rm -rf ~/Library/Safari/*
echo Completed Restoring


