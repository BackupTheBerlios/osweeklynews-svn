<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:img="urn:x-suse:toms:image-table"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  exclude-result-prefixes="img">

<!-- ==== The Parameters === -->

<!-- The start-indent for the body text:                 -->
<xsl:param name="body.start.indent">3em</xsl:param>

<xsl:param name="column.count.body" select="1"/>

<!-- Do we use draft mode:                               -->  
<xsl:param name="draft.mode" select="'no'"/>
<!-- This is going to be a book, so we print doublesided -->
<xsl:param name="double.sided">0</xsl:param>

<!-- Contains a table mapping between @role and image filename -->
<xsl:param name="own.imgtable" select="document('imagetable.xml')//img:*"/>

<xsl:param name="own.section.background-color">#E5E5E6</xsl:param>

<!-- Use FOP 1.x extensions                              -->
<xsl:param name="fop1.extensions" select="1"/>
<xsl:param name="xep.extensions" select="0"/>

<!--<xsl:param name="header.column.widths">0 4 0</xsl:param>-->
<xsl:param name="headers.on.blank.pages" select="0"/>

<xsl:param name="logos.src.path">logos/</xsl:param>
<!-- Use blocks for variable lists:                      -->
<xsl:param name="variablelist.as.blocks" select="'1'"/>  
<!-- Present glossarys using blocks instead of lists?    -->
<xsl:param name="glossary.as.blocks" select="1"/>
<!-- The used paper type                                 -->
<xsl:param name="paper.type">A4</xsl:param>

<xsl:param name="page.margin.inner">2em</xsl:param>
<xsl:param name="page.margin.outer">2em</xsl:param>

<xsl:param name="ulink.footnotes" select="1"/>

<xsl:param name="ulink.hyphenate" select="'&#x200B;'"/>
<!-- Insert breakpoint /before/ the following characters: -->
<xsl:param name="ulink.hyphenate.before.chars"
  >.,%?&amp;#\-+{_</xsl:param>
<!-- Insert breakpoint /after/ the following characters: -->
<xsl:param name="ulink.hyphenate.after.chars"
  >/:@=};</xsl:param>
  

<!-- ==== Attribute Sets === -->
<xsl:attribute-set name="own-title-color">
  <xsl:attribute name="color">#669900</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="blockquote.properties">
<xsl:attribute name="margin-{$direction.align.start}">0em</xsl:attribute>
<xsl:attribute name="margin-{$direction.align.end}">0em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="formal.title.properties">
  <xsl:attribute name="font-family"><xsl:value-of select="$sans.font.family"/></xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.properties"
  use-attribute-sets="own-title-color">
  <xsl:attribute name="font-weight">normal</xsl:attribute>  
</xsl:attribute-set>

<xsl:attribute-set name="article.appendix.title.properties" use-attribute-sets="own-title-color">
</xsl:attribute-set>

<xsl:attribute-set name="component.title.properties" use-attribute-sets="own-title-color">
</xsl:attribute-set>


</xsl:stylesheet>