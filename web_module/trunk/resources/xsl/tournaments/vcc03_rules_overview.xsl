<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/vcc03_links.xsl"/>
  <xsl:import href="../includes/modules/vcc03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 Verizon Coding Challenge - Computer Programming Tournament - Rules - Overview</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins
<xsl:call-template name="Top"/>
Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
         <td>
         <p><img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <a href="/" ><img src="/i/tournament/vcc03/vcc03_left.gif" width="180" height="74" border="0"/></a><br />
         <img src="/i/clear.gif" width="180" height="60" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
<!-- TCO Header -->
   <p><br /></p>
   <div align="center"><img src="/i/tournament/vcc03/vcc03.gif" alt="Verizon Coding Challenge" width="500" height="120" border="0" vspace="0" /></div>
   <p><br /></p>

<!-- Tab bar links-->
            <xsl:call-template name="vcc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="vcc03_sublinks">
                <xsl:with-param name="selectedList">rules</xsl:with-param>
                <xsl:with-param name="selectedTab">overview</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Official Rules and Regulations</h2>
            
            <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

            <p>The 2003 Verizon Coding Challenge is being offered by Verizon Communications ("Verizon") and TopCoder, Inc. ("TopCoder").  Verizon is 
            using the results of the Coding Challenge to identify possible employees for their Chennai VDSI center.  The Coding Challenge will take place between 
            Monday, August 4 and Friday, August 29, 2003.  It begins with a 2-week online registration, after which up to 500 eligible individuals will be 
            invited to compete in the programming tournament.  The tournament consists of two (2) online elimination rounds and one (1) onsite final round.  
            All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, Verizon will award US$1,900 in cash prizes 
            to the top 4 finalists in the tournament.</p>
            </blockquote>

            <p><br/></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="FootVCC"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

