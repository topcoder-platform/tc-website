<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="srm_best_worst">
            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">SRM 172</font></td>
                    <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/stat?&amp;c=last_match" class="bodyText"><strong>View Stats</strong></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr>
                    <td valign="middle" align="center" bgcolor="#093158" width="33%" nowrap="nowrap" height="15">
                        <a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>Division Leaders</a>
                    </td>
                    <td valign="middle" align="center" bgcolor="#093158" width="34%" nowrap="nowrap">
                        <a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>Problem Stats</a>
                    </td>
                    <td valign="middle" align="center" bgcolor="#093158" width="33%" nowrap="nowrap">
                        <a class="statTextBig"><xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>Results</a>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#001935">
                    <tr><td align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best / Worst Rating Change</td></tr>

                    <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">

                    <tr valign="middle">
                        <td width="20%" class="statTextBig" nowrap="nowrap">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
                        <td width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td>
                        <td width="35%" class="statText" nowrap="nowrap">
                            <a>
                            <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                            <xsl:attribute name="CLASS">
                                <xsl:call-template name="GetRatingClass">
                                    <xsl:with-param name="rating">
                                    <xsl:value-of select="rating"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:attribute>
                            <xsl:value-of select="handle"/>
                            </a>
                        </td>
                        <td width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
                        <td width="20%" class="statText" nowrap="nowrap"><xsl:value-of select="room_name"/></td>
                    </tr>

                    </xsl:for-each>
            </table>
  </xsl:template>
</xsl:stylesheet>
