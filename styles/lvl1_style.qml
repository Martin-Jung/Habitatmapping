<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" version="3.4.14-Madeira" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <customproperties>
    <property value="false" key="WMSBackgroundLayer"/>
    <property value="false" key="WMSPublishDataSourceUrl"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="Value" key="identify/format"/>
  </customproperties>
  <pipe>
    <rasterrenderer type="paletted" band="1" opacity="1" alphaBand="-1">
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
        <paletteEntry value="0" label="Water" color="#002de1" alpha="255"/>
        <paletteEntry value="100" label="Forest" color="#0a941c" alpha="255"/>
        <paletteEntry value="200" label="Savanna" color="#c6ff53" alpha="255"/>
        <paletteEntry value="300" label="Shrubland" color="#eaa03f" alpha="255"/>
        <paletteEntry value="400" label="Grassland" color="#98fae7" alpha="255"/>
        <paletteEntry value="500" label="Wetlands (inland)" color="#5bb5ff" alpha="255"/>
        <paletteEntry value="600" label="Rocky Areas" color="#a59283" alpha="255"/>
        <paletteEntry value="800" label="Desert" color="#fffce1" alpha="255"/>
        <paletteEntry value="1400" label="Artificial - Terrestrial" color="#d95049" alpha="255"/>
        <paletteEntry value="1700" label="Unknown" color="#ffffff" alpha="255"/>
      </colorPalette>
      <colorramp type="randomcolors" name="[source]"/>
    </rasterrenderer>
    <brightnesscontrast brightness="0" contrast="0"/>
    <huesaturation colorizeStrength="100" colorizeBlue="128" colorizeOn="0" grayscaleMode="0" saturation="0" colorizeGreen="128" colorizeRed="255"/>
    <rasterresampler maxOversampling="2"/>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
