#!/bin/bash
#
# This script adds the field "zoom-fullscreen" to the output of each object in $(yabai -m query --spaces)
# If a window within a space is currently zoomed in, the value will be 1, otherwise 0

# NOTE: If I want to start using this bash script again instead of `spaces-json.mjs` tips here about how 
# to make it more performant https://github.com/koekeishiya/yabai/issues/474#issuecomment-613906088
spaces=$(/usr/local/bin/yabai -m query --spaces)

for index in $(echo "${spaces}" | /usr/local/bin/jq -r '.[].index'); do
    hasFullscreenWindow=$(/usr/local/bin/yabai -m query --windows --space "${index}" | /usr/local/bin/jq -e 'map(select(."zoom-fullscreen" == 1)) | if length > 0 then 1 else 0 end')
    spaces=$(echo "${spaces}" | /usr/local/bin/jq --argjson hasFullscreenWindow $hasFullscreenWindow --argjson index "${index}" '.[$index -1]."zoom-fullscreen" |= $hasFullscreenWindow')
done

echo "$spaces"
