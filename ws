#!/bin/bash
#SWITCH WALL WITH ZENBU
#BASED ON COLORSCHEME COLORS

case "$1" in
	"-wallpaper")
		#TYPICAL WALLPAPER
		hsetroot -fill $HOME/images/wallpapers/mountains_bw.png -blur 0
	;;
	"-solid")
		#SOLID BOLD BLACK COLOR
		hsetroot -solid "#454545"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#454545" \
		xc:"#C6C7C2" \
		xc:"#C2FA11" \
		xc:"#90918E" \
		xc:"#D4D6D0" \
		xc:"#F0F0E9" \
		xc:"#82827F" \
		xc:"#C8C9C4" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#454545" \
		xc:"#C6C7C2" \
		xc:"#C2FA11" \
		xc:"#90918E" \
		xc:"#D4D6D0" \
		xc:"#F0F0E9" \
		xc:"#82827F" \
		xc:"#C8C9C4" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#C6C7C2" xc:"#9AC70E" +append \) \
		\( xc:"#90918E" xc:"#F0F0E9" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#454545"
	;;
esac
