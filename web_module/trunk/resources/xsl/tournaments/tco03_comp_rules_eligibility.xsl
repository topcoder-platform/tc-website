<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tco03_suplinks.xsl"/>
  <xsl:import href="../includes/modules/tco03_links.xsl"/>
  <xsl:import href="../includes/modules/tco03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 TopCoder Open - Computer Programming Tournament - Rules - Eligibility</title>

<xsl:call-template name="CSS"/>      
<xsl:call-template name="TCOCSS"/>      

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
            <div align="center">
                <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
                <img src="/i/promos/tco03/tco_home_comp_start_a.gif" alt="Component Competition starts Sept 2" width="540" height="165" border="0"/><br/>
                <A href="/index?t=development&amp;c=comp_projects" target="_top"><img src="/i/promos/tco03/tco_home_comp_start_b.gif" alt="Start submitting projects today" width="185" height="21" border="0" /></A><br/>
                <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br />
            </div>

            <table border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                    <td width="50%" align="center"><img src="/i/tournament/tco03/coding_start.gif" alt="Coding Start" width="219" height="15" border="0" vspace="5"/></td>
                    <td width="50%" align="center"><img src="/i/tournament/tco03/component_start.gif" alt="Component Start" width="222" height="15" border="0" vspace="5"/></td>
                </tr>
                <tr>
                    <td width="50%" align="center"><a href="/index?t=tournaments&amp;c=tco03_overview"><img src="/i/tournament/tco03/coding_tab_off.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0"/></a></td>
                    <td width="50%" align="center"><a href="/index?t=tournaments&amp;c=tco03_comp_overview"><img src="/i/tournament/tco03/component_tab_on.gif" alt="Component tab" width="239" height="54" border="0" vspace="0"/></a></td>
                </tr>
                <tr><td align="center" colspan="2">
                <img src="/i/tournament/tco03/bracket_left.gif" alt="bracket" width="25" height="19" border="0" vspace="0"/>
                <img src="/i/tournament/tco03/bracket_middle.gif" alt="bracket" width="240" height="19" border="0" vspace="0"/>
                <img src="/i/tournament/tco03/bracket_right.gif" alt="bracket" width="25" height="19" border="0" vspace="0"/></td></tr>
            </table>

<!-- Tab bar suplinks
            <xsl:call-template name="tco03_suplinks">
                <xsl:with-param name="selectedTab">component</xsl:with-param>
            </xsl:call-template>-->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedContest">component</xsl:with-param>
                <xsl:with-param name="selectedTab">component_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">component_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">eligibility</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Eligibility</h2>

            <p>
           All rated TopCoder members who are 18 years of age or older (as of September 2nd) and who have not been permanently suspended 
           from participating in TopCoder Component Development projects are eligible to compete in the Component Tournament.
            </p>
            
            <p>
            Those members who are eligible to compete in both the Coding Tournament of the 2003 TopCoder Open and in the Component Tournament will be 
            permitted to participate in both.  In addition, members will be allowed to compete in both the design and development elements 
            of the Component Tournament.  However, if one member participates in Online Round #1 of both the design and development contest AND qualifies 
            as one of the advancers in each, then the member will only be permitted to advance in one of the contests (either design or development).  The following criteria 
            will be used to determine which contest the member will advance to:
            </p>
            <ul>
            <li>The member will advance to subsequent rounds of the contest according to their seed</li>
            <li>If the member's seed is the same in each competition, then the member will advance to the contest in which he/she achieved a higher average score</li>
            <li>If the member's average score is the same in both contests, then the member will advance to the contest in which he/she achieved a higher score for his/her level 2 component</li>
            <li>If the member's level 2 component score is the same for both contests, then TopCoder will assign the member to one of the contests</li>
            </ul>
            
            <p>
            Employees of TopCoder, Inc. and those involved in the production (including prize suppliers), implementation and distribution 
            of this tournament and their advertising or promotion agencies, parent companies, service providers, agents, officers, subsidiaries 
            or affiliates, or any other persons or entities directly associated with the tournament and members of the immediate families and/or 
            persons living in the same household as such persons, are ineligible to enter the tournament.
            </p>
            
            <p><span class="bodySubtitle">About the component tournament schedule</span><br />
           Each contestant in an online round must submit his or her design and/or development submissions for components as scheduled (Click 
           <a href="/?&amp;t=tournaments&amp;c=tco03_comp_sched#sched">here</a> for competition dates and times.).  If a coder does not participate, 
           for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in that round of competition.</p>
            
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

