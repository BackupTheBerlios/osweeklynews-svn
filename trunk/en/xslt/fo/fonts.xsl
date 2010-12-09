<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
  Common Entities for all OWN articles
  
  This work is licensed under the
  Creative Commons Attribution-ShareAlike 3.0 Unported License
  by Sascha Manns. To view a copy of this license, visit
  http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to
  Creative Commons
  171 Second Street
  Suite 300
  San Francisco California 94105
  USA.
  
-->
  
<xsl:param name="body.font.family">'DejaVu Sans Condensed'</xsl:param><!-- 'Charis SIL' -->
<xsl:param name="title.font.family">'DejaVu Sans Condensed'</xsl:param>
<xsl:param name="monospace.font.family">'DejaVu Sans Mono'</xsl:param>
<xsl:param name="sans.font.family"><xsl:value-of select="$title.font.family"/></xsl:param>
<xsl:param name="symbol.font.family">
  <xsl:value-of select="$body.font.family"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="$title.font.family"/>
  <xsl:text>,</xsl:text>
  <!--<xsl:text>Symbol</xsl:text>-->
</xsl:param>

</xsl:stylesheet>