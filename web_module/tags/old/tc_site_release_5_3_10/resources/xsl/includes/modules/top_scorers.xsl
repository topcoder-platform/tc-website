<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_scorers">    
    <xsl:param name="division"></xsl:param>
            <table border="0" cellspacing="0" cellpadding="5" width="100%" bgcolor="#555555">
                <tr valign="top">
                <xsl:choose>
                    <xsl:when test="number($division)=2">
                    <td class="smallFoot">Here is a view of the Top-10 Division II scorers from <xsl:value-of select="/TC/HOME/Div2TopScorers/Coder/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div2TopScorers/Coder/round_name"/></td>
                    </xsl:when>
                    <xsl:otherwise>
                    <td class="smallFoot">Here is a view of the Top-10 Division I scorers from <xsl:value-of select="/TC/HOME/Div1TopScorers/Coder/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div1Scorers/Coder/round_name"/></td>
                    </xsl:otherwise>
                </xsl:choose>     
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
                <tr valign="middle">
                    <td align="right" background="/i/graybv_lite_bg.gif" class="statText">&#160;Rank</td>        
                    <td align="left" background="/i/graybv_lite_bg.gif" class="statText">Room</td>
                    <td align="left" background="/i/graybv_lite_bg.gif" class="statText">Handle</td>
                    <td align="right" background="/i/graybv_lite_bg.gif" class="statText">Final&#160;Pts&#160;</td>
                </tr>

        <xsl:choose>
          <xsl:when test="number($division)=2">
            <xsl:for-each select="/TC/HOME/Div2TopScorers/Coder">
                <tr>
                    <td align="right" class="statText">&#160;<xsl:value-of select="rank"/>.&#160;&#160;</td>
                    <td align="left" class="statText" nowrap="nowrap"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;cr=<xsl:value-of select="coder_id"/>&amp;rd=<xsl:value-of select="round_id"/>&amp;rm=<xsl:value-of select="room_id"/></xsl:attribute><xsl:value-of select="room_name"/></A></td>
                    <td align="left" class="statText">
                        <A>
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                        <xsl:attribute name="class">
                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="handle"/>
                        </A>
                    </td>
                    <td align="right" class="statText"><xsl:value-of select="final_points"/>&#160;</td>
                </tr>
            </xsl:for-each>
          </xsl:when>
          
          <xsl:otherwise>
            <xsl:for-each select="/TC/HOME/Div1TopScorers/Coder">
                <tr>
                    <td align="right" class="statText">&#160;<xsl:value-of select="rank"/>.&#160;&#160;</td>
                    <td align="left" class="statText" nowrap="nowrap"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;cr=<xsl:value-of select="coder_id"/>&amp;rd=<xsl:value-of select="round_id"/>&amp;rm=<xsl:value-of select="room_id"/></xsl:attribute><xsl:value-of select="room_name"/></A></td>
                    <td align="left" class="statText">
                        <A>
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                        <xsl:attribute name="class">
                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="handle"/>
                        </A>
                    </td>
                    <td align="right" class="statText"><xsl:value-of select="final_points"/>&#160;</td>
                </tr>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>     

                <tr valign="top">
                    <td colspan="4" align="right" class="statText" height="18">
                        <A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_stats</xsl:attribute><img src="/i/mystats_icon.gif" alt="" width="10" height="10" border="0" hspace="3" />All last match results</A>&#160;
                    </td>
                </tr>
                
                <tr>
                    <td width="10%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="10%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="40%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="40%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                 </tr> 
            </table>
            <img src="/i/clear.gif" width="1" height="1" border="0"/>
  </xsl:template>
</xsl:stylesheet>


