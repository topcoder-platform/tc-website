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

<title>2003 TopCoder Open sponsored by Intel&#174; sponsored by Intel&#174;</title>

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

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td class="bodyText">
<br/>
<h2>radeye's Odds</h2>

<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
   <td class="sidebarTitle" align="left" colspan="3"></td>
   <td class="sidebarTitle" align="right"></td>
   <td class="sidebarTitle" align="center" colspan="5">Probability of advancing to:</td>
   <td class="sidebarTitle" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td class="sidebarTitle" align="left">Handle</td>
   <td class="sidebarTitle" align="right">Rating</td>
   <td class="sidebarTitle" align="right">Volatility</td>
   <td class="sidebarTitle" align="right">Earnings</td>
   <td class="sidebarTitle" align="right">Online 2</td>
   <td class="sidebarTitle" align="right">Online 3</td>
   <td class="sidebarTitle" align="right">Online 4</td>
   <td class="sidebarTitle" align="right">Semifinals</td>
   <td class="sidebarTitle" align="right">Finals</td>
   <td class="sidebarTitle" align="right">4th</td>
   <td class="sidebarTitle" align="right">3rd</td>
   <td class="sidebarTitle" align="right">2nd</td>
   <td class="sidebarTitle" align="right">Champ</td>
</tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
<tr><td class="formHandleEven" style="color:red">John_Dethridge</td><td class="formHandleEven" align="right">3337</td><td class="formHandleEven" align="right">269</td><td class="formHandleEven" align="right">$30,210.23</td><td class="formHandleEven" align="right">99.99</td><td class="formHandleEven" align="right">99.96</td><td class="formHandleEven" align="right">60.77</td><td class="formHandleEven" align="right">87.77</td><td class="formHandleEven" align="right">1.920</td><td class="formHandleEven" align="right">9.506</td><td class="formHandleEven" align="right">25.92</td><td class="formHandleEven" align="right">50.42</td><td class="formHandleEven" align="right">50.42</td></tr>
<tr><td class="formHandleOdd" style="color:red">John_Dethridge</td><td class="formHandleOdd" align="right">3337</td><td class="formHandleOdd" align="right">269</td><td class="formHandleOdd" align="right">$30,210.23</td><td class="formHandleOdd" align="right">99.99</td><td class="formHandleOdd" align="right">99.96</td><td class="formHandleOdd" align="right">60.77</td><td class="formHandleOdd" align="right">87.77</td><td class="formHandleOdd" align="right">1.920</td><td class="formHandleOdd" align="right">9.506</td><td class="formHandleOdd" align="right">25.92</td><td class="formHandleOdd" align="right">50.42</td><td class="formHandleOdd" align="right">50.42</td></tr>
</table>

</td>
</tr>
</table>
</body>

</html>

    </xsl:template>
</xsl:stylesheet>

