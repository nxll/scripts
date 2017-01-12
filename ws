#!/bin/bash
#SWITCH WALL WITH ZENBU
#BASED ON COLORSCHEME COLORS

case "$1" in
	"-wallpaper")
		#TYPICAL WALLPAPER
		hsetroot -fill $HOME/images/wallpapers/forest-meadow-leaves-autumn.jpg -blur 2
	;;
	"-solid")
		#SOLID BOLD BLACK COLOR
		hsetroot -solid "#38362F"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#38362F" \
		xc:"#C7CC60" \
		xc:"#7A824D" \
		xc:"#ABAA7B" \
		xc:"#99A34D" \
		xc:"#6E7351" \
		xc:"#8C8765" \
		xc:"#D6CFB5" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#38362F" \
		xc:"#C7CC60" \
		xc:"#7A824D" \
		xc:"#ABAA7B" \
		xc:"#99A34D" \
		xc:"#6E7351" \
		xc:"#8C8765" \
		xc:"#D6CFB5" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#C7CC60" xc:"#707746" +append \) \
		\( xc:"#ABAA7B" xc:"#6E7351" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#38362F"
	;;
esac
