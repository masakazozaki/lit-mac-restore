#!/bin/bash

sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

SCRIPT_PATH=$(dirname $0)

bash $SCRIPT_PATH/scripts/adobe.sh
bash $SCRIPT_PATH/scripts/iphone.sh
bash $SCRIPT_PATH/scripts/mozer.sh
bash $SCRIPT_PATH/scripts/common.sh

osascript -e 'display notification "書類フォルダにファイルが残っていないか確認してください。" with title "PC初期化が完了しました" sound name "alert"' &>/dev/null
echo "Completed Restoring"
