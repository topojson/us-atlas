# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [National Atlas](http://nationalatlas.gov/) one million-scale dataset.

## Installing via Homebrew

Before you can run `make`, you’ll need to install Node.js. Here’s how to do that using [Homebrew](http://mxcl.github.com/homebrew/) on Mac OS X:

```bash
brew install node
```

And then, from this repository’s root directory, install the dependencies:

```bash
npm install
```

If you want to install this software using an alternate method see the website for [TopoJSON](https://github.com/mbostock/topojson). I also recommend reading my tutorial, [Let’s Make a Map](http://bost.ocks.org/mike/map/).

## Generating TopoJSON

Once you have everything installed, simply run:

```
make
```

This will generate a large number of TopoJSON files of varying size in the `topo` directory. As a by-product of producing these files, you’ll also download the one million-scale shapefiles directly from the National Atlas and convert them into GeoJSON and filter.

`make` and `make all` generate TopoJSON files for the boundaries of the United States. In addition, you can run
`make topo/streams.json` and `make topo/roads.json` to generate TopoJSON for streams and roads. These aren't
made by default because of their size. `streams.json` requires a 180M download and 4.5GB of memory to generate.

If you want to generate a custom map, I recommend modifying the Makefile. Or, just use the Makefile as a set of examples, and run the appropriate `ogr2ogr` and `topojson` commands from the terminal.
