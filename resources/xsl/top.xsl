<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="menu.xsl"/>
  <xsl:import href="includes/modules/rating.xsl"/>
  <xsl:import href="script.xsl"/>
  <!-- <xsl:import href="../includes/modules/rating.xsl"/> -->  
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Top"/>
  </xsl:template>
  <xsl:template name="Top">

<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">    
    <tr valign="middle">
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
        <td nowrap="0" class="registerToday"><span class="time">Current Member Count</span>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> - <span class="time"><xsl:call-template name="DateTime"/></span><a href="Javascript:tcTime()" class="statText">[Get Time]</a></td>
        <td width="99%" align="right" class="login" nowrap="0">

            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                    <A class="loginLinks" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=submit_logout</xsl:attribute>Logout</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Update Profile</A>
                </xsl:when>
                <xsl:otherwise>
                    <A class="loginLinks" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=login</xsl:attribute>Login</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</A>
                </xsl:otherwise>
            </xsl:choose>
            
            &#160;&#160;|&#160;&#160;<A target="_parent" class="loginLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>Home</A>
        </td>
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table> 

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">    
    <tr><td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>                
</table> 

<!-- Logo Bar Include Begins -->       
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">            
    <tr valign="middle">
        <td width="15" bgcolor="#000000"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206" bgcolor="#000000">
          <a target="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>
            <img src="/i/logo.gif" width="206" height="49" border="0" vspace="5"/>
          </a>
        </td>
        <td width="20" bgcolor="#000000"><img src="/i/clear.gif" width="1" height="1" border="0" hspace="15"/></td>
        <td class="time" valign="bottom" nowrap="" align="right">

<xsl:choose>
    <xsl:when test="/TC/LoggedIn='true'">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">            
                <tr>
                    <td><img src="/i/clear.gif" width="1" height="75" border="0"/></td>
                    <td width="100%" bgcolor="#333333">
                        <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
                        <xsl:when test="number(/TC/Rating)&lt;1200">top_div2_badge</xsl:when>
                        <xsl:otherwise>top_div1_badge</xsl:otherwise></xsl:choose>.jpg</xsl:attribute>                   
                        <img src="/i/clear.gif" width="1" height="75" border="0"/>
                    </td>
                    
                    <td class="time" align="right" valign="middle" width="150" bgcolor="#333333"><img src="/i/clear.gif" width="150" height="1" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">            
                                <tr>
                                   <td class="time" height="18" valign="middle" align="center" bgcolor="#000000">                                                                           
                                        <a>
                                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                                        <xsl:attribute name="class">
                                            <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="/TC/Rating"/></xsl:with-param></xsl:call-template>
                                        </xsl:attribute>
                                        <b><xsl:value-of select="/TC/Handle"/></b>
                                        </a>
                                </td>
                            </tr>
                         
                            <tr><form name="selectform">
                                <td class="time" height="18" valign="middle" align="center">                                                                         
                                    <select name="quickstat" size="1" class="dropdown" onchange="window.location=this.options[this.selectedIndex].value">      
                                        <option value="SELECTED"> Select a Feature: </option>
                                        <option><xsl:attribute name="value">/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Profile</option>
                                        <option><xsl:attribute name="value">/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Rating History</option>
                                        <option><xsl:attribute name="value">/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Earnings History</option>
                                        <option><xsl:attribute name="value">/stat?c=coder_room_stats&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Room Statistics</option> 
                                        <option><xsl:attribute name="value">/stat?c=round_stats</xsl:attribute>Round Statistics</option>
                                        <option><xsl:attribute name="value">/index?t=search</xsl:attribute>Advanced Member Search</option> 
                                        <option><xsl:attribute name="value">/PactsMemberServlet</xsl:attribute>Affidavits</option> 
                                        <option><xsl:attribute name="value">/index?t=search&amp;c=refer</xsl:attribute>My Referrals</option>
                                        <option><xsl:attribute name="value">/index?t=development&amp;c=index</xsl:attribute>Development</option>
                                        <option><xsl:attribute name="value">/index?t=tces&amp;c=index</xsl:attribute>TCES (jobs)</option> 
                                    </select>
                                </td></form>
                            </tr>                                 
                        </table>
                    </td>
                    <td width="10" bgcolor="#333333"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>             
                </table>
            </xsl:when>             
            
            <xsl:otherwise>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">            
                    <tr>
                        <td><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
                        <td width="99%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
                        <td width="190"><img src="/i/clear.gif" width="190" height="1" border="0"/></td>
                        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    </tr> 
                    
                    <tr>
                        <td><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
                        <td width="99%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
                        <td width="190"><img src="/i/clear.gif" width="190" height="74" border="0"/></td>
                        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    </tr>           
                </table>                    
    </xsl:otherwise>
</xsl:choose>                
            </td>        
        </tr>             
</table>

    <xsl:call-template name="TopMenu"/>
  </xsl:template>
</xsl:stylesheet>
