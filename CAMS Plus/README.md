This repo fuses CAMS, L.A. City, and Assessor addresses into a single PostGIS points table. It is assumed the user has ArcGIS Pro, PostgreSQL, PostGIS, pgAdmin4, and QGIS installed and has some proficiency in this software.

You will need some data:

<ul>
  <li><a href="https://lacounty.maps.arcgis.com/home/item.html?id=cdd4c011519849caa62286044f1d31c9">CAMS_Points</a></li>
  <li><a href="https://egis-lacounty.hub.arcgis.com/documents/parcels/about">Parcels</a></li>
  <li><a href="https://egis-lacounty.hub.arcgis.com/datasets/la-county-city-boundaries">City Boundaries</a></li>
  <li><a href="https://data.lacity.org/City-Infrastructure-Service-Requests/Addresses-in-the-City-of-Los-Angeles/4ca8-mxuh">Addresses in the City of Los Angeles</a></li>
  <li><a href="https://lacounty.maps.arcgis.com/home/item.html?id=d134cbd2ac6a49fb97c4cd9da97080db#overview">CAMS Locator files</a> - You can use 7Zip to extract the CAMS_POINTS locator files if you don't feel like using ArcGIS Pro.</li>
</ul>

Here are the steps:

<ol type="1">
  <li>Load CAMS Points, Parcels, City Boundaries, and L.A. City addresses into a PostgreSQL database.</li>
  <li>Run <b>cams_not_la_city.sql</b> to create a table cams_plus with all addresses in CAMS outside the City of L.A.</li>
  <li>Run <b>load_addresses_lacity.sql</b> to add L.A. addresses into cams_plus.</li>
  <li>Run <b>parcels_no_address_points.sql</b> to create a table parcels_no_cams_points from parcels with no CAMS points.</li>
  <li>Run <b>geocode_parcels.py</b>. Before running this script, create an sde file to let it connect to your PostgreSQL database and read parcels_no_cams_points as your input. Output is a new Esri file geodatabase feature class that you will need to upload into PostgreSQL.</li>
  <li>Run <b>load_parcel_addresses.sql</b> to load parcel addresses into cams_plus that didn't geocode.</li>
  <li>Dont forget to vacuum analyze.</li>
</ol>

