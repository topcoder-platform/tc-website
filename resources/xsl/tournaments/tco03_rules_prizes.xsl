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

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Rules - Prizes</title>

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
                <xsl:with-param name="selectedTab">prizes</xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>About the Prizes</h2>

            <p>The tournament will award prizes to all competitors in Online Round #1 and $100,000 in cash prizes. Up to 500 competitors will
            receive a prize for competing in Online Round #1, and up to 200 eligible competitors will receive cash prizes.
            Any and all applicable taxes on prizes, including the cost of a guest attending the onsite rounds, are the sole
            responsibility of the prizewinner. Prizes will be distributed as follows:</p>

            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">500 competitors who compete in Online Round #1</td>
                    <td width="50%" class="sidebarText" align="right">Limited edition 2003 TopCoder Open sponsored by Intel&#174;  t-shirt</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">200 competitors who advance to and compete in Online Round #2</td>
                    <td width="50%" class="sidebarText" align="right">$25 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">100 competitors who advance to and compete in Online Round #3</td>
                    <td width="50%" class="sidebarText" align="right">$50 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">50 competitors who advance to and compete in Online Round #4</td>
                    <td width="50%" class="sidebarText" align="right">$100 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">12 Semifinalists* who compete in one of four Semifinal rounds but do not advance to the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$1,000 each</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">4<span class="super">th</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$3,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">3<span class="super">rd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$5,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">2<span class="super">nd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$15,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">1<span class="super">st</span> place finisher* - Tournament Champion</td>
                    <td width="50%" class="sidebarText" align="right">$50,000</td>
                </tr>

                <tr>
                    <td colspan="2" class="sidebarText">* Prize will be awarded at the conclusion of the Championship Round.
                        Winner must be present at the onsite rounds to receive prize.</td>
                </tr>
            </table>
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

