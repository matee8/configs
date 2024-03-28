#!/bin/bash


if [ -z "$@" ]; then
    echo -en "Suspend\0icon\x1fsystem-suspend\n"
    echo -en "Logout\0icon\x1fsystem-log-out\n"
    echo -en "Reboot\0icon\x1fsystem-reboot\n"
    echo -en "Shutdown\0icon\x1fsystem-shutdown\n"
else
    if [ "$1" = "Shutdown" ]; then
        shutdown now
    elif [ "$1" = "Logout" ]; then
        i3-msg exit
    elif [ "$1" = "Reboot" ]; then
        reboot
    elif [ "$1" = "Suspend" ]; then
        systemctl suspend
    fi
fi
