Let's create a shapefile with (mostly) SQL!

Here's the How-To

<ol>
<li>QGIS and PostGIS were the tools of choice while bored on a rainy day. I sure want to go to the beach. Sigh.</li>

<li>Start with a sketch of a silhouette on a blank sheet of white paper, throw it into your scanner (phone pic can work) and <a href="https://docs.qgis.org/3.22/en/docs/training_manual/forestry/map_georeferencing.html?highlight=georeference" target="_blank">georeference</a> it to wherever part of our Earth you want to place it.</li>

<li>This example was traced using QGIS curvilinear geometry tools and topolgy. You may prefer the r.to.vect tool (GRASS Plugin) to convert your raster to vector polygons, dissolve, fill holes, smooth, and remove slivers.</li>

<li>Compute geometry [area($geometry)] and export your table to a spreadsheet. Total the area and divide by 2,495 (the number of L.A. County Census Tracts) to give you an average area. With this average, compute how many pieces for each polygon you want to split.</li>

<li>Use the QGIS Database Manager to load your polygons into your PostgreSQL database.</li>

<li>For each of your polygons, create a new table [e.g. CREATE TABLE POLY_1 AS SELECT * FROM POLY_MAIN WHERE ID = 1]. Don't forget to create spatial indexes.</li>

<li>For each polygon (table), follow the steps in Paul Ramsey's blog on PostGIS Polygon Splitting.</li>

<li>Merge polygons into a single table using INSERT statements.</li>

<li>Download the Census Tracts CSV and import it into your database as a new table. Connecting census tract numbers with your polygons is a simple table join.</li>

<li>Population figures are a simple PostgreSQL random function. We don't feel like sharing real data in this shapefile.</li>

<li>Export the file to a format your friends can use.</li>
