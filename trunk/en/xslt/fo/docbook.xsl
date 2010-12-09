<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:exsl="http://exslt.org/common"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
  exclude-result-prefixes="exsl">

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
  
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

<xsl:include href="param.xsl"/>
<xsl:include href="article.titlepage.xsl"/>
<xsl:include href="hyphenate-url.xsl"/>
<xsl:include href="fonts.xsl"/>
<xsl:include href="sections.xsl"/>

  
</xsl:stylesheet>
