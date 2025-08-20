#!/bin/bash
# monika_checker.sh
LOG_PATH="/home/zoey/Dropbox/96 Just Monika/zoey/AppData/Roaming/itch/apps/ddlc/DDLC-1.1.1-pc/log/aff_log.log"

while true
do
clear
RAWNUMS=$(cat "$LOG_PATH" | tail -n 1 | head -n 1 | grep -o '[[:digit:]]*')

echo -ne "SAVE (CURRENT VALUE) "
echo $RAWNUMS | tail -c 14 | head -c 4
echo ""


RAWNUMSF=$(cat "$LOG_PATH" | grep "FREEZE" | grep -o '[[:digit:]]*')

echo -ne "FREEZE (LIMIT TODAY) "
echo $RAWNUMSF | tail -c 28 | head -c 4

echo ""

sleep 1s

done

