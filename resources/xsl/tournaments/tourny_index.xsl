<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Tournaments</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>

<body>
<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
            <td width="6"><img src="/i/clear.gif" width="6" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelblue</xsl:with-param>
                <xsl:with-param name="image">tournaments_blue</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="7" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td width="100%">
                        <table border="0" cellspacing="0" cellpadding="3" width="100%">
                            <tr><td colspan="2"><img src="/i/clear.gif" width="6" height="1" border="0"/></td></tr>
                        
                            <tr>
                                <td width="50%" align="left" class="statTextBig" background="/i/steel_bluebv_bg.gif">Collegiate Challenge Tournaments</td>
                                <td width="50%" align="left" class="statTextBig" background="/i/steel_bluebv_bg.gif">Invitational Tournaments</td>
                            </tr>
                            
                            <tr><td colspan="2"><img src="/i/clear.gif" width="6" height="1" border="0"/></td></tr>
                        
                        <tr valign="top">
                            <td align="left" class="statText">
                                Date: April, 2003<br/>
                                Location: University Park Hotel @ MIT<br/>
                                Cambridge, MA<br/>
                                Sponsor: Sun Microsystems<br/>
                                Total Purse: $100,000<br/>
                                <a href="/index?t=tournaments&amp;c=tccc03_champ" class="statTextBig">Summary</a></td>
                                
                            <td align="left" class="statText" valign="top">
                                Date: November, 2003<br/>
                                Location: TBD<br/>
                                <!-- Sponsor: TBD<br /> -->
                                Total Purse: TBD<br/>
                                <!-- <a href="/index?t=tournaments&amp;c=invit03_champ" class="statTextBig">Summary</a> --></td>
                        </tr>                        
                        
                        <tr><td colspan="2"><img src="/i/clear.gif" width="6" height="1" border="0"/></td></tr>
                        
                        <tr valign="top">
                            <td align="left" class="statText" valign="top">
                                Date: April, 2002<br/>
                                Location: University Park Hotel @ MIT<br/>
                                Cambridge, MA<br/>
                                Sponsor: Sun Microsystems<br/>
                                Total Purse: $150,000<br/>
                                <a href="/index?t=tournaments&amp;c=2002tccc_champ" class="statTextBig">Summary</a></td>
                            
                            <td align="left" class="statText" valign="top">
                                Date: November, 2002<br/>
                                Location: Mohegan Sun Casino<br/>
                                Uncasville, CT<br/>
                                <!-- Sponsor: TBD<BR/> -->
                                Total Purse: $150,000<br/>
                                <a href="/index?t=tournaments&amp;c=invit02_champ" class="statTextBig">Summary</a></td>
                            </tr>                        
                        
                            <tr><td colspan="2"><img src="/i/clear.gif" width="6" height="1" border="0"/></td></tr>
                        
                            <tr valign="top">
                                <td align="left" class="statText" valign="top">
                                    Date: June, 2001<br/>
                                    Location: San Francisco Hilton and Towers<br/>
                                    San Francisco, CA<br/>
                                    Total Purse: $250,000<br/>
                                    <a href="/index?t=tournaments&amp;c=tourny_tccc_01" class="statTextBig">Summary</a></td>
                            
                                <td align="left" class="statText" valign="top">
                                    Date: November, 2001<br/>
                                    Location: Foxwoods Resort Casino<br/>
                                    Mashantucket, CT<br/>
                                    Total Purse: $250,000<br/>
                                    <a href="/index?t=tournaments&amp;c=tourny_tci_01" class="statTextBig">Summary</a></td>
                            </tr>
                            
                            <tr><td colspan="2"><img src="/i/clear.gif" width="6" height="1" border="0"/></td></tr>
                        
                            <tr><td colspan="2" align="left"><a href="mailto:sponsorships@topcoder.com" class="statText">Interested in sponsoring a TopCoder tournament?</a></td></tr>
                        </table>
                    
                        <p><br/></p>
                    
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
            <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>
  </xsl:template>
</xsl:stylesheet>

