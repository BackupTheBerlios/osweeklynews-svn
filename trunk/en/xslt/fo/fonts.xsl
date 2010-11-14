<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:param name="body.font.family">'Charis SIL'</xsl:param>
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