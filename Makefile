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

# add node_modules/.bin to path for turf-cli
export PATH := node_modules/.bin:$(PATH)

echo:
	echo ${PATH}

all:

.SECONDARY:

# http://www.nationalatlas.gov/atlasftp-1m.html
gz/%.tar.gz:
	mkdir -p $(dir $@)
	curl 'http://dds.cr.usgs.gov/pub/data/nationalatlas/$(notdir $@)' -o $@.download
	mv $@.download $@

# Zip Code Tabulation Areas
gz/tl_2015_us_zcta510.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/ZCTA5/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Tracts
gz/tl_2015_%_tract.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/TRACT/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Block Groups
gz/tl_2015_%_bg.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/BG/$(notdir $@)' -o $@.download
	mv $@.download $@

# Census Blocks
gz/tl_2015_%_tabblock.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/TABBLOCK/$(notdir $@)' -o $@.download
	mv $@.download $@

gz/tabblock2010_%_pophu.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2010BLKPOPHU/$(notdir $@)' -o $@.download
	mv $@.download $@

# Core Based Statistical Areas
gz/tl_2015_us_cbsa.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/CBSA/$(notdir $@)' -o $@.download
	mv $@.download $@

# Congressional Districts (Alternative)
gz/tl_2015_us_cd114.zip:
	mkdir -p $(dir $@)
	curl 'ftp://ftp2.census.gov/geo/tiger/TIGER2015/CD/$(notdir $@)' -o $@.download
	mv $@.download $@

# State legislative districts upper
gz/tl_2015_%_sldu.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/SLDU/$(notdir $@)' -o $@.download
	mv $@.download $@

# State legislative districts lower
gz/tl_2015_%_sldl.zip:
	mkdir -p $(dir $@)
	curl 'http://www2.census.gov/geo/tiger/TIGER2015/SLDL/$(notdir $@)' -o $@.download
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
# shp/us/congress.shp: gz/cgd114p010g.shp_nt00845.tar.gz
shp/us/congress-unfiltered.shp: gz/tl_2015_us_cd114.zip
shp/us/zipcodes-unmerged.shp: gz/tl_2015_us_zcta510.zip
shp/us/cbsa.shp: gz/tl_2015_us_cbsa.zip

shp/al/tracts.shp: gz/tl_2015_01_tract.zip
shp/ak/tracts.shp: gz/tl_2015_02_tract.zip
shp/az/tracts.shp: gz/tl_2015_04_tract.zip
shp/ar/tracts.shp: gz/tl_2015_05_tract.zip
shp/ca/tracts.shp: gz/tl_2015_06_tract.zip
shp/co/tracts.shp: gz/tl_2015_08_tract.zip
shp/ct/tracts.shp: gz/tl_2015_09_tract.zip
shp/de/tracts.shp: gz/tl_2015_10_tract.zip
shp/dc/tracts.shp: gz/tl_2015_11_tract.zip
shp/fl/tracts.shp: gz/tl_2015_12_tract.zip
shp/ga/tracts.shp: gz/tl_2015_13_tract.zip
shp/hi/tracts.shp: gz/tl_2015_15_tract.zip
shp/id/tracts.shp: gz/tl_2015_16_tract.zip
shp/il/tracts.shp: gz/tl_2015_17_tract.zip
shp/in/tracts.shp: gz/tl_2015_18_tract.zip
shp/ia/tracts.shp: gz/tl_2015_19_tract.zip
shp/ks/tracts.shp: gz/tl_2015_20_tract.zip
shp/ky/tracts.shp: gz/tl_2015_21_tract.zip
shp/la/tracts.shp: gz/tl_2015_22_tract.zip
shp/me/tracts.shp: gz/tl_2015_23_tract.zip
shp/md/tracts.shp: gz/tl_2015_24_tract.zip
shp/ma/tracts.shp: gz/tl_2015_25_tract.zip
shp/mi/tracts.shp: gz/tl_2015_26_tract.zip
shp/mn/tracts.shp: gz/tl_2015_27_tract.zip
shp/ms/tracts.shp: gz/tl_2015_28_tract.zip
shp/mo/tracts.shp: gz/tl_2015_29_tract.zip
shp/mt/tracts.shp: gz/tl_2015_30_tract.zip
shp/ne/tracts.shp: gz/tl_2015_31_tract.zip
shp/nv/tracts.shp: gz/tl_2015_32_tract.zip
shp/nh/tracts.shp: gz/tl_2015_33_tract.zip
shp/nj/tracts.shp: gz/tl_2015_34_tract.zip
shp/nm/tracts.shp: gz/tl_2015_35_tract.zip
shp/ny/tracts.shp: gz/tl_2015_36_tract.zip
shp/nc/tracts.shp: gz/tl_2015_37_tract.zip
shp/nd/tracts.shp: gz/tl_2015_38_tract.zip
shp/oh/tracts.shp: gz/tl_2015_39_tract.zip
shp/ok/tracts.shp: gz/tl_2015_40_tract.zip
shp/or/tracts.shp: gz/tl_2015_41_tract.zip
shp/pa/tracts.shp: gz/tl_2015_42_tract.zip
shp/ri/tracts.shp: gz/tl_2015_44_tract.zip
shp/sc/tracts.shp: gz/tl_2015_45_tract.zip
shp/sd/tracts.shp: gz/tl_2015_46_tract.zip
shp/tn/tracts.shp: gz/tl_2015_47_tract.zip
shp/tx/tracts.shp: gz/tl_2015_48_tract.zip
shp/ut/tracts.shp: gz/tl_2015_49_tract.zip
shp/vt/tracts.shp: gz/tl_2015_50_tract.zip
shp/va/tracts.shp: gz/tl_2015_51_tract.zip
shp/wa/tracts.shp: gz/tl_2015_53_tract.zip
shp/wv/tracts.shp: gz/tl_2015_54_tract.zip
shp/wi/tracts.shp: gz/tl_2015_55_tract.zip
shp/wy/tracts.shp: gz/tl_2015_56_tract.zip
shp/as/tracts.shp: gz/tl_2015_60_tract.zip
shp/fm/tracts.shp: gz/tl_2015_64_tract.zip
shp/gu/tracts.shp: gz/tl_2015_66_tract.zip
shp/mh/tracts.shp: gz/tl_2015_68_tract.zip
shp/mp/tracts.shp: gz/tl_2015_69_tract.zip
shp/pw/tracts.shp: gz/tl_2015_70_tract.zip
shp/pr/tracts.shp: gz/tl_2015_72_tract.zip
shp/um/tracts.shp: gz/tl_2015_74_tract.zip
shp/vi/tracts.shp: gz/tl_2015_78_tract.zip

shp/al/blockgroups.shp: gz/tl_2015_01_bg.zip
shp/ak/blockgroups.shp: gz/tl_2015_02_bg.zip
shp/az/blockgroups.shp: gz/tl_2015_04_bg.zip
shp/ar/blockgroups.shp: gz/tl_2015_05_bg.zip
shp/ca/blockgroups.shp: gz/tl_2015_06_bg.zip
shp/co/blockgroups.shp: gz/tl_2015_08_bg.zip
shp/ct/blockgroups.shp: gz/tl_2015_09_bg.zip
shp/de/blockgroups.shp: gz/tl_2015_10_bg.zip
shp/dc/blockgroups.shp: gz/tl_2015_11_bg.zip
shp/fl/blockgroups.shp: gz/tl_2015_12_bg.zip
shp/ga/blockgroups.shp: gz/tl_2015_13_bg.zip
shp/hi/blockgroups.shp: gz/tl_2015_15_bg.zip
shp/id/blockgroups.shp: gz/tl_2015_16_bg.zip
shp/il/blockgroups.shp: gz/tl_2015_17_bg.zip
shp/in/blockgroups.shp: gz/tl_2015_18_bg.zip
shp/ia/blockgroups.shp: gz/tl_2015_19_bg.zip
shp/ks/blockgroups.shp: gz/tl_2015_20_bg.zip
shp/ky/blockgroups.shp: gz/tl_2015_21_bg.zip
shp/la/blockgroups.shp: gz/tl_2015_22_bg.zip
shp/me/blockgroups.shp: gz/tl_2015_23_bg.zip
shp/md/blockgroups.shp: gz/tl_2015_24_bg.zip
shp/ma/blockgroups.shp: gz/tl_2015_25_bg.zip
shp/mi/blockgroups.shp: gz/tl_2015_26_bg.zip
shp/mn/blockgroups.shp: gz/tl_2015_27_bg.zip
shp/ms/blockgroups.shp: gz/tl_2015_28_bg.zip
shp/mo/blockgroups.shp: gz/tl_2015_29_bg.zip
shp/mt/blockgroups.shp: gz/tl_2015_30_bg.zip
shp/ne/blockgroups.shp: gz/tl_2015_31_bg.zip
shp/nv/blockgroups.shp: gz/tl_2015_32_bg.zip
shp/nh/blockgroups.shp: gz/tl_2015_33_bg.zip
shp/nj/blockgroups.shp: gz/tl_2015_34_bg.zip
shp/nm/blockgroups.shp: gz/tl_2015_35_bg.zip
shp/ny/blockgroups.shp: gz/tl_2015_36_bg.zip
shp/nc/blockgroups.shp: gz/tl_2015_37_bg.zip
shp/nd/blockgroups.shp: gz/tl_2015_38_bg.zip
shp/oh/blockgroups.shp: gz/tl_2015_39_bg.zip
shp/ok/blockgroups.shp: gz/tl_2015_40_bg.zip
shp/or/blockgroups.shp: gz/tl_2015_41_bg.zip
shp/pa/blockgroups.shp: gz/tl_2015_42_bg.zip
shp/ri/blockgroups.shp: gz/tl_2015_44_bg.zip
shp/sc/blockgroups.shp: gz/tl_2015_45_bg.zip
shp/sd/blockgroups.shp: gz/tl_2015_46_bg.zip
shp/tn/blockgroups.shp: gz/tl_2015_47_bg.zip
shp/tx/blockgroups.shp: gz/tl_2015_48_bg.zip
shp/ut/blockgroups.shp: gz/tl_2015_49_bg.zip
shp/vt/blockgroups.shp: gz/tl_2015_50_bg.zip
shp/va/blockgroups.shp: gz/tl_2015_51_bg.zip
shp/wa/blockgroups.shp: gz/tl_2015_53_bg.zip
shp/wv/blockgroups.shp: gz/tl_2015_54_bg.zip
shp/wi/blockgroups.shp: gz/tl_2015_55_bg.zip
shp/wy/blockgroups.shp: gz/tl_2015_56_bg.zip
shp/as/blockgroups.shp: gz/tl_2015_60_bg.zip
shp/fm/blockgroups.shp: gz/tl_2015_64_bg.zip
shp/gu/blockgroups.shp: gz/tl_2015_66_bg.zip
shp/mh/blockgroups.shp: gz/tl_2015_68_bg.zip
shp/mp/blockgroups.shp: gz/tl_2015_69_bg.zip
shp/pw/blockgroups.shp: gz/tl_2015_70_bg.zip
shp/pr/blockgroups.shp: gz/tl_2015_72_bg.zip
shp/um/blockgroups.shp: gz/tl_2015_74_bg.zip
shp/vi/blockgroups.shp: gz/tl_2015_78_bg.zip

shp/al/blocks.shp: gz/tl_2015_01_tabblock.zip
shp/ak/blocks.shp: gz/tl_2015_02_tabblock.zip
shp/az/blocks.shp: gz/tl_2015_04_tabblock.zip
shp/ar/blocks.shp: gz/tl_2015_05_tabblock.zip
shp/ca/blocks.shp: gz/tl_2015_06_tabblock.zip
shp/co/blocks.shp: gz/tl_2015_08_tabblock.zip
shp/ct/blocks.shp: gz/tl_2015_09_tabblock.zip
shp/de/blocks.shp: gz/tl_2015_10_tabblock.zip
shp/dc/blocks.shp: gz/tl_2015_11_tabblock.zip
shp/fl/blocks.shp: gz/tl_2015_12_tabblock.zip
shp/ga/blocks.shp: gz/tl_2015_13_tabblock.zip
shp/hi/blocks.shp: gz/tl_2015_15_tabblock.zip
shp/id/blocks.shp: gz/tl_2015_16_tabblock.zip
shp/il/blocks.shp: gz/tl_2015_17_tabblock.zip
shp/in/blocks.shp: gz/tl_2015_18_tabblock.zip
shp/ia/blocks.shp: gz/tl_2015_19_tabblock.zip
shp/ks/blocks.shp: gz/tl_2015_20_tabblock.zip
shp/ky/blocks.shp: gz/tl_2015_21_tabblock.zip
shp/la/blocks.shp: gz/tl_2015_22_tabblock.zip
shp/me/blocks.shp: gz/tl_2015_23_tabblock.zip
shp/md/blocks.shp: gz/tl_2015_24_tabblock.zip
shp/ma/blocks.shp: gz/tl_2015_25_tabblock.zip
shp/mi/blocks.shp: gz/tl_2015_26_tabblock.zip
shp/mn/blocks.shp: gz/tl_2015_27_tabblock.zip
shp/ms/blocks.shp: gz/tl_2015_28_tabblock.zip
shp/mo/blocks.shp: gz/tl_2015_29_tabblock.zip
shp/mt/blocks.shp: gz/tl_2015_30_tabblock.zip
shp/ne/blocks.shp: gz/tl_2015_31_tabblock.zip
shp/nv/blocks.shp: gz/tl_2015_32_tabblock.zip
shp/nh/blocks.shp: gz/tl_2015_33_tabblock.zip
shp/nj/blocks.shp: gz/tl_2015_34_tabblock.zip
shp/nm/blocks.shp: gz/tl_2015_35_tabblock.zip
shp/ny/blocks.shp: gz/tl_2015_36_tabblock.zip
shp/nc/blocks.shp: gz/tl_2015_37_tabblock.zip
shp/nd/blocks.shp: gz/tl_2015_38_tabblock.zip
shp/oh/blocks.shp: gz/tl_2015_39_tabblock.zip
shp/ok/blocks.shp: gz/tl_2015_40_tabblock.zip
shp/or/blocks.shp: gz/tl_2015_41_tabblock.zip
shp/pa/blocks.shp: gz/tl_2015_42_tabblock.zip
shp/ri/blocks.shp: gz/tl_2015_44_tabblock.zip
shp/sc/blocks.shp: gz/tl_2015_45_tabblock.zip
shp/sd/blocks.shp: gz/tl_2015_46_tabblock.zip
shp/tn/blocks.shp: gz/tl_2015_47_tabblock.zip
shp/tx/blocks.shp: gz/tl_2015_48_tabblock.zip
shp/ut/blocks.shp: gz/tl_2015_49_tabblock.zip
shp/vt/blocks.shp: gz/tl_2015_50_tabblock.zip
shp/va/blocks.shp: gz/tl_2015_51_tabblock.zip
shp/wa/blocks.shp: gz/tl_2015_53_tabblock.zip
shp/wv/blocks.shp: gz/tl_2015_54_tabblock.zip
shp/wi/blocks.shp: gz/tl_2015_55_tabblock.zip
shp/wy/blocks.shp: gz/tl_2015_56_tabblock.zip
shp/as/blocks.shp: gz/tl_2015_60_tabblock.zip
shp/fm/blocks.shp: gz/tl_2015_64_tabblock.zip
shp/gu/blocks.shp: gz/tl_2015_66_tabblock.zip
shp/mh/blocks.shp: gz/tl_2015_68_tabblock.zip
shp/mp/blocks.shp: gz/tl_2015_69_tabblock.zip
shp/pw/blocks.shp: gz/tl_2015_70_tabblock.zip
shp/pr/blocks.shp: gz/tl_2015_72_tabblock.zip
shp/um/blocks.shp: gz/tl_2015_74_tabblock.zip
shp/vi/blocks.shp: gz/tl_2015_78_tabblock.zip

# Unzip gz/tabblock2010_{statefips}_pophu.zip to shp/xx/pop_blocks.shp
shp/al/pop_blocks.shp: gz/tabblock2010_01_pophu.zip
shp/ak/pop_blocks.shp: gz/tabblock2010_02_pophu.zip
shp/az/pop_blocks.shp: gz/tabblock2010_04_pophu.zip
shp/ar/pop_blocks.shp: gz/tabblock2010_05_pophu.zip
shp/ca/pop_blocks.shp: gz/tabblock2010_06_pophu.zip
shp/co/pop_blocks.shp: gz/tabblock2010_08_pophu.zip
shp/ct/pop_blocks.shp: gz/tabblock2010_09_pophu.zip
shp/de/pop_blocks.shp: gz/tabblock2010_10_pophu.zip
shp/dc/pop_blocks.shp: gz/tabblock2010_11_pophu.zip
shp/fl/pop_blocks.shp: gz/tabblock2010_12_pophu.zip
shp/ga/pop_blocks.shp: gz/tabblock2010_13_pophu.zip
shp/hi/pop_blocks.shp: gz/tabblock2010_15_pophu.zip
shp/id/pop_blocks.shp: gz/tabblock2010_16_pophu.zip
shp/il/pop_blocks.shp: gz/tabblock2010_17_pophu.zip
shp/in/pop_blocks.shp: gz/tabblock2010_18_pophu.zip
shp/ia/pop_blocks.shp: gz/tabblock2010_19_pophu.zip
shp/ks/pop_blocks.shp: gz/tabblock2010_20_pophu.zip
shp/ky/pop_blocks.shp: gz/tabblock2010_21_pophu.zip
shp/la/pop_blocks.shp: gz/tabblock2010_22_pophu.zip
shp/me/pop_blocks.shp: gz/tabblock2010_23_pophu.zip
shp/md/pop_blocks.shp: gz/tabblock2010_24_pophu.zip
shp/ma/pop_blocks.shp: gz/tabblock2010_25_pophu.zip
shp/mi/pop_blocks.shp: gz/tabblock2010_26_pophu.zip
shp/mn/pop_blocks.shp: gz/tabblock2010_27_pophu.zip
shp/ms/pop_blocks.shp: gz/tabblock2010_28_pophu.zip
shp/mo/pop_blocks.shp: gz/tabblock2010_29_pophu.zip
shp/mt/pop_blocks.shp: gz/tabblock2010_30_pophu.zip
shp/ne/pop_blocks.shp: gz/tabblock2010_31_pophu.zip
shp/nv/pop_blocks.shp: gz/tabblock2010_32_pophu.zip
shp/nh/pop_blocks.shp: gz/tabblock2010_33_pophu.zip
shp/nj/pop_blocks.shp: gz/tabblock2010_34_pophu.zip
shp/nm/pop_blocks.shp: gz/tabblock2010_35_pophu.zip
shp/ny/pop_blocks.shp: gz/tabblock2010_36_pophu.zip
shp/nc/pop_blocks.shp: gz/tabblock2010_37_pophu.zip
shp/nd/pop_blocks.shp: gz/tabblock2010_38_pophu.zip
shp/oh/pop_blocks.shp: gz/tabblock2010_39_pophu.zip
shp/ok/pop_blocks.shp: gz/tabblock2010_40_pophu.zip
shp/or/pop_blocks.shp: gz/tabblock2010_41_pophu.zip
shp/pa/pop_blocks.shp: gz/tabblock2010_42_pophu.zip
shp/ri/pop_blocks.shp: gz/tabblock2010_44_pophu.zip
shp/sc/pop_blocks.shp: gz/tabblock2010_45_pophu.zip
shp/sd/pop_blocks.shp: gz/tabblock2010_46_pophu.zip
shp/tn/pop_blocks.shp: gz/tabblock2010_47_pophu.zip
shp/tx/pop_blocks.shp: gz/tabblock2010_48_pophu.zip
shp/ut/pop_blocks.shp: gz/tabblock2010_49_pophu.zip
shp/vt/pop_blocks.shp: gz/tabblock2010_50_pophu.zip
shp/va/pop_blocks.shp: gz/tabblock2010_51_pophu.zip
shp/wa/pop_blocks.shp: gz/tabblock2010_53_pophu.zip
shp/wv/pop_blocks.shp: gz/tabblock2010_54_pophu.zip
shp/wi/pop_blocks.shp: gz/tabblock2010_55_pophu.zip
shp/wy/pop_blocks.shp: gz/tabblock2010_56_pophu.zip

shp/al/sldl.shp: gz/tl_2015_01_sldl.zip
shp/ak/sldl.shp: gz/tl_2015_02_sldl.zip
shp/az/sldl.shp: gz/tl_2015_04_sldl.zip
shp/ar/sldl.shp: gz/tl_2015_05_sldl.zip
shp/ca/sldl.shp: gz/tl_2015_06_sldl.zip
shp/co/sldl.shp: gz/tl_2015_08_sldl.zip
shp/ct/sldl.shp: gz/tl_2015_09_sldl.zip
shp/de/sldl.shp: gz/tl_2015_10_sldl.zip
shp/fl/sldl.shp: gz/tl_2015_12_sldl.zip
shp/ga/sldl.shp: gz/tl_2015_13_sldl.zip
shp/hi/sldl.shp: gz/tl_2015_15_sldl.zip
shp/id/sldl.shp: gz/tl_2015_16_sldl.zip
shp/il/sldl.shp: gz/tl_2015_17_sldl.zip
shp/in/sldl.shp: gz/tl_2015_18_sldl.zip
shp/ia/sldl.shp: gz/tl_2015_19_sldl.zip
shp/ks/sldl.shp: gz/tl_2015_20_sldl.zip
shp/ky/sldl.shp: gz/tl_2015_21_sldl.zip
shp/la/sldl.shp: gz/tl_2015_22_sldl.zip
shp/me/sldl.shp: gz/tl_2015_23_sldl.zip
shp/md/sldl.shp: gz/tl_2015_24_sldl.zip
shp/ma/sldl.shp: gz/tl_2015_25_sldl.zip
shp/mi/sldl.shp: gz/tl_2015_26_sldl.zip
shp/mn/sldl.shp: gz/tl_2015_27_sldl.zip
shp/ms/sldl.shp: gz/tl_2015_28_sldl.zip
shp/mo/sldl.shp: gz/tl_2015_29_sldl.zip
shp/mt/sldl.shp: gz/tl_2015_30_sldl.zip
shp/nv/sldl.shp: gz/tl_2015_32_sldl.zip
shp/nh/sldl.shp: gz/tl_2015_33_sldl.zip
shp/nj/sldl.shp: gz/tl_2015_34_sldl.zip
shp/nm/sldl.shp: gz/tl_2015_35_sldl.zip
shp/ny/sldl.shp: gz/tl_2015_36_sldl.zip
shp/nc/sldl.shp: gz/tl_2015_37_sldl.zip
shp/nd/sldl.shp: gz/tl_2015_38_sldl.zip
shp/oh/sldl.shp: gz/tl_2015_39_sldl.zip
shp/ok/sldl.shp: gz/tl_2015_40_sldl.zip
shp/or/sldl.shp: gz/tl_2015_41_sldl.zip
shp/pa/sldl.shp: gz/tl_2015_42_sldl.zip
shp/ri/sldl.shp: gz/tl_2015_44_sldl.zip
shp/sc/sldl.shp: gz/tl_2015_45_sldl.zip
shp/sd/sldl.shp: gz/tl_2015_46_sldl.zip
shp/tn/sldl.shp: gz/tl_2015_47_sldl.zip
shp/tx/sldl.shp: gz/tl_2015_48_sldl.zip
shp/ut/sldl.shp: gz/tl_2015_49_sldl.zip
shp/vt/sldl.shp: gz/tl_2015_50_sldl.zip
shp/va/sldl.shp: gz/tl_2015_51_sldl.zip
shp/wa/sldl.shp: gz/tl_2015_53_sldl.zip
shp/wv/sldl.shp: gz/tl_2015_54_sldl.zip
shp/wi/sldl.shp: gz/tl_2015_55_sldl.zip
shp/wy/sldl.shp: gz/tl_2015_56_sldl.zip
shp/pr/sldl.shp: gz/tl_2015_72_sldl.zip

shp/al/sldu.shp: gz/tl_2015_01_sldu.zip
shp/ak/sldu.shp: gz/tl_2015_02_sldu.zip
shp/az/sldu.shp: gz/tl_2015_04_sldu.zip
shp/ar/sldu.shp: gz/tl_2015_05_sldu.zip
shp/ca/sldu.shp: gz/tl_2015_06_sldu.zip
shp/co/sldu.shp: gz/tl_2015_08_sldu.zip
shp/ct/sldu.shp: gz/tl_2015_09_sldu.zip
shp/de/sldu.shp: gz/tl_2015_10_sldu.zip
shp/fl/sldu.shp: gz/tl_2015_12_sldu.zip
shp/ga/sldu.shp: gz/tl_2015_13_sldu.zip
shp/hi/sldu.shp: gz/tl_2015_15_sldu.zip
shp/id/sldu.shp: gz/tl_2015_16_sldu.zip
shp/il/sldu.shp: gz/tl_2015_17_sldu.zip
shp/in/sldu.shp: gz/tl_2015_18_sldu.zip
shp/ia/sldu.shp: gz/tl_2015_19_sldu.zip
shp/ks/sldu.shp: gz/tl_2015_20_sldu.zip
shp/ky/sldu.shp: gz/tl_2015_21_sldu.zip
shp/la/sldu.shp: gz/tl_2015_22_sldu.zip
shp/me/sldu.shp: gz/tl_2015_23_sldu.zip
shp/md/sldu.shp: gz/tl_2015_24_sldu.zip
shp/ma/sldu.shp: gz/tl_2015_25_sldu.zip
shp/mi/sldu.shp: gz/tl_2015_26_sldu.zip
shp/mn/sldu.shp: gz/tl_2015_27_sldu.zip
shp/ms/sldu.shp: gz/tl_2015_28_sldu.zip
shp/mo/sldu.shp: gz/tl_2015_29_sldu.zip
shp/mt/sldu.shp: gz/tl_2015_30_sldu.zip
shp/nv/sldu.shp: gz/tl_2015_32_sldu.zip
shp/nh/sldu.shp: gz/tl_2015_33_sldu.zip
shp/nj/sldu.shp: gz/tl_2015_34_sldu.zip
shp/nm/sldu.shp: gz/tl_2015_35_sldu.zip
shp/ny/sldu.shp: gz/tl_2015_36_sldu.zip
shp/nc/sldu.shp: gz/tl_2015_37_sldu.zip
shp/nd/sldu.shp: gz/tl_2015_38_sldu.zip
shp/oh/sldu.shp: gz/tl_2015_39_sldu.zip
shp/ok/sldu.shp: gz/tl_2015_40_sldu.zip
shp/or/sldu.shp: gz/tl_2015_41_sldu.zip
shp/pa/sldu.shp: gz/tl_2015_42_sldu.zip
shp/ri/sldu.shp: gz/tl_2015_44_sldu.zip
shp/sc/sldu.shp: gz/tl_2015_45_sldu.zip
shp/sd/sldu.shp: gz/tl_2015_46_sldu.zip
shp/tn/sldu.shp: gz/tl_2015_47_sldu.zip
shp/tx/sldu.shp: gz/tl_2015_48_sldu.zip
shp/ut/sldu.shp: gz/tl_2015_49_sldu.zip
shp/vt/sldu.shp: gz/tl_2015_50_sldu.zip
shp/va/sldu.shp: gz/tl_2015_51_sldu.zip
shp/wa/sldu.shp: gz/tl_2015_53_sldu.zip
shp/wv/sldu.shp: gz/tl_2015_54_sldu.zip
shp/wi/sldu.shp: gz/tl_2015_55_sldu.zip
shp/wy/sldu.shp: gz/tl_2015_56_sldu.zip
shp/pr/sldu.shp: gz/tl_2015_72_sldu.zip

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

# National boundary, without the great lakes
# Note that this depends on the lakes having the property NATION010: 2, which
# could change if a new version of nation-unmerged is used.
shp/us/nation-land.shp: shp/us/nation-unmerged.shp
	ogr2ogr $@ $^ -sql "SELECT * FROM 'nation-unmerged' WHERE NOT NATION010=2"

shp/us/congress-clipped.shp: shp/us/congress-ungrouped.shp shp/us/nation-land.shp
	ogr2ogr -clipsrc shp/us/nation-land.shp shp/us/congress-clipped.shp shp/us/congress-ungrouped.shp

shp/us/%.shp:
	rm -rf $(basename $@)
	mkdir -p $(basename $@)
	tar -xzm -C $(basename $@) -f $<
	for file in $(basename $@)/*; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rmdir $(basename $@)

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

shp/us/zipcodes-unmerged.shp shp/us/cbsa.shp shp/%/tracts.shp shp/%/blockgroups.shp shp/%/blocks.shp shp/%/pop_blocks.shp shp/%/sldl.shp shp/%/sldu.shp:
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
		--simplify=7e-6 \
		--id-property=+FIPS \
		--properties STATE,COUNTY,COUNTYP010 \
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
.PHONY: all-combined
all-combined:
	for i in ${STATES} ; do make topo/us-$$i-combined.json ; done

.PHONY: all-pop-blocks
all-pop-blocks:
	for i in ${STATES} ; do make geojson/us-$$i-pop-blocks.geojson && rm shp/$$i/pop_blocks.shp ; done

# National combined (states)
topo/us-combined.json: geojson/states.geojson
	node_modules/.bin/topojson \
		-o temp.json \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-6 \
		--id-property=+STATE_FIPS \
		--properties STATE_FIPS,postal \
		--external-properties fips.csv \
		-- $^
	node_modules/.bin/topojson \
	  -o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--id-property=postal \
		--properties postal \
		-- temp.json
	rm temp.json

topo/us-northeast-combined.json: geojson/northeast/states.geojson
	node_modules/.bin/topojson \
		-o temp.json \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-6 \
		--id-property=+STATE_FIPS \
		--properties STATE_FIPS,postal \
		--external-properties fips.csv \
		-- $^
	node_modules/.bin/topojson \
	  -o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--id-property=postal \
		--properties postal \
		-- temp.json
	rm temp.json


# Per-state combined (counties, cities)
topo/us-%-combined.json: geojson/%/subunits.geojson geojson/%/districts.geojson geojson/%/counties.geojson topo/us-%-cities.json
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--properties \
		-- $^

# Per-state counties
topo/us-%-counties-10m-ungrouped.json: shp/%/counties.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=3e-8 \
		--id-property=+FIPS \
		--properties COUNTY,COUNTYP010 \
		-- $<

geojson/%/counties.geojson: topo/us-%-counties-10m.json
	mkdir -p $(dir $@)
	rm -f $@
	topojson-geojson -o $(dir $@) $<
	cat $(dir $@)/counties.json | ./clip-at-dateline > $@
	rm $(dir $@)/counties.json

# National
geojson/states.geojson: shp/us/states.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f "GeoJSON" $(dir $@)temp.json $<
	cat $(dir $@)temp.json | ./clip-at-dateline > $@
	rm $(dir $@)temp.json

geojson/counties.geojson: shp/us/counties.shp
	mkdir -p $(dir $@)
	rm -f $@
	ogr2ogr -f "GeoJSON" $(dir $@)temp.json $<
	cat $(dir $@)temp.json | ./clip-at-dateline > $@
	rm $(dir $@)temp.json

geojson/districts.geojson: shp/us/congress-clipped.shp
	mkdir -p $(dir $@)
	rm -rf $@
	ogr2ogr -f "GeoJSON" $(dir $@)temp.json $<
	cat $(dir $@)temp.json | ./clip-at-dateline | ./normalize-district > $@
	rm $(dir $@)temp.json

geojson/us-10m: geojson/counties.geojson geojson/districts.geojson geojson/states.geojson
	mkdir -p $@
	node_modules/.bin/topojson \
		-o temp.json \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-6 \
		--properties GEOID,STATE_FIPS,FIPS\
		--external-properties fips.csv \
		-- $^
	node_modules/.bin/topojson-geojson -o $@ temp.json
	for f in $$(ls $@) ; do mv $@/$$f $@/$$(basename $$f .json).geojson; done
	rm temp.json

# Cities
topo/us-%-cities.json: geojson/%/cities.geojson
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=geonameid \
		--properties name,scalerank,pop_max \
		-- $<

#
# Albers-projected Vector Tiles
#
geojson/albers/%.geojson: geojson/%.geojson
	mkdir -p $(dir $@)
	cat $^ \
		| ./reproject-geojson \
		| ./normalize-properties GEOID:id STATE_FIPS:id FIPS:id  \
		| ./geojson-id id \
		> $@

geojson/albers/us-10m/counties.geojson: geojson/counties.geojson
	mkdir -p $(dir $@)
	cat $^ \
		| ./reproject-geojson \
		| ./normalize-properties GEOID:id STATE_FIPS:id FIPS:id  \
		| ./geojson-id id \
		> $@

geojson/albers/state-bounds.json: geojson/albers/states.geojson
	cat $^ | ./extract-projected-bounds > $@

geojson/albers/state-labels-dataset.geojson:
	curl "https://api.mapbox.com/datasets/v1/devseed/cis7wq7mj04l92zpk9tbk9wgo/features?access_token=$(MapboxAccessToken)" > $@

geojson/albers/state-labels.geojson: geojson/albers/state-labels-dataset.geojson
	# Note: reprojecting using 'mercator' because the incoming data was _already_ reprojected
	# to albers so it could be edited in the Mapbox Studio dataset editor
	cat $^ \
		| jq '{ type: "FeatureCollection", \
					  features: .features | \
							map(. | select(.geometry.type == "Point" and .properties.type != "callout")) \
					}' \
		| ./reproject-geojson --projection mercator \
		| node_modules/.bin/geojson-join \
			--format=csv --againstField=postal --geojsonField=postal fips.csv \
		| ./normalize-properties \
				statePostal:statePostal postal:statePostal \
				STATE_FIPS:id id:id \
				type:type \
		| ./geojson-id id \
		> $@

geojson/albers/state-label-callouts.geojson: geojson/albers/state-labels-dataset.geojson
	# Note: reprojecting using 'mercator' because the incoming data was _already_ reprojected
	# to albers so it could be edited in the Mapbox Studio dataset editor
	cat $^ \
		| jq '{ type: "FeatureCollection", \
					  features: .features | \
							map(. | select(.properties.type == "callout" or .geometry.type == "LineString")) \
					}' \
		| ./reproject-geojson --projection mercator \
		| node_modules/.bin/geojson-join \
			--format=csv --againstField=postal --geojsonField=postal fips.csv \
		| ./normalize-properties \
				statePostal:statePostal postal:statePostal \
				STATE_FIPS:id id:id \
				type:type \
		| ./geojson-id id \
		> $@

tiles/z0-4.mbtiles: geojson/albers/us-10m/states.geojson \
	geojson/albers/us-10m/counties.geojson \
	geojson/albers/us-10m/districts.geojson \
	geojson/albers/state-labels.geojson \
	geojson/albers/state-label-callouts.geojson
	mkdir -p $(dir $@)
	tippecanoe --projection EPSG:3857 \
		-f \
		--named-layer=states:geojson/albers/us-10m/states.geojson \
		--named-layer=counties:geojson/albers/us-10m/counties.geojson \
		--named-layer=districts:geojson/albers/us-10m/districts.geojson \
		--named-layer=state-labels:geojson/albers/state-labels.geojson \
		--named-layer=state-label-callouts:geojson/albers/state-label-callouts.geojson \
		--read-parallel \
		--no-polygon-splitting \
		--maximum-zoom=4 \
		--drop-rate=0 \
		--name=2016-us-election \
		--output $@

tiles/z5-12.mbtiles: geojson/albers/states.geojson \
	geojson/albers/counties.geojson \
	geojson/albers/districts.geojson \
	geojson/albers/state-labels.geojson \
	geojson/albers/state-label-callouts.geojson
	mkdir -p $(dir $@)
	tippecanoe --projection EPSG:3857 \
		-f \
		--named-layer=states:geojson/albers/states.geojson \
		--named-layer=counties:geojson/albers/counties.geojson \
		--named-layer=districts:geojson/albers/districts.geojson \
		--named-layer=state-labels:geojson/albers/state-labels.geojson \
		--named-layer=state-label-callouts:geojson/albers/state-label-callouts.geojson \
		--read-parallel \
		--no-polygon-splitting \
		--minimum-zoom=5 \
		--maximum-zoom=12 \
		--drop-rate=0 \
		--name=2016-us-election \
		--output $@

tiles/wapo-2016-election.mbtiles: tiles/z0-4.mbtiles tiles/z5-12.mbtiles
	tile-join -f -o $@ $^

tiles/wapo-2016-election-development.mbtiles: tiles/wapo-2016-election.mbtiles
	cp $^ $@

.PHONY: upload/%
upload/%: tiles/%.mbtiles
ifndef MapboxAccessToken
	$(error MapboxAccessToken not defined)
endif
ifndef MB_ACCOUNT
	$(error MB_ACCOUNT not defined)
endif
	node_modules/.bin/mapbox-upload $(MB_ACCOUNT).$* $^


#
# State cities, districts, subunits
#


geojson/%/cities.geojson:
	mkdir -p $(dir $@)
	node_modules/.bin/turf filter data/naturalearth-us-cities.geojson adm1name "`./expand-state-name $*`" > $@

# Census blocks
topo/us-%-pop-blocks.json: shp/%/pop_blocks.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=+BLOCKID10 \
		--properties HOUSING10,POP10 \
		-- $<

geojson/us-%-pop-blocks.geojson: topo/us-%-pop-blocks.json
	mkdir -p $(basename $@)
	node_modules/.bin/topojson-geojson -o $(basename $@) \
		--id-property=BLOCKID10 \
		$<
	cp $(basename $@)/pop_blocks.json $@
	rm -rf $(basename $@)

# State legislative district upper
topo/us-%-sldu.json: shp/%/sldu.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=3e-8 \
		--id-property=+GEOID \
		--properties NAMELSAD \
		-- $<

geojson/%/sldu.geojson: topo/us-%-sldu.json
	node_modules/.bin/topojson-geojson -o $(dir $@) \
		--properties NAMELSAD \
		$<
		cat $(dir $@)sldu.json | ./clip-at-dateline > $@
		rm $(dir $@)sldu.json

# State legislative district lower
topo/us-%-sldl.json: shp/%/sldl.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=3e-8 \
		--id-property=+GEOID \
		--properties NAMELSAD \
		-- $<

geojson/%/sldl.geojson: topo/us-%-sldl.json
	node_modules/.bin/topojson-geojson -o $(dir $@) \
		--properties NAMELSAD \
		$<
		cat $(dir $@)sldl.json | ./clip-at-dateline > $@
		rm $(dir $@)sldl.json

# Congressional Districts
# The targets with '%' take care of going from a state's district shapefile to the
# districts.geojson we need, but each individual state has to be added below (following
# the example of MN)

topo/us-%-congress.json: shp/%/congress-clipped.shp
	mkdir -p $(dir $@)
	node_modules/.bin/topojson \
		-o $@ \
		--no-pre-quantization \
		--post-quantization=1e6 \
		--simplify=7e-7 \
		--id-property=NAMELSAD \
		-- $<

