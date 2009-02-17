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
                <xsl:with-param name="image">events</xsl:with-param>
                <xsl:with-param name="title">Tournaments</xsl:with-param>
            </xsl:call-template>


            <img src="/i/clear.gif" alt="" width="1" height="15" border="0"/><br/>

<!-- Upcoming Tournaments begins -->

            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Upcoming Tournaments</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2" valign="top"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=about"><img src="/i/tournament/tco06Logo.gif" alt="2006 TopCoder Open" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2" valign="top"><font size="3"><strong>2006 TopCoder Open(TM)</strong></font>
                     <br /><br />
                        May 3-5<br />
                        Aladdin Resort and Casino<br/>
                        Las Vegas, Nevada, USA<br />
                     <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=about">Details</A>
                        <br />
                     <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=logo_overview">Logo Contest</A>
                     </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<!-- Upcoming Tournaments ends -->

<!-- Past Tournaments begins -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">Past Tournaments</font></td></tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2" valign="top"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about"><img src="/i/tournament/photo_tco05.jpg" alt="2005 TCCC" width="274" height="121" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2005 TopCoder Open(TM) Sponsored by Sun Microsystems</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        October 12-14<br />
                        Santa Clara Marriott<br/>
                        Santa Clara, CA, USA<br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">Details</A>
                        <br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=logo_overview">Logo Contest</A>
                    </td>
                    <td width="1%" valign="bottom"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about"><img src="/i/pressroom/tco05_logo.gif" alt="" border="0" /></A></td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2" valign="top"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about"><img src="/i/tournament/photo_tccc05.jpg" alt="2005 TCCC" width="274" height="121" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2005 TopCoder Collegiate Challenge(TM) sponsored by Yahoo!<sup>&#174; </sup></strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        March 10-11<br />
                        Santa Clara Marriott<br/>
                        Santa Clara, CA, USA<br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about">Details</A>
                    </td>
                    <td width="1%" valign="bottom"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about"><img src="/i/pressroom/tccc05_logo.gif" alt="" border="0" /></A></td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2" valign="top"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about"><img src="/i/tournament/photo_tco04.jpg" alt="2004 TCO" width="274" height="121" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2004 TopCoder Open(TM) sponsored by Microsoft<sup>&#174; </sup></strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 11-12<br />
                        Santa Clara Marriott<br/>
                        Santa Clara, CA, USA<br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">Details</A>
                    </td>
                    <td width="1%" valign="bottom"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about"><img src="/i/pressroom/tco04_logo.gif" alt="" border="0" /></A></td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2" valign="top"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about"><img src="/i/tournament/photo_tccc04.jpg" alt="2004 TCCC" width="274" height="121" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2004 TopCoder Collegiate Challenge(TM) sponsored by Yahoo!<sup>&#174; </sup></strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        April 15-16<br />
                        Boston Park Plaza Hotel<br/>
                        Boston, Massachusetts<br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about">Details</A>
                    </td>
                    <td width="1%" valign="bottom"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about"><img src="/i/tournament/logo_tccc04.gif" alt="" width="113" height="73" border="0" /></A></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview"><img src="/i/tournament/photo_tco03.jpg" alt="2003 TopCoder Open" width="274" height="121" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2003 TopCoder Open(TM) sponsored by Intel<sup>&#174; </sup></strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        December 4-5<br />
                        Mohegan Sun Casino<br />
                        Uncasville, Connecticut<br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final">Summary</A>
                    </td>
                    <td width="1%" valign="bottom"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final"><img src="/i/tournament/logo_tco03.gif" alt="" width="113" height="73" border="0" /></A></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/photo_tccc03.jpg" alt="2003 TCCC" width="274" height="134" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2003 Sun Microsystems(TM) TopCoder Collegiate Challenge(TM)</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        April 4-5<br />
                        University Park Hotel @ MIT<br/>
                        Cambridge, Massachusetts<br />
                        <A href="/index?t=tournaments&amp;c=tccc03_champ">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><A href="/index?t=tournaments&amp;c=tccc03_champ"><img src="/i/tournament/logo_tccc03.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></A></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&amp;c=invit02_champ"><img src="/i/tournament/photo_tci02.jpg" alt="2002 TCI" width="274" height="134" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2002 TopCoder Invitational(TM)</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        November 22-23<br />
                        Mohegan Sun Casino<br />
                        Uncasville, Connecticut<br />
                        <A href="/index?t=tournaments&amp;c=invit02_champ">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><A href="/index?t=tournaments&amp;c=invit02_champ"><img src="/i/tournament/logo_tci02.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></A></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" rowspan="2"><A href="/index?t=tournaments&amp;c=2002tccc_champ"><img src="/i/tournament/photo_tccc02.jpg" alt="2002 TCCC" width="274" height="134" border="0" /></A></td>
                    <td width="10" rowspan="2"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText" colspan="2"><font size="3"><strong>2002 Sun Microsystems(TM) TopCoder Collegiate Challenge(TM)</strong></font></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText">
                        April 19-20<br />
                        University Park Hotel @ MIT<br/>
                        Cambridge, Massachusetts<br />
                        <A href="/index?t=tournaments&amp;c=2002tccc_champ">Summary</A>
                    </td>
                    <td valign="bottom" width="1%"><A href="/index?t=tournaments&amp;c=2002tccc_champ"><img src="/i/tournament/logo_tccc02.gif" alt="Logo" width="113" height="73" border="0" hspace="2" align="right" /></A></td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/index?t=tournaments&amp;c=tourny_tci_01"><img src="/i/tournament/photo_tci01.jpg" alt="2001 TCI" width="274" height="134" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong>2001 TopCoder Invitational(TM)</strong></font><br />
                        November 2-3<br />
                        Foxwoods Resort Casino<br />
                        Mashantucket, Connecticut<br />
                        <A href="/index?t=tournaments&amp;c=tourny_tci_01">Summary</A></p>
                    </td>
                </tr>
            </table>

                <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/index?t=tournaments&amp;c=tourny_tccc_01"><img src="/i/tournament/photo_tccc01.jpg" alt="2001 TCCC" width="274" height="134" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong>2001 TopCoder Collegiate Challenge(TM)</strong></font><br />
                        June 5-7<br />
                        San Francisco Hilton and Towers<br/>
                        San Francisco, California<br />
                        <A href="/index?t=tournaments&amp;c=tourny_tccc_01">Summary</A></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <div align="center"><A href="mailto:sponsorships@topcoder.com">Sponsor a TopCoder tournament</A></div>

            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">tco03</xsl:with-param>
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

