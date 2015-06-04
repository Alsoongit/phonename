#!/bin/bash
INTERACTIVE=True
DIGITS=$(whiptail --title "Open CNAM Lookup" --inputbox "Enter a number in +1XXXXXXXXXX format." 10 60 Enter Digits. 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
   whiptail --textbox /dev/stdin 10 100 <<< "$(curl --silent https://api.opencnam.com/v2/phone/$DIGITS)"
else
    echo "You chose Cancel. Sad Face!"
fi
