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
        <td width="180">
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
                <xsl:with-param name="selectedTab">schedule</xsl:with-param>
            </xsl:call-template>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subhead2"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br />
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">

                            <tr><td colspan="6" class="statText"><strong>Schedule</strong><br /><br /></td></tr>

                    <tr valign="middle">
                      <td align="left" width="20%" class="statTextBig" background="/i/orangebv_bg.gif">Regional Round One</td>
                      <td align="center" width="16%" class="tourney_subhead1">Northeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">Southeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">West</td>
                      <td align="center" width="16%" class="tourney_subhead1">Midwest</td>
                      <td align="center" width="16%" class="tourney_subhead1">International</td>
                    </tr>

                    <tr valign="middle">
                      <td align="right" class="statText"><a class="statText" href="/index/?t=tournaments&amp;c=tccc03_competitors&amp;rds=4462,4464,4466"><strong>Competitors</strong></a></td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Advancers</td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4462&amp;rc=N">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4462&amp;rc=STH">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4464&amp;rc=W">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4464&amp;rc=MW">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4466&amp;rc=INT">View</a></td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">Room Winners<br />Wildcards</td>
                      <td align="center" class="statText">20<br />80</td>
                      <td align="center" class="statText">20<br />80</td>
                      <td align="center" class="statText">20<br />80</td>
                      <td align="center" class="statText">20<br />80</td>
                      <td align="center" class="statText">20<br />80</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Dates<br />Raindates</td>
                      <td align="center" class="tourney_subhead2" colspan="2">Tue, Feb 18, 9pm EST*<br />(Wed, Feb 19, 9pm EST*)</td>
                      <td align="center" class="tourney_subhead2" colspan="2">Thu, Feb 20, 9pm EST*<br />(Sun, Feb 23, 12pm EST*)</td>
                      <td align="center" class="tourney_subhead2">Sat, Feb 22, 12pm EST*<br />(Sun, Feb 23, 12pm EST*)</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">*Times are subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                    
                    <tr valign="middle">
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Quarterfinals</td>
                      <td align="center" width="16%" class="tourney_subhead1">Northeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">Southeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">West</td>
                      <td align="center" width="16%" class="tourney_subhead1">Midwest</td>
                      <td align="center" width="16%" class="tourney_subhead1">International</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText"><a class="statText" href="/index/?t=tournaments&amp;c=tccc03_competitors&amp;rds=4472"></a>Competitors</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Advancers<br />(Each advancer wins $50)</td>
                      <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4472&amp;rc=N">View</a></td>
                      <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4472&amp;rc=STH">View</a></td>
                      <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4472&amp;rc=W">View</a></td>
                      <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4472&amp;rc=MW">View</a></td>
                      <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4472&amp;rc=INT">View</a></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners<br />Wildcards</td>
                      <td align="center" class="statText">10<br />30</td>
                      <td align="center" class="statText">10<br />30</td>
                      <td align="center" class="statText">10<br />30</td>
                      <td align="center" class="statText">10<br />30</td>
                      <td align="center" class="statText">10<br />30</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Date<br />Raindate</td>
                      <td align="center" class="tourney_subhead2" colspan="5">Wed, Feb 26, 9pm EST*<br />(Thu, Feb 27, 9pm EST*)</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">*Time is subject to change.</td></tr>

                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                      
                    <tr valign="middle">
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Semifinals</td>
                      <td align="center" width="16%" class="tourney_subhead1">Northeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">Southeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">West</td>
                      <td align="center" width="16%" class="tourney_subhead1">Midwest</td>
                      <td align="center" width="16%" class="tourney_subhead1">International</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">Competitors</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Advancers<br />(Each advancer wins $50)</td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4474&amp;rc=N">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4474&amp;rc=STH">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4474&amp;rc=W">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4474&amp;rc=MW">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4474&amp;rc=INT">View</a></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners<br />Wildcards</td>
                      <td align="center" class="statText">4<br />6</td>
                      <td align="center" class="statText">4<br />6</td>
                      <td align="center" class="statText">4<br />6</td>
                      <td align="center" class="statText">4<br />6</td>
                      <td align="center" class="statText">4<br />6</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Date<br />Raindate</td>
                      <td align="center" class="tourney_subhead2" colspan="5">Wed, Mar 5, 9pm EST*<br />(Thu, Mar 6, 9pm EST*)</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" height="13" class="statText">*Time is subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                    
                    <tr>
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Championship</td>
                      <td align="center" width="16%" class="tourney_subhead1">Northeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">Southeast</td>
                      <td align="center" width="16%" class="tourney_subhead1">West</td>
                      <td align="center" width="16%" class="tourney_subhead1">Midwest</td>
                      <td align="center" width="16%" class="tourney_subhead1">International</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Competitors</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Advancers<br />(Each Regional Champion wins $600)</td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4482&amp;rc=N">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4482&amp;rc=STH">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4482&amp;rc=W">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4482&amp;rc=MW">View</a></td>
                        <td align="center" class="tourney_subhead2"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4482&amp;rc=INT">View</a></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">Wildcards</td>
                      <td align="center" colspan="5" class="statText">11  &#40;total&#41; Wildcards from all regions</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Date<br />Raindate</td>
                      <td align="center" class="tourney_subhead2" colspan="5">Wed, Mar 12, 9pm EST*<br />(Thu, Mar 13, 9pm EST*)</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">*Time is subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                </table>
                    
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                    <tr>
                      <td align="left" width="20%" class="statTextBig" background="/i/orangebv_bg.gif">Semifinals</td>
                      <td align="center" width="20%" class="tourney_subhead1">Room 1</td>
                      <td align="center" width="20%" class="tourney_subhead1">Room 2</td>
                      <td align="center" width="20%" class="tourney_subhead1">Room 3</td>
                      <td align="center" width="20%" class="tourney_subhead1">Room 4</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">Competitors</td>
                      <td align="center" class="statText">4</td>
                      <td align="center" class="statText">4</td>
                      <td align="center" class="statText">4</td>
                      <td align="center" class="statText">4</td>
                    </tr>
                    
       				<tr valign="middle">
                      <td align="right" class="tourney_subhead2">Finalists</td>
                      <td align="center" class="tourney_subhead2" colspan="4"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_semifour">View</a></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td class="tourney_subhead2">Date: All matches occur on Fri, Apr 4th</td>
                      <td align="center" class="tourney_subhead2">10:00am EST*</td>
                      <td align="center" class="tourney_subhead2">1:00pm EST*</td>
                      <td align="center" class="tourney_subhead2">4:00pm EST*</td>
                      <td align="center" class="tourney_subhead2">7:00pm EST*</td>
                    </tr>
                    
                    <tr><td colspan="5" valign="middle" class="statText">**Times are subject to change.</td></tr>
                    
                    <tr><td colspan="5"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                   
                    <tr>
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Championship</td>
                      <td colspan="4" class="tourney_subhead1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    </tr>
                    
                    <tr>
                      <td align="right" height="13" class="statText">Competitors</td>
                      <td colspan="4" align="center" class="statText">4 Coders in 1 Round</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Champion</td>
                      <td align="center" colspan="2" class="tourney_subhead2"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262936">dgarthur</a></td>
                      <td align="center" class="tourney_subhead2">Points: 1447.71</td>
                      <td align="center" class="tourney_subhead2">Seed:1</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners</td>
                      <td align="center" class="statText" colspan="4">1</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead2">Date</td>
                      <td align="center" colspan="4" class="tourney_subhead2">Sat, Apr 5, 1pm EST*</td>
                    </tr>
                    
                    <tr><td colspan="5" valign="middle" height="13" class="statText">**Time is subject to change.</td></tr>
                    
                    <tr> <td colspan="5"><img src="/i/clear.gif" alt="" width="1" height="20" border="0"/></td></tr>
                    
                    </table>
                        <p><br /></p>
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
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br />

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

