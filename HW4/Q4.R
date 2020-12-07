########################################################################################################################
# geosphere is a really cool library for spatial calcs, see
# https://cran.r-project.org/web/packages/geosphere/vignettes/geosphere.pdf
# install.packages('geosphere')
# use the library to compute polygon stats such as area, perimeter, centroid
library('geosphere')
# the pairs of values are long,lat...
pol <- rbind(c(-118.282798,34.021717), c(-118.285446,34.020559), c(-118.288798, 34.019606), c(-118.288018,34.019181), c(-118.286604,34.018685), c(-118.284279, 34.018672), c(-118.282497,34.018675), c(-118.276428,34.019044))
areaPolygon(pol)
perimeter(pol)
# store the centroid in 'c' because we'll need it below, for plotting
c <- centroid(pol)
c
c[1][1]
c[2][1]

########################################################################################################################
# leaflet is an R port of the excellent leaflet.js library (https://leafletjs.com/)
# see https://cran.r-project.org/web/packages/leaflet/leaflet.pdf
# install.packages("leaflet")
# use leaflet to plot the convex hull coords, plus centroid
library("leaflet")
m <- leaflet()
m <- addTiles(m)
# our centroid - right now, it's the centroid of the 'pol' polygon above 
m <- addMarkers(m, lng=c[1][1], lat=c[2][1], popup="Hull centroid")
# our convex hull - right now it's a piece of Venice Beach!!
m <- addCircleMarkers(m, lng=-118.282798, lat=34.021717,label="Leavey Library", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.285446, lat=34.020559,label="Tommy Trojan", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.288798, lat=34.019606,label="Science Eng Lib", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.288018, lat=34.019181,label="Architecture Lib", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.286604, lat=34.018685,label="Hoose Library", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.284279, lat=34.018672,label="Law Library", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.282497, lat=34.018675,label="Gaughan Tib Lib", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
m <- addCircleMarkers(m, lng=-118.276428, lat=34.019044,label="Grand Avenue Lib", radius=2, fillOpacity=1.0,fill = TRUE, fillColor ="red")
# time to see the results
m
########################################################################################################################