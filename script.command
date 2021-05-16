#!/bin/sh
    sudo -v
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &

    echo "Cleaning Xcode Files..."
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

    echo "Changing Wallpaper"
    curl https://life-is-tech.com/materials/images/summer2021_navy.jpg > ~/Desktop/wallpaper.jpg
    osascript -e 'tell application "System Events" to tell every desktop to set picture to "~/Desktop/wallpaper.jpg"'

    echo "Cleaning User Files..."
    sudo rm -rfv ~/Desktop/*
    sudo rm -rfv ~/Downloads/*

    echo "Cleaning Trash..."
    osascript -e 'tell application "Finder" to set warns before emptying of trash to false' &>/dev/null
    osascript -e 'tell application "Finder" to empty trash' &>/dev/null
    osascript -e 'tell application "Finder" to set warns before emptying of trash to true' &>/dev/null

    osascript -e 'display notification "書類フォルダにファイルが残っていないか確認してください。" with title "PC初期化が完了しました" sound name "alert"' &>/dev/null
echo Completed Restoring
