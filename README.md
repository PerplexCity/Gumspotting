# Gumspotting
The repository contains all data and scripts used in the analysis for the ["Gumspotting" article on perplex.city](https://perplex.city/gumspotting-53ea3137087#.p7nxby6h3).
To create the GIF of the 5-year gumspot simulation, the python script [spots_sim.py](../master/spots_sim.py) spits out 52 million trials worth of 1-in-a-million chances into the [spots.csv](../master/spots.csv) (usually somewhere between 40 and 55 spots will be created).
From there, you can run [spot_GIF.R](../master/spot_GIF.R) in R Studio to create the images. You'll have to restrict the rows one-by-one to create every single image.

The main gumspot count information lives in [gumspots_data.xlsx](../master/gumspots_data.xlsx), which isn't sourced from any website or generated via simulation but rather simply gathered via observation. In that sense, you'll just have to trust that it's legitimate. It includes flag counts for every block from 117th Street through 130th Street, along with several statistics based on those counts (average, median, 5-block average, etc.) and some demographic information that was looked up on a [geodemographic data site](http://proximityone.com/location_based_demographics.htm).

To create the graphs, the data was duplicated into the CSV file [gumspots.csv](../master/gumspots.csv) and then fed into [gum_graphs.R](../master/gum_graphs.R)
