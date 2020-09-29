<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" minScale="1e+8" maxScale="0" version="3.10.9-A Coruña" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <rasterrenderer alphaBand="-1" opacity="1" type="paletted" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry color="#002de1" value="0" label="Water" alpha="255"/>
        <paletteEntry color="#0a941c" value="100" label="Forest" alpha="255"/>
        <paletteEntry color="#c6ff53" value="200" label="Savanna" alpha="255"/>
        <paletteEntry color="#eaa03f" value="300" label="Shrubland" alpha="255"/>
        <paletteEntry color="#98fae7" value="400" label="Grassland" alpha="255"/>
        <paletteEntry color="#5bb5ff" value="500" label="Wetlands (inland)" alpha="255"/>
        <paletteEntry color="#a59283" value="600" label="Rocky Areas" alpha="255"/>
        <paletteEntry color="#fffce1" value="800" label="Desert" alpha="255"/>
        <paletteEntry color="#99ddf7" value="900" label="Marine - Neritic" alpha="255"/>
        <paletteEntry color="#1da2d8" value="1000" label="Marine - Oceanic" alpha="255"/>
        <paletteEntry color="#7fcdff" value="1100" label="Deep Ocean Floor" alpha="255"/>
        <paletteEntry color="#4ce6e6" value="1200" label="Marine - Intertidal" alpha="255"/>
        <paletteEntry color="#d95049" value="1400" label="Artificial - Terrestrial" alpha="255"/>
        <paletteEntry color="#ffffff" value="1700" label="Unknown" alpha="255"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors"/>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0"/>
    <huesaturation colorizeBlue="128" colorizeOn="0" colorizeGreen="128" saturation="0" grayscaleMode="0" colorizeRed="255" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
