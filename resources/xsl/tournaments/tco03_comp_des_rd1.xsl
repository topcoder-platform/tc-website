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
                <xsl:with-param name="selectedContest">component</xsl:with-param>
                <xsl:with-param name="selectedTab">advancers</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="tco03_sublinks">
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template>

            <blockquote>
            <h2>Advancers</h2>
            <div align="right" class="bodyText">Design&#160;&#160;|&#160;&#160;<A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_dev_rd1">Development</A></div>
            <br/>
            
<!-- Design Winners Begins -->
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Advancers</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Seed</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1(T)</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
                    <td class="formHandleOdd" align="right">bye</td>
                    <td class="formHandleOdd" align="right"><a class="StatText" href="http://www.topcoder.com/?&amp;t=development&amp;c=bonus_contest_0303">Contest 1</a></td>
                    <td class="formHandleOdd" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">1(T)</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268546">TangentZ</a></td>
                    <td class="formHandleEven" align="right">bye</td>
                    <td class="formHandleEven" align="right"><a class="StatText" href="http://www.topcoder.com/?t=development&amp;c=des_bonus_contest_2">Contest 2</a></td>
                    <td class="formHandleEven" align="right">$0.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">91.21</td>
                    <td class="formHandleOdd" align="right">86.78, 94.64</td>
                    <td class="formHandleOdd" align="right">$315.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">4</td>
                    <td class="formHandleEven" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleEven" align="right">86.40</td>
                    <td class="formHandleEven" align="right">81.84, 90.86</td>
                    <td class="formHandleEven" align="right">$210.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">5</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">86.05</td>
                    <td class="formHandleOdd" align="right">79.54,  92.56</td>
                    <td class="formHandleOdd" align="right">$236.25</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">6</td>
                    <td class="formHandleEven" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleEven" align="right">80.08</td>
                    <td class="formHandleEven" align="right">80.03, 80.13</td>
                    <td class="formHandleEven" align="right">$158.00</td>
                </tr>

                <tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score</td></tr>

            </table>
           
           <br/><br/>
            
            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Design Wild Card Pool</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="10%" align="center">Rank</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left">Handle</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Average Score*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="30%" align="right">Round Scores</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Tournament Earnings</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formHandleOdd" align="right">90.38</td>
                    <td class="formHandleOdd" align="right">90.38</td>
                    <td class="formHandleOdd" align="right">$105.00</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven" align="left"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
                    <td class="formHandleEven" align="right">89.18</td>
                    <td class="formHandleEven" align="right">89.18</td>
                    <td class="formHandleEven" align="right">$52.50</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="left"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">StrongHold</a></td>
                    <td class="formHandleOdd" align="right">80.58</td>
                    <td class="formHandleOdd" align="right">80.58</td>
                    <td class="formHandleOdd" align="right">$105.00</td>
                </tr>

                <tr valign="middle"><td background="/i/graybv_bg.gif" class="statTextLarge" width="20%" align="left" colspan="5">*the average of the two highest scores, including at least one level II score</td></tr>

            </table>            

           <br/><br/>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Project Scores</font></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="500" align="center" class="formFrame">
                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="35%">Project Name</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15" align="center">Total<br/>Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="center">Place</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="20%">Winner(s)</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" width="15%" align="right">Board&#160;Score</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7411659" class="statText" target="_blank">Business Date Utility</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">92.56</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="formHandleEven" align="right">90.38</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleOdd" align="right">80.03</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7409563" class="statText" target="_blank">Dependency Map</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
                    <td class="formHandleEven" align="right">80.13</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7410827" class="statText" target="_blank">Image Overlay</a></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleOdd" align="right">94.64</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"></td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven" align="center">2</td>
                    <td class="formHandleEven"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
                    <td class="formHandleEven" align="right">89.18</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"></td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd" align="center">3</td>
                    <td class="formHandleOdd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
                    <td class="formHandleOdd" align="right">79.54</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7408776" class="statText" target="_blank">Load Estimator</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleEven" align="right">90.86</td>
                </tr>
                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7410707" class="statText" target="_blank">Shopping Cart</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="formHandleOdd" align="right">81.84</td>
                </tr>
                
                <tr valign="middle">
                    <td class="formHandleEven"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7408797" class="statText" target="_blank">SVG Generator</a></td>
                    <td class="formHandleEven" align="center">1</td>
                    <td class="formHandleEven" align="center"></td>
                    <td class="formHandleEven"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
                    <td class="formHandleEven" align="right">86.79</td>
                </tr>

                <tr valign="middle">
                    <td class="formHandleOdd"><a href="http://software.topcoder.com/catalog/c_component.jsp?comp=7411234" class="statText" target="_blank">Tree View Tag</a></td>
                    <td class="formHandleOdd" align="center">1</td>
                    <td class="formHandleOdd" align="center"></td>
                    <td class="formHandleOdd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7405912">Stronghold</a></td>
                    <td class="formHandleOdd" align="right">80.58</td>
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

