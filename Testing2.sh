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

Japanese(){
    sed 's#user.web=.*#user.web=http://Something112#' $SPTH/example.conf > $SPTH/changed.conf && mv $SPTH/changed.conf $SPTH/example.conf
    echo "Updated the Japan file"
    sed -n 5p $SPTH/example.conf
}

Korean(){
    sed 's#user.web=.*#user.web=http://Returng#' $SPTH/item.conf > $SPTH/change.conf && mv $SPTH/change.conf $SPTH/item.conf
    echo "Updated the Korean file"
    sed -n 5p $SPTH/example.conf
}
Timer_object(){
    secs=$((1 * 05))
    while [ $secs -gt 0 ]; do
       echo -ne "Rebooting in $secs\033[0K\r"
       sleep 1
       : $((secs--))
    done
}
function box_out()
{
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf 3
  echo " -${b//?/-}-
| ${b//?/ } |"
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 4)" "-$w" "$l" "$(tput setaf 3)"
  done
  echo "| ${b//?/ } |
 -${b//?/-}-"
  tput sgr 0
}
main_file(){
    echo "-*60"
    echo -n "Type which contentpack version to be changed? [Jp or Ko]: "
    read yno
    case $yno in
            [jJ] | [jJ][Pp] )
                    Japanese
                    Timer_object
                    ;;
            [Kk] | [Kk][Oo] )
                    Korean
                    Timer_object
                    ;;
            *) echo "Please enter the valid input"
                main_file
                ;;
    esac
}
box_out
main_file
