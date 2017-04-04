#!bin/sh
#Finding the path
SPTH='/var/local/java/prefs'
PTHC='/mnt/us/documents'
pid=$$
#use to check or exit
if [ -f "$SPTH/ContentPackages.preferences" ];
then
   echo "File $SPTH exist."
else
   echo "File $SPTH does not exist, Existing out of loop" >&2
   kill -9 $pid
fi

#Using a if else to find the file
echo -n "Hurry up and type something! > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow!"
fi

#Functioning out
edit_file(){
  sed 's#ja.font.version=.*#ja.font.version=2012-05-05#' $SPTH/ContentPackages.preferences > $SPTH/changed.preferences && mv $SPTH/changed.preferences $SPTH/ContentPackages.preferences
  sed -n 4p $SPTH/ContentPackages.preferences
}
edit_file
