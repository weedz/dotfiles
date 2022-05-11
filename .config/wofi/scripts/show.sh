#!/bin/sh

swaymsg -r -t get_tree \
| jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | select(.name!="__i3_scratch") | (.id | tostring) + "\t" + if (.app_id != null) then .app_id else (.window_properties.class) end  + "\t" + .name' \
| wofi --insensitive --show dmenu,drun -Ddrun-print_command=true | {
    read -r id name
    if [ -n "$name" ]; then
        swaymsg "[con_id=$id]" focus
    else
        "$id" &
    fi
}
