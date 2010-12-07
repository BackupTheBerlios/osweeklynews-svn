<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:template match="pubdate" mode="article.titlepage.recto.auto.mode">
    <div xsl:use-attribute-sets="article.titlepage.recto.style">
      <xsl:call-template name="gentext">
        <xsl:with-param name="key">published</xsl:with-param>
      </xsl:call-template>
      <xsl:text>: </xsl:text>
      <xsl:apply-templates select="." mode="article.titlepage.recto.mode"/>
    </div>
  </xsl:template>
  
  
</xsl:stylesheet>