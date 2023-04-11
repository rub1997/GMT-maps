#!/usr/bin/env bash
#Mapa para la SEG 2022
gmt begin T070 pdf
	gmt coast -R-95.30/-94.15/18.00/18.70 -JM10i -Dh -W0.1 -Ba -Slightblue
	gmt plot ./kml/temporal_lluvioso.gmt -R-95.30/-94.15/18.00/18.70 -JM10i -L -V -t60 -Gdodgerblue2 #-W0.8p,blue
	gmt plot ./kml/pastizal_cultivado.gmt -R-95.30/-94.15/18.00/18.70 -JM10i -L -V -t60 -Grosybrown1
	gmt plot ./kml/selva_perennifolia.gmt -R-95.30/-94.15/18.00/18.70 -JM10i -L -V -t60 -Gthistle2
	gmt grdcontour @earth_relief_01m -A200 -Gd3i -L-10
	gmt coast -Sc
	gmt pscoast -Q
	echo -95.2412 18.4252 ref | gmt plot -Ss0.50 -Gred -W0.5p
	#CIUDADES
	echo -94.44 18.13 Coatzacoalcos | gmt plot -Sc0.40 -Gvioletred1 -W0.5p
	echo -95.10 18.42 Coatzacoalcos | gmt plot -Sc0.40 -Gpurple2 -W0.5p #anteriormente utilice el color lavender
	echo -94.70 18.60 Golfo de Mexico | gmt pstext -F+f12,Helvetica-Bold,black
	#LEYENDA
	echo -94.35 18.50 Coatzacoalcos | gmt plot -Sc0.40 -Gvioletred1 -W0.5p
	echo -94.35 18.47 Catemaco | gmt plot -Sc0.40 -Gpurple2 -W0.5p
	echo -94.285 18.50 Coatzacoalcos | gmt pstext -F+f10,black
	echo -94.30 18.47 Catemaco | gmt pstext -F+f10,black
	echo -94.35 18.44 Punto de Referencia T070 | gmt plot -Ss0.40 -Gred -W0.5p
	echo -94.265 18.44 Punto de Referencia | gmt pstext -F+f10,black
	echo -94.28 18.42 T070 | gmt pstext -F+f10,black
	echo -94.35 18.40 Temporal lluvioso | gmt plot -Sd0.40 -Gdodgerblue2 -W0.5p
	echo -94.275 18.40 Temporal lluvioso | gmt pstext -F+f10,black
	echo -94.35 18.37 Pastizal cultivado | gmt plot -Sd0.40 -Grosybrown1 -W0.5p
	echo -94.275 18.37 Pastizal cultivado | gmt pstext -F+f10,black
	echo -94.35 18.34 Selva | gmt plot -Sd0.40 -Gthistle2 -W0.5p
	echo -94.315 18.34 Selva | gmt pstext -F+f10,black
	gmt basemap -R-95.30/-94.15/18.00/18.70 -JM10i -LjRB+o20c/1c+c30+w20k+l+f -Tdg-94.25/18.60+w1.5c+f+l,,,N
gmt end show
