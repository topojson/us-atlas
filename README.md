# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [Census Bureau’s](http://www.census.gov/) [cartographic boundary shapefiles](https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html), 2017 edition. For earlier additions, see [past releases](https://github.com/topojson/us-atlas/releases).

Both projected and unprojected forms are provided. The projection used by these files is:

```js
d3.geoAlbersUsa().scale(1300).translate([487.5, 305])
````

This is an equal-area Albers projection suitable for choropleth maps, and designed to fit a 975×610 viewport.

### Usage

In a browser, using [d3-geo](https://github.com/d3/d3-geo) and SVG:<br>
https://observablehq.com/@d3/u-s-map

In a browser, using [d3-geo](https://github.com/d3/d3-geo) and Canvas:<br>
https://observablehq.com/@d3/u-s-map-canvas

In Node, using [d3-geo](https://github.com/d3/d3-geo) and [node-canvas](https://github.com/Automattic/node-canvas):<br>
https://bl.ocks.org/mbostock/885fffe88d72b2a25c090e0bbbef382f

## File Reference

<a href="#counties-10m.json" name="counties-10m.json">#</a> <b>counties-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/counties-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>counties</i>, <i>states</i>, and <i>nation</i>. The geometry is quantized and simplified, but not projected. This topology is derived from the Census Bureau’s [cartographic county boundaries, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/). The state boundaries are computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) counties, and the nation boundary is computed by merging states, ensuring a consistent topology.

<a href="#counties-albers-10m.json" name="counties-albers-10m.json">#</a> <b>counties-albers-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/counties-albers-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>counties</i>, <i>states</i>, and <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 975×610 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic county boundaries, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/). The state boundaries are computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) counties, and the nation boundary is computed by merging states, ensuring a consistent topology.

<a href="#states-10m.json" name="states-10m.json">#</a> <b>states-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/states-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>states</i> and <i>nation</i>. The geometry is quantized and simplified, but not projected. This topology is derived from the Census Bureau’s [cartographic state boundaries, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/). The nation boundary is computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) states, ensuring a consistent topology.

<a href="#states-albers-10m.json" name="states-albers-10m.json">#</a> <b>states-albers-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/states-albers-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collections <i>states</i> and <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 975×610 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic state boundaries, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/). The nation boundary is computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) states, ensuring a consistent topology.

<a href="#nation-10m.json" name="nation-10m.json">#</a> <b>nation-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/nation-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collection <i>nation</i>. The geometry is quantized and simplified, but not projected. This topology is derived from the Census Bureau’s [cartographic nation boundary, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/).

<a href="#nation-albers-10m.json" name="nation-albers-10m.json">#</a> <b>nation-albers-10m.json</b> · [Download](https://cdn.jsdelivr.net/npm/us-atlas@3/nation-albers-10m.json "Source")

A [TopoJSON file](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing the geometry collection <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 975×610 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic nation boundary, 2017 edition](https://www2.census.gov/geo/tiger/GENZ2017/shp/).

<a href="#counties" name="counties">#</a> *us*.objects.<b>counties</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/counties.png" width="480" height="300">

Each county has two properties:

* *id* - the five-digit [FIPS county code](https://en.wikipedia.org/wiki/FIPS_county_code), such as `"06069"`
* *name* - the county name, such as `"San Benito"`

The first two digits of the county FIPS code is the state FIPS code.

<a href="#states" name="states">#</a> *us*.objects.<b>states</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/states.png" width="480" height="300">

Each state has two properties:

* *id* - the two-digit [FIPS state code](https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code), such as `"06"`
* *name* - the state name, such as `"California"`

<a href="#nation" name="nation">#</a> *us*.objects.<b>nation</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/nation.png" width="480" height="300">

The nation has two properties:

* *id* - the string `"US"`
* *name* - the string `"United States"`
