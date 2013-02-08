# U.S. Atlas TopoJSON

This repository provides a Makefile a few scripts for generating TopoJSON files from the [National Atlas](http://nationalatlas.gov/) one million-scale dataset.

## Installing via Homebrew

Before you can run `make`, you’ll need to install some needed software. Here’s how to do that using [Homebrew](http://mxcl.github.com/homebrew/) on Mac OS X:

```bash
brew install node
brew install gdal
npm install -g topojson
```

If you want to install this software using an alternate method, see the respective websites for [TopoJSON](https://github.com/mbostock/topojson) and [GDAL](http://www.gdal.org/). I also recommend reading my tutorial, [Let’s Make a Map](http://bost.ocks.org/mike/map/).

## Generating TopoJSON

Once you have everything installed, simply run:

```
make
```

This will generate a large number of TopoJSON files of varying size in the `topo` directory. As a by-product of producing these files, you’ll also download the one million-scale shapefiles directly from the National Atlas and convert them into GeoJSON and filter using `ogr2ogr`.

If you want to generate a custom map, I recommend modifying the Makefile. Or, just use the Makefile as a set of examples, and run the appropriate `ogr2ogr` and `topojson` commands from the terminal.
