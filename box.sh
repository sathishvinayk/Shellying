function box_out()
{
  prd="*"
  local s=("$@") b w
  for l in "${s[@]}"; do
    ((w<${#l})) && { b="$l"; w="${#l}"; }
  done
  tput setaf 3
  echo " -${b//?/-}Values and their properties-----------
| ${b//?/ }ja: Japanese $prd ko: Korean            | "
  for l in "${s[@]}"; do
    printf '| %s%*s%s |\n' "$(tput setaf 4)" "-$w" "$l" "$(tput setaf 3)"
  done
  echo "| ${b//?/ }cn: Chinese  $prd hi: Hindi Keyboard    |
 -${b//?/-}-------------------------------------- "
  tput sgr 0
}
box_out
