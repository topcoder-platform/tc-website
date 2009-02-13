<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="BodyTop">
    <xsl:param name="image1"></xsl:param>
    <xsl:param name="image"></xsl:param>
    <xsl:param name="title"></xsl:param>
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
      <TR>
        <TD VALIGN="top" WIDTH="11" ALIGN="right">
          
<xsl:choose>
<xsl:when test="$image1='steelblue'"><img src="/i/clear.gif" width="1" height="8" BORDER="0"/><BR/>
<IMG WIDTH="11" HEIGHT="26" BORDER="0"><xsl:attribute name="SRC">/i/steelblue_top_left1.gif</xsl:attribute></IMG>
</xsl:when>
<xsl:otherwise>
<IMG WIDTH="11" HEIGHT="26" BORDER="0"><xsl:attribute name="SRC">/i/table_top_leftx.gif</xsl:attribute></IMG>
</xsl:otherwise>
</xsl:choose>
          
        </TD>
        <TD VALIGN="bottom" WIDTH="75" ALIGN="left"><img src="/i/clear.gif" width="1" height="8" BORDER="0"/><BR/>
          <IMG WIDTH="180" HEIGHT="26" BORDER="0">
            <xsl:attribute name="SRC">/i/header_<xsl:value-of select="$image"/>.gif</xsl:attribute>
            <xsl:attribute name="ALT"><xsl:value-of select="$image"/></xsl:attribute>
          </IMG>
        </TD>
        <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
          <BR/>&#160;<SPAN CLASS="bodySubhead">&#160;&#160;<xsl:value-of select="$title"/>&#160;&#160;</SPAN>
        </TD>
        <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
      </TR>
      <!-- <TR>
        <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
      </TR>       
      <TR>
        <TD VALIGN="top" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
        <TD VALIGN="top" WIDTH="100%" ALIGN="left" COLSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
        <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      </TR> -->      
    </TABLE>
  </xsl:template>
</xsl:stylesheet>
