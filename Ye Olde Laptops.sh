#!/bin/bash

# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
#Older version hence "Ye Olde"

HEIGHT=15
WIDTH=50
CHOICE_HEIGHT=7
BACKTITLE="Have fun n00bz!"
TITLE="Laptop Scripts"
MENU="Choose one of the following options:"

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                1 "Build" \
                2 "QC" \
                3 "Grant QC" \
                4 "OEM Rollback" \
                5 "Broadcom Drivers" \
                6 "Libdvd" \
                7 "Regionset" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
    1)
		dialog --title "Build" --msgbox "\nYou have chosen Build!\n\n\nClick ENTER key to continue..." 10 50; clear;
        ping -c1 data
if [ $? -eq 0 ]
	then
	dialog --title "Action Required" --msgbox "\nSpeaker test. Turn it up!\n\n\nClick ENTER key to continue..." $HEIGHT $WIDTH; clear;
	speaker-test -t wav -c2 -l1
	sudo apt install oem-config-gtk -y
	sudo apt install cheese -y
	wget -O - build/tools | sh
	cheese
	stress-test
	dialog --title "Action Required" --msgbox "\nPlug in headphones for the next test.\n\n\nClick ENTER key to continue..." $HEIGHT $WIDTH; clear;
	speaker-test -t wav -c2 -l1
	eject
	dialog --title "Action Required" --msgbox "\nTest optical drive.\n\n\nClick ENTER key to continue..." $HEIGHT $WIDTH; clear;
	printme
	sudo apt update && sudo apt upgrade -y
	dialog --title "Action Required" --msgbox "\nSystem will shutdown, complete any unfinished testing.\n\n\nClick ENTER key to continue..." $HEIGHT $WIDTH; clear;
	shutdown -P now
	else
	echo Please connect an ethernet cable and try again.
fi
        ;;
    2)
        echo "You chose QC"
        ping -c1 data

if [ $? -eq 0 ]
	then
	wget -O - build/tools | sh
	dialog --title "Action Required" --msgbox "\nSpeaker test. Turn it up!\n\n\nClick ENTER key to continue..." 10 50; clear;
	speaker-test -t wav -c2 -l1
	sudo apt install oem-config-gtk -y
	sudo apt install cheese -y
	cheese
	stress-test
	dialog --title "Action Required" --msgbox "\nPlug in headphones for the next test.\n\n\nClick ENTER key to continue..." 10 50; clear;
	speaker-test -t wav -c2 -l1
	sudo apt update && sudo apt upgrade -y
	eject
	dialog --title "Action Required" --msgbox "\nTest optical drive.\n\n\nClick ENTER key to continue..." 10 50; clear;
	dialog --title "Action Required" --msgbox "\nPrintme is starting, don't forget battery % in notes.\n\n\nClick ENTER key to continue..." 10 50; clear;
	printme
	passwd
	dialog --title "Action Required" --msgbox "\nSystem will shutdown, complete any unfinished testing.\n\n\nClick ENTER key to continue..." 10 50; clear;
	shutdown -P now
	else 
	echo Please connect an ethernet cable and try again

fi
        ;;
    3)
        echo "You chose Grant QC"
        ping -c1 data
if [ $? -eq 0 ]
	then
	wget -O - build/tools | sh
	dialog --title "Action Required" --msgbox "\nSpeaker test. Turn it up!\n\n\nClick ENTER key to continue..." 10 50; clear;
	speaker-test -t wav -c2 -l1
	sudo apt install oem-config-gtk -y
	sudo apt install cheese -y
	cheese
	stress-test
	dialog --title "Action Required" --msgbox "\nPlug in headphones for the next test.\n\n\nClick ENTER key to continue..." 10 50; clear;
	speaker-test -t wav -c2 -l1
	sudo apt update
	sudo apt upgrade -y
	eject
	dialog --title "Action Required" --msgbox "\nTest optical drive.\n\n\nClick ENTER key to continue..." 10 50; clear;
	dialog --title "Action Required" --msgbox "\nPrintme is starting, don't forget battery % in notes.\n\n\nClick ENTER key to continue..." 10 50; clear;
	printme
	oem-config-prepare
	dialog --title "Action Required" --msgbox "\nSystem will shutdown, complete any unfinished testing.\n\n\nClick ENTER key to continue..." 10 50; clear;
	shutdown -P now
	else
	echo Please connect a network cable and try again.
fi
        ;;
    4)
		echo "You chose OEM Rollback"
	sudo rm -r /etc/systemd/system/oem-config-target.wants
	sudo rm -r /etc/systemd/system/default.target
	sudo apt purge oem-config-gtk -y
	sudo apt install  oem-config-gtk -y
	sudo reboot
		;;
	5) 
		echo "You chose Broadcom Drivers"
	sudo apt purge bcmwl* -y
	sudo apt install b43-fwcutter firmware-b43-installer -y	
		;;
	6)
		echo "You chose Libdvd"
	sudo apt install libdvd-pkg -y
	sudo dpkg-reconfigure libdvd-pkg	
		;;
	7)
		echo "You chose Regionset"
	sudo rm -R ~/.dvdcss/
	sudo apt install regionset -y
	regionset /dev/sr0
		;;
esac
