<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!--Make HTML conform to modern coding standards -->
  <xsl:param name="make.clean.html" select="1"/>

  <!-- Name of the default CSS input file: -->
  <xsl:param name="docbook.css.source"/>

  <!--Name of the stylesheet(s) to use in the generated HTML--> 
  <xsl:param name="html.stylesheet">susebooks.css</xsl:param>


</xsl:stylesheet>