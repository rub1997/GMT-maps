#!/usr/bin/env bash
# This script maps the topography and bathymetry of a region bounded by -R
# It also maps the GPS velocities within the velo.out file
# The GPS stations and epicenter are plotted

gmt begin mendocino_1205_2 pdf
    gmt coast -R-127.00/-120.90/38.30/43.00 -JM10i -Dh -W0.1 -Ba -Sgray
    gmt makecpt -Cabyss -T-6700/0 #oceans
        gmt coast -Sc
        gmt grdimage @earth_relief_03s -C -I+d -t5
        gmt pscoast -Q
        gmt colorbar -DJBL+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
    gmt makecpt -Cdem1 -T-80/5000 #dem
        gmt coast -Gc
        gmt grdimage @earth_relief_03s -C -I+d -t10
        gmt pscoast -Q
        gmt colorbar -DJBR+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
    echo -123.726 38.928 p059 | gmt plot -Sc0.40 -Gvioletred1 -W0.5p
    echo -124.283 40.504 p159 | gmt plot -Sc0.40 -Gvioletred1 -W0.5p
    echo -124.255 41.783 ptsg | gmt plot -Sc0.40 -Gvioletred1 -W0.5p
    echo -125.022 40.374 mendocino_earthquake | gmt plot -Sa0.80 -Ggreen1 -W0.5p
    gmt velo velo.out -R-127.00/-120.90/38.30/43.00 -Wthin,black -Se0.2c/0.39/12 -BWeSn -JM10i -Gblack -L -N -A1c+p3p+e
    gmt basemap -R-127.00/-120.90/38.30/43.00 -JM10i -LjRB+o20c/1c+c30+w120k+l+f -Tdg-126.70/39.00+w1.5c+f+l,,,N
gmt end show


