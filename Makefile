TOPOJSON = ./node_modules/topojson/bin/topojson

STATES = \
	us \
	al ak az ar ca co ct de dc fl \
	ga hi id il in ia ks ky la me \
	md ma mi mn ms mo mt ne nv nh \
	nj nm ny nc nd oh ok or pa ri \
	sc sd tn tx ut vt va wa wv wi \
	wy as fm gu mh mp pw pr um vi

all: $(addprefix topo/,$(addsuffix .json,$(STATES)))

# http://www.nationalatlas.gov/atlasftp-1m.html
gz/%.tar.gz:
	mkdir -p $(dir $@) && curl http://dds.cr.usgs.gov/pub/data/nationalatlas/$*.tar.gz -o $@.download && mv $@.download $@

shp/nationalp010g.shp: gz/nationalp010g_nt00797.tar.gz
	mkdir -p $(dir $@) && tar -xzm -C shp -f $<

shp/statep010.shp: gz/statep010_nt00798.tar.gz
	mkdir -p $(dir $@) && tar -xzm -C shp -f $<

shp/countyp010.shp: gz/countyp010_nt00795.tar.gz
	mkdir -p $(dir $@) && tar -xzm -C shp -f $<

# For individual states:
# - use the default TopoJSON quantization
# - remove duplicate state geometries (e.g., Great Lakes)
topo/%.json: geo/%/counties.json geo/%/states.json
	mkdir -p $(dir $@) && $(TOPOJSON) --id-property=+FIPS,+STATE_FIPS -p COUNTY=name,STATE=name -- $(filter %.json,$^) | ./topouniq states > $@

# For the full United States:
# - increase TopoJSON’s quantization by 10x
# - remove duplicate state geometries (e.g., Great Lakes)
# - merge the nation object into a single MultiPolygon
topo/us.json: geo/us/counties.json geo/us/states.json geo/us/nation.json
	mkdir -p $(dir $@) && $(TOPOJSON) -q 1e5 --id-property=+FIPS,+STATE_FIPS -p COUNTY=name,STATE=name -- $(filter %.json,$^) | ./topouniq states | ./topomerge nation 1 > $@

geo/us/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON $@ $<

geo/us/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON $@ $<

geo/us/nation.json: shp/nationalp010g.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON $@ $<

geo/al/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'AL'" $@ $<

geo/al/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '01'" $@ $<

geo/ak/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'AK'" $@ $<

geo/ak/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '02'" $@ $<

geo/az/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'AZ'" $@ $<

geo/az/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '04'" $@ $<

geo/ar/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'AR'" $@ $<

geo/ar/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '05'" $@ $<

geo/ca/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'CA'" $@ $<

geo/ca/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '06'" $@ $<

geo/co/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'CO'" $@ $<

geo/co/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '08'" $@ $<

geo/ct/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'CT'" $@ $<

geo/ct/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '09'" $@ $<

geo/de/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'DE'" $@ $<

geo/de/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '10'" $@ $<

geo/dc/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'DC'" $@ $<

geo/dc/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '11'" $@ $<

geo/fl/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'FL'" $@ $<

geo/fl/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '12'" $@ $<

geo/ga/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'GA'" $@ $<

geo/ga/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '13'" $@ $<

geo/hi/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'HI'" $@ $<

geo/hi/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '15'" $@ $<

geo/id/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'ID'" $@ $<

geo/id/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '16'" $@ $<

geo/il/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'IL'" $@ $<

geo/il/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '17'" $@ $<

geo/in/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'IN'" $@ $<

geo/in/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '18'" $@ $<

geo/ia/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'IA'" $@ $<

geo/ia/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '19'" $@ $<

geo/ks/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'KS'" $@ $<

geo/ks/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '20'" $@ $<

geo/ky/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'KY'" $@ $<

geo/ky/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '21'" $@ $<

geo/la/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'LA'" $@ $<

geo/la/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '22'" $@ $<

geo/me/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'ME'" $@ $<

geo/me/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '23'" $@ $<

geo/md/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MD'" $@ $<

geo/md/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '24'" $@ $<

geo/ma/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MA'" $@ $<

geo/ma/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '25'" $@ $<

geo/mi/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MI'" $@ $<

geo/mi/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '26'" $@ $<

geo/mn/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MN'" $@ $<

geo/mn/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '27'" $@ $<

geo/ms/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MS'" $@ $<

geo/ms/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '28'" $@ $<

geo/mo/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MO'" $@ $<

geo/mo/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '29'" $@ $<

geo/mt/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MT'" $@ $<

geo/mt/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '30'" $@ $<

geo/ne/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NE'" $@ $<

geo/ne/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '31'" $@ $<

geo/nv/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NV'" $@ $<

geo/nv/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '32'" $@ $<

geo/nh/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NH'" $@ $<

geo/nh/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '33'" $@ $<

geo/nj/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NJ'" $@ $<

geo/nj/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '34'" $@ $<

geo/nm/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NM'" $@ $<

geo/nm/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '35'" $@ $<

geo/ny/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NY'" $@ $<

geo/ny/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '36'" $@ $<

geo/nc/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'NC'" $@ $<

geo/nc/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '37'" $@ $<

geo/nd/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'ND'" $@ $<

geo/nd/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '38'" $@ $<

geo/oh/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'OH'" $@ $<

geo/oh/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '39'" $@ $<

geo/ok/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'OK'" $@ $<

geo/ok/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '40'" $@ $<

geo/or/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'OR'" $@ $<

geo/or/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '41'" $@ $<

geo/pa/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'PA'" $@ $<

geo/pa/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '42'" $@ $<

geo/ri/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'RI'" $@ $<

geo/ri/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '44'" $@ $<

geo/sc/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'SC'" $@ $<

geo/sc/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '45'" $@ $<

geo/sd/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'SD'" $@ $<

geo/sd/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '46'" $@ $<

geo/tn/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'TN'" $@ $<

geo/tn/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '47'" $@ $<

geo/tx/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'TX'" $@ $<

geo/tx/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '48'" $@ $<

geo/ut/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'UT'" $@ $<

geo/ut/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '49'" $@ $<

geo/vt/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'VT'" $@ $<

geo/vt/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '50'" $@ $<

geo/va/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'VA'" $@ $<

geo/va/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '51'" $@ $<

geo/wa/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'WA'" $@ $<

geo/wa/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '53'" $@ $<

geo/wv/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'WV'" $@ $<

geo/wv/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '54'" $@ $<

geo/wi/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'WI'" $@ $<

geo/wi/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '55'" $@ $<

geo/wy/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'WY'" $@ $<

geo/wy/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '56'" $@ $<

geo/as/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'AS'" $@ $<

geo/as/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '60'" $@ $<

geo/fm/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'FM'" $@ $<

geo/fm/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '64'" $@ $<

geo/gu/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'GU'" $@ $<

geo/gu/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '66'" $@ $<

geo/mh/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MH'" $@ $<

geo/mh/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '68'" $@ $<

geo/mp/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'MP'" $@ $<

geo/mp/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '69'" $@ $<

geo/pw/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'PW'" $@ $<

geo/pw/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '70'" $@ $<

geo/pr/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'PR'" $@ $<

geo/pr/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '72'" $@ $<

geo/um/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'UM'" $@ $<

geo/um/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '74'" $@ $<

geo/vi/counties.json: shp/countyp010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE = 'VI'" $@ $<

geo/vi/states.json: shp/statep010.shp
	mkdir -p $(dir $@) && rm -f $@ && ogr2ogr -f GeoJSON -where "STATE_FIPS = '78'" $@ $<
