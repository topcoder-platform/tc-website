<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 TopCoder Open - Computer Programming Tournament - Overview</title>

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
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1"></xsl:with-param>
                <xsl:with-param name="image">tournaments_white</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Open</xsl:with-param>
            </xsl:call-template>
        
<!-- TCO Header -->
            <div align="center"><img src="/i/tournament/tco03/header_tco_main.gif" alt="2003 TopCoder Open" width="494" height="119" border="0" vspace="15" /></div>

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>
    
            <h2>Official Rules and Regulations</h2>
            
            <blockquote>
            <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

            <ul>
                <li><strong>Dates: </strong><br />
                    October 7th through December 5th, 2003</li>
                <li><strong>Rounds: </strong><br />
                    Two (2) qualification rounds - online<br />
                    Four (4) elimination rounds - online<br />
                    Two (2) final rounds - the Semifinal and Championship rounds will be held at the Mohegan Sun Casino and Resort in Uncasville, CT on December 4th and 5th</li>
                <li><strong>Prizes: </strong><br />
                    Total Prize Purse: $100,000 in cash<br />
                    Up to 500 competitors will receive a prize just for competing in Online Round #1<br />
                    Up to 200 eligible competitors will receive cash prizes</li>
                <li><strong>Finalists: </strong><br />
                    The top 16 finishers in the online rounds will advance to the onsite Semifinal and Championship rounds</li>
            </ul>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
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

