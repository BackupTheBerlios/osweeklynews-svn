<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:img="urn:x-suse:toms:image-table"
  exclude-result-prefixes="img"
  >

<!-- This is a table mapping between @role and image filename

-->
<table xmlns="urn:x-suse:toms:image-table">
  <entry role="status-updates">OWN-oxygen-Board.png</entry>	
  <entry role="board">OWN-oxygen-Board.png</entry>	
  <entry role="distribution">Suse_Box.png</entry>
  <entry role="susestudio">Built-with-web-big.png</entry>
  <entry role="announcements">Marketing.png</entry>
  <entry role="buildserviceteam">OWN-oxygen-Build-Service.png</entry>
  <entry role="artteam">Logo-art.png</entry>
  <entry role="boosters">Suse_Box.png</entry>
  <entry role="education">OpenSUSE-Edu.png</entry>
  <entry role="gnometeam">GNOME-foot.jpg</entry>
  <entry role="kdeteam">Kde-logo.jpg</entry>
  <entry role="marketingteam">Start-here-branding.png</entry>
  <entry role="medical">Opensuse_medical_logo11.png</entry>
  <entry role="monoteam">Mono_project_logo.png</entry>
  <entry role="openfateteam">Logo-fate.png</entry>
  <entry role="oooteam">Nuvola_apps_ooo_gulls.png</entry>
  <entry role="testing">Suse_Box.png</entry>
  <entry role="wiki">OWN-oxygen-WCE.png</entry>
  <entry role="yast">Icon-yast.png</entry>
  <entry role="translationteam">OWN-Icon-locale.png</entry>
  <entry role="community">Icon-project.png</entry>
  <entry role="updates">OWN-oxygen-New-Updated-Applications.png</entry>
  <entry role="security">Logo-SecurityUpdates.png</entry>
  <entry role="kernel">Tux.svg.png</entry>
  <entry role="tipsandtricks">OWN-oxygen-Tips-and-Tricks.png</entry>
  <entry role="planetsuse">Logo-PlanetSUSE.png</entry>
  <entry role="forums">OWN-oxygen-openSUSE-Forums.png</entry>
  <entry role="ontheweb">OWN-oxygen-On-the-Web.png</entry>
  <entry role="feedback">OWN-oxygen-Credits.png</entry><!-- FIXME -->
  <entry role="credits">OWN-oxygen-Credits.png</entry>
  <entry role="translations">OWN-Icon-locale.png</entry>
</table>

<xsl:param name="imgtable" select="document('')//img:*"/>

<xsl:template name="sect1.titlepage.before.recto">
  <fo:block text-align-last="justify">
    <fo:leader leader-pattern="rule" xsl:use-attribute-sets="own-title-color"/>
  </fo:block>
</xsl:template>

<xsl:template name="create-image-title">
  <xsl:param name="node" select=".."/>
  <xsl:variable name="img" select="$imgtable[@role=$node/@role]"/>
  
  <!--<xsl:message>create-image-title: <xsl:value-of
    select="concat(name($node), ' ', $node/@role, '== ', $img)"/></xsl:message>
  -->
  <xsl:if test="$node/@role and $img != ''">    
    <fo:external-graphic width="40px" content-width="30px"
      margin-right="1em">
      <xsl:attribute name="src">
          <xsl:call-template name="fo-external-image">            
            <xsl:with-param name="filename">
              <xsl:value-of select="concat($logos.src.path, $img)"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:attribute>
    </fo:external-graphic>
  </xsl:if>  
</xsl:template>



<xsl:template name="section.heading">
  <xsl:param name="level" select="1"/>
  <xsl:param name="marker" select="1"/>
  <xsl:param name="title"/>
  <xsl:param name="marker.title"/>

  <fo:block xsl:use-attribute-sets="section.title.properties">
    <xsl:if test="$marker != 0">
      <fo:marker marker-class-name="section.head.marker">
        <xsl:copy-of select="$marker.title"/>
      </fo:marker>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$level=1">
        <fo:block xsl:use-attribute-sets="section.title.level1.properties" background-color="#E5E5E6">
          <xsl:call-template name="create-image-title"/>
          <fo:inline>
          <xsl:copy-of select="$title"/>
          </fo:inline>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=2">
        <fo:block xsl:use-attribute-sets="section.title.level2.properties">
          <xsl:call-template name="create-image-title"/>
          <xsl:copy-of select="$title"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=3">
        <fo:block xsl:use-attribute-sets="section.title.level3.properties">
          <xsl:call-template name="create-image-title"/>
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
</xsl:template>
  
</xsl:stylesheet>
