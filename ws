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
		hsetroot -solid "#3A404A"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#3A404A" \
		xc:"#FF8D7E" \
		xc:"#8AD6D2" \
		xc:"#BAB6B3" \
		xc:"#799FA1" \
		xc:"#999393" \
		xc:"#B2CCD1" \
		xc:"#FFFFFF" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#3A404A" \
		xc:"#FF8D7E" \
		xc:"#8AD6D2" \
		xc:"#BAB6B3" \
		xc:"#799FA1" \
		xc:"#999393" \
		xc:"#B2CCD1" \
		xc:"#FFFFFF" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#FF8D7E" xc:"#84CDC9" +append \) \
		\( xc:"#BAB6B3" xc:"#999393" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#3A404A"
	;;
esac
