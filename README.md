# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [Census Bureau’s](http://www.census.gov/) [cartographic boundary shapefiles](https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html), 2015 edition.

### Usage

In a browser (using [d3-geo](https://github.com/d3/d3-geo) and Canvas), [bl.ocks.org/3783604](https://bl.ocks.org/mbostock/3783604):

```html
<!DOCTYPE html>
<canvas width="960" height="600"></canvas>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://d3js.org/topojson.v2.min.js"></script>
<script>

var context = d3.select("canvas").node().getContext("2d"),
    path = d3.geoPath().context(context);

d3.json("https://d3js.org/us-10m.v0.json", function(error, us) {
  if (error) throw error;

  context.beginPath();
  path(topojson.mesh(us));
  context.stroke();
});

</script>
```

In Node (using [d3-geo](https://github.com/d3/d3-geo) and [node-canvas](https://github.com/Automattic/node-canvas)), [bl.ocks.org/885fffe88d72b2a25c090e0bbbef382f](https://bl.ocks.org/mbostock/885fffe88d72b2a25c090e0bbbef382f):

```js
var d3 = require("d3-geo"),
    topojson = require("topojson-client"),
    Canvas = require("canvas"),
    us = require("./node_modules/us-atlas/us/10m.json");

var canvas = new Canvas(960, 600),
    context = canvas.getContext("2d"),
    path = d3.geoPath().context(context);

context.beginPath();
path(topojson.mesh(us));
context.stroke();

canvas.toBuffer();
```

## File Reference

<a href="#us/10m.json" name="us/10m.json">#</a> <b>us/10m.json</b> [<>](https://d3js.org/us-10m.v0.json "Source")

A [TopoJSON *topology*](https://github.com/topojson/topojson-specification/blob/master/README.md) containing three geometry collections: <i>counties</i>, <i>states</i>, and <i>nation</i>. The geometry is projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 960×600 viewport. This topology is derived from the Census Bureau’s [cartographic county boundaries](http://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html), 2015 edition; the state boundaries are computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) counties, and the nation boundary is computed by merging states, ensuring a consistent topology.

<a href="#us/10m.json_counties" name="us/10m.json_counties">#</a> *us*.objects.<b>counties</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-counties.png" width="480" height="300">

<a href="#us/10m.json_states" name="us/10m.json_states">#</a> *us*.objects.<b>states</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-states.png" width="480" height="300">

<a href="#us/10m.json_nation" name="us/10m.json_nation">#</a> *us*.objects.<b>nation</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-nation.png" width="480" height="300">

## FIPS Code Reference

| Abbreviation | Code |
|----|----|
| al | 01 |
| ak | 02 |
| az | 04 |
| ar | 05 |
| ca | 06 |
| co | 08 |
| ct | 09 |
| de | 10 |
| dc | 11 |
| fl | 12 |
| ga | 13 |
| hi | 15 |
| id | 16 |
| il | 17 |
| in | 18 |
| ia | 19 |
| ks | 20 |
| ky | 21 |
| la | 22 |
| me | 23 |
| md | 24 |
| ma | 25 |
| mi | 26 |
| mn | 27 |
| ms | 28 |
| mo | 29 |
| mt | 30 |
| ne | 31 |
| nv | 32 |
| nh | 33 |
| nj | 34 |
| nm | 35 |
| ny | 36 |
| nc | 37 |
| nd | 38 |
| oh | 39 |
| ok | 40 |
| or | 41 |
| pa | 42 |
| ri | 44 |
| sc | 45 |
| sd | 46 |
| tn | 47 |
| tx | 48 |
| ut | 49 |
| vt | 50 |
| va | 51 |
| wa | 53 |
| wv | 54 |
| wi | 55 |
| wy | 56 |
| as | 60 |
| fm | 64 |
| gu | 66 |
| mh | 68 |
| mp | 69 |
| pw | 70 |
| pr | 72 |
| um | 74 |
| vi | 78 |
