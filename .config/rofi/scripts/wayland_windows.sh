#!/bin/sh

if [ -z "$@" ]; then
  # Show windows from all outputs. Displayed as "[id]\t[program_name]\t[window_title]""
  swaymsg -r -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | select(.name!="__i3_scratch") | (.id | tostring) + "\t" + if (.app_id != null) then .app_id else (.window_properties.class) end  + "\t" + .name'
else
  # Change to selected window
  con_id=${@%%$'\t'*}
  swaymsg -rq [con_id="$con_id"] focus
fi;
