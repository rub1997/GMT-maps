T070.sh creates a map with coordinates describe in -R with a Mercator projection. It's intendes to show the mean topographic features of the bounding box in -R with the type of vegetation describes in https://www.inegi.org.mx/temas/usosuelo/ . The vegetation was uploaded using QGIS to "unwrap" the shape file into kml files. The kml files were converted to gmt files using: ogr2ogr -f "GMT" output_file.gmt input_file.kml
This map also plotes the reference point used in a SAR time series. 
