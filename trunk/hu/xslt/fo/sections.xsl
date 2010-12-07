<?xml version="1.0" encoding="UTF-8"?>
<!--  This document licensed under CC-BY-SA by Sascha Manns <saigkill@opensuse.org> and Thomas Schraitle <toms@suse.de>-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:img="urn:x-suse:toms:image-table"
  exclude-result-prefixes="img"
  >


<!--<xsl:template name="sect1.titlepage.before.recto">
  <fo:block text-align-last="justify">
    <fo:leader leader-pattern="rule" xsl:use-attribute-sets="own-title-color"/>
  </fo:block>
</xsl:template>-->


<xsl:template name="section.heading">
  <xsl:param name="level" select="1"/>
  <xsl:param name="marker" select="1"/>
  <xsl:param name="title"/>
  <xsl:param name="marker.title"/>
  <xsl:variable name="node" select=".."/>
  <xsl:variable name="img" select="$own.imgtable[@role=$node/@role]"/>
 
 <xsl:variable name="content">
   <fo:block vertical-align="middle">
    <xsl:choose>
      <xsl:when test="$level=1">
        <fo:block xsl:use-attribute-sets="section.title.level1.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=2">
        <fo:block xsl:use-attribute-sets="section.title.level2.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=3">
        <fo:block xsl:use-attribute-sets="section.title.level3.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=4">
        <fo:block xsl:use-attribute-sets="section.title.level4.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=5">
        <fo:block xsl:use-attribute-sets="section.title.level5.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block xsl:use-attribute-sets="section.title.level6.properties">
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
 </xsl:variable>
  
 <fo:block xsl:use-attribute-sets="section.title.properties"
   padding-before="0.25em" padding-after="0.25em">
   <xsl:if test="$level = 1">
     <!-- Only set background for level 1 sections -->
     <xsl:attribute name="background-color">
       <xsl:value-of select="$own.section.background-color"/>
     </xsl:attribute>
   </xsl:if>
    <xsl:if test="$marker != 0">
      <fo:marker marker-class-name="section.head.marker">
        <xsl:copy-of select="$marker.title"/>
      </fo:marker>
    </xsl:if>
      <xsl:choose>
        <xsl:when test="$node/@role and $img != ''">
          <fo:table table-layout="fixed" width="100%">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(11)"/>
            <fo:table-body>
              <fo:table-cell padding-start="0.5em">
                <fo:block vertical-align="middle">
                  <fo:external-graphic width="30px" content-width="25px"
                    vertical-align="middle"
                    margin-right="1em">
                    <xsl:attribute name="src">
                      <xsl:call-template name="fo-external-image">
                        <xsl:with-param name="filename">
                          <xsl:value-of
                            select="concat($logos.src.path, $img)"/>
                        </xsl:with-param>
                      </xsl:call-template>
                    </xsl:attribute>
                  </fo:external-graphic>
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <xsl:copy-of select="$content"/>
              </fo:table-cell>
            </fo:table-body>
          </fo:table>
        </xsl:when>
        <xsl:otherwise>
            <xsl:copy-of select="$content"/>
        </xsl:otherwise>
      </xsl:choose>
 </fo:block>
  
</xsl:template>
  
</xsl:stylesheet>
