Let's create a shapefile with (mostly) SQL!

Here's the How-To

<ol>
<li>QGIS and PostGIS were the tools of choice while bored on a rainy day. I sure want to go to the beach. Sigh.</li>

<li>Start with a sketch of a silhouette on a blank sheet of white paper, throw it into your scanner (phone pic can work) and <a href="https://docs.qgis.org/3.22/en/docs/training_manual/forestry/map_georeferencing.html?highlight=georeference">georeference</a> it to wherever part of our Earth you want to place it.</li>

<li>This example was traced using QGIS curvilinear geometry tools and <a href="https://docs.qgis.org/3.22/en/docs/user_manual/plugins/core_plugins/plugins_topology_checker.html?highlight=topology%20plugin">topolgy</a>. You may prefer the <a href="https://grass.osgeo.org/grass78/manuals/r.to.vect.html">r.to.vect</a> tool (GRASS Plugin) to convert your raster to vector polygons, <a href="https://docs.qgis.org/3.22/en/docs/user_manual/processing_algs/gdal/vectorgeoprocessing.html?highlight=dissolve#dissolve">dissolve</a>, <a href="https://docs.qgis.org/3.22/en/docs/user_manual/processing_algs/qgis/vectorgeometry.html?highlight=delete%20holes#delete-holes">fill holes</a>, <a href="https://docs.qgis.org/3.22/en/docs/user_manual/processing_algs/qgis/vectorgeometry.html?highlight=delete%20holes#smooth">smooth</a>, and remove slivers.</li>

<li>Compute geometry <a href="https://docs.qgis.org/3.22/en/docs/user_manual/working_with_vector/attribute_table.html?highlight=field%20calculator#using-the-field-calculator">[area($geometry)]</a> and export your table to a spreadsheet. Total the area and divide by 2,495 (the number of L.A. County Census Tracts) to give you an average area. With this average, compute how many pieces for each polygon you want to split.</li>

<li>Use the QGIS <a href="https://docs.qgis.org/3.22/en/docs/training_manual/databases/db_manager.html?highlight=database%20manager">Database Manager</a> to load your polygons into your PostgreSQL database.</li>

<li>For each of your polygons, create a new table [e.g. CREATE TABLE POLY_1 AS SELECT * FROM POLY_MAIN WHERE ID = 1]. Don't forget to create spatial indexes.</li>

<li>For each polygon (table), follow the steps in <a href="https://blog.cleverelephant.ca/2018/06/polygon-splitting.html">Paul Ramsey's blog</a> on PostGIS Polygon Splitting.</li>

<li>Merge polygons into a single table using INSERT statements.</li>

<li>Download the <a href="https://blog.cleverelephant.ca/2018/06/polygon-splitting.html">Census Tracts CSV</a> and import it into your database as a new table. Connecting census tract numbers with your polygons is a simple table join.</li>

<li>Population figures are a simple PostgreSQL random function. We don't feel like sharing real data in this shapefile.</li>

<li>Export the file to a format your friends can use.</li>
