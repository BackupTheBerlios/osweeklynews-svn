<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink='http://www.w3.org/1999/xlink'
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:exsl="http://exslt.org/common"
  exclude-result-prefixes="exsl xlink">

<xsl:template name="hyperlink.url.display">
  <!-- * This template is called for all external hyperlinks (ulinks and -->
  <!-- * for all simple xlinks); it determines whether the URL for the -->
  <!-- * hyperlink is displayed, and how to display it (either inline or -->
  <!-- * as a numbered footnote). -->
  <xsl:param name="url"/>
  <xsl:param name="ulink.url">
    <!-- * ulink.url is just the value of the URL wrapped in 'url(...)' -->
    <xsl:call-template name="fo-external-image">
      <xsl:with-param name="filename" select="$url"/>
    </xsl:call-template>
  </xsl:param>

  <xsl:if test="count(child::node()) != 0
                and string(.) != $url
                and $ulink.show != 0">
    <!-- * Display the URL for this hyperlink only if it is non-empty, -->
    <!-- * and the value of its content is not a URL that is the same as -->
    <!-- * URL it links to, and if ulink.show is non-zero. -->
    <xsl:choose>
      <xsl:when test="$ulink.footnotes != 0 and not(ancestor::footnote)">
        <!-- * ulink.show and ulink.footnote are both non-zero; that -->
        <!-- * means we display the URL as a footnote (instead of inline) -->
        <fo:footnote>
          <xsl:call-template name="ulink.footnote.number">
            <xsl:with-param name="super" select="1"/>
          </xsl:call-template>
          <fo:footnote-body xsl:use-attribute-sets="footnote.properties">
            <fo:block>
              <xsl:call-template name="ulink.footnote.number"/>
              <xsl:text> </xsl:text>
              <fo:basic-link external-destination="{$ulink.url}">
                <xsl:value-of select="$url"/>
              </fo:basic-link>
            </fo:block>
          </fo:footnote-body>
        </fo:footnote>
      </xsl:when>
      <xsl:otherwise>
        <!-- * ulink.show is non-zero, but ulink.footnote is not; that -->
        <!-- * means we display the URL inline -->
        <fo:inline hyphenate="false">
          <!-- * put square brackets around the URL -->
          <xsl:text> [</xsl:text>
          <fo:basic-link external-destination="{$ulink.url}">
            <xsl:call-template name="hyphenate-url">
              <xsl:with-param name="url" select="$url"/>
            </xsl:call-template>
          </fo:basic-link>
          <xsl:text>]</xsl:text>
        </fo:inline>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template> 

<xsl:template name="ulink.footnote.number">
  <xsl:param name="super" select="0"/>
  <fo:inline xsl:use-attribute-sets="footnote.mark.properties">
      <xsl:if test="$super != 0">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size">75%</xsl:attribute>
        <xsl:choose>
          <xsl:when test="$fop.extensions != 0">
            <xsl:attribute name="vertical-align">super</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="baseline-shift">super</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    <xsl:variable name="fnum">
      <!-- * Determine the footnote number to display for this hyperlink, -->
      <!-- * by counting all foonotes, ulinks, and any elements that have -->
      <!-- * an xlink:href attribute that meets the following criteria: -->
      <!-- * -->
      <!-- * - the content of the element is not a URI that is the same -->
      <!-- *   URI as the value of the href attribute -->
      <!-- * - the href attribute is not an internal ID reference (does -->
      <!-- *   not start with a hash sign) -->
      <!-- * - the href is not part of an olink reference (the element -->
      <!-- * - does not have an xlink:role attribute that indicates it is -->
      <!-- *   an olink, and the href does not contain a hash sign) -->
      <!-- * - the element either has no xlink:type attribute or has -->
      <!-- *   an xlink:type attribute whose value is 'simple' -->
      <!-- FIXME: list in @from is probably not complete -->
      <xsl:number level="any" 
                  from="chapter|appendix|preface|article|refentry|bibliography[not(parent::article)]"
                  count="footnote[not(@label)][not(ancestor::tgroup)]
                  |ulink[node()][@url != .][not(ancestor::footnote)]
                  |*[node()][@xlink:href][not(@xlink:href = .)][not(starts-with(@xlink:href,'#'))]
                    [not(contains(@xlink:href,'#') and @xlink:role = $xolink.role)]
                    [not(@xlink:type) or @xlink:type='simple']
                    [not(ancestor::footnote)]"
                  format="1"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="string-length($footnote.number.symbols) &gt;= $fnum">
        <xsl:value-of select="substring($footnote.number.symbols, $fnum, 1)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:number value="$fnum" format="{$footnote.number.format}"/>
      </xsl:otherwise>
    </xsl:choose>
  </fo:inline>
</xsl:template>

</xsl:stylesheet>