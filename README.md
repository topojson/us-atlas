# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [Census Bureau’s](http://www.census.gov/) [cartographic boundary shapefiles](https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html), 2017 edition. For the 2015 edition, use us-atlas@1.

### Usage

In a browser, using [d3-geo](https://github.com/d3/d3-geo) and SVG:
https://observablehq.com/@d3/u-s-map

In a browser, using [d3-geo](https://github.com/d3/d3-geo) and Canvas:
https://observablehq.com/@d3/u-s-map-canvas

In Node, using [d3-geo](https://github.com/d3/d3-geo) and [node-canvas](https://github.com/Automattic/node-canvas):
https://bl.ocks.org/mbostock/885fffe88d72b2a25c090e0bbbef382f

## File Reference

<a href="#us/10m.json" name="us/10m.json">#</a> <b>us/10m.json</b> [<>](https://cdn.jsdelivr.net/npm/us-atlas@2/us/10m.json "Source")

A [TopoJSON *topology*](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>counties</i>, <i>states</i>, and <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 960×600 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic county boundaries](http://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html), 2017 edition. The state boundaries are computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) counties, and the nation boundary is computed by merging states, ensuring a consistent topology.

<a href="#us/states-10m.json" name="us/states-10m.json">#</a> <b>us/states-10m.json</b> [<>](https://cdn.jsdelivr.net/npm/us-atlas@2/us/states-10m.json "Source")

A [TopoJSON *topology*](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>states</i>, and <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 960×600 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic county boundaries](http://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html), 2017 edition. The nation boundary is computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) states, ensuring a consistent topology.

<a href="#us/10m.json_counties" name="us/10m.json_counties">#</a> *us*.objects.<b>counties</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-counties.png" width="480" height="300">

<a href="#us/10m.json_states" name="us/10m.json_states">#</a> *us*.objects.<b>states</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-states.png" width="480" height="300">

<a href="#us/10m.json_nation" name="us/10m.json_nation">#</a> *us*.objects.<b>nation</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-nation.png" width="480" height="300">
