#!/bin/bash

vmPlayer="VMware Workstation 12 Player (Non-commercial use only)"

while [ 1 ]; do
  sleep 1

  windowName="$(xdotool getwindowfocus getwindowname)"
  VMwareConstantPattern=${windowName: -54}
  currentValue="$(dconf read /org/compiz/profiles/unity/plugins/unityshell/show-launcher)"

  # echo $currentValue
  # echo ${windowName}

  if [ "$VMwareConstantPattern" == "$vmPlayer" ] && [ $currentValue == "'unset'" ]; then
    dconf write /org/compiz/profiles/unity/plugins/unityshell/show-launcher "''"
    echo No SuperKey
  fi

  if [ "$VMwareConstantPattern" != "$vmPlayer" ] && [ $currentValue == "''" ]; then
    dconf write /org/compiz/profiles/unity/plugins/unityshell/show-launcher "'unset'"
    echo SuperKey back to normal
  fi

done
