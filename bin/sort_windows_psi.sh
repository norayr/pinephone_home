set -x
function find_active_tab_from_list {
  local func_result=""
  for i in "$@"
  do
    echo "Searching for window title: $i" >&2  # Redirect debug output to standard error
    res=$(wmctrl -lx | grep -i "groupchat.Psi" | grep -i "$i" | awk '{ print $1 }')
    echo "Result: $res" >&2  # Redirect debug output to standard error
    if [[ -n "$res" ]]
    then
      func_result=$res
      break
    fi
  done
  echo "$func_result"  # This is the only output that should go to standard output
}

if [[ -z $1 ]]
then
  echo "Please provide a config file name."
  exit 1
fi

# Window dimensions and positions
W=450  # Width of the window
H=500  # Height of the window
declare -A X_COORDINATES=( [0]=80 [1]=550 [2]=1020 [3]=80 [4]=550 [5]=1020 )
declare -A Y_COORDINATES=( [0]=50 [1]=50 [2]=50 [3]=580 [4]=580 [5]=580 )
declare -A workspace_count

while IFS= read -r line || [[ -n "$line" ]]; do
  if [[ -z "$line" || "${line:0:1}" == "#" ]]; then
    continue
  fi

  wrkSpc=$(echo "$line" | cut -d ':' -f 1)
  winLst=$(echo "$line" | cut -d ':' -f 2-)
  win=$(find_active_tab_from_list "$winLst")

  if [[ -z "$win" ]]; then
    echo "Window for '$winLst' not found."
    continue
  fi

  count=${workspace_count[$wrkSpc]:-0}
  idx=$((count % 6))
  X=${X_COORDINATES[$idx]}
  Y=${Y_COORDINATES[$idx]}

  echo "Placing window $win ($winLst) in workspace $wrkSpc at position $X, $Y."
  wmctrl -i -r "$win" -t "$wrkSpc"
  wmctrl -i -r "$win" -e 0,$X,$Y,$W,$H
  #transset --id "$win" 1 >/dev/null
  workspace_count[$wrkSpc]=$((count + 1))
done < "$1"
