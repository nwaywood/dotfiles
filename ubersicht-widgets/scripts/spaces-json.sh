#!/bin/bash
#
# This script adds the field "zoom-fullscreen" to the output of each object in $(yabai -m query --spaces)
# If a window within a space is currently zoomed in, the value will be 1, otherwise 0

spaces=$(yabai -m query --spaces)

for index in $(echo "${spaces}" | jq -r '.[].index'); do
    hasFullscreenWindow=$(yabai -m query --windows --space "${index}" | jq -e 'map(select(."zoom-fullscreen" == 1)) | if length > 0 then 1 else 0 end')
    spaces=$(echo "${spaces}" | jq --argjson hasFullscreenWindow $hasFullscreenWindow --argjson index "${index}" '.[$index -1]."zoom-fullscreen" |= $hasFullscreenWindow')
done

echo $spaces
