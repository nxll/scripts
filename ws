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
		hsetroot -solid "#403D3F"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#403D3F" \
		xc:"#97463E" \
		xc:"#8BA283" \
		xc:"#C2975B" \
		xc:"#53576C" \
		xc:"#787060" \
		xc:"#7A5848" \
		xc:"#D1CFC5" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#403D3F" \
		xc:"#97463E" \
		xc:"#8BA283" \
		xc:"#C2975B" \
		xc:"#53576C" \
		xc:"#787060" \
		xc:"#7A5848" \
		xc:"#D1CFC5" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#97463E" xc:"#97A293" +append \) \
		\( xc:"#C2975B" xc:"#787060" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#403D3F"
	;;
esac
