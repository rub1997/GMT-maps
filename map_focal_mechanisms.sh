#!/usr/bin/env bash

gmt begin grs1_2 png
    # Set map
    gmt coast -R-104.80/-92.50/14.00/20.00 -JM10i -Dh -W0.1 -Ba -Sgray
    # Only plot digital elevation model for bathymetry using 90m pixel
    gmt makecpt -Cabyss -T-6700/0 #oceans
        gmt coast -Sc
        gmt grdimage @earth_relief_03s -C -I+d -t5
        gmt pscoast -Q
        gmt colorbar -DJBL+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
    # Plot depth slab of Mexican Subduction Zone
    gmt grdcontour slab_depth.grd -R-104.80/-92.50/14.00/20.00 -JM10i -C25 -W0.5p,dimgray -A25
    # Plot convergence velocities from DeMets et al. (2010)
    echo -107.00 20.00 20 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -107.00 19.90 1.4 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -105.10 18.10 35 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -105.10 17.90 1.9 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -104.00 17.30 45 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -104.00 17.10 4.7 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -102.10 16.25 50 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -102.10 16.05 5.3 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -100.20 15.50 60 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -100.20 15.30 5.9 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -97.80 14.80 60 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -97.80 14.60 6.4 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -95.50 14.20 65 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -96.10 14.30 6.8 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    echo -93.80 13.40 65 0.9 | gmt plot -Sv0.15i+ea+p2p,orange -W4p,orange
    echo -93.80 13.20 6.5 cm/yr | gmt pstext -F+f12p,Helvetica-Bold,white
    # Plot focal mechanisms with color maroon from USGS
    gmt psmeca thrust_erth -R-104.80/-92.50/14.00/20.00 -JM10i -Sc0.5c -Gmaroon -W1p+bwhite
    # Plot focal mechanisms with color blue from USGS
    gmt psmeca normal_erth -R-104.80/-92.50/14.00/20.00 -JM10i -Sc0.5c -Gblue -W1p+bwhite
    # Set scale bar and orientation
    gmt basemap -R-104.80/-92.50/14.00/20.00 -JM10i -LjLT+o20c/1c+c30+w120k+l+f -Tdg-93.40/19.50+w1.5c+f+l,,,N
# End with the map. VERY IMPORTANT!
gmt end show


