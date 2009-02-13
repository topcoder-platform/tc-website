<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>2003 TopCoder Open sponsored by Intel&#174; sponsored by Intel&#174; - Qualification Round 1 Summary</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td class="bodyText" width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td class="bodyText" width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%" nowrap="nowrap"><font size="3">TCO - Qualification Round 1 Summary</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, October 7, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<table cellpadding="4" cellspacing="2" align="center" border="0" width="100%">
<tr>
   <td class="advancers_header_nopadding" align="left">Handle</td>
   <td class="advancers_header_nopadding" align="right">Rating</td>
   <td class="advancers_header_nopadding" align="right">Volatility</td>
   <td class="advancers_header_nopadding" align="right">Online 2</td>
   <td class="advancers_header_nopadding" align="right">Online 3</td>
   <td class="advancers_header_nopadding" align="right">Online 4</td>
   <td class="advancers_header_nopadding" align="right">Semifinals</td>
   <td class="advancers_header_nopadding" align="right">Finals</td>
   <td class="advancers_header_nopadding" align="right">4th</td>
   <td class="advancers_header_nopadding" align="right">3rd</td>
   <td class="advancers_header_nopadding" align="right">2nd</td>
   <td class="advancers_header_nopadding" align="right">Champ</td>
   <td class="advancers_header_nopadding" align="right">Earnings</td>
</tr>
<tr>
   <td class="advancers_list" style="color:red">John_Dethridge</td>
   <td class="advancers_list" align="right">3337</td>
   <td class="advancers_list" align="right">269</td>
   <td class="advancers_list" align="right">99.99</td>
   <td class="advancers_list" align="right">99.96</td>
   <td class="advancers_list" align="right">60.77</td>
   <td class="advancers_list" align="right">87.77</td>
   <td class="advancers_list" align="right">1.920</td>
   <td class="advancers_list" align="right">9.506</td>
   <td class="advancers_list" align="right">25.92</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">$30,210.23</td>
</tr>
<tr>
   <td class="advancers_list" style="color:red">John_Dethridge</td>
   <td class="advancers_list" align="right">3337</td>
   <td class="advancers_list" align="right">269</td>
   <td class="advancers_list" align="right">99.99</td>
   <td class="advancers_list" align="right">99.96</td>
   <td class="advancers_list" align="right">60.77</td>
   <td class="advancers_list" align="right">87.77</td>
   <td class="advancers_list" align="right">1.920</td>
   <td class="advancers_list" align="right">9.506</td>
   <td class="advancers_list" align="right">25.92</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">$30,210.23</td>
</tr>
<tr>
   <td class="advancers_list" style="color:red">John_Dethridge</td>
   <td class="advancers_list" align="right">3337</td>
   <td class="advancers_list" align="right">269</td>
   <td class="advancers_list" align="right">99.99</td>
   <td class="advancers_list" align="right">99.96</td>
   <td class="advancers_list" align="right">60.77</td>
   <td class="advancers_list" align="right">87.77</td>
   <td class="advancers_list" align="right">1.920</td>
   <td class="advancers_list" align="right">9.506</td>
   <td class="advancers_list" align="right">25.92</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">$30,210.23</td>
</tr>
<tr>
   <td class="advancers_list" style="color:red">John_Dethridge</td>
   <td class="advancers_list" align="right">3337</td>
   <td class="advancers_list" align="right">269</td>
   <td class="advancers_list" align="right">99.99</td>
   <td class="advancers_list" align="right">99.96</td>
   <td class="advancers_list" align="right">60.77</td>
   <td class="advancers_list" align="right">87.77</td>
   <td class="advancers_list" align="right">1.920</td>
   <td class="advancers_list" align="right">9.506</td>
   <td class="advancers_list" align="right">25.92</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">50.42</td>
   <td class="advancers_list" align="right">$30,210.23</td>
</tr>
</table>

                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td class="bodyText" width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td class="bodyText" width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td class="bodyText" width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>

