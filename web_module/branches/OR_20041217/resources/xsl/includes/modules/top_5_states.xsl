<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_5_states">
            <table width="100%" border="0" cellspacing="0" cellpadding="2" valign="top" bgcolor="#001935">
                <tr valign="middle">
                    <td colspan="2" class="statTextBig" bgcolor="#093158" height="18">&#160;States</td>              
                    <td class="statTextBig" align="right" bgcolor="#093158" height="18"><a href="/stat?c=state_avg_rating" class="statTextBig">View all</a>&#160;</td>              
                </tr>                        
                
                <tr valign="middle">
                    <td class="statText" align="right" background="/i/steel_bluebv_bg.gif" height="18">&#160;Rank</td>  
                    <td class="statText" background="/i/steel_bluebv_bg.gif" height="18">Name</td>
                    <td class="statText" align="right" background="/i/steel_bluebv_bg.gif" height="18">Avg. Rating&#160;</td>            
                </tr>                  
                
                <xsl:for-each select="/TC/HOME/TopRankedStates/State">
                <tr valign="middle">
                    <td class="statText" align="right">&#160;<xsl:value-of select="rank"/>.&#160;&#160;</td>
                    <td class="statText"><xsl:value-of select="name"/></td>
                    <td class="statText" align="right"><xsl:value-of select="avg_rating"/>&#160;</td>                    
                </tr>                 
                </xsl:for-each>                
                
                <tr>
                    <td width="10%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="50%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="40%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                 </tr> 
            </table>
  </xsl:template>
</xsl:stylesheet>
