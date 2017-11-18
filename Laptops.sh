#!/bin/bash

# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script


DIALOG_HEIGHT=17
DIALOG_WIDTH=50
HEIGHT=15
WIDTH=50
CHOICE_HEIGHT=6
TITLE="Laptop Scripts"
MENU="Choose one of the following options:"

CHOICE=$(dialog --clear \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                1 "Build" \
                2 "QC" \
                3 "OEM Rollback" \
                4 "Broadcom Drivers" \
                5 "Libdvd" \
                6 "Regionset" \
                7 "Production Day Build" \
                8 "Production Day QC" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
    1)
		dialog --title "Build" --msgbox "\nYou have chosen Build!\n\n\nClick ENTER key to continue..." 10 50; clear;
        ping -c1 data

		if [ $? -eq 0 ]
			then
			dialog --title "Hello!" --msgbox "\nWelcome to the Build Program. Make sure that you have a build binder handy and open to the build section, then press Enter." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Speaker Test" --msgbox "\nThe first thing we are going to do is test the speakers on this machine. Review Section 10 in the build section of the laptops binder to understand what it's doing and why. Turn up the volume! If you don't hear anything, please consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			speaker-test -t wav -c2 -l1
			dialog --title "Headphone Test" --msgbox "\nNow we are going to test the headphone jack. Plug in some headphones and turn the volume down so you don't deafen yourself. If you don't hear anything, please consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			speaker-test -t wav -c2 -l1
			dialog --title "Stress Testing the CPU" --msgbox "\nNext we will test the processor by installing some scripts from our tools on the Free Geek server. Type 'freegeek' when prompted for a password. Beware! The cursor will not move when you input the password! Just keep typing and press enter after you have typed the password.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			wget -O - build/tools | sh
			stress-test
			dialog --title "WiFi Test" --msgbox "\nTo test the WiFi, we need to unplug the ethernet cable and connect to the Freegeek WiFi network. Open Firefox and run a google search for Free Geek Mothership. If this doesn't work, consult your instructor. Otherwise...\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Drivers" --msgbox "\nNow we will check to see if there are any necessary drivers for this laptop. Reconnect the ethernet cable and open the Menu in the lower left corner of the screen. In the text box type driver and select the driver manager. Enter freegeek as the password. If any drivers show up, ask your instructor for further instruction. Also see section 13 in the Build section of the laptop binder for additional information.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			eject
			dialog --title "Optical Drive" --msgbox "\nThe optical drive should have opened, and now you should take an audio CD and place it in the drive. A menu will appear, and you should select VLC from the dropdown menu and check the box saying 'Always Perform this Action.' If the CD plays, repeat with a DVD. If the DVD plays, utter a Huzzah! If these do not function properly, review section 15 in the Build section of the laptop binder and consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "USB Ports" --msgbox "\nNow grab a USB mouse and test to make sure that you are able to move the mouse cursor when it is plugged into each of the USB ports. Make note of any ports that do not function and cover broken or non-functional ports with electrical tape.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Webcam" --msgbox "\nWe will test the webcam next.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt install cheese
			cheese
			dialog --title "HDMI" --msgbox "\nTake the laptop to the monitor at the end of the bench, and plug in the HDMI cable. You should see the screen wake up and something will be displayed. If so, return to your place on the bench and reconnect the power cable and ethernet cable. If not, consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "OEM Config" --msgbox "\nNow we will install the OEM Config software we use to make sure that everyone sets their own username and password when they receive this laptop from Free Geek.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt install oem-config-gtk
			dialog --title "System Updates" --msgbox "\nWe will now install any software and system updates for this laptop to ensure the best possible security and most stable experience on this laptop. While this is occuring, check out step 17 in the binder and follow the directions for store display directions.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt update && sudo apt upgrade -y
			dialog --title "Battery Quest" --msgbox "\nSee the instructions for battery testing in part 17 of the binder. If you have a battery below 70% capacity, prepare yourself for Battery Quest. Good Luck! \n\n\nPress Enter once you have finished checking the battery..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Power/Display Settings" --msgbox "\nRead the instructions in section 17 of the build part of the laptops binder. Make sure you both Prepare the system for display in the store and change the More Display Settings.\n\n\nPress Enter once you have made the necessary changes..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Printme" --msgbox "\nWe are almost finished! Now we will run printme, a piece of software that will ask you some questions and assemble a specification sheet for this laptop. Please answer all of the questions.\n\nBe sure to record the battery capacity (%) in the noteworthy items!!\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			printme
			dialog --title "Shutdown" --msgbox "\nCongratulations, you have finished building this laptop! This laptop will now shutdown, so prepare to move this laptop to the testing rack and begin memtest86+. Consult the instructions part 18 of the build section of the binder to do so.\n\n\nThank you for all your help and press Enter to shutdown..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			shutdown -P now
			else
			echo Please connect an ethernet cable and try again.
		fi
    ;;
    2)
        ping -c1 data

		if [ $? -eq 0 ]
			then
			dialog --title "QC" --msgbox "\nYou have chosen Quality Control!\n\n\nClick ENTER key to continue..." 10 50; clear;
			dialog --title "Hello!" --msgbox "\nWelcome to the Quality Control. Make sure that you have a build binder handy and open to the QC section, then press Enter." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Speaker Test" --msgbox "\nThe first thing we are going to do is test the speakers on this machine. Turn up the volume! If you don't hear anything, please review section 6 in the QC portion of the laptops binder and consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			speaker-test -t wav -c2 -l1
			dialog --title "Headphone Test" --msgbox "\nNow we are going to test the headphone jack. Plug in some headphones and turn the volume down so you don't deafen yourself. If you don't hear anything, please consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			speaker-test -t wav -c2 -l1
			dialog --title "Stress Testing the CPU" --msgbox "\nNext we will test the processor by installing some scripts from our tools on the Free Geek server. Type 'freegeek' when prompted for a password. Beware! The cursor will not move when you input the password! Just keep typing and press enter after you have typed the password.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			wget -O - build/tools | sh ; sleep 5;
			stress-test
			dialog --title "WiFi Test" --msgbox "\nTo test the WiFi, we need to unplug the ethernet cable and connect to the Freegeek WiFi network. Open Firefox and run a google search for Free Geek Mothership. If this doesn't work, consult section 6 in the QC portion of the laptops binder and your instructor. Otherwise...\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Drivers" --msgbox "\nNow we will check to see if there are any necessary drivers for this laptop. Reconnect the ethernet cable and open the Menu in the lower left corner of the screen. In the text box type driver and select the driver manager. Enter freegeek as the password. If any drivers show up, ask your instructor for further instruction.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			eject
			dialog --title "Optical Drive" --msgbox "\nThe optical drive should have opened, and now you should take an audio CD and place it in the drive. A menu will appear, and you should select VLC from the dropdown menu and check the box saying Always Perform this Action. If the CD plays, repeat with a DVD. If the DVD plays, utter a Huzzah! Review section 6 of the laptops binder and consult your instructor if the optical drive fails to function.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "USB Ports" --msgbox "\nNow grab a USB mouse and test to make sure that you are able to move the mouse cursor when it is plugged into each of the USB ports. Make note of any ports that do not function and cover broken or non-functional ports with electrical tape.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Webcam" --msgbox "\nWe will test the webcam next.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt install cheese
			cheese
			dialog --title "HDMI" --msgbox "\nTake the laptop to the monitor at the end of the bench, and plug in the HDMI cable. You should see the screen wake up and something will be displayed. If so, return to your place on the bench and reconnect the power cable and ethernet cable. If not, consult your instructor.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "OEM Config" --msgbox "\nNow we make sure that the OEM Config software that we use to make sure that everyone sets their own username and password when they receive this laptop from Free Geek is installed.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt install oem-config-gtk
			dialog --title "Battery Quest" --msgbox "\nSee the instructions for battery testing in part 17 of Build section of the binder. Make sure that the percentage on the keeper label matches what the system reports. Good Luck! \n\n\nPress Enter once you have finished checking the battery..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "Power/Display Settings" --msgbox "\nRead the instructions in section 17 of the build part of the laptops binder. Make sure you both Prepare the system for display in the store and change the More Display Settings.\n\n\nPress Enter once you have made the necessary changes..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			dialog --title "System Updates" --msgbox "\nWe will now install any software and system updates for this laptop to ensure the best possible security and most stable experience on this laptop. While this is occuring, check out step 16 in the binder and follow the directions for store display directions.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			sudo apt update && sudo apt upgrade -y
			dialog --title "Printme" --msgbox "\nWe are almost finished! Now we will run printme, a piece of software that will ask you some questions and assemble a specification sheet for this laptop. Please answer all of the questions.\n\nBe sure to record the battery capacity (%) in the noteworthy items at the end of the questions.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
			printme; sleep 5;
			#This keeps getting skipped, but for why?
				CHOICE_HEIGHT=2
				TITLE="End Destination"
				MENU="Choose the end destination for this laptop. If you are not sure what this means, consult your instructor."
		
				QC_CHOICE=$(dialog --clear \
							--backtitle "$BACKTITLE" \
							--title "$TITLE" \
							--menu "$MENU" \
							$HEIGHT $WIDTH $CHOICE_HEIGHT \
							1 "Store" \
							2 "Grant" \
							2>&1 >/dev/tty)
			clear
			case $QC_CHOICE in
				1)
				dialog --title "Password Change" --msgbox "\nNext we need to change the password on the machine. Have a staff member take care of the next step.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				passwd
				dialog --title "Shutdown" --msgbox "\nCongratulations, you have finished quality checking this laptop! This laptop will now shutdown, so make sure that you have checked off all of the boxes on the keeper label for the QC column.\n\n\nThank you for all your help and press Enter to shutdown..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				shutdown -P now
					;;
				2)
				dialog --title "Prepare for Shipping to End User" --msgbox "\nNow we will run the OEM configuration software so that the next person to turn it on will be able to set their own username and password.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;	
				oem-config-prepare
				dialog --title "Shutdown" --msgbox "\nCongratulations, you have finished quality checking this laptop! This laptop will now shutdown, so make sure that you have checked off all of the boxes on the keeper label for the QC column.\n\n\nThank you for all your help and press Enter to shutdown..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				shutdown -P now
					;;
			esac
			else 
			echo Please connect an ethernet cable and try again
		
		fi
    ;;
    3)
		dialog --title "OEM Rollback" --msgbox "\nYou have chosen OEM Rollback! Please make sure that you are connected to an ethernet cable.\n\n\nClick ENTER key to continue..." 10 50; clear;
		sudo rm -r /etc/systemd/system/oem-config-target.wants
		sudo rm -r /etc/systemd/system/default.target
		sudo apt purge oem-config-gtk -y
		sudo apt install  oem-config-gtk -y
		sudo reboot
	;;
	4) 
		dialog --title "Broadcom" --msgbox "\nYou have chosen Broadcom Drivers!\n\n\nClick ENTER key to continue..." 10 50; clear;
		sudo apt purge bcmwl* -y
		sudo apt install b43-fwcutter firmware-b43-installer -y	
	;;
	5)
		dialog --title "Libdvd" --msgbox "\nYou have chosen Libdvd!\n\n\nClick ENTER key to continue..." 10 50; clear;
		sudo apt install libdvd-pkg -y
		sudo dpkg-reconfigure libdvd-pkg
	;;
	6)
		dialog --title "Regionset" --msgbox "\nYou have chosen Regionset!\n\n\nClick ENTER key to continue..." 10 50; clear;
		sudo rm -R ~/.dvdcss/
		sudo apt install regionset -y
		regionset /dev/sr0
	;;
	7)
		dialog --title "Production Day Build" --msgbox "\nYou have chosen Build!\n\n\nClick ENTER key to continue..." 10 50; clear;
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
	8)
		dialog --title "Production Day QC" --msgbox "\nYou have chosen QC!\n\n\nClick ENTER key to continue..." 10 50; clear;
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
			printme; sleep 5;
			#This keeps getting skipped, but for why?
				CHOICE_HEIGHT=2
				TITLE="End Destination"
				MENU="Choose the end destination for this laptop. If you are not sure what this means, consult your instructor."
		
				QC_CHOICE=$(dialog --clear \
							--backtitle "$BACKTITLE" \
							--title "$TITLE" \
							--menu "$MENU" \
							$HEIGHT $WIDTH $CHOICE_HEIGHT \
							1 "Store" \
							2 "Grant" \
							2>&1 >/dev/tty)
			clear
			case $QC_CHOICE in
				1)
				dialog --title "Password Change" --msgbox "\nNext we need to change the password on the machine. Have a staff member take care of the next step.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				passwd
				dialog --title "Shutdown" --msgbox "\nCongratulations, you have finished quality checking this laptop! This laptop will now shutdown, so make sure that you have checked off all of the boxes on the keeper label for the QC column.\n\n\nThank you for all your help and press Enter to shutdown..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				shutdown -P now
					;;
				2)
				dialog --title "Prepare for Shipping to End User" --msgbox "\nNow we will run the OEM configuration software so that the next person to turn it on will be able to set their own username and password.\n\n\nPress Enter to continue..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;	
				oem-config-prepare
				dialog --title "Shutdown" --msgbox "\nCongratulations, you have finished quality checking this laptop! This laptop will now shutdown, so make sure that you have checked off all of the boxes on the keeper label for the QC column.\n\n\nThank you for all your help and press Enter to shutdown..." $DIALOG_HEIGHT $DIALOG_WIDTH; clear;
				shutdown -P now
					;;
			esac
		fi
	;;
esac
