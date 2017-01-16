#!/bin/bash
#SWITCH WALL WITH ZENBU
#BASED ON COLORSCHEME COLORS

case "$1" in
	"-wallpaper")
		#TYPICAL WALLPAPER
		hsetroot -tile $HOME/images/wallpapers/21211Ftile.png -blur 0
	;;
	"-solid")
		#SOLID BOLD BLACK COLOR
		hsetroot -solid "#282826"
	;;
	"-gradient")
		#GRADIENT STRIPES
		convert -size 100x100 \
		xc:"#282826" \
		xc:"#989995" \
		xc:"#C2FA11" \
		xc:"#BBBDB8" \
		xc:"#777875" \
		xc:"#D6D6D0" \
		xc:"#696966" \
		xc:"#AFB0AB" \
		+append -filter Cubic \
		-distort SRT 60 \
		-blur 0x40 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-striped")
		#STRIPES
		convert -size 350x350 \
		xc:"#282826" \
		xc:"#989995" \
		xc:"#C2FA11" \
		xc:"#BBBDB8" \
		xc:"#777875" \
		xc:"#D6D6D0" \
		xc:"#696966" \
		xc:"#AFB0AB" \
		\( -clone 0--1 -clone 0--1 \) \
		+append -filter Cubic \
		-distort SRT 60 \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	"-4color")
		#4 COLOR GRADIENT
		convert \( xc:"#989995" xc:"#9AC70E" +append \) \
		\( xc:"#BBBDB8" xc:"#D6D6D0" +append \) -append \
		-filter point -interpolate catrom \
		-define distort:viewport=100x100 \
		-distort Affine '.5,.5 .5,.5   1.5,1.5 99.5,99.5' \
		/tmp/wall.png

		hsetroot -fill /tmp/wall.png -brightness 0.1
	;;
	*)
		#FALLBACK IF NOTHING IS CHOSEN
		hsetroot -solid "#282826"
	;;
esac
