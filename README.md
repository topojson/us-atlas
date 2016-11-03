# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [National Map](http://nationalmap.gov/) [one million-scale dataset](https://nationalmap.gov/small_scale/atlasftp.html) and [U.S. Census Bureau](http://www.census.gov/geo/maps-data/data/tiger-line.html) [shapefiles](https://www.census.gov/cgi-bin/geo/shapefiles/index.php).

### Usage

In a browser (using [d3-geo](https://github.com/d3/d3-geo) and Canvas):

```html
<!DOCTYPE html>
<canvas width="960" height="600"></canvas>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://d3js.org/topojson.v2.min.js"></script>
<script>

var context = d3.select("canvas").node().getContext("2d"),
    path = d3.geoPath().context(context);

d3.json("https://unpkg.com/us-atlas/us/10m.json", function(error, us) {
  if (error) throw error;

  context.beginPath();
  path(topojson.mesh(us));
  context.stroke();
});

</script>
```
http://bl.ocks.org/mbostock/3783604

In Node ([RunKit](https://runkit.com/home), using [node-canvas](https://github.com/Automattic/node-canvas)):

```js
var d3 = require("d3-geo"),
    topojson = require("topojson-client"),
    Canvas = require("canvas"),
    us = require("us-atlas/us/10m.json");

var canvas = new Canvas(960, 600),
    context = canvas.getContext("2d"),
    path = d3.geoPath().context(context);

context.beginPath();
path(topojson.mesh(us));
context.stroke();

canvas.toBuffer();
```
https://runkit.com/mbostock/rasterizing-us-atlas

## File Reference

<a href="#us/10m.json" name="us/10m.json">#</a> <b>us/10m.json</b> [<>](https://unpkg.com/us-atlas/us/10m.json "Source")

A [TopoJSON *topology*](https://github.com/topojson/topojson-specification/blob/master/README.md) containing three geometry collections: <i>counties</i>, <i>states</i>, and <i>nation</i>.

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-counties.png" width="480" height="300">

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-states.png" width="480" height="300">

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-nation.png" width="480" height="300">

This topology is derived from the Census Bureau’s [cartographic county boundaries](http://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html), 2015 edition, and projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 960×600 viewport.

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
