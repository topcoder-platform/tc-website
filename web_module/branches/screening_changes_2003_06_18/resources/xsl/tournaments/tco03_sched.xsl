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

<title>2003 TopCoder Open - Computer Programming Tournament - Schedule</title>

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
                <xsl:with-param name="selectedTab">schedule</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Schedule</h2>
            
<!-- Qualification Rounds begins -->
            <p><span class="bodySubtitle">Qualification Rounds</span></p>

            <p><strong>Automatic Berths</strong> - The 100 highest rated TopCoder members as of October 7th will receive an automatic berth into 
            <A href="#online">Online Round #1.</A> The 100 highest rated members must have competed in at least three TopCoder rated events (i.e., 
            Single Round Matches and/or previous tournaments) prior to October 7th.</p>

            <p><strong>Qualification Spots</strong> - All members can compete for one of 400 qualification spots in the tournament.  Two Qualification 
            Rounds will be held, and the top 200 scorers from each Qualification Round will win a spot in Online Round #1 of the TCO.</p>

            <table width="100%" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round #1</td>
                    <td class="sidebarText">
                        Tuesday, October 7<br />
                        Registration:  7:00 PM - 9:55 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">All members</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Qualification Round #2</td>
                    <td class="sidebarText">
                        Thursday, October 9<br />
                        Registration:  7:00 PM - 9:55 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">All members</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate" 
                        will be the following day at the same time.
                    </td>
                </tr>
            </table><br />
<!-- Qualification Rounds ends -->

<!-- Online Elimination Rounds begins -->
            <A name="online"></A><p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            A total of 500 TopCoder members will compete in Online Round #1 of the TCO.  The field will be comprised of 100 automatic 
            berths and 400 qualification spots. Each room winner and the next highest scorers in each round will advance.</p>
            
            <table width="100%" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #1</td>
                    <td class="sidebarText">
                        Wednesday, October 15th<br />
                        Login by:  9:50 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">500</td>
                    <td class="sidebarText" align="center">200</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #2</td>
                    <td class="sidebarText">
                        Wednesday, October 22nd<br />
                        Login by:  9:50 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">200</td>
                    <td class="sidebarText" align="center">100</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #3</td>
                    <td class="sidebarText">
                        Wednesday, October 29th<br />
                        Login by:  9:50 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">100</td>
                    <td class="sidebarText" align="center">50</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #4</td>
                    <td class="sidebarText">
                        Wednesday, November 5th<br />
                        Login by:  9:50 PM<br />
                        Compete: 10:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">50</td>
                    <td class="sidebarText" align="center">16</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate" 
                        will be the following day at the same time.
                    </td>
                </tr>
            </table>
<!-- Online Elimination Rounds ends -->

<!-- Onsite Semifinal and Championship Rounds begins -->
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br />
            The 16 advancers from Online Round #4 will travel to Mohegan Sun on Wednesday, December 3rd to compete in the Semifinal round 
            of the tournament being held on Thursday, December 4th.</p>
            
            <table width="100%" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 10:00 AM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 1:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 4:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #4</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 7:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" bgcolor="#FFCC33"><strong>Championship Round</strong></td>
                    <td class="bodyText" bgcolor="#FFCC33">
                        <strong>Friday, December 5th<br />
                        Compete: 1:00 PM<br /></strong>
                    </td>
                    <td class="bodyText" bgcolor="#FFCC33" align="center"><strong>4</strong></td>
                    <td class="bodyText" bgcolor="#FFCC33" align="center"><strong>1</strong></td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. The times of the onsite rounds are subject to change.
                    </td>
                </tr>
            </table><br />

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

