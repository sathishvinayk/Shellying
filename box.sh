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
box_out
