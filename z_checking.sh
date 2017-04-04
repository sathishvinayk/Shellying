#!bin/sh
#Finding the path
SPTH='/var/local/java/prefs'
pid=$$
#use to check or exit
if [ -f "$SPTH/ContentPackages.preferences" ]
then
   echo "File $FILE exist."
else
   echo "File $FILE does not exist, Existing out of loop" >&2
   kill -9 $pid
fi
