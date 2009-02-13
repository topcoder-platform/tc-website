<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_10_coders">
            <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#555555">
<!-- Division I Begins -->
                <tr valign="middle">
                    <td class="statTextBig" width="1%" nowrap="0">&#160;Top <xsl:value-of select="count(/TC/HOME/TopDiv1RankedCoders/Coder)"/> Coders</td>
                    <td class="statTextBig" width="15"><A href="javascript:infoWindow('/tc?&amp;module=Static&amp;d1=statistics&amp;d2=info&amp;d3=topRatedCoders')" class="statTextBig"><img src="/i/icon_help_blue.gif" alt="?" width="15" height="11" border="0"/></A></td>
                    <td class="statTextBig" align="right" width="99%"><a href="/tc?module=AlgoRank" class="statTextBig">View all coders</a>&#160;</td>              
                </tr>
            </table>
                
            <table width="100%" border="0" cellspacing="0" cellpadding="2" valign="top" bgcolor="#333333">
                <tr valign="middle">
                    <td class="statText" align="right" background="/i/graybv_lite_bg.gif" height="18">&#160;Rank</td>  
                    <td class="statText" background="/i/graybv_lite_bg.gif" height="18">Handle</td>
                    <td class="statText" align="right" background="/i/graybv_lite_bg.gif" height="18">Rating&#160;</td>            
                </tr>                  
                
                <xsl:for-each select="/TC/HOME/TopDiv1RankedCoders/Coder">
                <tr>
                    <td class="statText" align="right">&#160;<xsl:value-of select="rank"/>.&#160;&#160;</td>
                    <td class="statText">
                        <a>
                        <xsl:attribute name="HREF">tc?module=MemberProfile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                        <xsl:attribute name="CLASS">
                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="handle"/>
                        </a>
                    </td>
                    <td class="statText" align="right"><xsl:value-of select="rating"/>&#160;</td>               
                </tr>             
                </xsl:for-each>                     
                
                <tr>
                    <td width="10%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="50%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="40%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                 </tr> 
<!-- Division I Ends -->
            </table>
  </xsl:template>
</xsl:stylesheet>
