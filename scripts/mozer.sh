#!/bin/bash

echo "Cleaning Mozer..."
sudo rm $HOME/Library/Preferences/io.mozer.mozer-lesson-app.plist
sudo rm $HOME/Library/Preferences/io.mozer.mozer-lesson-app.helper.plist
sudo rm -rf /Applications/MozerLessonApp.app
sudo rm -rf $HOME/Library/Application\ Support/MozerLessonApp
sudo rm -rf $HOME/Library/Saved\ Application\ State/io.mozer.mozer-lesson-app.savedState
sudo rm -rf /private/var/db/receipts/io.mozer.mozer-lesson-app.bom
sudo rm -rf /private/var/db/receipts/io.mozer.mozer-lesson-app.plist