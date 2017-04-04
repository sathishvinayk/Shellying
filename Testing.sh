#!bin/sh
#Finding the path
SPTH='/Users/sathishvinayk/Documents'
pid=$$
#use to check or exit
if [ -f "$SPTH/example.conf" ];
then
   echo "File $FILE exist."
else
   echo "File $FILE does not exist, Existing out of loop" >&2
   kill -9 $pid
fi

#Using a if else to find the file
echo -n "Hurry up and type something! > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow!"
fi

#Countdown timer
secs=$((1 * 05))
while [ $secs -gt 0 ]; do
   echo -ne "Rebooting in $secs\033[0K\r"
   sleep 1
   : $((secs--))
done

#Main subject
Japanese(){
    sed 's#user.web=.*#user.web=http://Returnig#' $SPTH/example.conf > $SPTH/changed.conf && mv $SPTH/changed.conf $SPTH/example.conf
    echo "Updated the conf file"
    sed -n 5p $SPTH/example.conf
}

Korean(){
    sed 's#user.web=.*#user.web=http://Returng#' $SPTH/item.conf > $SPTH/change.conf && mv $SPTH/change.conf $SPTH/item.conf
    echo "Updated the conf file"
    sed -n 5p $SPTH/example.conf
}
Japanese
Korean
