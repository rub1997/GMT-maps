#!/usr/bin/env bash
folder_name=$(basename "$PWD")

gmt begin $folder_name pdf
    gmt set FONT_LABEL=15p,Helvetica,black \
            FONT_ANNOT_PRIMARY=20p,Helvetica,black \
            FONT_ANNOT_SECONDARY=20p,Helvetica,black \
            FONT_LABEL=25p,Helvetica,black \
            FONT_TITLE=20p,Helvetica,black \
            MAP_ANNOT_OBLIQUE 32 \
            FORMAT_GEO_MAP ddd.xx \
            FORMAT_DATE_IN yyyy-mm-dd FORMAT_CLOCK_IN hh:mm:ss \

    gmt coast -R124.80/126.0/5.25/6.25 -JM8i -Dh -W0.1 -B0.5 -Slightsteelblue1 -Ggray88
    #gmt makecpt -Cabyss -T-6700/0 #oceans
    #    gmt coast -Sc
    #    gmt grdimage @earth_relief_03s -C -I+d -t5
    #    gmt pscoast -Q
    #    gmt colorbar -DJBL+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
    #gmt makecpt -Cdem1 -T-80/5000 #dem
    #    gmt coast -Gc
    #    gmt grdimage @earth_relief_03s -C -I+d -t10
    #    gmt pscoast -Q
    #    gmt colorbar -DJBR+o-15c/1.6c+w14c/0.5c+h -C -Ba1000f -By+lm
    #gmt coast -Ggray88
    gmt coast -Ggray88
    gmt coast -Gc # start clip values outside land
    gmt makecpt -T-60/60/10 -Cvik -Z >> los_decomposition.cpt
    gmt grdimage descending_ifg.grd -R124.80/126.0/5.25/6.25 -JM8i -Clos_decomposition_vik.cpt -B -Q
    gmt pscoast -Q # end clip values outside land
    gmt colorbar -DjBR+o2c/1.0c+w4.5c/0.4c -Clos_decomposition_vik.cpt -Ba30f -Bxaf+l"LOS"
    gmt plot faults.txt -R124.80/126.0/5.25/6.25 -JM8i -W2p,black
    # plot aftershocks with colorpalette given by time occurance and size given by magnitude
    #  Lon, Lat, Time (Col 3), Scaled Mag (Col 4 * 0.05)
    gmt makecpt -Chot -T2026-06-07T23:37:41/2026-06-22T02:20:00/1d -D >> date.cpt
    awk '{print $1, $2, $3, $4*0.15}' aftershocks.txt | gmt plot -R124.80/126.0/5.25/6.25 -JM8i -Sc -C./faults/date.cpt -W0.25p,black -t25
    gmt colorbar -DjBR+o3.7c/1.0c+w4.5c/0.4c -C./faults/date.cpt  -Ba3d -By+l"Date" #separation of 3 days in colorbar
    # asc coordinate arrow 125.90 5.70 {110, heading} {28, look}
    # desc coordinate arrow 125.85 5.80 {257, heading} {170, look}
    echo 125.85 5.80 257 3.0c | gmt plot -R124.80/126.0/5.25/6.25 -JM8i -Sv0.4c+e+h0.7 -W3.5p,black
    echo 125.85 5.80 170 1.0c | gmt plot -R124.80/126.0/5.25/6.25 -JM8i -Sv0.4c+e+h0.7 -W3.5p,black
    # lon lat depth str dip slip st dip slip mant exp plon plat
    echo 125.047 5.592 55.2 359 47 103 161 45 77 7.8 0 125.08 5.75 | gmt psmeca -R124.80/126.0/5.25/6.25 -JM8i -Sc0.95c -A0.5p,black+sc0.15c+gred
    gmt basemap -R124.80/126.0/5.25/6.25 -JM8i -LjRB+o16c/1.0c+c30+w20k+l"km" -Fl+gwhite -Tdg125.90/6.13+w2.5c+l,,,N
gmt end
