#!/bin/bash
#SWITCH WALL WITH ZENBU
#BASED ON COLORSCHEME COLORS

case "$1" in
	"-wallpaper")
		#TYPICAL WALLPAPER
		hsetroot -fill $HOME/images/wallpapers/_DSF6699b_3000px_1500.jpg -blur 0
	;;
	"-solid")
		#SOLID BOLD BLACK COLOR
		hsetroot -solid "#57607A"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#57607A" \
		xc:"#ED7278" \
		xc:"#A19EC7" \
		xc:"#FFD7AF" \
		xc:"#F75D64" \
		xc:"#9C6D9C" \
		xc:"#FF806F" \
		xc:"#FDCBAC" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#57607A" \
		xc:"#ED7278" \
		xc:"#A19EC7" \
		xc:"#FFD7AF" \
		xc:"#F75D64" \
		xc:"#9C6D9C" \
		xc:"#FF806F" \
		xc:"#FDCBAC" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#ED7278" xc:"#918EB3" +append \) \
		\( xc:"#FFD7AF" xc:"#9C6D9C" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#57607A"
	;;
esac
