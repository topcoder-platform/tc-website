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
                <xsl:with-param name="selectedList"></xsl:with-param>
                <xsl:with-param name="selectedTab"></xsl:with-param>
            </xsl:call-template> 

            <blockquote>
            <h2>Advancers</h2>
            
            <table width="500" align="center" border="0" cellpadding="5" cellspacing="0" class="formFrame">
               <tr>
                  <td width = "28%" align = "right" class="advancers_header">
                      <a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=seed&amp;sdir=asc">Seed</a>
                  </td>
                  <td width = "28%" align = "left" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=handle&amp;sdir=asc">Handle</a></td>
                  <td width = "28%" align = "right" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=rating&amp;sdir=asc">Rating</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=round1&amp;sdir=asc">Round 1</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=round2&amp;sdir=asc">Round 2</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=round3&amp;sdir=asc">Round 3</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=round4&amp;sdir=asc">Round 4</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=semi&amp;sdir=asc">Semi</a></td>
                  <td width = "12%" align = "center" class="advancers_header"><a class="statTextBig" href="/?&amp;t=tournaments&amp;c=tco03_bracket&amp;sc=final&amp;sdir=asc">Final</a></td>
               </tr>
               <xsl:for-each select="/TC/TOURNAMENTS/Competitors/Competitor">
                   <tr>
                      <td align = "right" class="advancers_list"><xsl:value-of select="seed"/></td>
                      <td align = "left" class="advancers_list">
                           <a>
                                    <xsl:attribute name="HREF">/stat?c=member_profile&amp;cr=<xsl:value-of select="user_id"/></xsl:attribute>
                                    <xsl:attribute name="CLASS">
                                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                                      </xsl:attribute>
                                      <xsl:value-of select="handle"/>
                                  </a>
                      </td>
                      <td align = "right" class="advancers_list"><xsl:value-of select="rating"/></td>
                      <td class="advancers_strong"><xsl:value-of select="round1"/></td>
                      <td class="advancers_strong"><xsl:value-of select="round2"/></td>
                      <td class="advancers_strong"><xsl:value-of select="round3"/></td>
                      <td class="advancers_strong"><xsl:value-of select="round4"/></td>
                      <td class="advancers_strong"><xsl:value-of select="semi"/></td>
                      <td class="advancers_strong"><xsl:value-of select="final"/></td>
                   </tr>
                </xsl:for-each>

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

