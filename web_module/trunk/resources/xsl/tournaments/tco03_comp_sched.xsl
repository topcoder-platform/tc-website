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

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Schedule</title>

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
                <xsl:with-param name="selectedTab">component_schedule</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Schedule</h2>

<!-- Qualification Rounds begins -->
           <p><span class="bodySubtitle">Online Elimination Rounds</span></p>
            <p>All eligible TopCoder members may compete in Online Round 1 of the Component Tournament. For design, the top eight scorers from Round 1
            will advance.  The top eight scorers from Round 1 along with the winners of the previous quarterly component design contests
            will compete in Online Round 2.  For development, the top ten scorers from Round 1 will compete in Online Round 2.
            The top two scorers from Round 2 will compete in the Championship Round at Mohegan Sun on December 5th.</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="25%" align="center">Development</td>
                    <td class="sidebarTitle" width="25%" align="center">Design</td>
                </tr>
                <tr><td colspan="3" align="center" class="sidebarText">ALL TIMES ARE EASTERN TIME</td></tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round 1</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        09.02.03 12:00am
                     </td>
                     <td class="sidebarText">
                        09.04.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        09.15.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        09.17.03 11:59pm
                     </td>
                </tr>
                 <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        10.02.03
                        </td>
                     <td class="sidebarText">
                        10.02.03
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round 2</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        10.07.03 12:00am
                     </td>
                     <td class="sidebarText">
                        10.09.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        10.20.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        10.22.03 11:59pm
                     </td>
                </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        11.06.03
                        </td>
                     <td class="sidebarText">
                        11.06.03
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Onsite Championship Round 3</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        11.06.03 12:00am
                     </td>
                     <td class="sidebarText">
                        11.06.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        11.17.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        11.17.03 11:59pm
                     </td>
                </tr>
                  <tr>
                     <td class="sidebarText">
                        Submissions posted
                        </td>
                     <td class="sidebarText">
                        11.25.03 6:00pm
                        </td>
                     <td class="sidebarText">
                        11.25.03 6:00pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Scorecards posted*
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am
                        </td>
                     <td class="sidebarText">
                        11.25.03 8:00am
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final fixes*
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am - 12:00pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am - 12:00pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final reviews*
                        </td>
                     <td class="sidebarText">
                        12.05.03 12:15pm - 3:30pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 12.15pm - 3:30pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced*
                        </td>
                     <td class="sidebarText">
                        12.05.03 4:20pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 4:20pm
                        </td>
                   </tr>
                <tr><td colspan="3" class="sidebarText">*These times are subject to change</td></tr>



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

