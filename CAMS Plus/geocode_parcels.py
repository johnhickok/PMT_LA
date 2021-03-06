# -*- coding: utf-8 -*-

import arcpy, os

# Set your environment to the folder this is running in.
this_folder = os.getcwd()
arcpy.env.workspace = this_folder

# This env variable allows you to overwrite your results to it.
arcpy.env.overwriteOutput = True

# copy records from pg table to a geopackage using qgis
in_table = 'postgres_localhost.sde/laco_backup.public.parcels_no_cams_points'

# your copy may be in a different folder
address_locator = 'CAMS_POINTS.loc'

# Field mapping between locator and the csv file
in_address_fields = """
'Street or Intersection' g_address VISIBLE NONE;
'City or Placename' g_city VISIBLE NONE;
State g_state VISIBLE NONE;
'ZIP Code' g_zip VISIBLE NONE
"""

# Using an Esri GDB avoids truncated field names
arcpy.management.Delete('geocode_test.gdb')
arcpy.CreateFileGDB_management(this_folder, 'geocode_test.gdb')
out_feature_class = 'geocode_test.gdb/parcel_results'

# Geocode addresses with above parameters
arcpy.geocoding.GeocodeAddresses(in_table, address_locator, in_address_fields, out_feature_class)
