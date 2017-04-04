#!bin/sh
#Finding the path
SPTH='/mnt/us/documents'
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
#echo -n "Hurry up and type something! > "
#if read -t 3 response; then
#    echo "Great, you made it in time!"
#else
#    echo "Sorry, you are too slow!"
#fi


while true
do
  echo -n "Hurry up and type something! > "
  # (1) prompt user, and read command line argument
  read -p "Run the cron script now? " answer

  # (2) handle the input we were given
  case $answer in
   [yY]* ) /usr/bin/wget -O - -q -t 1 http://www.example.com/cron.php
           echo "Okay, just ran the cron script."
           break;;

   [nN]* ) exit;;

   * )     echo "Dude, just enter Y or N, please.";;
  esac
done

#Main subject
sed 's#user.web=.*#user.web=http://New_DOMAIN#' $SPTH/example.conf > $SPTH/changed.conf && mv $SPTH/changed.conf $SPTH/example.conf
echo "Updated the conf file"

sed -n 5p $SPTH/example.conf
while [ 1 ]
do
if [ -s /mnt/us/documents/example.conf ]
then
reboot
fi
done
