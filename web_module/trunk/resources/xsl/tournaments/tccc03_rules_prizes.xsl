<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03rule_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Tournaments</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelblue</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>
        
            <xsl:call-template name="tccc03_links"/>
            
            <xsl:call-template name="tccc03rule_links"/>
    
            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" class="statText">
                                    <p>Prizes will be awarded to a total of 200 competitors.  Prize money will be distributed as follows:<br /><br /></p>
                                </td>
                            </tr>
                        </table>

                        <div align="center">
                        <table width="100%" border="0" cellpadding="6" cellspacing="1">
                            <tr>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Competitor(s)</td>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Prize Money</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">200 advancers from Regional Quarterfinal Round who compete in Regional Semifinal Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$50 each</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">50 advancers from Regional Semifinal Round who compete in Regional Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$50 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">5 Regional Champions</td>
                            <td valign="top" bgcolor="#666666" class="statText">$600 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">12 competitors who compete in the Semifinal Round who do not advance to the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$1,000 each</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">4th place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$2,500</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">3rd place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$5,000</td>
                        </tr>                                                                                                
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">2nd place finisher in the Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">$15,000</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText"><b>1st place finisher - Tournament Champion</b></td>
                            <td valign="top" bgcolor="#666666" class="statText"><b>$50,000</b></td>
                            </tr>                                                                                                        
                        </table>
                        </div>
                        
                        <table border="0" cellspacing="0" cellpadding="0" width="100%">
                            <tr>
                                <td class="statText"><br />
                                    ** All prizes will be awarded at the conclusion of the final onsite round of competition. Any and all 
                                    applicable taxes on prizes including bringing a guest to the onsite rounds are the sole 
                                    responsibility of the prizewinner.
                                </td>
                            </tr>
                        </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

        <xsl:call-template name="public_right_col"/>       

        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

