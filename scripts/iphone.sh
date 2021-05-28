#!/bin/bash

echo "Cleaning Xcode Files..."
if type "xcrun" &>/dev/null; then
  echo 'Cleaning up iOS Simulators...'
  osascript -e 'tell application "com.apple.CoreSimulator.CoreSimulatorService" to quit' &>/dev/null
  osascript -e 'tell application "iOS Simulator" to quit' &>/dev/null
  osascript -e 'tell application "Simulator" to quit' &>/dev/null
  xcrun simctl shutdown all &>/dev/null
  xcrun simctl erase all &>/dev/null
fi

sudo rm -rf $HOME/Library/Developer/Xcode/DerivedData/*
sudo rm -rf $HOME/Library/Developer/Xcode/iOS\ DeviceSupport/*