<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_head.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules - Eligibility</title>

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

<!-- TCO Head Begins -->
<xsl:call-template name="tco03_head"/>
<!-- TCO Head Ends -->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedContest">coding</xsl:with-param>
                <xsl:with-param name="selectedTab">coding_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">coding_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">eligibility</xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Eligibility</h2>

            <p>
            All TopCoder members who are 18 years of age or older may attempt to
            qualify for the TCO.  500 members will qualify either through
            Qualification Rounds or by receiving an automatic berth.
            </p>

            <p><span class="bodySubtitle">Qualification Rounds</span><br />
            All members who have not already qualified for the Coding Tournament can compete in
            the Qualifying Rounds.  The top 200 scorers from each of the two
            Qualification Rounds will be eligible to compete in Online Round 1.
            The Qualification Rounds will be held on Tuesday, October 7th
            and Thursday, October 9th. </p>

            <p><span class="bodySubtitle">Automatic Berths</span><br />
            The 100 highest rated TopCoder members as of October 7th who have
            participated in at least three (3) TopCoder rated events (i.e., Single
            Round Matches and previous tournaments) prior to October 7th, with at
            least one (1) of those events being between July 7th and October 7th,
            will receive an automatic berth into Online Round 1.
            </p>


            <p>All citizens and lawful permanent residents of the following countries (and all non-immigrants currently residing in
            the United States with a valid Visa) are eligible to win cash prizes after completing the appropriate affidavit and tax form:</p>

            <ul>
                <li>Australia</li>
                <li>Canada (excluding Qu&#233;b&#232;c)</li>
                <li>China</li>
                <li>India</li>
                <li>Ireland</li>
                <li>New Zealand</li>
                <li>Sweden</li>
                <li>United Kingdom</li>
                <li>United States (including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands)</li>
            </ul>

            <p>TopCoder members who do not meet the citizenship requirements to win prize money are eligible to compete,
            however will be required to donate any cash prizes to charity.  Members will choose a charity to receive their
            winnings from the TopCoder approved list of charities.  A prize-winning member may request a new charity for
            the list, however it shall remain in TopCoder's sole discretion to add that charity after reviewing the proposed
            charity's credentials.</p>

            <p>Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation
            and distribution of this tournament and their advertising or promotion agencies, parent companies, service providers,
            agents, officers, subsidiaries or affiliates, or any other persons or entities directly associated with the tournament
            and members of the immediate families and/or persons living in the same household as such persons, are ineligible
            to enter the tournament.</p>
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

