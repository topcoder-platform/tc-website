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

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

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
                <xsl:with-param name="selectedList"></xsl:with-param>
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template> 

            <blockquote>
            <h2>Advancers</h2>
            
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="0" class="formFrame">
               <tr>
                  <td width = "28%" align = "right" class="advancers_header"><A class="statTextBig" href="/">Seed</A></td>
                  <td width = "28%" align = "left" class="advancers_header"><A class="statTextBig" href="/">Handle</A></td>
                  <td width = "28%" align = "right" class="advancers_header"><A class="statTextBig" href="/">Rating</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Round 1</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Round 2</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Round 3</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Round 4</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Semifinals</A></td>
                  <td width = "12%" align = "center" class="advancers_header"><A class="statTextBig" href="/">Finals</A></td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">2</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">John Dethridge</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">champion</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">1</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">SnapDragon</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">3</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">moira</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">4</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">dgarthur</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">somedude</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">somedude</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
               <tr>
                  <td align = "right" class="advancers_list">10</td>
                  <td align = "left" class="advancers_list"><A class="coderTextRed">andSoOn</A></td>
                  <td align = "right" class="advancers_list">3359</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong">advanced</td>
                  <td class="advancers_strong"><font color="#FF0000">eliminated</font></td>
                  <td class="advancers_strong">&#160;</td>
                  <td class="advancers_strong">&#160;</td>
               </tr>
            </table>
            <br/><br/>
            

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

