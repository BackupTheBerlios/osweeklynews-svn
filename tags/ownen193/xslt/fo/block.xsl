<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>

<xsl:template match="blockquote">
  <xsl:variable name="keep.together">
    <xsl:call-template name="pi.dbfo_keep-together"/>
  </xsl:variable>
  <fo:block xsl:use-attribute-sets="blockquote.properties">
    <xsl:if test="$keep.together != ''">
      <xsl:attribute name="keep-together.within-column"><xsl:value-of
                      select="$keep.together"/></xsl:attribute>
    </xsl:if>
    <xsl:call-template name="anchor"/>
   
    <fo:block>
      <xsl:if test="title|info/title">
        <fo:block xsl:use-attribute-sets="formal.title.properties">
          <fo:inline><xsl:call-template name="gentext.startquote"/></fo:inline>
          <xsl:apply-templates select="title" mode="block.title"/>
        </fo:block>
      </xsl:if>
      <!-- Select everything except title or attribution: -->
      <xsl:apply-templates select="*[not(self::title) and not(self::attribution)]"/>
    </fo:block>
    <xsl:if test="attribution">
      <fo:block text-align="right">
        <!-- mdash -->
        <xsl:text>&#x2014;</xsl:text>
        <xsl:apply-templates select="attribution"/>
      </fo:block>
    </xsl:if>
    <fo:inline><xsl:call-template name="gentext.endquote"/></fo:inline>
  </fo:block>
</xsl:template>


<xsl:template match="blockquote/title" mode="block.title">
  <fo:inline role="blockquote-title">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>

</xsl:stylesheet>
