# -*- coding: utf-8 -*-

import arcpy, os

# Set your environment to the folder this is running in.
arcpy.env.workspace = os.getcwd()

# Your script might create an empty shapefile
# This env variable allows you to overwrite your results to it.
arcpy.env.overwriteOutput = True

in_table = 'sample_addresses.csv'

# your copy may be in a different folder
address_locator = 'locator/CAMS_POINTS.loc'

# Field mapping between locator and the csv file
in_address_fields = """
'Street or Intersection' street VISIBLE NONE;
'City or Placename' city VISIBLE NONE;
State state VISIBLE NONE;
'ZIP Code' zipcode VISIBLE NONE
"""

# Your folder location may be different.
out_feature_class = 'shp/sample_results.shp'

arcpy.geocoding.GeocodeAddresses(in_table, address_locator, in_address_fields, out_feature_class)
