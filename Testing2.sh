SPTH='/Users/sathishvinayk/Documents'
CPT="example.conf"
pid=$$

#use to check or exit
check_file(){
    echo "Checking whether Contentpack.Preferences file exists or not"
    sleep 2
    if [ -f "$SPTH/$CPT" ];
    then
       echo "File $PTH exist."
    else
       echo "File $PTH does not exist, Existing out of loop" >&2
       kill -9 $pid
    fi
}


#Functions
japanese(){
    sed 's#user.web=.*#user.web=http://Something112#' $SPTH/$CPT > $SPTH/changed.conf && mv $SPTH/changed.conf $SPTH/$CPT
    echo "Updated the Japan file"
    sed -n 5p $SPTH/$CPT
}
korean(){
    sed 's#user.web=.*#user.web=http://Returng#' $SPTH/item.conf > $SPTH/change.conf && mv $SPTH/change.conf $SPTH/item.conf
    echo "Updated the Korean file"
    sed -n 5p $SPTH/$CPT
}
chinese(){
    sed 's#user.web=.*#user.web=http://Returng#' $SPTH/item.conf > $SPTH/change.conf && mv $SPTH/change.conf $SPTH/item.conf
    echo "Updated the Korean file"
    sed -n 5p $SPTH/$CPT
}
Timer_object(){
    secs=$((1 * 05))
    while [ $secs -gt 0 ]; do
       echo -ne "Rebooting the kindle in $secs\033[0K\r"
       sleep 1
       : $((secs--))
    done
}

#Main File
main_file(){
    echo -n "Type which contentpack version to be changed? [Jp or Ko]: "
    read yno
    case $yno in
            [jJ] | [jJ][Pp] )
                    japanese
                    Timer_object
                    ;;
            [Kk] | [Kk][Oo] )
                    korean
                    Timer_object
                    ;;
            [Cc] | [Cc][Nn] )
                    chinese
                    Timer_object
                    ;;
            *) echo "Please enter the valid input"
                main_file
                ;;
    esac
}

#Box model
function box_out()
{
  prd="**"
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf 3
  echo " -${b//?/-}Values and their properties-----------------------------------------------
| ${b//?/ }   *********  FONTS  ************    |  ********  INDIC KB  **********   |
| ${b//?/ }ja => Japanese                       |   hi  => Hindi KB                 | "
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 4)" "-$w" "$l" "$(tput setaf 3)"
  done
  echo "| ${b//?/ }cn => Chinese                        |   mal => Malayalam KB             |
| ${b//?/ }ko => Korean                         |   ta  => Tamil KB                 |
| ${b//?/ }                                     |   gu  => Gujarati KB              |
| ${b//?/ }                                     |   mar => Marathi KB               |
 -${b//?/-}-------------------------------------------------------------------------- "
  tput sgr 0
}

#Call the funcs
check_file
box_out
main_file
