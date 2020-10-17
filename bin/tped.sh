#!/bin/bash

# Run as root only.
myWHOAMI=$(whoami)
if [ "$myWHOAMI" != "root" ]
  then
    echo "Need to run as root ..."
    exit
fi

# set backtitle, get filename
myBACKTITLE="T-Pot Edition Selection Tool"
myYMLS=$(cd /opt/nwx/etc/compose/ && ls -1 *.yml)
myLINK="/opt/nwx/etc/nwx.yml"

# Let's load docker images in parallel
function fuPULLIMAGES {
local myTPOTCOMPOSE="/opt/nwx/etc/nwx.yml"
for name in $(cat $myTPOTCOMPOSE | grep -v '#' | grep image | cut -d'"' -f2 | uniq)
  do
    docker pull $name &
  done
wait
echo
}

# setup menu
for i in $myYMLS;
  do
    myITEMS+="$i $(echo $i | cut -d "." -f1 | tr [:lower:] [:upper:]) " 
done
myEDITION=$(dialog --backtitle "$myBACKTITLE" --menu "Select T-Pot Edition" 12 50 5 $myITEMS 3>&1 1>&2 2>&3 3>&-)
if [ "$myEDITION" == "" ];
  then
    echo "Have a nice day!"
    exit
fi
dialog --backtitle "$myBACKTITLE" --title "[ Activate now? ]" --yesno "\n$myEDITION" 7 50
myOK=$?
if [ "$myOK" == "0" ];
  then
    echo "OK - Activating and downloading latest images."
    systemctl stop nwx
    if [ "$(docker ps -aq)" != "" ];
      then
        docker stop $(docker ps -aq)
        docker rm $(docker ps -aq)
    fi
    rm -f $myLINK
    ln -s /opt/nwx/etc/compose/$myEDITION $myLINK
    fuPULLIMAGES
    systemctl start nwx
    echo "Done. Use \"dps.sh\" for monitoring"
  else 
    echo "Have a nice day!"
fi
