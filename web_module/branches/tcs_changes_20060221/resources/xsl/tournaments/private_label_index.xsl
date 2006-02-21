<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Upcoming and Past Computer Programming Tournaments at TopCoder</title>
        <xsl:call-template name="CSS"/>
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>

<body>
<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
            <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1"> </xsl:with-param>
                <xsl:with-param name="image">events_white</xsl:with-param>
                <xsl:with-param name="title">Private Label Events</xsl:with-param>
            </xsl:call-template>


            <img src="/i/clear.gif" alt="" width="1" height="15" border="0"/><br/>

<!-- Upcoming Events begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Upcoming Events</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?t=tournaments&amp;c=vcc03_rules_overview"><img src="/i/tournament/photo_vcc03.jpg" alt="2003 Verizon Coding Challenge" width="274" height="134" border="0" /></A><br />&#160;</td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong>2003 Verizon Coding Challenge</strong></font><br />
                        August 20-29<br />
                        Verizon facility<br />
                        Chennai, India</p>

                        <p><font color="#CC0000"><strong>Online Registration opens August 4</strong></font></p>

                        <p><A href="/?t=tournaments&amp;c=vcc03_rules_overview">Official Rules and Regulations</A></p><br />
                    </td>
                </tr>
            </table>
<!-- Upcoming Events ends -->

<!-- Past Events begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Past Events</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/index?t=tournaments&amp;c=javaone2003"><img src="/i/tournament/photo_javaonecc03.jpg" alt="2003 JavaOne Coding Challenge" width="274" height="134" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><A href="/index?t=tournaments&amp;c=javaone2003"><img src="/i/tournament/logo_javaonecc03.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></A>
                        <font size="3"><strong>2003 Sun Microsystems(TM) JavaOne<span class="super">SM</span> Coding Challenge</strong></font><br />
                        June 10-12<br />
                        Moscone Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&amp;c=javaone2003">More Info</A></p>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/index?t=tournaments&amp;c=2002sunnetwork_rules"><img src="/i/tournament/photo_sunnetworkcc03.jpg" alt="2002 SunNetwork Coding Challenge" width="274" height="134" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><A href="/index?t=tournaments&amp;c=2002sunnetwork_rules"><img src="/i/tournament/logo_sunnetworkcc03.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></A>
                        <font size="3"><strong>2002 SunNetwork Coding Challenge</strong></font><br />
                        September 18-20<br />
                        Moscone Center<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&amp;c=2002sunnetwork_rules">Summary</A></p>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <div align="center"><A href="mailto:sponsorships@topcoder.com">Find out how your organization can put on a Private Label Event</A></div>

            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tourny</xsl:with-param>
            </xsl:call-template>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
            <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>
  </xsl:template>
</xsl:stylesheet>

