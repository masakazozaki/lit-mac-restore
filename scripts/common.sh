#!/bin/bash

echo "Changing Wallpaper"
curl -o $HOME/Desktop/wallpaper.jpg https://life-is-tech.com/materials/images/21sum-wallpaper-aquablue.jpg
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$USER_HOME/Desktop/wallpaper.jpg\""

echo "Cleaning KeyChains"
sudo rm -rf $HOME/Library/Keychains/*

echo "Cleaning Google Chrome..."
sudo rm -rf $HOME/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/*
sudo rm -rf $HOME/Library/Application\ Support/Google/Chrome/*

echo "Cleaning Saferi..."
sudo rm -rf $HOME/Library/Safari/*

echo "Cleaning User Files..."
sudo rm -rf $HOME/Desktop/*
sudo rm -rf $HOME/Downloads/*

echo "Cleaning Trash..."
osascript -e 'tell application "Finder" to set warns before emptying of trash to false' &>/dev/null
osascript -e 'tell application "Finder" to empty trash' &>/dev/null
osascript -e 'tell application "Finder" to set warns before emptying of trash to true' &>/dev/null