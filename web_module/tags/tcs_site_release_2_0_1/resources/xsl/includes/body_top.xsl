<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="BodyTop">
    <xsl:param name="image1"></xsl:param>
    <xsl:param name="image"></xsl:param>
    <xsl:param name="title"></xsl:param>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="bottom">
                    <td width="11" align="right">
          
<xsl:choose>
    <xsl:when test="$image1='steelblue'"><img src="/i/clear.gif" width="1" height="8" border="0"/><br/>
                        <img width="11" height="26" border="0"><xsl:attribute name="SRC">/i/steelblue_top_left1.gif</xsl:attribute></img>
    </xsl:when>

    <xsl:when test="$image1='steelgray'"><img src="/i/clear.gif" width="1" height="8" border="0"/><br/>
                        <img width="11" height="26" border="0"><xsl:attribute name="SRC">/i/tourney_top_left1.gif</xsl:attribute></img>
    </xsl:when>

    <xsl:otherwise>
                        <img width="11" height="26" border="0"><xsl:attribute name="SRC">/i/clear.gif</xsl:attribute></img>
    </xsl:otherwise>
</xsl:choose>
          
                    </td>
                    
                    <td width="75" align="left"><img src="/i/clear.gif" width="1" height="8" border="0"/><br/>
                        <img width="180" height="26" border="0">
                            <xsl:attribute name="SRC">/i/header_<xsl:value-of select="$image"/>.gif</xsl:attribute>
                            <xsl:attribute name="ALT"><xsl:value-of select="$image"/></xsl:attribute>
                        </img>
                    </td>
        
                    <td class="bodySubhead" width="100%">
                        &#160;<xsl:value-of select="$title"/>&#160;<br />
                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                    </td>
                    
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                </tr>
            </table>

  </xsl:template>
</xsl:stylesheet>
