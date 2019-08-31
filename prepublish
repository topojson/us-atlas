#!/bin/bash

rm -rvf *-10m.json
mkdir -p build

if [ ! -f build/cb_2017_us_county_5m.shp ]; then
  curl -o build/cb_2017_us_county_5m.zip 'https://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_county_5m.zip'
  unzip -od build build/cb_2017_us_county_5m.zip cb_2017_us_county_5m.shp cb_2017_us_county_5m.dbf
  chmod a-x build/cb_2017_us_county_5m.*
fi

if [ ! -f build/cb_2017_us_state_5m.shp ]; then
  curl -o build/cb_2017_us_state_5m.zip 'https://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_state_5m.zip'
  unzip -od build build/cb_2017_us_state_5m.zip cb_2017_us_state_5m.shp cb_2017_us_state_5m.dbf
  chmod a-x build/cb_2017_us_state_5m.*
fi

if [ ! -f build/cb_2017_us_nation_5m.shp ]; then
  curl -o build/cb_2017_us_nation_5m.zip 'https://www2.census.gov/geo/tiger/GENZ2017/shp/cb_2017_us_nation_5m.zip'
  unzip -od build build/cb_2017_us_nation_5m.zip cb_2017_us_nation_5m.shp cb_2017_us_nation_5m.dbf
  chmod a-x build/cb_2017_us_nation_5m.*
fi

geo2topo -q 1e5 -n counties=<( \
    shp2json -n build/cb_2017_us_county_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, delete d.properties, d)') \
  | toposimplify -f -s 1e-7 \
  | topomerge states=counties -k 'd.id.slice(0, 2)' \
  | topomerge nation=states \
  | node ./properties.js \
  > counties-10m.json

geo2topo -q 1e5 -n counties=<( \
    shp2json -n build/cb_2017_us_county_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, delete d.properties, d)' \
      | geoproject -n 'd3.geoAlbersUsa().scale(1300).translate([487.5, 305])') \
  | toposimplify -f -p 0.25 \
  | topomerge states=counties -k 'd.id.slice(0, 2)' \
  | topomerge nation=states \
  | node ./properties.js \
  > counties-albers-10m.json

geo2topo -q 1e5 -n states=<( \
    shp2json -n build/cb_2017_us_state_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, d.properties = {name: d.properties.NAME}, d)') \
  | toposimplify -f -s 1e-7 \
  | topomerge nation=states \
  > states-10m.json

geo2topo -q 1e5 -n states=<( \
    shp2json -n build/cb_2017_us_state_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, d.properties = {name: d.properties.NAME}, d)' \
      | geoproject -n 'd3.geoAlbersUsa().scale(1300).translate([487.5, 305])') \
  | toposimplify -f -p 0.25 \
  | topomerge nation=states \
  > states-albers-10m.json

geo2topo -q 1e5 -n nation=<( \
    shp2json -n build/cb_2017_us_nation_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, d.properties = {name: d.properties.NAME}, d)') \
  | toposimplify -f -s 1e-7 \
  > nation-10m.json

geo2topo -q 1e5 -n nation=<( \
    shp2json -n build/cb_2017_us_nation_5m.shp \
      | ndjson-filter '!/000$/.test(d.properties.GEOID)' \
      | ndjson-map '(d.id = d.properties.GEOID, d.properties = {name: d.properties.NAME}, d)' \
      | geoproject -n 'd3.geoAlbersUsa().scale(1300).translate([487.5, 305])') \
  | toposimplify -f -p 0.25 \
  > nation-albers-10m.json
