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

<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Overview</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body onLoad="timer(1);">

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
                <xsl:with-param name="selectedTab">coding_advancers</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Advancers</h2>
            
            <p>The following TopCoder members have received byes in the qualification round of the 2003 TopCoder Open:</p>
            
            <table width="300" align="center" border="0" cellpadding="6" cellspacing="0" class="formFrame">
                <tr>
                    <td class="header" width="50%">Handle</td>
                    <td class="header" width="50%" align="right">Rating</td>
                </tr>
                <tr>
                    <td class="formHandleOdd" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">SnapDragon</A></td>
                    <td class="formHandleOdd" width="50%" align="right">3329&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleEven" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">tomek</A></td>
                    <td class="formHandleEven" width="50%" align="right">3148&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleOdd" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">NGBronson</A></td>
                    <td class="formHandleOdd" width="50%" align="right">3117&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleEven" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">John Dethridge</A></td>
                    <td class="formHandleEven" width="50%" align="right">3089&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleOdd" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">ZorbaTHut</A></td>
                    <td class="formHandleOdd" width="50%" align="right">2947&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleEven" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">Yarin</A></td>
                    <td class="formHandleEven" width="50%" align="right">2903&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleOdd" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">dgarthur</A></td>
                    <td class="formHandleOdd" width="50%" align="right">2861&#160; &#160; </td>
                </tr>
                <tr>
                    <td class="formHandleEven" width="50%"><A class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">dgarthur</A></td>
                    <td class="formHandleEven" width="50%" align="right">2861&#160; &#160; </td>
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
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
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

