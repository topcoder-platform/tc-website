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
                <xsl:with-param name="selectedTab">schedule</xsl:with-param>
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
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">

                            <tr><td colspan="6" class="statText"><strong>Schedule</strong><br /><br /></td></tr>

                    <tr valign="middle">
                      <td align="left" width="26%" class="statTextBig" background="/i/orangebv_bg.gif">Regional Round One<br/>
<!--
                        &#160;&#160;&#160;Northeast &amp; Southeast Regions<BR/>
                        &#160;&#160;&#160;&#160;Tuesday, Feb. 19 @ 8pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Tuesday, Feb. 26 @ 8pm EST)<BR/>
                        &#160;&#160;&#160;West &amp; Midwest Regions<BR/>
                        &#160;&#160;&#160;&#160;Thursday, Feb. 21 @ 10pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Thursday, Feb. 28 @ 10pm EST)<BR/>
-->
                      </td>
                      <td align="center" width="11%" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne200" class="statTextBig"></a>Update</td>
                      <td align="center" width="11%" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_se200" class="statTextBig"></a>Update</td>
                      <td align="center" width="11%" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_w200" class="statTextBig"></a>Update</td>
                      <td align="center" width="11%" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw200" class="statTextBig"></a>Update</td>
                      <td align="center" width="11%" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_int200" class="statTextBig"></a>Update</td>
                    </tr>

                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><a class="statText" href="/index/?t=tournaments&amp;c=tccc03_competitors&amp;rds=4462,4464,4466"><strong>Total Competitors</strong></a></td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne200" class="statTextBig"></a>Northeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_se200" class="statTextBig"></a>Southeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_w200" class="statTextBig"></a>West</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw200" class="statTextBig"></a>Midwest</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_int200" class="statTextBig"></a>International</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">1,000</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                      <td align="center" class="statText">200</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Advancing</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">Room Winners<br/>Wildcards</td>
                      <td align="center" class="statText"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4462&amp;rc=N">20</a><br/>80</td>
                      <td align="center" class="statText"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4462&amp;rc=STH">20</a><br/>80</td>
                      <td align="center" class="statText"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4464&amp;rc=W">20</a><br/>80</td>
                      <td align="center" class="statText"><a class="statText" href="/index?t=tournaments&amp;c=tccc03_tourney_advancers&amp;rds=4464&amp;rc=MW">20</a><br/>80</td>
                      <td align="center" class="statText">20<br/>80</td>
                    </tr>
                    
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Top-10 Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_ne" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_se" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_w" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_mw" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_nese1_summary" CLASS="statTextBig">NE/SE</A></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_wmw1_summary" CLASS="statTextBig">W/MW</A></TD>
                    </TR> -->
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Dates</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <!-- <TR>
                      <TD VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="top" CLASS="statText">Northeast &amp; Southeast Regions:<BR/>Tues. Feb. 18 @ 9pm EST<BR/>(raindate: Wed. Feb. 19 @ 9pm EST)</TD>
                      <TD COLSPAN="2" VALIGN="top" CLASS="statText">West &amp; Midwest Regions:<BR/>Thurs. Feb. 20 @ 9pm EST<BR/>(raindate: Fri. Feb. 21 @ 9pm EST)</TD>
                      <TD VALIGN="top" CLASS="statText">International Region:<BR/>Sat. Feb. 22 @ 12pm EST<BR/>(raindate: Sun. Feb. 23 @ 12pm EST)</TD>
                    </TR> -->
                    
                    <tr><td colspan="6" valign="middle" class="statText" height="30"><strong>Northeast &amp; Southeast Regions:</strong><br/>Tues. Feb. 18 @ **9pm EST (raindate: Wed. Feb. 19 @ 9pm EST)</td></tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText" height="30"><strong>West &amp; Midwest Regions:</strong><br/>Thurs. Feb. 20 @ **9pm EST (raindate: Fri. Feb. 21 @ 9pm EST)</td></tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText" height="30"><strong>International Region:</strong><br/>Sat. Feb. 22 @ **12pm EST (raindate: Sun. Feb. 23 @ 12pm EST)</td></tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">**Times are subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    
                    <tr valign="middle">
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Quarterfinals<br/>
<!--
                        &#160;&#160;&#160;Northeast &amp; Southeast Regions<BR/>
                        &#160;&#160;&#160;&#160;Tuesday, Feb. 19 @ 8pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Tuesday, Feb. 26 @ 8pm EST)<BR/>
                        &#160;&#160;&#160;West &amp; Midwest Regions<BR/>
                        &#160;&#160;&#160;&#160;Thursday, Feb. 21 @ 10pm EST<BR/>
                        &#160;&#160;&#160;&#160;(raindate: Thursday, Feb. 28 @ 10pm EST)<BR/>
-->
                      </td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne100" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_se100" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_w100" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw100" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_int100" class="statTextBig"></a>Update</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><strong>Total Competitors</strong></td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne100" class="statTextBig"></a>Northeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_se100" class="statTextBig"></a>Southeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_w100" class="statTextBig"></a>West</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw100" class="statTextBig"></a>Midwest</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_int100" class="statTextBig"></a>International</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">500</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                      <td align="center" class="statText">100</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Advancing<br/>(All advancers win $50 each)</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners<br/>Wildcards</td>
                      <td align="center" class="statText">10<br/>30</td>
                      <td align="center" class="statText">10<br/>30</td>
                      <td align="center" class="statText">10<br/>30</td>
                      <td align="center" class="statText">10<br/>30</td>
                      <td align="center" class="statText">10<br/>30</td>
                    </tr>
                    
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Top-10 Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_ne" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_se" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_w" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_mw" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_nese1_summary" CLASS="statTextBig">NE/SE</A></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_wmw1_summary" CLASS="statTextBig">W/MW</A></TD>
                    </TR> -->
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Dates</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">All Regions: Wed. Feb. 26 @ **9pm EST (raindate: Thurs. Feb. 27 @ 9pm EST)</td></tr>
                      
                    <tr><td colspan="6" valign="middle" class="statText">**Time is subject to change.</td></tr>

                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                      
                    <tr valign="middle">
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Semifinals</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne40" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_se40" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_w40" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw40" class="statTextBig"></a>Update</td>
                      <td align="center" class="tourney_subhead1"><a href="/index?t=tournaments&amp;c=tccc03_regions_int40" class="statTextBig"></a>Update</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><strong>Total Competitors</strong></td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne40" class="statTextBig"></a>Northeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_se40" class="statTextBig"></a>Southeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_w40" class="statTextBig"></a>West</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw40" class="statTextBig"></a>Midwest</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_int40" class="statTextBig"></a>International</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">200</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                      <td align="center" class="statText">40</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Advancing<br/>(All advancers win $50 each)</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners<br/>Wildcards</td>
                      <td align="center" class="statText">4<br/>6</td>
                      <td align="center" class="statText">4<br/>6</td>
                      <td align="center" class="statText">4<br/>6</td>
                      <td align="center" class="statText">4<br/>6</td>
                      <td align="center" class="statText">4<br/>6</td>
                    </tr>
                    
                    <!-- <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Room Winners&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=top_10_wins_regions" CLASS="statTextBig"><IMG SRC="/i/arrow_white.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Summary&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=tccc02_regional_semi" CLASS="statTextBig">All Regions</A></TD>
                    </TR> -->
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Date</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">All Regions: Wed. Mar. 5 @ **9pm EST (raindate: Thurs. Mar. 6 @ 9pm EST)</td></tr>
                   
                    <tr><td colspan="6" valign="middle" height="13" class="statText">**Time is subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    
                    <tr>
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Regional Championship</td>
                      <td colspan="5" class="tourney_subhead1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><strong>Total Competitors</strong></td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_ne" class="statTextBig"></a>Northeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_se" class="statTextBig"></a>Southeast</td>
                      <td align="center" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_w" class="statTextBig"></a>West</td>
                      <td align="center" valign="middle" width="11%" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_mw" class="statTextBig"></a>Midwest</td>
                      <td align="center" valign="middle" width="11%" class="tourney_subnav"><a href="/index?t=tournaments&amp;c=tccc03_regions_int" class="statTextBig"></a>INT</td>
                    </tr>
                   
                    <tr valign="middle">
                      <td align="right" class="statText">50</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                      <td align="center" class="statText">10</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Advancing<br/>(Each regional champion wins $600 each)</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
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
                      <td colspan="5" align="center" class="statText">11  &#40;total&#41; Wildcards from all regions</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Date</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">All Regions: Wed. Mar. 12 @ **9pm EST (raindate: Thurs. Mar. 13 @ 9pm EST)</td></tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">**Time is subject to change.</td></tr>
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    
                    <tr>
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Semifinals</td>
                      <td colspan="5" class="tourney_subhead1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><strong>Total Competitors</strong></td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr>
                      <td align="right" class="statText">16</td>
                      <td colspan="5" align="center" class="statText">4 Coders in 4 Rooms</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Advancing</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">Room Winners</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">1</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Date</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="statText">All matches occur on Friday, April 4th</td>
                      <td align="center" class="statText">**10:00am (EST)</td>
                      <td align="center" class="statText">**1:00pm (EST)</td>
                      <td align="center" class="statText">**4:00pm (EST)</td>
                      <td align="center" class="statText">**7:00pm (EST)</td>
                      <td align="center" class="statText">&#160;</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">**Times are subject to change.</td></tr>
                    
                    <!-- <TR>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Room 1 - 8am EST<BR/>Room 2 - 11am EST</TD>
                      <TD COLSPAN="3" VALIGN="middle" CLASS="statText">Room 3 - 3pm EST<BR/>Room 4 - 6pm EST</TD>
                    </TR> -->
                    
                    <tr><td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                   
                    <tr>
                      <td align="left" class="statTextBig" background="/i/orangebv_bg.gif">Championship</td>
                      <td colspan="5" class="tourney_subhead1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav"><strong>Total Competitors</strong></td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr>
                      <td align="right" height="13" class="statText">4</td>
                      <td colspan="5" align="center" class="statText">4 Coders in 1 Round</td>
                    </tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subnav">Date&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                      <td align="center" class="tourney_subnav">&#160;</td>
                    </tr>
                    
                    <tr><td colspan="6" valign="middle" class="statText">Saturday, April 5, @ **12pm EST</td></tr>
                    
                    <tr><td colspan="6" valign="middle" height="13" class="statText">**Time is subject to change.</td></tr>
                    
                    <tr> <td colspan="6"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                    
                    <tr valign="middle">
                      <td align="right" class="tourney_subhead1">&#160;</td>
                      <td align="center" class="tourney_subhead1">&#160;</td>
                      <td colspan="3" align="center" class="statTextBig" background="/i/orangebv_bg.gif"><strong>Tournament Champion</strong></td>
                      <td align="center" class="tourney_subhead1">&#160;</td>
                    </tr>
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

