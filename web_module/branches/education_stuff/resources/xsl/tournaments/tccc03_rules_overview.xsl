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
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>
        
            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

            
            <xsl:call-template name="tccc03rule_links"/>
    
            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="99%">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" class="statText">
                                    <br />
                                    <div align="center">
                                    <p><b>2003 TopCoder Collegiate Challenge<br/>
                                    Official Rules and Regulations</b></p>
                                    <p>No purchase necessary to enter or win.</p>
                                    </div>
                                    
                                    <p><strong>Overview of the Tournament</strong><br />
                                    The 2003 TopCoder Collegiate Challenge tournament will take place between February 18, 2003 and April 5, 2003.  It will consist of four 
                                    (4) online Regional rounds and two (2) onsite rounds.  The top 16 finishers from the Regional rounds, including the Regional Champion from each of the 
                                    five (5) regions, will advance to the onsite Semifinal and  Championship rounds, being held at the University Park Hotel @ MIT in Cambridge, MA from 
                                    April 4-5, 2003.</p>
                        
                                    <p><strong>Eligibility</strong><br />
                                    The tournament is open to the members who meet the following criteria:</p>
                                    <ul>
                                        <li>Are at least 18 years of age (as of February 18th, 2003);</li>
                                        <li>Are matriculated full time at an accredited college or university;</li>
                                        <li>Have participated in at least two (2) TopCoder rated events (i.e. Single Round Matches and previous tournaments) prior to February 15, 2003, with 
                                        at least one (1) of those events being since August 1, 2002.</li>
                                    </ul>

                                    <p>Those who compete in the tournament and meet the following criteria will be eligible to receive prize money after completing an affidavit and a tax form:</p>
                        
                                    <ul>                    
                                        <li>All citizens and lawful permanent residents of:</li>
                                        <ul>
                                            <li>Australia</li>
                                            <li>Canada, excluding Quebec</li>
                                            <li>China</li>
                                            <li>India</li>
                                            <li>Ireland</li>
                                            <li>New Zealand</li>
                                            <li>the United Kingdom</li>
                                            <li>the United States (including the US territories of Guam, Puerto Rico and the US Virgin Islands)</li>                              
                                        </ul>
                                        <li>All non-immigrants currently residing in the US with a valid Visa</li>
                                    </ul>
                    
                                    <p>Those who do not meet the criteria for prize money will have their winnings donated to a charity.  
                                    TopCoder maintains a list of approved <a href="http://www.topcoder.com/?&amp;t=support&amp;c=charities" class="statText">charities</a>.  
                                    The member will be allowed to choose from this list of charities.  A prize-winning member may request 
                                    a new charity for the list.  It will be TopCoder's sole discretion to add that charity after reviewing credentials.</p>
                         
                                    <p><strong>Invitations and Registration</strong><br />
                                    The top 1,000 rated TopCoder members as of February 14, 2003 who meet the eligibility criteria defined above will be invited via email to 
                                    compete in the tournament.  Invitations will be emailed no later than 6:00PM Eastern Time on February 15th.</p>

                                    <p>Employees of TopCoder, Inc. and those involved in the development, production (including prize suppliers), implementation and distribution 
                                    of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, 
                                    or any other persons or entities directly associated with the tournament and members of the immediate families and/or persons living in the 
                                    same household as such persons, are ineligible to enter the tournament.</p>
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

