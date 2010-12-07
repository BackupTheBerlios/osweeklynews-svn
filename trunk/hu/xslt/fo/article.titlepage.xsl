<?xml version="1.0" encoding="UTF-8"?>
<!--  This document licensed under CC-BY-SA by Sascha Manns <saigkill@opensuse.org> and Thomas Schraitle <toms@suse.de>-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template name="article.titlepage.before.recto">
  <xsl:param name="filename">Opensuse_weekly_news_banner.png</xsl:param>
  <fo:block space-after="2em">
    <fo:external-graphic width="100px">
        <xsl:attribute name="src">
          <xsl:call-template name="fo-external-image">
            <xsl:with-param name="filename">
              <xsl:value-of select="concat($logos.src.path, $filename)"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:attribute>
    </fo:external-graphic>
  </fo:block>
</xsl:template>

<!-- article.titlepage.before.verso -->
<xsl:template name="article.titlepage.separator">
  <fo:block page-break-after="always">
    <fo:leader leader-pattern="space"/>
  </fo:block>
</xsl:template>

<xsl:template name="table.of.contents.titlepage.recto">
  <fo:block xsl:use-attribute-sets="own-title-color"
    start-indent="0pt" 
    font-size="17.28pt" 
    font-weight="normal"    
    font-family="{$title.fontset}">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'TableofContents'"/>
      </xsl:call-template></fo:block>
</xsl:template>
</xsl:stylesheet>