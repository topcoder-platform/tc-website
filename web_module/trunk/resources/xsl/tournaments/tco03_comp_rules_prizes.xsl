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

<title>2003 TopCoder Open - Computer Programming Tournament - Rules - Prizes</title>

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
        

<!-- TCO Header 
             <div align="center">
            <img src="/i/tournament/tco03/tco_promo_big2.gif" alt="2003 TopCoder Open" width="550" height="160" border="0" vspace="15" usemap="#tco_links" />
            <map name="tco_links">
            <area shape="rect" coords="30,100,220,155" href="/index?t=tournaments&amp;c=tco03_overview" />
            <area shape="rect" coords="355,100,545,155" href="/index?t=tournaments&amp;c=tco03_comp_overview" />            
            </map>
            </div>
-->
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
                <xsl:with-param name="selectedTab">components</xsl:with-param>
            </xsl:call-template>-->

<!-- Tab bar links-->
            <xsl:call-template name="tco03_links">
                <xsl:with-param name="selectedContest">component</xsl:with-param>
                <xsl:with-param name="selectedTab">component_rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedList">component_rules</xsl:with-param>
                <xsl:with-param name="selectedTab">prizes</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>About the Prizes</h2>
            
            <p>The tournament will award $30,000 in cash prizes.  $15,000 will be awarded for each of the design and development competitions.  
            Any and all applicable taxes on prizes, including the cost of a guest attending the onsite rounds, are the sole responsibility of the 
            prizewinner.  Prizes will be distributed as follows:</p>
            
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="50%" class="sidebarTitle">Competitor(s)</td>
                    <td width="50%" class="sidebarTitle" align="right">Prize</td>
                </tr>
                <tr>
                    <td width="50%" class="sidebarText">2<span class="super">nd</span> place finisher* in the Championship Round</td>
                    <td width="50%" class="sidebarText" align="right">$5,000</td>
                </tr>

                <tr>
                    <td width="50%" class="sidebarText">1<span class="super">st</span> place finisher* - Component Design/Development Champion</td>
                    <td width="50%" class="sidebarText" align="right">$10,000</td>
                </tr>

                <tr>
                    <td colspan="2" class="sidebarText">* Prizes will be awarded at the conclusion of the Championship Round. 
                        Winners must be present at the onsite rounds to receive prize.</td>
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

