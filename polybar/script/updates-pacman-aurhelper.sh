#!/bin/sh
echo $(checkupdates 2> /dev/null | wc -l)
# updates_aur=$(yay -Qum 2> /dev/null | wc -l)
