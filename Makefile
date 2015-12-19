# Census Bureau Geographic Hierarchy
# http://www.census.gov/geo/www/geodiagram.html

# states:
# al ak az ar ca co ct de dc fl
# ga hi id il in ia ks ky la me
# md ma mi mn ms mo mt ne nv nh
# nj nm ny nc nd oh ok or pa ri
# sc sd tn tx ut vt va wa wv wi
# wy

# territories with counties:
# pr vi

# territories without counties:
# as fm gu mh mp pw um

all:

.SECONDARY:

# http://www.nationalatlas.gov/atlasftp-1m.html
gz/%.tar.gz:
	mkdir -p $(dir $@)
	curl 'http://dds.cr.usgs.gov/pub/data/nationalatlas/$(notdir $@)' -o $@.download
	mv $@.download $@

# Zip Code Tabulation Areas
gz/tl_2012_us_zcta510.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2012/ZCTA5/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Tracts
gz/tl_2012_%_tract.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2012/TRACT/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Block Groups
gz/tl_2012_%_bg.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2012/BG/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Blocks
gz/tl_2012_%_tabblock.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2012/TABBLOCK/$(notdir $@)' -o $@.download
	mv $@.download $@

# Core Based Statistical Areas
gz/tl_2012_us_cbsa.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2012/CBSA/$(notdir $@)' -o $@.download
	mv $@.download $@

# Congressional Districts (Alternative)
gz/tl_2013_us_cd113.zip:
	mkdir -p $(dir $@)
	curl 'ftp://ftp2.census.gov/geo/tiger/TIGER2013/CD/$(notdir $@)' -o $@.download
	mv $@.download $@

shp/us/nation-unmerged.shp: gz/nationalp010g_nt00797.tar.gz
shp/us/states-unfiltered.shp: gz/statep010_nt00798.tar.gz
shp/us/counties-unfiltered.shp: gz/countyp010_nt00795.tar.gz
shp/us/coast.shp: gz/coastll010_nt00794.tar.gz
shp/us/airports.shp: gz/airprtx010g_nt00802.tar.gz
shp/us/ferries.shp: gz/ferry_l010g_nt00796.tar.gz
shp/us/ports.shp: gz/portsx010g.shp_nt00824.tar.gz
shp/us/amtrak.shp: gz/amtrakx010g.shp_nt00823.tar.gz
shp/us/railroads.shp: gz/railrdl010_nt00800.tar.gz
shp/us/roads-unmerged.shp: gz/roadtrl010_nt00801.tar.gz
shp/us/streams-unmerged.shp: gz/streaml010_nt00804.tar.gz
shp/us/waterbodies.shp: gz/wtrbdyp010_nt00803.tar.gz
# shp/us/congress.shp: gz/cgd113p010g.shp_nt00845.tar.gz
shp/us/congress-unfiltered.shp: gz/tl_2013_us_cd113.zip
shp/us/zipcodes-unmerged.shp: gz/tl_2012_us_zcta510.zip
shp/us/cbsa.shp: gz/tl_2012_us_cbsa.zip

shp/al/tracts.shp: gz/tl_2012_01_tract.zip
shp/ak/tracts.shp: gz/tl_2012_02_tract.zip
shp/az/tracts.shp: gz/tl_2012_04_tract.zip
shp/ar/tracts.shp: gz/tl_2012_05_tract.zip
shp/ca/tracts.shp: gz/tl_2012_06_tract.zip
shp/co/tracts.shp: gz/tl_2012_08_tract.zip
shp/ct/tracts.shp: gz/tl_2012_09_tract.zip
shp/de/tracts.shp: gz/tl_2012_10_tract.zip
shp/dc/tracts.shp: gz/tl_2012_11_tract.zip
shp/fl/tracts.shp: gz/tl_2012_12_tract.zip
shp/ga/tracts.shp: gz/tl_2012_13_tract.zip
shp/hi/tracts.shp: gz/tl_2012_15_tract.zip
shp/id/tracts.shp: gz/tl_2012_16_tract.zip
shp/il/tracts.shp: gz/tl_2012_17_tract.zip
shp/in/tracts.shp: gz/tl_2012_18_tract.zip
shp/ia/tracts.shp: gz/tl_2012_19_tract.zip
shp/ks/tracts.shp: gz/tl_2012_20_tract.zip
shp/ky/tracts.shp: gz/tl_2012_21_tract.zip
shp/la/tracts.shp: gz/tl_2012_22_tract.zip
shp/me/tracts.shp: gz/tl_2012_23_tract.zip
shp/md/tracts.shp: gz/tl_2012_24_tract.zip
shp/ma/tracts.shp: gz/tl_2012_25_tract.zip
shp/mi/tracts.shp: gz/tl_2012_26_tract.zip
shp/mn/tracts.shp: gz/tl_2012_27_tract.zip
shp/ms/tracts.shp: gz/tl_2012_28_tract.zip
shp/mo/tracts.shp: gz/tl_2012_29_tract.zip
shp/mt/tracts.shp: gz/tl_2012_30_tract.zip
shp/ne/tracts.shp: gz/tl_2012_31_tract.zip
shp/nv/tracts.shp: gz/tl_2012_32_tract.zip
shp/nh/tracts.shp: gz/tl_2012_33_tract.zip
shp/nj/tracts.shp: gz/tl_2012_34_tract.zip
shp/nm/tracts.shp: gz/tl_2012_35_tract.zip
shp/ny/tracts.shp: gz/tl_2012_36_tract.zip
shp/nc/tracts.shp: gz/tl_2012_37_tract.zip
shp/nd/tracts.shp: gz/tl_2012_38_tract.zip
shp/oh/tracts.shp: gz/tl_2012_39_tract.zip
shp/ok/tracts.shp: gz/tl_2012_40_tract.zip
shp/or/tracts.shp: gz/tl_2012_41_tract.zip
shp/pa/tracts.shp: gz/tl_2012_42_tract.zip
shp/ri/tracts.shp: gz/tl_2012_44_tract.zip
shp/sc/tracts.shp: gz/tl_2012_45_tract.zip
shp/sd/tracts.shp: gz/tl_2012_46_tract.zip
shp/tn/tracts.shp: gz/tl_2012_47_tract.zip
shp/tx/tracts.shp: gz/tl_2012_48_tract.zip
shp/ut/tracts.shp: gz/tl_2012_49_tract.zip
shp/vt/tracts.shp: gz/tl_2012_50_tract.zip
shp/va/tracts.shp: gz/tl_2012_51_tract.zip
shp/wa/tracts.shp: gz/tl_2012_53_tract.zip
shp/wv/tracts.shp: gz/tl_2012_54_tract.zip
shp/wi/tracts.shp: gz/tl_2012_55_tract.zip
shp/wy/tracts.shp: gz/tl_2012_56_tract.zip
shp/as/tracts.shp: gz/tl_2012_60_tract.zip
shp/fm/tracts.shp: gz/tl_2012_64_tract.zip
shp/gu/tracts.shp: gz/tl_2012_66_tract.zip
shp/mh/tracts.shp: gz/tl_2012_68_tract.zip
shp/mp/tracts.shp: gz/tl_2012_69_tract.zip
shp/pw/tracts.shp: gz/tl_2012_70_tract.zip
shp/pr/tracts.shp: gz/tl_2012_72_tract.zip
shp/um/tracts.shp: gz/tl_2012_74_tract.zip
shp/vi/tracts.shp: gz/tl_2012_78_tract.zip

shp/al/blockgroups.shp: gz/tl_2012_01_bg.zip
shp/ak/blockgroups.shp: gz/tl_2012_02_bg.zip
shp/az/blockgroups.shp: gz/tl_2012_04_bg.zip
shp/ar/blockgroups.shp: gz/tl_2012_05_bg.zip
shp/ca/blockgroups.shp: gz/tl_2012_06_bg.zip
shp/co/blockgroups.shp: gz/tl_2012_08_bg.zip
shp/ct/blockgroups.shp: gz/tl_2012_09_bg.zip
shp/de/blockgroups.shp: gz/tl_2012_10_bg.zip
shp/dc/blockgroups.shp: gz/tl_2012_11_bg.zip
shp/fl/blockgroups.shp: gz/tl_2012_12_bg.zip
shp/ga/blockgroups.shp: gz/tl_2012_13_bg.zip
shp/hi/blockgroups.shp: gz/tl_2012_15_bg.zip
shp/id/blockgroups.shp: gz/tl_2012_16_bg.zip
shp/il/blockgroups.shp: gz/tl_2012_17_bg.zip
shp/in/blockgroups.shp: gz/tl_2012_18_bg.zip
shp/ia/blockgroups.shp: gz/tl_2012_19_bg.zip
shp/ks/blockgroups.shp: gz/tl_2012_20_bg.zip
shp/ky/blockgroups.shp: gz/tl_2012_21_bg.zip
shp/la/blockgroups.shp: gz/tl_2012_22_bg.zip
shp/me/blockgroups.shp: gz/tl_2012_23_bg.zip
shp/md/blockgroups.shp: gz/tl_2012_24_bg.zip
shp/ma/blockgroups.shp: gz/tl_2012_25_bg.zip
shp/mi/blockgroups.shp: gz/tl_2012_26_bg.zip
shp/mn/blockgroups.shp: gz/tl_2012_27_bg.zip
shp/ms/blockgroups.shp: gz/tl_2012_28_bg.zip
shp/mo/blockgroups.shp: gz/tl_2012_29_bg.zip
shp/mt/blockgroups.shp: gz/tl_2012_30_bg.zip
shp/ne/blockgroups.shp: gz/tl_2012_31_bg.zip
shp/nv/blockgroups.shp: gz/tl_2012_32_bg.zip
shp/nh/blockgroups.shp: gz/tl_2012_33_bg.zip
shp/nj/blockgroups.shp: gz/tl_2012_34_bg.zip
shp/nm/blockgroups.shp: gz/tl_2012_35_bg.zip
shp/ny/blockgroups.shp: gz/tl_2012_36_bg.zip
shp/nc/blockgroups.shp: gz/tl_2012_37_bg.zip
shp/nd/blockgroups.shp: gz/tl_2012_38_bg.zip
shp/oh/blockgroups.shp: gz/tl_2012_39_bg.zip
shp/ok/blockgroups.shp: gz/tl_2012_40_bg.zip
shp/or/blockgroups.shp: gz/tl_2012_41_bg.zip
shp/pa/blockgroups.shp: gz/tl_2012_42_bg.zip
shp/ri/blockgroups.shp: gz/tl_2012_44_bg.zip
shp/sc/blockgroups.shp: gz/tl_2012_45_bg.zip
shp/sd/blockgroups.shp: gz/tl_2012_46_bg.zip
shp/tn/blockgroups.shp: gz/tl_2012_47_bg.zip
shp/tx/blockgroups.shp: gz/tl_2012_48_bg.zip
shp/ut/blockgroups.shp: gz/tl_2012_49_bg.zip
shp/vt/blockgroups.shp: gz/tl_2012_50_bg.zip
shp/va/blockgroups.shp: gz/tl_2012_51_bg.zip
shp/wa/blockgroups.shp: gz/tl_2012_53_bg.zip
shp/wv/blockgroups.shp: gz/tl_2012_54_bg.zip
shp/wi/blockgroups.shp: gz/tl_2012_55_bg.zip
shp/wy/blockgroups.shp: gz/tl_2012_56_bg.zip
shp/as/blockgroups.shp: gz/tl_2012_60_bg.zip
shp/fm/blockgroups.shp: gz/tl_2012_64_bg.zip
shp/gu/blockgroups.shp: gz/tl_2012_66_bg.zip
shp/mh/blockgroups.shp: gz/tl_2012_68_bg.zip
shp/mp/blockgroups.shp: gz/tl_2012_69_bg.zip
shp/pw/blockgroups.shp: gz/tl_2012_70_bg.zip
shp/pr/blockgroups.shp: gz/tl_2012_72_bg.zip
shp/um/blockgroups.shp: gz/tl_2012_74_bg.zip
shp/vi/blockgroups.shp: gz/tl_2012_78_bg.zip

shp/al/blocks.shp: gz/tl_2012_01_tabblock.zip
shp/ak/blocks.shp: gz/tl_2012_02_tabblock.zip
shp/az/blocks.shp: gz/tl_2012_04_tabblock.zip
shp/ar/blocks.shp: gz/tl_2012_05_tabblock.zip
shp/ca/blocks.shp: gz/tl_2012_06_tabblock.zip
shp/co/blocks.shp: gz/tl_2012_08_tabblock.zip
shp/ct/blocks.shp: gz/tl_2012_09_tabblock.zip
shp/de/blocks.shp: gz/tl_2012_10_tabblock.zip
shp/dc/blocks.shp: gz/tl_2012_11_tabblock.zip
shp/fl/blocks.shp: gz/tl_2012_12_tabblock.zip
shp/ga/blocks.shp: gz/tl_2012_13_tabblock.zip
shp/hi/blocks.shp: gz/tl_2012_15_tabblock.zip
shp/id/blocks.shp: gz/tl_2012_16_tabblock.zip
shp/il/blocks.shp: gz/tl_2012_17_tabblock.zip
shp/in/blocks.shp: gz/tl_2012_18_tabblock.zip
shp/ia/blocks.shp: gz/tl_2012_19_tabblock.zip
shp/ks/blocks.shp: gz/tl_2012_20_tabblock.zip
shp/ky/blocks.shp: gz/tl_2012_21_tabblock.zip
shp/la/blocks.shp: gz/tl_2012_22_tabblock.zip
shp/me/blocks.shp: gz/tl_2012_23_tabblock.zip
shp/md/blocks.shp: gz/tl_2012_24_tabblock.zip
shp/ma/blocks.shp: gz/tl_2012_25_tabblock.zip
shp/mi/blocks.shp: gz/tl_2012_26_tabblock.zip
shp/mn/blocks.shp: gz/tl_2012_27_tabblock.zip
shp/ms/blocks.shp: gz/tl_2012_28_tabblock.zip
shp/mo/blocks.shp: gz/tl_2012_29_tabblock.zip
shp/mt/blocks.shp: gz/tl_2012_30_tabblock.zip
shp/ne/blocks.shp: gz/tl_2012_31_tabblock.zip
shp/nv/blocks.shp: gz/tl_2012_32_tabblock.zip
shp/nh/blocks.shp: gz/tl_2012_33_tabblock.zip
shp/nj/blocks.shp: gz/tl_2012_34_tabblock.zip
shp/nm/blocks.shp: gz/tl_2012_35_tabblock.zip
shp/ny/blocks.shp: gz/tl_2012_36_tabblock.zip
shp/nc/blocks.shp: gz/tl_2012_37_tabblock.zip
shp/nd/blocks.shp: gz/tl_2012_38_tabblock.zip
shp/oh/blocks.shp: gz/tl_2012_39_tabblock.zip
shp/ok/blocks.shp: gz/tl_2012_40_tabblock.zip
shp/or/blocks.shp: gz/tl_2012_41_tabblock.zip
shp/pa/blocks.shp: gz/tl_2012_42_tabblock.zip
shp/ri/blocks.shp: gz/tl_2012_44_tabblock.zip
shp/sc/blocks.shp: gz/tl_2012_45_tabblock.zip
shp/sd/blocks.shp: gz/tl_2012_46_tabblock.zip
shp/tn/blocks.shp: gz/tl_2012_47_tabblock.zip
shp/tx/blocks.shp: gz/tl_2012_48_tabblock.zip
shp/ut/blocks.shp: gz/tl_2012_49_tabblock.zip
shp/vt/blocks.shp: gz/tl_2012_50_tabblock.zip
shp/va/blocks.shp: gz/tl_2012_51_tabblock.zip
shp/wa/blocks.shp: gz/tl_2012_53_tabblock.zip
shp/wv/blocks.shp: gz/tl_2012_54_tabblock.zip
shp/wi/blocks.shp: gz/tl_2012_55_tabblock.zip
shp/wy/blocks.shp: gz/tl_2012_56_tabblock.zip
shp/as/blocks.shp: gz/tl_2012_60_tabblock.zip
shp/fm/blocks.shp: gz/tl_2012_64_tabblock.zip
shp/gu/blocks.shp: gz/tl_2012_66_tabblock.zip
shp/mh/blocks.shp: gz/tl_2012_68_tabblock.zip
shp/mp/blocks.shp: gz/tl_2012_69_tabblock.zip
shp/pw/blocks.shp: gz/tl_2012_70_tabblock.zip
shp/pr/blocks.shp: gz/tl_2012_72_tabblock.zip
shp/um/blocks.shp: gz/tl_2012_74_tabblock.zip
shp/vi/blocks.shp: gz/tl_2012_78_tabblock.zip

shp/us/%.shp:
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar -xzm -C $(basename $@) -f $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)

# remove water counties (e.g., Great Lakes)
shp/us/counties.shp: shp/us/counties-unfiltered.shp
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "FIPS NOT LIKE '%000'" $@ $<

# remove undefined congressional districts
shp/us/congress-ungrouped.shp: shp/us/congress-unfiltered.shp
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "GEOID NOT LIKE '%ZZ'" $@ $<

# remove duplicate states for water (e.g., Great Lakes)
shp/us/states.shp: shp/us/states-unfiltered.shp bin/geouniq
	@rm -f -- $@ $(basename $@)-unfiltered.json
	ogr2ogr -f 'GeoJSON' $(basename $@)-unfiltered.json $<
	bin/geouniq STATE_FIPS < $(basename $@)-unfiltered.json > $(basename $@).json
	ogr2ogr -f 'ESRI Shapefile' $@ $(basename $@).json
	rm -f -- $(basename $@).json $(basename $@).json

# merge the nation object into a single MultiPolygon
shp/us/nation.json: shp/us/nation-unmerged.shp bin/geomerge
	@rm -f -- $@ $(basename $@)-unmerged.json
	ogr2ogr -f 'GeoJSON' $(basename $@)-unmerged.json $<
	bin/geomerge 1 < $(basename $@)-unmerged.json > $@

# merge geometries
shp/us/%.json: shp/us/%-unmerged.shp bin/geomerge
	@rm -f -- $@ $(basename $@)-unmerged.json
	ogr2ogr -f 'GeoJSON' $(basename $@)-unmerged.json $<
	bin/geomerge < $(basename $@)-unmerged.json > $@

shp/us/zipcodes-unmerged.shp shp/us/cbsa.shp shp/%/tracts.shp shp/%/blockgroups.shp shp/%/blocks.shp:
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)
	touch $@

shp/al/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '01'" $@ $<

shp/ak/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '02'" $@ $<

shp/az/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '04'" $@ $<

shp/ar/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '05'" $@ $<

shp/ca/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '06'" $@ $<

shp/co/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '08'" $@ $<

shp/ct/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '09'" $@ $<

shp/de/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '10'" $@ $<

shp/dc/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '11'" $@ $<

shp/fl/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '12'" $@ $<

shp/ga/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '13'" $@ $<

shp/hi/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '15'" $@ $<

shp/id/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '16'" $@ $<

shp/il/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '17'" $@ $<

shp/in/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '18'" $@ $<

shp/ia/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '19'" $@ $<

shp/ks/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '20'" $@ $<

shp/ky/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '21'" $@ $<

shp/la/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '22'" $@ $<

shp/me/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '23'" $@ $<

shp/md/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '24'" $@ $<

shp/ma/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '25'" $@ $<

shp/mi/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '26'" $@ $<

shp/mn/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '27'" $@ $<

shp/ms/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '28'" $@ $<

shp/mo/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '29'" $@ $<

shp/mt/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '30'" $@ $<

shp/ne/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '31'" $@ $<

shp/nv/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '32'" $@ $<

shp/nh/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '33'" $@ $<

shp/nj/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '34'" $@ $<

shp/nm/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '35'" $@ $<

shp/ny/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '36'" $@ $<

shp/nc/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '37'" $@ $<

shp/nd/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '38'" $@ $<

shp/oh/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '39'" $@ $<

shp/ok/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '40'" $@ $<

shp/or/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '41'" $@ $<

shp/pa/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '42'" $@ $<

shp/ri/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '44'" $@ $<

shp/sc/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '45'" $@ $<

shp/sd/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '46'" $@ $<

shp/tn/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '47'" $@ $<

shp/tx/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '48'" $@ $<

shp/ut/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '49'" $@ $<

shp/vt/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '50'" $@ $<

shp/va/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '51'" $@ $<

shp/wa/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '53'" $@ $<

shp/wv/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '54'" $@ $<

shp/wi/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '55'" $@ $<

shp/wy/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '56'" $@ $<

shp/as/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '60'" $@ $<

shp/fm/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '64'" $@ $<

shp/gu/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '66'" $@ $<

shp/mh/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '68'" $@ $<

shp/mp/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '69'" $@ $<

shp/pw/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '70'" $@ $<

shp/pr/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '72'" $@ $<

shp/um/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '74'" $@ $<

shp/vi/states.shp: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE_FIPS = '78'" $@ $<

shp/%/counties.shp: shp/us/counties.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f 'ESRI Shapefile' -where "STATE = '`echo $* | tr a-z A-Z`'" $@ $<

png/%.png: shp/%.shp bin/rasterize
	mkdir -p $(dir $@)
	node --max_old_space_size=8192 bin/rasterize $< $@
	optipng $@

topo/us-congress-10m-ungrouped.json: shp/us/congress-ungrouped.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=+GEOID \
		-- districts=$<

topo/us-counties-10m-ungrouped.json: shp/us/counties.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=+FIPS \
		--properties COUNTY,COUNTYP010 \
		-- $<

topo/us-%-counties-10m-ungrouped.json: shp/%/counties.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=+FIPS \
		--properties COUNTY,COUNTYP010 \
		-- $<

# Group polygons into multipolygons.
topo/us-%-10m.json: topo/us-%-10m-ungrouped.json
	node_modules/.bin/topojson-group \
		-o $@ \
		-- topo/us-$*-10m-ungrouped.json

# Merge counties into states.
topo/us-states-10m.json: topo/us-counties-10m.json
	node_modules/.bin/topojson-merge \
		-o $@ \
		--in-object=counties \
		--out-object=states \
		--key='d.id / 1000 | 0' \
		-- topo/us-counties-10m.json

# Merge states into the nation (land).
topo/us-10m.json: topo/us-states-10m.json
	node_modules/.bin/topojson-merge \
		-o $@ \
		--in-object=states \
		--out-object=land \
		--no-key \
		-- topo/us-states-10m.json

STATES=al ak az ar ca co ct de dc fl ga hi id il in ia ks ky la me md ma mi mn ms mo mt ne nv nh nj nm ny nc nd oh ok or pa ri sc sd tn tx ut vt va wa wv wi wy
.PHONY: all-counties
all-counties:
	for i in ${STATES} ; do make topo/us-$$i-counties-10m.json ; done
