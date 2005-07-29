<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="Preload"/>
        <title>Statistics, Editorials, Match Results and Member Profiles at TopCoder</title>
        <xsl:call-template name="CSS"/>

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body>
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2005</font></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>July</strong></td></tr>
                            <tr><td class="bodyText">&#160;07.28.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 255 - <a href="/index?t=statistics&amp;c=srm255_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.26.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 254 - <a href="/index?t=statistics&amp;c=srm254_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.23.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 253 - <a href="/index?t=statistics&amp;c=srm253_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.12.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 251 - <a href="/index?t=statistics&amp;c=srm251_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.07.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 250 - <a href="/index?t=statistics&amp;c=srm250_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>June</strong></td></tr>
                            <tr><td class="bodyText">&#160;06.29.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 249 - <a href="/index?t=statistics&amp;c=srm249_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.21.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 248 - <a href="/index?t=statistics&amp;c=srm248_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.18.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 247 - <a href="/index?t=statistics&amp;c=srm247_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.09.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 246 - <a href="/index?t=statistics&amp;c=srm246_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.01.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 245 - <a href="/index?t=statistics&amp;c=srm245_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>May</strong></td></tr>
                            <tr><td class="bodyText">&#160;05.23.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 244 - <a href="/index?t=statistics&amp;c=srm244_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.17.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 243 - <a href="/index?t=statistics&amp;c=srm243_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.14.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 242 - <a href="/index?t=statistics&amp;c=srm242_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.04.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 241 - <a href="/index?t=statistics&amp;c=srm241_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>April</strong></td></tr>
                            <tr><td class="bodyText">&#160;04.30.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 240 - <a href="/index?t=statistics&amp;c=srm240_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.18.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 239 - <a href="/index?t=statistics&amp;c=srm239_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.14.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 238 - <a href="/index?t=statistics&amp;c=srm238_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.06.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 237 - <a href="/index?t=statistics&amp;c=srm237_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.02.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 236 - <a href="/index?t=statistics&amp;c=srm236_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>March</strong></td></tr>
                            <tr><td class="bodyText">&#160;03.22.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 235 - <a href="/index?t=statistics&amp;c=srm235_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.16.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 234 - <a href="/index?t=statistics&amp;c=srm234_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.11.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Finals - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_finals_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.11.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - WildCard Room - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_wildcard_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.10.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Semifinals Room 3 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room3_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.10.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Semifinals Room 2 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room2_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.10.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Semifinals Room 1 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=alg_room1_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.02.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 233 - <a href="/index?t=statistics&amp;c=srm233_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>February</strong></td></tr>
                            <tr><td class="bodyText">&#160;02.23.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 232 - <a href="/index?t=statistics&amp;c=srm232_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.19.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 231 - <a href="/index?t=statistics&amp;c=srm231_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.08.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 230 - <a href="/index?t=statistics&amp;c=srm230_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.02.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Online Round 4 - <a href="/index?t=statistics&amp;c=tccc05_online_rd_4">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>January</strong></td></tr>
                            <tr><td class="bodyText">&#160;01.31.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 229 - <a href="/index?t=statistics&amp;c=srm229_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.27.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 228 - <a href="/index?t=statistics&amp;c=srm228_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.26.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Online Round 3 - <a href="/index?t=statistics&amp;c=tccc05_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.22.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 227 - <a href="/index?t=statistics&amp;c=srm227_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.19.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Online Round 2 - <a href="/index?t=statistics&amp;c=tccc05_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.15.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Online Round 1 - <a href="/index?t=statistics&amp;c=tccc05_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.12.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Qualification 5 - <a href="/index?t=statistics&amp;c=tccc05_qual_5">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.12.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Qualification 4 - <a href="/index?t=statistics&amp;c=tccc05_qual_4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.12.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Qualification 3 - <a href="/index?t=statistics&amp;c=tccc05_qual_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.12.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Qualification 2 - <a href="/index?t=statistics&amp;c=tccc05_qual_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.12.05</td><td class="bodyText" nowrap="0">&#160;TCCC05 - Qualification 1 - <a href="/index?t=statistics&amp;c=tccc05_qual_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.05.05</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 226 - <a href="/index?t=statistics&amp;c=srm226_prob">Problem Set &amp; Analysis</a></td></tr>
                        </table>

                        <br/><br/>

                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2004</font></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>December</strong></td></tr>
                            <tr><td class="bodyText">&#160;12.28.04</td><td class="bodyText" nowrap="0">&#160;SRM 225 - <a href="/index?t=statistics&amp;c=srm225_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.22.04</td><td class="bodyText" nowrap="0">&#160;SRM 224 - <a href="/index?t=statistics&amp;c=srm224_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.18.04</td><td class="bodyText" nowrap="0">&#160;SRM 223 - <a href="/index?t=statistics&amp;c=srm223_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.07.04</td><td class="bodyText" nowrap="0">&#160;SRM 222 - <a href="/index?t=statistics&amp;c=srm222_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.01.04</td><td class="bodyText" nowrap="0">&#160;SRM 221 - <a href="/index?t=statistics&amp;c=srm221_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>November</strong></td></tr>
                            <tr><td class="bodyText">&#160;11.23.04</td><td class="bodyText" nowrap="0">&#160;SRM 220 - <a href="/index?t=statistics&amp;c=srm220_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.20.04</td><td class="bodyText" nowrap="0">&#160;SRM 219 - <a href="/index?t=statistics&amp;c=srm219_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.12.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Finals - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_finals_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.12.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - WildCard Round - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_wildcard_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.11.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Semifinals Room 3 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_room3_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.11.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Semifinals Room 2 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_room2_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.11.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Semifinals Room 1 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=alg_room1_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.04.04</td><td class="bodyText" nowrap="0">&#160;SRM 218- <a href="/index?t=statistics&amp;c=srm218_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>October</strong></td></tr>
                            <tr><td class="bodyText">&#160;10.27.04</td><td class="bodyText" nowrap="0">&#160;SRM 217- <a href="/index?t=statistics&amp;c=srm217_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.18.04</td><td class="bodyText" nowrap="0">&#160;SRM 216- <a href="/index?t=statistics&amp;c=srm216_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.16.04</td><td class="bodyText" nowrap="0">&#160;SRM 215- <a href="/index?t=statistics&amp;c=srm215_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.06.04</td><td class="bodyText" nowrap="0">&#160;SRM 214- <a href="/index?t=statistics&amp;c=srm214_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>September</strong></td></tr>
                            <tr><td class="bodyText">&#160;09.29.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Online Round 4 - <a href="/index?t=statistics&amp;c=tco04_online_rd_4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.28.04</td><td class="bodyText" nowrap="0">&#160;SRM 213- <a href="/index?t=statistics&amp;c=srm213_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.25.04</td><td class="bodyText" nowrap="0">&#160;SRM 212- <a href="/index?t=statistics&amp;c=srm212_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.22.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Online Round 3 - <a href="/index?t=statistics&amp;c=tco04_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.14.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Online Round 2 - <a href="/index?t=statistics&amp;c=tco04_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.14.04</td><td class="bodyText" nowrap="0">&#160;SRM 211- <a href="/index?t=statistics&amp;c=srm211_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.11.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Online Round 1 - <a href="/index?t=statistics&amp;c=tco04_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Qualification 5 - <a href="/index?t=statistics&amp;c=tco04_qual_5">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Qualification 4 - <a href="/index?t=statistics&amp;c=tco04_qual_4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Qualification 3 - <a href="/index?t=statistics&amp;c=tco04_qual_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Qualification 2 - <a href="/index?t=statistics&amp;c=tco04_qual_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.04</td><td class="bodyText" nowrap="0">&#160;TCO04 - Qualification 1 - <a href="/index?t=statistics&amp;c=tco04_qual_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.01.04</td><td class="bodyText" nowrap="0">&#160;SRM 210- <a href="/index?t=statistics&amp;c=srm210_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>August</strong></td></tr>
                            <tr><td class="bodyText">&#160;08.28.04</td><td class="bodyText" nowrap="0">&#160;SRM 209- <a href="/index?t=statistics&amp;c=srm209_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.18.04</td><td class="bodyText" nowrap="0">&#160;SRM 208- <a href="/index?t=statistics&amp;c=srm208_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.10.04</td><td class="bodyText" nowrap="0">&#160;SRM 207- <a href="/index?t=statistics&amp;c=srm207_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.04.04</td><td class="bodyText" nowrap="0">&#160;SRM 206- <a href="/index?t=statistics&amp;c=srm206_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>July</strong></td></tr>
                            <tr><td class="bodyText">&#160;07.31.04</td><td class="bodyText" nowrap="0">&#160;SRM 205- <a href="/index?t=statistics&amp;c=srm205_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.21.04</td><td class="bodyText" nowrap="0">&#160;SRM 204- <a href="/index?t=statistics&amp;c=srm204_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.15.04</td><td class="bodyText" nowrap="0">&#160;SRM 203- <a href="/index?t=statistics&amp;c=srm203_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.07.04</td><td class="bodyText" nowrap="0">&#160;SRM 202- <a href="/index?t=statistics&amp;c=srm202_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>June</strong></td></tr>
                            <tr><td class="bodyText">&#160;06.29.04</td><td class="bodyText" nowrap="0">&#160;SRM 201- <a href="/index?t=statistics&amp;c=srm201_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.21.04</td><td class="bodyText" nowrap="0">&#160;SRM 200- <a href="/index?t=statistics&amp;c=srm200_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.16.04</td><td class="bodyText" nowrap="0">&#160;SRM 199- <a href="/index?t=statistics&amp;c=srm199_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.12.04</td><td class="bodyText" nowrap="0">&#160;SRM 198- <a href="/index?t=statistics&amp;c=srm198_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.02.04</td><td class="bodyText" nowrap="0">&#160;SRM 197- <a href="/index?t=statistics&amp;c=srm197_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>May</strong></td></tr>
                            <tr><td class="bodyText">&#160;05.27.04</td><td class="bodyText" nowrap="0">&#160;SRM 196- <a href="/index?t=statistics&amp;c=srm196_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.18.04</td><td class="bodyText" nowrap="0">&#160;SRM 195- <a href="/index?t=statistics&amp;c=srm195_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.15.04</td><td class="bodyText" nowrap="0">&#160;SRM 194- <a href="/index?t=statistics&amp;c=srm194_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.05.04</td><td class="bodyText" nowrap="0">&#160;SRM 193- <a href="/index?t=statistics&amp;c=srm193_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>April</strong></td></tr>
                            <tr><td class="bodyText">&#160;04.27.04</td><td class="bodyText" nowrap="0">&#160;SRM 192- <a href="/index?t=statistics&amp;c=srm192_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.24.04</td><td class="bodyText" nowrap="0">&#160;SRM 191- <a href="/index?t=statistics&amp;c=srm191_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.16.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Finals - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=alg_finals_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.15.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Wildcard Room - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=alg_wildcard_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.15.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Semi Room 3 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=alg_room3_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.15.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Semi Room 2 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=alg_room2_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.15.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Semi Room 1 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=alg_room1_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.06.04</td><td class="bodyText" nowrap="0">&#160;SRM 190 - <a href="/index?t=statistics&amp;c=srm190_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>March</strong></td></tr>
                            <tr><td class="bodyText">&#160;03.31.04</td><td class="bodyText" nowrap="0">&#160;SRM 189 - <a href="/index?t=statistics&amp;c=srm189_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.25.04</td><td class="bodyText" nowrap="0">&#160;SRM 188 - <a href="/index?t=statistics&amp;c=srm188_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.17.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Online Round 4 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.16.04</td><td class="bodyText" nowrap="0">&#160;SRM 187 - <a href="/index?t=statistics&amp;c=srm187_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.13.04</td><td class="bodyText" nowrap="0">&#160;SRM 186 - <a href="/index?t=statistics&amp;c=srm186_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.10.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Online Round 3 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.03.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Online Round 2 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.01.04</td><td class="bodyText" nowrap="0">&#160;SRM 185 - <a href="/index?t=statistics&amp;c=srm185_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>February</strong></td></tr>
                            <tr><td class="bodyText">&#160;02.28.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Online Round 1 - <a href="/index?t=statistics&amp;c=tccc04_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.24.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Qualification 5 - <a href="/index?t=statistics&amp;c=tccc04_qual_5">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.24.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Qualification 4 - <a href="/index?t=statistics&amp;c=tccc04_qual_4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.24.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Qualification 3 - <a href="/index?t=statistics&amp;c=tccc04_qual_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.24.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Qualification 2 - <a href="/index?t=statistics&amp;c=tccc04_qual_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.24.04</td><td class="bodyText" nowrap="0">&#160;TCCC04 - Qualification 1 - <a href="/index?t=statistics&amp;c=tccc04_qual_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.17.04</td><td class="bodyText" nowrap="0">&#160;SRM 184 - <a href="/index?t=statistics&amp;c=srm184_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.11.04</td><td class="bodyText" nowrap="0">&#160;SRM 183 - <a href="/index?t=statistics&amp;c=srm183_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.07.04</td><td class="bodyText" nowrap="0">&#160;SRM 182 - <a href="/index?t=statistics&amp;c=srm182_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>January</strong></td></tr>
                            <tr><td class="bodyText">&#160;01.28.04</td><td class="bodyText" nowrap="0">&#160;SRM 181 - <a href="/index?t=statistics&amp;c=srm181_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.22.04</td><td class="bodyText" nowrap="0">&#160;SRM 180 - <a href="/index?t=statistics&amp;c=srm180_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.17.04</td><td class="bodyText" nowrap="0">&#160;SRM 179 - <a href="/index?t=statistics&amp;c=srm179_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.07.04</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 178 - <a href="/index?t=statistics&amp;c=srm178_prob">Problem Set &amp; Analysis</a></td></tr>
                        </table>

                        <br/><br/>

                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2003</font></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>December</strong></td></tr>
                            <tr><td class="bodyText">&#160;12.30.03</td><td class="bodyText" nowrap="0">&#160;SRM 177 - <a href="/index?t=statistics&amp;c=srm177_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.22.03</td><td class="bodyText" nowrap="0">&#160;SRM 176 - <a href="/index?t=statistics&amp;c=srm176_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.17.03</td><td class="bodyText" nowrap="0">&#160;SRM 175 - <a href="/index?t=statistics&amp;c=srm175_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.13.03</td><td class="bodyText" nowrap="0">&#160;SRM 174 - <a href="/index?t=statistics&amp;c=srm174_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.05.03</td><td class="bodyText" nowrap="0">&#160;2003 TCO Finals - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCO Semi Room 4 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=room4_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCO Semi Room 3 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=room3_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCO Semi Room 2 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=room2_analysis">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCO Semi Room 1 - <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=room1_analysis">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>November</strong></td></tr>
                            <tr><td class="bodyText">&#160;11.26.03</td><td class="bodyText" nowrap="0">&#160;SRM 173 - <a href="/index?t=statistics&amp;c=srm173_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.20.03</td><td class="bodyText" nowrap="0">&#160;SRM 172 - <a href="/index?t=statistics&amp;c=srm172_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.17.03</td><td class="bodyText" nowrap="0">&#160;CRPF - Finals - <a href="/index?t=statistics&amp;c=crpf_finals_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.12.03</td><td class="bodyText" nowrap="0">&#160;SRM 171 - <a href="/index?t=statistics&amp;c=srm171_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.11.03</td><td class="bodyText" nowrap="0">&#160;CRPF - Round 1 - <a href="/index?t=statistics&amp;c=crpf_rd1_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.08.03</td><td class="bodyText" nowrap="0">&#160;SRM 170 - <a href="/index?t=statistics&amp;c=srm170_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.05.03</td><td class="bodyText" nowrap="0">&#160;TCO - Online Round 4 - <a href="/index?t=statistics&amp;c=tco03_online_rd_4">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>October</strong></td></tr>
                            <tr><td class="bodyText">&#160;10.29.03</td><td class="bodyText" nowrap="0">&#160;TCO - Online Round 3 - <a href="/index?t=statistics&amp;c=tco03_online_rd_3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.28.03</td><td class="bodyText" nowrap="0">&#160;SRM 169 - <a href="/index?t=statistics&amp;c=srm169_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.22.03</td><td class="bodyText" nowrap="0">&#160;TCO - Online Round 2 - <a href="/index?t=statistics&amp;c=tco03_online_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.21.03</td><td class="bodyText" nowrap="0">&#160;SRM 168 - <a href="/index?t=statistics&amp;c=srm168_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.15.03</td><td class="bodyText" nowrap="0">&#160;TCO - Online Round 1 - <a href="/index?t=statistics&amp;c=tco03_online_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.14.03</td><td class="bodyText" nowrap="0">&#160;SRM 167 - <a href="/index?t=statistics&amp;c=srm167_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.09.03</td><td class="bodyText" nowrap="0">&#160;TCO - Qualification Round 2 - <a href="/index?t=statistics&amp;c=tco03_qual_rd_2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.07.03</td><td class="bodyText" nowrap="0">&#160;TCO - Qualification Round 1 - <a href="/index?t=statistics&amp;c=tco03_qual_rd_1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.01.03</td><td class="bodyText" nowrap="0">&#160;SRM 166 - <a href="/index?t=statistics&amp;c=srm166_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>September</strong></td></tr>
                            <tr><td class="bodyText">&#160;09.23.03</td><td class="bodyText" nowrap="0">&#160;SRM 165 - <a href="/index?t=statistics&amp;c=srm165_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.20.03</td><td class="bodyText" nowrap="0">&#160;SRM 164 - <a href="/index?t=statistics&amp;c=srm164_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.08.03</td><td class="bodyText" nowrap="0">&#160;SRM 163 - <a href="/index?t=statistics&amp;c=srm163_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.03.03</td><td class="bodyText" nowrap="0">&#160;SRM 162 - <a href="/index?t=statistics&amp;c=srm162_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>August</strong></td></tr>
                            <tr><td class="bodyText">&#160;08.28.03</td><td class="bodyText" nowrap="0">&#160;SRM 161 - <a href="/index?t=statistics&amp;c=srm161_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.23.03</td><td class="bodyText" nowrap="0">&#160;SRM 160 - <a href="/index?t=statistics&amp;c=srm160_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.12.03</td><td class="bodyText" nowrap="0">&#160;SRM 159 - <a href="/index?t=statistics&amp;c=srm159_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.06.03</td><td class="bodyText" nowrap="0">&#160;SRM 158 - <a href="/index?t=statistics&amp;c=srm158_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>July</strong></td></tr>
                            <tr><td class="bodyText">&#160;07.28.03</td><td class="bodyText" nowrap="0">&#160;SRM 157 - <a href="/index?t=statistics&amp;c=srm157_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.23.03</td><td class="bodyText" nowrap="0">&#160;SRM 156 - <a href="/index?t=statistics&amp;c=srm156_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.17.03</td><td class="bodyText" nowrap="0">&#160;SRM 155 - <a href="/index?t=statistics&amp;c=srm155_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.09.03</td><td class="bodyText" nowrap="0">&#160;SRM 154 - <a href="/index?t=statistics&amp;c=srm154_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.01.03</td><td class="bodyText" nowrap="0">&#160;SRM 153 - <a href="/index?t=statistics&amp;c=srm153_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>June</strong></td></tr>
                            <tr><td class="bodyText">&#160;06.26.03</td><td class="bodyText" nowrap="0">&#160;SRM 152 - <a href="/index?t=statistics&amp;c=srm152_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.17.03</td><td class="bodyText" nowrap="0">&#160;SRM 151 - <a href="/index?t=statistics&amp;c=srm151_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.11.03</td><td class="bodyText" nowrap="0">&#160;SRM 150 - <a href="/index?t=statistics&amp;c=srm150_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;06.02.03</td><td class="bodyText" nowrap="0">&#160;SRM 149 - <a href="/index?t=statistics&amp;c=srm149_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>May</strong></td></tr>
                            <tr><td class="bodyText">&#160;05.28.03</td><td class="bodyText" nowrap="0">&#160;SRM 148 - <a href="/index?t=statistics&amp;c=srm148_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.22.03</td><td class="bodyText" nowrap="0">&#160;SRM 147 - <a href="/index?t=statistics&amp;c=srm147_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.14.03</td><td class="bodyText" nowrap="0">&#160;SRM 146 - <a href="/index?t=statistics&amp;c=srm146_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;05.06.03</td><td class="bodyText" nowrap="0">&#160;SRM 145 - <a href="/index?t=statistics&amp;c=srm145_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>April</strong></td></tr>
                            <tr><td class="bodyText">&#160;04.30.03</td><td class="bodyText" nowrap="0">&#160;SRM 144 - <a href="/index?t=statistics&amp;c=srm144_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.15.03</td><td class="bodyText" nowrap="0">&#160;SRM 142 - <a href="/index?t=statistics&amp;c=srm142_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.10.03</td><td class="bodyText" nowrap="0">&#160;SRM 141 - <a href="/index?t=statistics&amp;c=srm141_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.05.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Finals - <a href="/index?t=tournaments&amp;c=tccc03_champprob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Semifinals - <a href="/index?t=tournaments&amp;c=tccc03_semiprob4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Semifinals - <a href="/index?t=tournaments&amp;c=tccc03_semiprob3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Semifinals - <a href="/index?t=tournaments&amp;c=tccc03_semiprob2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;04.04.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Semifinals - <a href="/index?t=tournaments&amp;c=tccc03_semiprob1">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>March</strong></td></tr>
                            <tr><td class="bodyText">&#160;03.26.03</td><td class="bodyText" nowrap="0">&#160;SRM 140 - <a href="/index?t=statistics&amp;c=srm140_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.18.03</td><td class="bodyText" nowrap="0">&#160;SRM 139 - <a href="/index?t=statistics&amp;c=srm139_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.12.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Regional Finals - <a href="/index?t=statistics&amp;c=tccc03_regfinal_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.10.03</td><td class="bodyText" nowrap="0">&#160;SRM 138 - <a href="/index?t=statistics&amp;c=srm138_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.06.03</td><td class="bodyText" nowrap="0">&#160;SRM 137 - <a href="/index?t=statistics&amp;c=srm137_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;03.05.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Regional Semi. - <a href="/index?t=statistics&amp;c=tccc03_reg_semi_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>February</strong></td></tr>
                            <tr><td class="bodyText">&#160;02.26.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Regional Quart. - <a href="/index?t=statistics&amp;c=tccc03_reg_quart_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.25.03</td><td class="bodyText" nowrap="0">&#160;SRM 136 - <a href="/index?t=statistics&amp;c=srm136_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.22.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Round 1 Int. - <a href="/index?t=statistics&amp;c=tccc03_int_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.20.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Round 1 W/MW - <a href="/index?t=statistics&amp;c=tccc03_wmw_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.18.03</td><td class="bodyText" nowrap="0">&#160;2003 TCCC Round 1 NE/SE - <a href="/index?t=statistics&amp;c=tccc03_nese_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.11.03</td><td class="bodyText" nowrap="0">&#160;SRM 135 - <a href="/index?t=statistics&amp;c=srm135_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.08.03</td><td class="bodyText" nowrap="0">&#160;SRM 134 - <a href="/index?t=statistics&amp;c=srm134_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.05.03</td><td class="bodyText" nowrap="0">&#160;SRM 133 - <a href="/index?t=statistics&amp;c=srm133_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;02.01.03</td><td class="bodyText" nowrap="0">&#160;SRM 132 - <a href="/index?t=statistics&amp;c=srm132_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>January</strong></td></tr>
                            <tr><td class="bodyText">&#160;01.30.03</td><td class="bodyText" nowrap="0">&#160;SRM 131 - <a href="/index?t=statistics&amp;c=srm131_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.14.03</td><td class="bodyText" nowrap="0">&#160;SRM 129 - <a href="/index?t=statistics&amp;c=srm129_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.06.03</td><td class="bodyText" nowrap="0">&#160;SRM 128 - <a href="/index?t=statistics&amp;c=srm128_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;01.02.03</td><td class="bodyText" nowrap="0" width="100%">&#160;SRM 127 - <a href="/index?t=statistics&amp;c=srm127_prob">Problem Set &amp; Analysis</a></td></tr>
                        </table>

                        <br/><br/>

                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" colspan="2"><font size="3">Match Editorial Archive - 2002</font></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>December</strong></td></tr>
                            <tr><td class="bodyText">&#160;12.23.02</td><td class="bodyText" nowrap="0">&#160;SRM 126 - <a href="/index?t=statistics&amp;c=srm126_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.16.02</td><td class="bodyText" nowrap="0">&#160;SRM 125 - <a href="/index?t=statistics&amp;c=srm125_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.12.02</td><td class="bodyText" nowrap="0">&#160;SRM 124 - <a href="/index?t=statistics&amp;c=srm124_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.10.02</td><td class="bodyText" nowrap="0">&#160;SRM 123 - <a href="/index?t=statistics&amp;c=srm123_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;12.04.02</td><td class="bodyText" nowrap="0">&#160;SRM 122 - <a href="/index?t=statistics&amp;c=srm122_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>November</strong></td></tr>
                            <tr><td class="bodyText">&#160;11.26.02</td><td class="bodyText" nowrap="0">&#160;SRM 121 - <a href="/index?t=statistics&amp;c=srm121_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.23.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Championship - <a href="/index?t=tournaments&amp;c=invit02_champprob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.22.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Room #4 - <a href="/index?t=tournaments&amp;c=invit02_semiprob4">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.22.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Room #3 - <a href="/index?t=tournaments&amp;c=invit02_semiprob3">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.22.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Room #2 - <a href="/index?t=tournaments&amp;c=invit02_semiprob2">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.22.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Room #1 - <a href="/index?t=tournaments&amp;c=invit02_semiprob1">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.13.02</td><td class="bodyText" nowrap="0">&#160;SRM 120 - <a href="/index?t=statistics&amp;c=srm120_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;11.07.02</td><td class="bodyText" nowrap="0">&#160;SRM 119 - <a href="/index?t=statistics&amp;c=srm119_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>October</strong></td></tr>
                            <tr><td class="bodyText">&#160;10.30.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Round #4 - <a href="/index?t=statistics&amp;c=invit02_r4_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.29.02</td><td class="bodyText" nowrap="0">&#160;SRM 118 - <a href="/index?t=statistics&amp;c=srm118_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.23.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Round #3 - <a href="/index?t=statistics&amp;c=invit02_r3_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.21.02</td><td class="bodyText" nowrap="0">&#160;SRM 117 - <a href="/index?t=statistics&amp;c=srm117_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.16.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Round #2 - <a href="/index?t=statistics&amp;c=invit02_r2_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.15.02</td><td class="bodyText" nowrap="0">&#160;SRM 116 - <a href="/index?t=statistics&amp;c=srm116_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.10.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Round #1 (part 2) - <a href="/index?t=statistics&amp;c=invit02_r1b_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;10.08.02</td><td class="bodyText" nowrap="0">&#160;2002 Invitational Round #1 (part 1) - <a href="/index?t=statistics&amp;c=invit02_r1a_prob">Problem Set &amp; Analysis</a></td></tr>

                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>September</strong></td></tr>
                            <tr><td class="bodyText">&#160;09.30.02</td><td class="bodyText" nowrap="0">&#160;SRM 115 - <a href="/index?t=statistics&amp;c=srm115_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.24.02</td><td class="bodyText" nowrap="0">&#160;SRM 114 - <a href="/index?t=statistics&amp;c=srm114_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.10.02</td><td class="bodyText" nowrap="0">&#160;SRM 113 - <a href="/index?t=statistics&amp;c=srm113_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.09.02</td><td class="bodyText" nowrap="0">&#160;SRM 112 - <a href="/index?t=statistics&amp;c=srm112_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;09.04.02</td><td class="bodyText" nowrap="0">&#160;SRM 111 - <a href="/index?t=statistics&amp;c=srm111_prob">Problem Set &amp; Analysis</a></td></tr>


                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>August</strong></td></tr>
                            <tr><td class="bodyText">&#160;08.27.02</td><td class="bodyText" nowrap="0">&#160;SRM 110 - <a href="/index?t=statistics&amp;c=srm110_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.21.02</td><td class="bodyText" nowrap="0">&#160;SRM 109 - <a href="/index?t=statistics&amp;c=srm109_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.12.02</td><td class="bodyText" nowrap="0">&#160;SRM 108 - <a href="/index?t=statistics&amp;c=srm108_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.07.02</td><td class="bodyText" nowrap="0">&#160;SRM 107 - <a href="/index?t=statistics&amp;c=srm107_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;08.01.02</td><td class="bodyText" nowrap="0">&#160;SRM 106 - <a href="/index?t=statistics&amp;c=srm106_prob">Problem Set &amp; Analysis</a></td></tr>


                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>July</strong></td></tr>
                            <tr><td class="bodyText">&#160;07.24.02</td><td class="bodyText" nowrap="0">&#160;SRM 105 - <a href="/index?t=statistics&amp;c=srm105_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.16.02</td><td class="bodyText" nowrap="0">&#160;SRM 104 - <a href="/index?t=statistics&amp;c=srm104_prob">Problem Set &amp; Analysis</a></td></tr>
                            <tr><td class="bodyText">&#160;07.10.02</td><td class="bodyText" nowrap="0">&#160;SRM 103 - <a href="/index?t=statistics&amp;c=srm103_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm103_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;07.01.02</td><td class="bodyText" nowrap="0">&#160;SRM 102 - <a href="/index?t=statistics&amp;c=srm102_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm102_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm102_prob">Problem Set</a><!-- | <A HREF="/index?t=statistics&amp;c=srm102_lessons">Lessons&#160;Learned</A> --></td></tr>


                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>June</strong></td></tr>
                            <tr><td class="bodyText">&#160;06.26.02</td><td class="bodyText" nowrap="0">&#160;SRM 101 - <a href="/index?t=statistics&amp;c=srm101_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm101_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm101_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm101_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;06.24.02</td><td class="bodyText" nowrap="0">&#160;SRM 100 - <a href="/index?t=statistics&amp;c=srm100_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm100_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm100_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;06.19.02</td><td class="bodyText" nowrap="0">&#160;SRM 98 - <a href="/index?t=statistics&amp;c=srm98_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm98_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm98_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;06.12.02</td><td class="bodyText" nowrap="0">&#160;SRM 97 - <a href="/index?t=statistics&amp;c=srm97_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm97_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm97_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm97_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;06.11.02</td><td class="bodyText" nowrap="0">&#160;SRM 96 - <a href="/index?t=statistics&amp;c=srm96_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm96_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm96_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;06.05.02</td><td class="bodyText" nowrap="0">&#160;SRM 95 - <a href="/index?t=statistics&amp;c=srm95_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm95_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm95_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;06.03.02</td><td class="bodyText" nowrap="0">&#160;SRM 94 - <a href="/index?t=statistics&amp;c=srm94_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm94_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm94_prob">Problem Set</a></td></tr>


                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>May</strong></td></tr>
                            <tr><td class="bodyText">&#160;05.30.02</td><td class="bodyText" nowrap="0">&#160;SRM 93 - <a href="/index?t=statistics&amp;c=srm93_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm93_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm93_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm93_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;05.29.02</td><td class="bodyText" nowrap="0">&#160;SRM 92 - <a href="/index?t=statistics&amp;c=srm92_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm92_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm92_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;05.22.02</td><td class="bodyText" nowrap="0">&#160;SRM 91 - <a href="/index?t=statistics&amp;c=srm91_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm91_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm91_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm91_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;05.21.02</td><td class="bodyText" nowrap="0">&#160;SRM 90 - <a href="/index?t=statistics&amp;c=srm90_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm90_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm90_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;05.18.02</td><td class="bodyText" nowrap="0">&#160;SRM 89 - <a href="/index?t=statistics&amp;c=srm89_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm89_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm89_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm89_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;05.15.02</td><td class="bodyText" nowrap="0">&#160;SRM 88 - <a href="/index?t=statistics&amp;c=srm88_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm88_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm88_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm88_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;05.09.02</td><td valign="middle" class="bodyText">&#160;SRM 87 - <a href="/index?t=statistics&amp;c=srm87_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm87_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm87_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm87_lessons">Lessons&#160;Learned</a></td></tr>
                            <tr><td class="bodyText">&#160;05.08.02</td><td valign="middle" class="bodyText">&#160;SRM 86 - <a href="/index?t=statistics&amp;c=srm86_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm86_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm86_prob">Problem Set</a></td></tr>
                            <tr><td class="bodyText">&#160;05.01.02</td><td valign="middle" class="bodyText">&#160;SRM 85 - <a href="/index?t=statistics&amp;c=srm85_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm85_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm85_prob">Problem Set</a> | <a href="/index?t=statistics&amp;c=srm85_lessons">Lessons&#160;Learned</a></td></tr>


                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td valign="middle" class="bodyText" colspan="2">&#160;<strong>April</strong></td></tr>
                            <tr><td class="bodyText">&#160;04.30.02</td><td valign="middle" class="bodyText">&#160;SRM 84 - <a href="/index?t=statistics&amp;c=srm84_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm84_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm84_prob">Problem Set Analysis &amp; Opinion</a></td></tr>
                            <tr><td class="bodyText">&#160;04.27.02</td><td valign="middle" class="bodyText">&#160;SRM 83 - <a href="/index?t=statistics&amp;c=srm83_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm83_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm83_prob">Problem Set Analysis &amp; Opinion</a></td></tr>
                            <tr><td class="bodyText">&#160;04.24.02</td><td valign="middle" class="bodyText">&#160;SRM 82 - Coder Point of View editorials not available for this match.</td></tr>
                            <tr><td class="bodyText">&#160;04.22.02</td><td valign="middle" class="bodyText">&#160;SRM 81 - This match was rescheduled to Saturday, April 27th as SRM 83</td></tr>
                            <tr><td class="bodyText">&#160;04.15.02</td><td valign="middle" class="bodyText">&#160;SRM 80 - <a href="/index?t=statistics&amp;c=srm80_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm80_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm80_prob">Problem Set Analysis &amp; Opinion</a></td></tr>
                            <tr><td class="bodyText">&#160;04.10.02</td><td valign="middle" class="bodyText">&#160;SRM 79 - <a href="/index?t=statistics&amp;c=srm79_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm79_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm79_prob">Problem Set Analysis &amp; Opinion</a></td></tr>
                            <tr><td class="bodyText">&#160;04.09.02</td><td valign="middle" class="bodyText"  width="100%">&#160;SRM 78 - <a href="/index?t=statistics&amp;c=srm78_room1">Room 1</a> | <a href="/index?t=statistics&amp;c=srm78_rookie">Rookie Review</a> | <a href="/index?t=statistics&amp;c=srm78_prob">Problem Set Analysis &amp; Opinion</a></td></tr>
                            <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                            <tr><td colspan="2" align="left"><br/><a href="mailto:editorial@topcoder.com">Are you a member interested in writing a review?</a></td></tr>
                        </table>

                        <p><br/></p>

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>
            <!--
            <xsl:call-template name="public_right_col">
                <xsl:with-param name="sectionName">statistics</xsl:with-param>
            </xsl:call-template>
            -->
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