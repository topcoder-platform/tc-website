<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_10_coders">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935">
				<tr>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td width="10%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
					<td width="5"><img src="/i/clear.gif" width="5" height="1" border="0"/></td>
					<td width="50%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
					<td width="5"><img src="/i/clear.gif" width="5" height="1" border="0"/></td>
					<td width="40%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				 </tr> 
				
<!-- Division I Begins -->
				<tr valign="middle">
					<td colspan="7" height="16" class="statTextBig" align="center">Division-I Coders</td>			  
				</tr>						
				
				<tr>
					<td colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             

				<tr valign="middle">
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif">Rank</td>  
 					<td width="7" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
 					<td width="7" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif">Rating</td>			
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
				</tr>				  
				
				<tr>
					<td colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
				
				<xsl:for-each select="/TC/HOME/TopDiv1RankedCoders/Coder">
				<tr>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                  		<td class="statText" align="right"><xsl:value-of select="rank"/>.&#160;&#160;</td>
 					<td width="7"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
                  		<td class="statText">
						<a>
						<xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
						<xsl:attribute name="CLASS">statText</xsl:attribute>
						<font>
						<xsl:attribute name="color">
						<xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
						</xsl:attribute>
						<xsl:value-of select="handle"/>
						</font>
						</a>
					</td>
 					<td width="7"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" align="right"><xsl:value-of select="rating"/></td>               
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
				
				<tr>
					<td height="1" colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
				</xsl:for-each>                     

				<tr> 
					<td height="10" colspan="7"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
				</tr>				  
<!-- Division I Ends -->
          
<!-- Division II Begins -->
				<tr valign="middle">
					<td colspan="7" height="16" class="statTextBig" align="center">Division-II Coders</td>			  
				</tr>						
				
				<tr>
					<td colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             

				<tr valign="middle">
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif">Rank</td>  
 					<td width="7" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
 					<td width="7" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif">Rating</td>			
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
				</tr>				  
				
				<tr>
					<td colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
				
				<xsl:for-each select="/TC/HOME/TopDiv2RankedCoders/Coder">
				<tr>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                  		<td class="statText" align="right"><xsl:value-of select="rank"/>.&#160;&#160;</td>
 					<td width="7"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
                  		<td class="statText">
						<a>
						<xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
						<xsl:attribute name="CLASS">statText</xsl:attribute>
						<font>
						<xsl:attribute name="color">
						<xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
						</xsl:attribute>
						<xsl:value-of select="handle"/>
						</font>
						</a>
					</td>
 					<td width="7"><img src="/i/clear.gif" width="7" height="1" border="0"/></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" align="right"><xsl:value-of select="rating"/></td>               
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>             
				
				<tr>
					<td height="1" colspan="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>                             
				</xsl:for-each>                     

				<tr> 
					<td height="10" colspan="7"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
				</tr>				  
			</table>          
  </xsl:template>
</xsl:stylesheet>
