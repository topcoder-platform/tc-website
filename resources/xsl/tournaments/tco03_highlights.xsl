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
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
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
            
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="formFrame">
               <tr>
                  <td width = "40%" align = "left" class="advancers_header">Round</td>
                  <td width = "20%" align = "right" class="advancers_header">Advancers</td>
                  <td width = "20%" align = "right" class="advancers_header">Room Winners</td>
                  <td width = "20%" align = "right" class="advancers_header">Wildcards</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/index?t=tournaments&amp;c=tco03_top100" class="topLink">Top 100</a></td>
                  <td align = "right" class="advancers_faded"><a href="/index?t=tournaments&amp;c=tco03_top100">100</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4700" class="topLink">Qualification Round 1</a></td>
                  <td align = "right" class="advancers_faded"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4700">200</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4701" class="topLink">Qualification Round 2</a></td>
                  <td align = "right" class="advancers_faded"><a href="/?&amp;t=tournaments&amp;c=tco03_advancers&amp;rd=4701">200</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
               </tr>
            </table>
            <br/><br/>
            <table width="500" align="center" border="0" cellpadding="2" cellspacing="2" class="formFrame">
               <tr>
                  <td width = "40%" align = "left" class="advancers_header">Round</td>
                  <td width = "15%" align = "right" class="advancers_header">Advancers</td>
                  <td width = "15%" align = "right" class="advancers_header">Room Winners</td>
                  <td width = "15%" align = "right" class="advancers_header">Wildcards</td>
                  <td width = "15%" align = "right" class="advancers_header">radeye's Odds</td>
               </tr>
               <tr>
                  <td align = "left" class="advancers_roundid"><a href="/index?t=tournaments&amp;c=tco03_top100" class="topLink">Online Round 1</a></td>
                  <td align = "right" class="advancers_faded"><a href="/index?t=tournaments&amp;c=tco03_top100">200</a></td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded">n/a</td>
                  <td align = "right" class="advancers_faded"><A href="Javascript:openWin('/index?t=tournaments&amp;c=tco03_radeye','comp',600,400);">view</A></td>
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

