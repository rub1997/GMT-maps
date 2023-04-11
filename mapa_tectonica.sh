#!/usr/bin/env bash
gmt begin mapa_tectonica png
	gmt coast -R-110/-90/12/22 -JM14i -Dh -W0.1 -Ba -N1 -Gwheat
	gmt makecpt -Cabyss -T-6700/0 #oceans
		gmt coast -Sc
		gmt grdimage @earth_relief_01m -C -I+d -t5
		gmt pscoast -Q
		gmt colorbar -DJBL+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
	gmt makecpt -Cdem1 -T-80/5000 #dem
		gmt coast -Gc
		gmt grdimage @earth_relief_01m -C -I+d -t10
		gmt pscoast -Q
		gmt colorbar -DJBR+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
	gmt plot trinchera.txt -R-110/-90/12/22 -JM14i -W0.9p,black -Sf1c/0.3c+l+t -Gred
	gmt plot orozco-w.txt -R-110/-90/12/22 -JM14i -W1.6p,lemonchiffon1,--
	gmt plot orozco-e.txt -R-110/-90/12/22 -JM14i -W1.6p,lemonchiffon1,--
	gmt plot gorman.txt -R-110/-90/12/22 -JM14i -W1.6p,lemonchiffon1,--
	gmt plot rivera.txt -R-110/-90/12/22 -JM14i -W1.6p,black,--
	gmt plot cocos-e.txt -R-110/-90/12/22 -JM14i -W1.6p,black,--
	gmt plot cocos-w.txt -R-110/-90/12/22 -JM14i -W1.6p,black,--
	gmt plot tehuantepec.txt -R-110/-90/12/22 -JM14i -W1.6p,lemonchiffon1,--
	echo -99.90 14.45 O Gorman| gmt pstext -F+f12p,Helvetica-Bold,black+a50
	echo -103.00 15.60 Orozco| gmt pstext -F+f12p,Helvetica-Bold,black+a35
	echo -96.50 13.10 Dorsal de Tehuantepec| gmt pstext -F+f12p,Helvetica-Bold,black+a50
	echo -108.00 20.30 'Placa de Rivera' | gmt pstext -F+f12p,Helvetica-Bold,black
	echo -101.00 13.00 'Placa de Cocos' | gmt pstext -F+f12p,Helvetica-Bold,black
	#Convergence velocities 
	echo -107.00 20.00 20 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -107.00 19.90 1.4 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -105.10 18.10 35 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -105.10 17.90 1.9 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -104.00 17.30 45 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -104.00 17.10 4.7 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -102.10 16.25 50 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -102.10 16.05 5.3 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -100.20 15.50 60 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -100.20 15.30 5.9 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -97.80 14.80 60 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -97.80 14.60 6.4 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -95.50 14.20 65 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -95.00 14.00 6.8 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	echo -93.80 13.40 65 0.9 | gmt plot -Sv0.15i+ea+p2p,red -W4p,red
	echo -93.80 13.20 6.5 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
	gmt basemap -R-110/-90/12/22 -JM14i -LjRB+o30c/1c+c30+w120k+l+f -Tdg-87/15.4+w2c+f+l,,,N

gmt end show
