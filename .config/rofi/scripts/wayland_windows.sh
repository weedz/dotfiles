#!/bin/sh


# Get available windows
#windows=$(swaymsg -t get_tree | jq -r '.nodes[1].nodes[].nodes[] | .. | (.id|tostring) + " " + .name?' | grep -e "[0-9]* ."  )

# windows=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?)|recurse(.floating_nodes[]?)|select(.type=="con"),select(.type=="floating_con")|(.id|tostring)+" "+.app_id+": "+.name')

# Show windows from all outputs. Displayed as "[id]\t[program_name]\t[window_title]""
windows=$(swaymsg -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | select(.name!="__i3_scratch") | (.id | tostring) + "\t" + if (.app_id != null) then .app_id else (.window_properties.class) end  + "\t" + .name')

# Select window with rofi
selected=$(echo "$windows" | rofi -dmenu -i -theme Arc-Dark | awk '{print $1}')

# Tell sway to focus said window
if [ -n "$selected" ]; then
  swaymsg [con_id="$selected"] focus
fi


# swaymsg \-t get_tree |
#   jq \-r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " " + .name)' |
#   rofi \-dmenu | {
#     read \-r id name
#     swaymsg "[con_id=$id]" focus
#   }
