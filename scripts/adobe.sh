#!/bin/bash

echo "Logging out Adobe..."
ps aux | grep Adobe | grep -v grep | awk '{ print "sudo kill -9", $2 }' | sh
sudo security delete-generic-password -l Adobe\ User\ Info "$HOME/Library/Keychains/login.keychain"
sudo security delete-generic-password -l Adobe\ User\ OS\ Info "$HOME/Library/Keychains/login.keychain"

echo "Cleaning Adobe Cache Files..."
sudo rm -rf $HOME/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/*
