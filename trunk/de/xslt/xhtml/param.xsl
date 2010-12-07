<?xml version="1.0" encoding="UTF-8"?>
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