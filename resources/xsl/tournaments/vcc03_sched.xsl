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

<title>Verizon Coding Challenge - Computer Programming Tournament - Schedule</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>
<!-- Top Begins 
<xsl:call-template name="Top"/>
Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/>
        </td>
<!-- Gutter Ends -->
    

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
                <xsl:with-param name="selectedTab">schedule</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="vcc03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Schedule</h2>
            
<!-- Qualification Description begins -->
            <p><strong>Qualification Spots</strong> - Verizon will choose all qualifying members for the 500 available spots.  These 
            members will then compete in Online Elimination Round 1</p>
<!-- Qualification Description Ends -->

<!-- Online Elimination Rounds begins -->
            <A name="online"></A><p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            A total of 500 TopCoder members will compete in Online Round #1 of the VCC.  Each room winner and the next highest 
            scorers in each round will advance.</p>
            
            <a name="sched"></a>
            <table width="450" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time - Chennai Time</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Round #1</td>
                    <td class="sidebarText">
                        Wednesday, August 20th<br />
                        Sign In: 6:00 PM - 8:55 PM<br />
                        START: 9:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">250</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Round #2</td>
                    <td class="sidebarText">
                        Monday, August 25th<br />
                        START: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">250</td>
                    <td class="sidebarText" align="center">25</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Round #3 - Championship Round</td>
                    <td class="sidebarText">
                        Friday, August 29th<br />
                        START: 9:30 PM<br />
                    </td>
                    <td class="sidebarText" align="center">25</td>
                    <td class="sidebarText" align="center">4 Prize  Winners</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: In the event a Round must be cancelled for any reason, the "raindate" will be the following day at the same time.
                    </td>
                </tr>
            </table>
            

<!-- Online Elimination Rounds ends -->

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

