<?xml version="1.0" encoding="UTF-8"?>
<!--  This document licensed under CC-BY-SA by Sascha Manns <saigkill@opensuse.org> and Thomas Schraitle <toms@suse.de>-->
<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:img="urn:x-suse:toms:image-table"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="img">
  
  <!--Make HTML conform to modern coding standards -->
  <xsl:param name="make.clean.html" select="1"/>

  <!-- Name of the default CSS input file: -->
  <xsl:param name="docbook.css.source"/>

  <!--Name of the stylesheet(s) to use in the generated HTML--> 
  <xsl:param name="html.stylesheet">susebooks.css</xsl:param>

  <!-- Contains a table mapping between @role and image filename
       taken from the fo/ directory
  -->
  <xsl:param name="own.imgtable" select="document('../fo/imagetable.xml')//img:*"/>

  <xsl:param name="logos.src.path">common/logos/</xsl:param>
</xsl:stylesheet>