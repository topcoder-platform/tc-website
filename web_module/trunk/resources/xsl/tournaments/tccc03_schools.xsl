<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>
<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Tournaments</title>

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
        <td width="170" bgcolor="#CCCCCC">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">schools</xsl:with-param>
            </xsl:call-template>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="0" cellspacing="1">
                            <tr><td colspan="4" class="statText"><strong>Schools Represented</strong><br /><br /></td></tr>

                        <tr>
                            <td width="25%" align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tourny_regions_ne" class="statTextBig"></a>Northeast</td>
                            <td width="25%" align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tourny_regions_se" class="statTextBig"></a>Southeast</td>
                            <td width="25%" align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tourny_regions_w" class="statTextBig"></a>West</td>
                            <td width="25%" align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tourny_regions_mw" class="statTextBig"></a>Midwest</td>
                        </tr>

                        <tr>
                            <td width="25%" align="left" valign="top" class="statText">
                            MIT&#160;&#40;210&#41;<br/>
                            VA Tech&#160;&#40;140&#41;<br/>
                            Carnegie Mellon&#160;&#40;139&#41;<br/>
                            Binghamton&#160;&#40;133&#41;<br/>
                            RIT&#160;&#40;116&#41;<br/>
                            </td>
                            <td width="25%" align="left" valign="top" class="statText">
                            GA Tech.&#160;&#40;188&#41;<br/>
                            NC State U.&#160;&#40;88&#41;<br/>
                            Florida&#160;&#40;73&#41;<br/>
                            Clemson U.&#160;&#40;69&#41;<br/>
                            U. Central FL&#160;&#40;65&#41;<br/>
                            </td>
                            <td width="25%" align="left" valign="top" class="statText">
                            Texas&#160;&#40;176&#41;<br/>
                            Stanford&#160;&#40;125&#41;<br/>
                            UCLA&#160;&#40;112&#41;<br/>
                            Berkeley&#160;&#40;103&#41;<br/>
                            UC Irvine&#160;&#40;70&#41;<br/>
                            </td>
                            <td width="25%" align="left" valign="top" class="statText">
                            U.&#160;Mich.&#160;Ann&#160;Arbor&#160;&#40;215&#41;<br/>
                            Purdue&#160;&#40;104&#41;<br/>
                            U. IL Urb.-Champ.&#160;&#40;91&#41;<br/>
                            Wisconsin&#160;&#40;67&#41;<br/>
                            Iowa State U.&#160;&#40;66&#41;<br/>
                            </td>
                        </tr>

                            <tr><td colspan="4"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td colspan="4" align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tourny_regions_ne" class="statTextBig"></a>International</td></tr>

                            <tr valign="top">
                                <td colspan="2" class="statText">
                                    Australia<br/>
                                    Canada, excluding Quebec<br/>
                                    China<br/>
                                    India
                                </td>

                                <td colspan="2" class="statText">
                                    Ireland<br/>
                                    New Zealand<br/>
                                    United Kingdom
                                </td>
                            </tr>

                            <tr><td colspan="4"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

        <xsl:call-template name="public_right_col"/>

        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
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

