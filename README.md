# U.S. Atlas TopoJSON

This repository provides a convenient mechanism for generating TopoJSON files from the [National Atlas](http://nationalatlas.gov/) one million-scale dataset and [U.S. Census Bureau](http://www.census.gov/geo/maps-data/data/tiger-line.html) shapefiles.

## Visual Index

<table>
<tr height="162">
<td>airports<br><a href="https://f.cloud.github.com/assets/230541/522339/2f82b0b6-c024-11e2-81fb-509cbfff1bd8.png"><img src="https://f.cloud.github.com/assets/230541/522353/3e214fc4-c024-11e2-8dbd-0bd0e7169666.png"></a></td>
<td>amtrak<br><a href="https://f.cloud.github.com/assets/230541/522340/2f966d72-c024-11e2-8fbf-7f20cb6ff983.png"><img src="https://f.cloud.github.com/assets/230541/522354/3e1fcc4e-c024-11e2-81b3-0d7aaae7660b.png"></a></td>
<td>coast<br><a href="https://f.cloud.github.com/assets/230541/522341/2faab084-c024-11e2-9ee3-8e9449e8ffda.png"><img src="https://f.cloud.github.com/assets/230541/522352/3e1f4224-c024-11e2-8a39-94a103196358.png"></a></td>
<td>congress<br><a href="https://f.cloud.github.com/assets/230541/522393/db95f2d2-c029-11e2-88e8-713345e1693d.png"><img src="https://f.cloud.github.com/assets/230541/522392/db84d61e-c029-11e2-9aa3-451ec17f5e92.png"></a></td>
</tr>
<tr height="162">
<td>counties<br><a href="https://f.cloud.github.com/assets/230541/522342/2fac7d10-c024-11e2-9971-131003e483a5.png"><img src="https://f.cloud.github.com/assets/230541/522357/3e22601c-c024-11e2-9348-c786552f8f6e.png"></a></td>
<td>ferries<br><a href="https://f.cloud.github.com/assets/230541/522343/2fabb434-c024-11e2-93bd-57d9676abaa4.png"><img src="https://f.cloud.github.com/assets/230541/522355/3e21b496-c024-11e2-97fc-4a7431d7223d.png"></a></td>
<td>nation<br><a href="https://f.cloud.github.com/assets/230541/522344/2fab4e9a-c024-11e2-912c-4c092876f150.png"><img src="https://f.cloud.github.com/assets/230541/522356/3e203de6-c024-11e2-83cd-355e3924d4bf.png"></a></td>
<td>ports<br><a href="https://f.cloud.github.com/assets/230541/522345/2fac0de4-c024-11e2-81da-8cc438ca13c2.png"><img src="https://f.cloud.github.com/assets/230541/522359/3e32a97c-c024-11e2-8589-1c2b7a0ae02b.png"></a></td>
</tr>
<tr height="162">
<td>railroads<br><a href="https://f.cloud.github.com/assets/230541/522346/2faeab80-c024-11e2-9b3f-47abb264646b.png"><img src="https://f.cloud.github.com/assets/230541/522360/3e357832-c024-11e2-974e-a2a58108eee0.png"></a></td>
<td>roads<br><a href="https://f.cloud.github.com/assets/230541/522347/2fbe814a-c024-11e2-9d3f-be2d2419cb98.png"><img src="https://f.cloud.github.com/assets/230541/522362/3e349520-c024-11e2-906a-e36d5d5aced1.png"></a></td>
<td>states<br><a href="https://f.cloud.github.com/assets/230541/522348/2fbf8b80-c024-11e2-853a-d01f0705b2dd.png"><img src="https://f.cloud.github.com/assets/230541/522358/3e33b86c-c024-11e2-99fd-fac212d3f701.png"></a></td>
<td>streams<br><a href="https://f.cloud.github.com/assets/230541/522349/2fbe8eb0-c024-11e2-896a-2421f130a161.png"><img src="https://f.cloud.github.com/assets/230541/522363/3e3476ee-c024-11e2-85b9-326f8c590839.png"></a></td>
</tr>
<tr height="162">
<td>waterbodies<br><a href="https://f.cloud.github.com/assets/230541/522350/2fbf9bac-c024-11e2-9976-cebc748ce4dc.png"><img src="https://f.cloud.github.com/assets/230541/522361/3e360018-c024-11e2-9ffa-669673f84139.png"></a></td>
<td>zipcodes<br><a href="https://f.cloud.github.com/assets/230541/522351/2fc1e966-c024-11e2-873d-872814ed0cad.png"><img src="https://f.cloud.github.com/assets/230541/522364/3e4658e6-c024-11e2-82a6-708af316bf84.png"></a></td>
</tr>
</table>

## Installing via Homebrew

Before you can run `make`, you’ll need to install Node.js. Here’s how to do that using [Homebrew](http://mxcl.github.com/homebrew/) on Mac OS X:

```bash
brew install node
```

And then, clone this repository, install its dependencies and run `make`:

```bash
git clone https://github.com/mbostock/us-atlas.git
cd us-atlas
npm install
make
```

If you want to install this software using an alternate method see the website for [TopoJSON](https://github.com/mbostock/topojson). I also recommend reading my tutorial, [Let’s Make a Map](http://bost.ocks.org/mike/map/).

## Generating TopoJSON

Once you have everything installed, simply run:

```
make
```

This will generate a large number of TopoJSON files of varying size in the `topo` directory. As a by-product of producing these files, you’ll also download shapefiles directly from the National Atlas or the Census Bureau.

`make` and `make all` generate TopoJSON files for the boundaries of the United States. In addition, you can run `make topo/us-streams.json` and `make topo/us-roads.json` to generate TopoJSON for streams and roads. These aren't made by default because of their size. `us-streams.json` requires a 180M download and 4.5GB of memory to generate.

If you want to generate a custom map, I recommend modifying the Makefile. Or, just use the Makefile as a set of examples, and run the appropriate `ogr2ogr` and `topojson` commands from the terminal.
