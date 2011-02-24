<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">
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
    
 <xsl:import href="http://docbook.sourceforge.net/release/xsl/current/xhtml/docbook.xsl"/>
 <xsl:import href="param.xsl"/>
 
 <xsl:include href="sections.xsl"/>
 <xsl:include href="block.xsl"/>
 <xsl:include href="titlepage.templates.xsl"/>
  
 <xsl:template match="*" mode="process.root">
  <xsl:variable name="doc" select="self::*"/>

  <xsl:call-template name="user.preroot"/>
  <xsl:call-template name="root.messages"/>

  <html>
    <head>
      <xsl:call-template name="system.head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:call-template name="head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:call-template name="user.head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
    </head>
    <xsl:copy-of select="$insert.piwikcode"/>
    <body>
      <xsl:call-template name="body.attributes"/>
      <xsl:call-template name="user.header.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:apply-templates select="."/>
      <xsl:call-template name="user.footer.content">
         <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
    </body>
  </html>
  <xsl:value-of select="$html.append"/>

  <!-- Generate any css files only once, not once per chunk -->
  <xsl:call-template name="generate.css.files"/>
</xsl:template>
 
  
</xsl:stylesheet>