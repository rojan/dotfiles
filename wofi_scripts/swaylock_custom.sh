#!/bin/bash
trap cleanup 0 1 2 3 6

image="/tmp/lock_sway_image-$$.png"
text="/tmp/lock_sway_text-$$.png"
width=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_mode.width')

function cleanup {
	rm ${image}
	rm ${text}
}


  # Generate screenshot of currently focused monitor
  grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') ${image}

  # and then blur
  convert ${image} -scale 25% -blur 0x5 -scale 400% -fill black -colorize 10% ${image}

  [[ -f $1 ]] && convert ${image} $1 \
	  -gravity center   \
	  -composite        \
	  -matte ${image}

  [ -f $text ] || {
	  convert -size ${width}x60 xc:gray \
	  -font Liberation-Sans \
	  -pointsize 26 \
	  -fill black \
	  -alpha activate \
	  -gravity center \
	  -kerning 5 \
	  -annotate +0+0 "Do not touch!" ${text};
  }

convert ${image} ${text} -gravity center -geometry +0+200 -composite ${image}
swaylock -F -s fill -i ${image} --text-wrong-color ffffff
