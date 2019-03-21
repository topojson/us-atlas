# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [Census Bureau’s](http://www.census.gov/) [cartographic boundary shapefiles](https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html), 2017 edition.

### Usage

In a browser (using [d3-geo](https://github.com/d3/d3-geo) and SVG), [bl.ocks.org/4108203](https://bl.ocks.org/mbostock/4108203):

```html
<!DOCTYPE html>
<svg width="960" height="600" fill="none" stroke="#000" stroke-linejoin="round" stroke-linecap="round"></svg>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://unpkg.com/topojson-client@3"></script>
<script>

var svg = d3.select("svg");

var path = d3.geoPath();

d3.json("https://unpkg.com/us-atlas@1/us/10m.json", function(error, us) {
  if (error) throw error;

  svg.append("path")
      .attr("stroke", "#aaa")
      .attr("stroke-width", 0.5)
      .attr("d", path(topojson.mesh(us, us.objects.counties, function(a, b) { return a !== b && (a.id / 1000 | 0) === (b.id / 1000 | 0); })));

  svg.append("path")
      .attr("stroke-width", 0.5)
      .attr("d", path(topojson.mesh(us, us.objects.states, function(a, b) { return a !== b; })));

  svg.append("path")
      .attr("d", path(topojson.feature(us, us.objects.nation)));
});

</script>
```

In a browser (using [d3-geo](https://github.com/d3/d3-geo) and Canvas), [bl.ocks.org/3783604](https://bl.ocks.org/mbostock/3783604):

```html
<!DOCTYPE html>
<canvas width="960" height="600"></canvas>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="https://unpkg.com/topojson-client@3"></script>
<script>

var context = d3.select("canvas").node().getContext("2d"),
    path = d3.geoPath().context(context);

d3.json("https://unpkg.com/us-atlas@1/us/10m.json", function(error, us) {
  if (error) throw error;

  context.beginPath();
  path(topojson.mesh(us));
  context.stroke();
});

</script>
```

In Node (using [d3-geo](https://github.com/d3/d3-geo) and [node-canvas](https://github.com/Automattic/node-canvas)), [bl.ocks.org/885fffe88d72b2a25c090e0bbbef382f](https://bl.ocks.org/mbostock/885fffe88d72b2a25c090e0bbbef382f):

```js
var fs = require("fs"),
    d3 = require("d3-geo"),
    topojson = require("topojson-client"),
    Canvas = require("canvas"),
    us = require("./node_modules/us-atlas/us/10m.json");

var canvas = new Canvas(960, 600),
    context = canvas.getContext("2d"),
    path = d3.geoPath().context(context);

context.beginPath();
path(topojson.mesh(us));
context.stroke();

canvas.pngStream().pipe(fs.createWriteStream("preview.png"));
```

## File Reference

<a href="#us/10m.json" name="us/10m.json">#</a> <b>us/10m.json</b> [<>](https://unpkg.com/us-atlas@1/us/10m.json "Source")

A [TopoJSON *topology*](https://github.com/topojson/topojson-specification/blob/master/README.md#21-topology-objects) containing three geometry collections: <i>counties</i>, <i>states</i>, and <i>nation</i>. The geometry is quantized, projected using [d3.geoAlbersUsa](https://github.com/d3/d3-geo/blob/master/README.md#geoAlbersUsa) to fit a 960×600 viewport, and simplified. This topology is derived from the Census Bureau’s [cartographic county boundaries](http://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html), 2017 edition. The state boundaries are computed by [merging](https://github.com/topojson/topojson-client/blob/master/README.md#merge) counties, and the nation boundary is computed by merging states, ensuring a consistent topology.

<a href="#us/10m.json_counties" name="us/10m.json_counties">#</a> *us*.objects.<b>counties</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-counties.png" width="480" height="300">

<a href="#us/10m.json_states" name="us/10m.json_states">#</a> *us*.objects.<b>states</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-states.png" width="480" height="300">

<a href="#us/10m.json_nation" name="us/10m.json_nation">#</a> *us*.objects.<b>nation</b>

<img src="https://raw.githubusercontent.com/topojson/us-atlas/master/img/us-10m-nation.png" width="480" height="300">
