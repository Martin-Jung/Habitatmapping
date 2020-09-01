<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" version="3.10.5-A Coruña" minScale="1e+8">
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
    <rasterrenderer opacity="1" alphaBand="-1" type="paletted" band="1">
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
        <paletteEntry value="0" alpha="255" color="#002de1" label="Water"/>
        <paletteEntry value="100" alpha="255" color="#0a941c" label="Forest"/>
        <paletteEntry value="200" alpha="255" color="#c6ff53" label="Savanna"/>
        <paletteEntry value="300" alpha="255" color="#eaa03f" label="Shrubland"/>
        <paletteEntry value="400" alpha="255" color="#98fae7" label="Grassland"/>
        <paletteEntry value="500" alpha="255" color="#5bb5ff" label="Wetlands (inland)"/>
        <paletteEntry value="600" alpha="255" color="#a59283" label="Rocky Areas"/>
        <paletteEntry value="800" alpha="255" color="#fffce1" label="Desert"/>
        <paletteEntry value="900" alpha="255" color="#c6e6ec" label="Marine - Neritic"/>
        <paletteEntry value="1000" alpha="255" color="#1da2d8" label="Marine - Oceanic"/>
        <paletteEntry value="1100" alpha="255" color="#7fcdff" label="Deep Ocean Floor"/>
        <paletteEntry value="1200" alpha="255" color="#4ce6e6" label="Marine - Intertidal"/>
        <paletteEntry value="1400" alpha="255" color="#d95049" label="Artificial - Terrestrial"/>
        <paletteEntry value="1700" alpha="255" color="#ffffff" label="Unknown"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors"/>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0"/>
    <huesaturation saturation="0" grayscaleMode="0" colorizeGreen="128" colorizeStrength="100" colorizeOn="0" colorizeRed="255" colorizeBlue="128"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
