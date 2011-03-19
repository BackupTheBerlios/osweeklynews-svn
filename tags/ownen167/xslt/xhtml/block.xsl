<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:template match="blockquote">
  <div class="blockquote">
    <xsl:call-template name="common.html.attributes"/>
    <xsl:call-template name="anchor"/>
    <xsl:choose>
      <xsl:when test="attribution">
        <table border="0" width="100%" cellspacing="0" cellpadding="0" 
          class="attribution" 
          summary="Block quote">
          <tr>
            <td width="10%" valign="top">&#160;</td>
            <td width="80%" valign="top">
              <span class="startquote"><xsl:call-template name="gentext.startquote"/></span>
              <xsl:apply-templates select="child::*[local-name(.)!='attribution']"/>
              <span class="endquote"><xsl:call-template name="gentext.endquote"/></span>
            </td>
            <td width="10%" valign="top">&#160;</td>
          </tr>
          <tr>
            <td width="10%" valign="top">&#160;</td>
            <td colspan="2" align="{$direction.align.end}" valign="top">
              <xsl:text>--</xsl:text>
              <xsl:apply-templates select="attribution"/>
            </td>
          </tr>
        </table>
      </xsl:when>
      <xsl:otherwise>
        <!-- We need to remove the "blockquote" HTML element to
          avoid the Bento theme (italic)
        -->
        <div>
          <span class="startquote"><xsl:call-template name="gentext.startquote"/></span>
          <xsl:apply-templates/>
          <span class="endquote"><xsl:call-template name="gentext.endquote"/></span>
        </div>          
      </xsl:otherwise>
    </xsl:choose>
  </div>
</xsl:template>
  
  
</xsl:stylesheet>