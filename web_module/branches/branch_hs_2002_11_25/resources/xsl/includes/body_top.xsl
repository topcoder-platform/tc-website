<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="BodyTop">
    <xsl:param name="image1"></xsl:param>
    <xsl:param name="image"></xsl:param>
    <xsl:param name="title"></xsl:param>
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
      <TR>
        <TD VALIGN="top" WIDTH="11" ALIGN="right">
          <IMG WIDTH="11" HEIGHT="26" BORDER="0">
<xsl:choose>
<xsl:when test="$image1='steelblue'">
<xsl:attribute name="SRC">/i/steelblue_top_left1.gif</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="SRC">/i/table_top_left1.gif</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
          </IMG>
        </TD>
        <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="75" ALIGN="left">
          <IMG WIDTH="180" HEIGHT="26" BORDER="0">
            <xsl:attribute name="SRC">/i/header_<xsl:value-of select="$image"/>.gif</xsl:attribute>
            <xsl:attribute name="ALT"><xsl:value-of select="$image"/></xsl:attribute>
          </IMG>
        </TD>
        <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%">
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
          <BR/>&#160;<SPAN CLASS="bodySubhead">&#160;&#160;<xsl:value-of select="$title"/>&#160;&#160;</SPAN>
        </TD>
        <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
      </TR>
    </TABLE>
  </xsl:template>
</xsl:stylesheet>
