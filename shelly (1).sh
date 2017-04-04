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

#Main subject
sed 's#user.web=.*#user.web=http://Domar_DOMAIN#' $SPTH/example.conf > $SPTH/changed.conf && mv $SPTH/changed.conf $SPTH/example.conf
echo "Updated the conf file"
sed -n 5p $SPTH/example.conf
