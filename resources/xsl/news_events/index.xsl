<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder Press Room - Press Releases and Articles featured in other publications</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

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
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title"></xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><strong>Current News</strong>&#160;&#160;|&#160;&#160;<A href="/?t=news_events&amp;c=press_release_archive">Press Releases Archive</A>&#160;&#160;|&#160;&#160;<A href="/?t=news_events&amp;c=article_archive">Articles Archive</A></div></td></tr>
            </table>
            
<!-- 2005 -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            
<!-- CRPF -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_01_25_05"><img src="/i/pressroom/crpf_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_01_25_05">TCS Delivers for International Consortium of Spinal Cord Injury Researchers</A></strong></font><br />
                        TopCoder today announced it has successfully deployed a high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. <span class="prHead"> [January 25]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCCC05 MOTOROLA -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_01_18_05"><img src="/i/pressroom/motorola_logo.gif" alt="Motorola" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_01_18_05">TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge</A></strong></font><br />
                        TopCoder today announced Motorola, Inc., (NYSE: MOT), a global leader in wireless, broadband and automotive communications technologies, as a premier sponsor for its 2005 TopCoder Collegiate Challenge (TCCC 05).  <span class="prHead">[January 18]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- ComputerWorld Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html" target="_blank"><img src="/i/pressroom/compworld_logo.gif" alt="ComputerWorld" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html" target="_blank">Code Reuse Pays Off for ING </A></strong></font><br />
						ING Americas last month finished work on a quality-management application built using an innovative development process that the company estimated saved it $300,000 and 1,200 man-hours. <span class="prHead">[January 10 - ComputerWorld]</span></p>
                    </td>
                </tr>
            </table>

            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            
<!-- 2004 -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            
<!-- TCCC05 YAHOO -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_12_20_04"><img src="/i/pressroom/tccc05_logo.gif" alt="TCCC05" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_12_20_04">TopCoder&#174; Announces Yahoo! as Title Sponsor for 2005 TCCC</A></strong></font><br />
                        TopCoder today announced Yahoo! Inc. as the title sponsor of the 2005 TopCoder Collegiate Challenge (TCCC).  The 2005 TCCC will bring many of the world's finest student programmers together in competition for international ranking, notoriety and a share of the $150,000 prize purse.  <span class="prHead">[December 20]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SCMP -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_12_03_04"><img src="/i/pressroom/scmp_logo.gif" alt="AP" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_12_03_04">Top coders seek bigger prize than cash</A></strong></font><br />
						At the semi-annual event, held earlier this month in California, four mainland programmers competed in a field of just 24, having beaten out more than 1,500 in preliminary events. To hear them tell it, they came for the networking opportunities as much as for the prize money.<span class="prHead"> [December 3 - SCMP]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCO 04 Finalists -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_11_15_04"><img src="/i/pressroom/tco04_logo.gif" alt="TCO04" width="135" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_11_15_04">Champions Announced In 2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</A></strong></font><br />
						TopCoder announced that Tomasz Czajka of Stalowej, Poland, Adrian Nicolae Carcu of Bistrita, Romania, and Jin GuanZhou of HangZhou City, China have won the Algorithm, Design and Development Competitions of the 2004 TopCoder Open, sponsored by Microsoft.  <span class="prHead">[November 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CNN GCJ04 -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/cnn_110404.pdf"><img src="/i/pressroom/cnn_logo.gif" alt="CNN" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/cnn_110404.pdf">Brain teasers help Google recruit workers</A></strong></font><br />
						As its rapidly growing business creates hundreds of new jobs, Google is trying to lure premier talent with offbeat tactics, including a computer-coding competition and a brain-twisting aptitude test that mixes geek humor with a daunting mathematical workout.<span class="prHead"> [November 4 - CNN]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCO 04 Finalists -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_11_01_04"><img src="/i/pressroom/tco04_logo.gif" alt="TCO04" width="135" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_11_01_04">TopCoder&#174; Announces Finalists for 2004 TopCoder Open Sponsored by Microsoft&#174;</A></strong></font><br />
						The semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $150,000 prize purse.  <span class="prHead">[November 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Associated Press Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_10_25_04"><img src="/i/pressroom/ap_logo.gif" alt="AP" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_10_25_04">Google's creative search for elite programmers</A></strong></font><br />
						Google Inc. finds almost anything on the Internet within seconds, but finding the sharp-minded computer engineers who program the company's lightning-quick search engine takes more time -- and a quirky bit of ingenuity.<span class="prHead"> [October 25 - Associated Press]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- GCJ04 Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_10_19_04"><img src="/i/pressroom/sj_mercury_logo.gif" alt="GCJ04" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_10_19_04">Google holds coding contest</A></strong></font><br />
						Some people like to play tennis or golf to blow off steam after a hard day. Bolek Szewcyzk likes to pound out line after line after line of code on his computer, solving complex problems or just exulting in the art of creation.<span class="prHead">[October 19 - SJ Mercury]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Tendances Tomek Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/i/pressroom/tendances_tomek.pdf"><img src="/i/pressroom/tendances_logo.gif" alt="Tendances" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/tendances_tomek.pdf">Dream Job and Juicy Premiums for Young, Crackshot Programmers</A></strong> [Translation]</font><br />
						<span class="prHead">[October]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- GCJ04 Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_10_05_04"><img src="/i/pressroom/gcj_logo.gif" alt="GCJ04" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_10_05_04">Google announces 50 Google Code Jam Finalists</A></strong></font><br />
						Google Inc. today announced the 50 finalists in the second annual Google Code Jam, Google's online coding competition consisting of a series of problem-solving challenges that invite participants to select a programming language and use their programming skills to code solutions to the problems. <span class="prHead">[October 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Newsforge Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank"><img src="/i/pressroom/newsforge_logo.gif" alt="Newsforge" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank">Coders win, winners code</A></strong></font><br />
						TopCoder announced on September 29 the completion of the final elimination round in the Algorithm Competition portion of its 2004 annual TopCoder Open coding contest. But the real winner may be TopCoder's open source development model, which gives programmers a chance to build enterprise applications for cash prizes. <span class="prHead">[October 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SoftDevMag -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_10_03_04"><img src="/i/pressroom/softdevmag_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_10_03_04">Triple Threat</A></strong></font><br />
                        TopCoder is itself a triple threat: It ranks programmers through competitions, has a catalog of commercial software components built by its members, and offers services using a patented process of distributing specifications in the form of problems up for bid. <span class="prHead"> [October]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Brainerd Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">

                    <td width="274"><A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank"><img src="/i/pressroom/brainerd_logo.gif" alt="Newsforge" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank">Hometown hero</A></strong></font><br />
						Jimb Esser left Minnesota for San Jose, Calif., after being sought by Cryptic Studios, makers of the City of Heroes online game. Cryptic Studios sought Esser after finding him -- where else but online -- through the TopCoder Web site and a programming tournament. <span class="prHead">[October 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CRPF -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_09_27_04"><img src="/i/pressroom/crpf_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_27_04">TopCoder Developing Application for CRPF Spinal Cord Injury Research Group</A></strong></font><br />
                        TopCoder today announced it has begun developing a  high-quality, web-based application to disseminate critical microarray data between the Christopher Reeve Paralysis Foundation's (CRPF) Research Consortium on Spinal Cord Injury and the general scientific community. <span class="prHead"> [September 27]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CIO Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank"><img src="/i/pressroom/searchcio_logo.gif" alt="CIO" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank">Outsourcing trend touches independents, too</A></strong></font><br />
                        During 14 years of contract work, Roberts [Pops] managed to secure long-term agreements with major corporations to provide IT services ranging from project management to development. One contract spread over seven years. Another project lasted six years. But those kinds of gigs are scarce nowadays. <span class="prHead">[September 15]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Morris -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_09_07_04"><img src="/i/pressroom/sdbp_logo.gif" alt="" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_07_04">TopCoder Software Industry Expert Michael Morris to Speak at 2004 SD Best Practices Conference</A></strong></font><br />
                        Michael Morris, vice president of software development, will be speaking at the Software Development Best Practices Conference and Expo at the Hynes Convention Center in Boston, MA September 20-23rd. Produced by CMP Media's SD Events group, the SD Best Practices Conference and Expo gives software management professionals an expansive range of topics that focus on boosting efficiency, streamlining infrastructure and producing successful project outcomes to enhance the quality of software production.<span class="prHead"> [September 7]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Yahoo! TCO-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_09_02_04"><img src="/i/pressroom/yahoo_logo.gif" alt="yahoo" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_02_04">Yahoo! Signs On as Premier Sponsor of 2004 TopCoder Open</A></strong></font><br />
                        "As a sponsor of the TopCoder Collegiate Challenge, Yahoo! had the opportunity to recruit several truly talented individuals. We are excited to continue our relationship with TopCoder and are looking forward to meeting with the top talent competing in the TopCoder Open," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo. <span class="prHead">[September 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Intel Sponsor TCO04 -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_08_18_04"><img src="/i/pressroom/intel.gif" alt="" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_08_18_04">Intel Corporation Sponsors 2004 TopCoder Open Tournament</A></strong></font><br />
                          "We are pleased to participate as a sponsor of the 2004 TopCoder Open, which is recognized as one of the pre-eminent events of its kind in the world," said Melissa Laird, general manager, Solutions Enabling Division, Intel Corporation. "We look forward to an exciting tournament and the interaction with an exceptional field of contestants."<span class="prHead"> [August 18]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  RedHerring -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_08_10_04"><img src="/i/pressroom/redherring_logo.gif" alt="" width="135" height="21" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_08_10_04">Better than You: King of code</A></strong></font><br />
                         Known in his competitive coding circles by first name only, Tomek Czajka is one of the world's best programmers. He's earned over $75,000 in algorithm-writing contests over the last few years on TopCoder, the Top Gun of programming competition sites. In addition to fortune and fame in the developer community, TopCoder winners are often recruited by event sponsors like Microsoft, Yahoo, and Google.<span class="prHead"> [August 10 - Red Herring]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCS -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_08_10_04"><img src="/i/pressroom/tcs_logo.gif" alt="nvidia" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_08_10_04">TopCoder Software Wins New Customer Contracts</A></strong></font><br />
                        TopCoder, Inc. today announced that TopCoder Software has won new accounts including Thomson Prometric and Burlington Coat Factory. The latest projects will utilize TopCoder Software's competitive application development model which harnesses the talent of software developers from around the world to design, develop and deploy software. <span class="prHead">[August 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- NVIDIA TCO-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_08_04_04"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_08_04_04">NVIDIA Named Premier Level Sponsor of 2004 TopCoder Open Tournament</A></strong></font><br />
                        "We are thrilled to be a part of this exciting coding competition for the 3rd consecutive year," said Daniel Rohrer, Manager of DirectX Graphics. "The characteristics that allow TopCoder competitors to be successful closely mirror qualities we look for in our engineers at NVIDIA" <span class="prHead">[August 4]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  TCO04 -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_07_28_04"><img src="/i/pressroom/tco04_logo.gif" alt="javaone" width="135" height="85" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_07_28_04">TopCoder Announces Microsoft as Title Sponsor for 2004 TCO</A></strong></font><br />
                        The 2004 TopCoder Open will bring the world's finest professional and collegiate programmers together in competition for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place November 11th and 12th at the Santa Clara Marriott in Santa Clara, CA.<span class="prHead"> [July 28]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- DevX Article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.devx.com/Java/Article/21602" target="_blank"><img src="/i/pressroom/devx_logo.gif" alt="DevX" width="135" height="92" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.devx.com/Java/Article/21602" target="_blank">The Smart Choice for Smart Clients: J2EE or .NET?</A></strong></font><br />
                        In a world of distributed computing, the demand for smart-client applications is growing quickly. IT managers realize they must keep users happy-the user's experience will make or break any application-while leveraging their existing service-oriented architectures (SOAs). The problem is that most development teams either do not know where to begin or they are unprepared for the challenges that come with smart-client implementation. <span class="prHead">[July 27]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Computer World-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html" target="_blank"><img src="/i/pressroom/compworld_logo.gif" alt="ComputerWorld" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html" target="_blank">BearingPoint Move Raises China's Profile</A></strong></font><br />
                        Wu Jiazhi is a China-based programmer who works for TopCoder Inc., a Glastonbury, Conn.-based firm that conducts online competitions for recruiting programming talent for outsourcing projects. Wu said he believes China's workers have the technical skills that will enable the country to rival or exceed India within several years.<span class="prHead"> [July 12]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Builder.com Javaone -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://builder.com.com/5100-6370_14-5260946.html" target="_blank"><img src="/i/pressroom/builder_logo.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://builder.com.com/5100-6370_14-5260946.html" target="_blank">CNET engineer wins JavaOne Coding Challenge</A></strong></font><br />
                        We always thought we worked with a bunch of smart people here at CNET, but now we have actual proof. Matthew McEachen, a senior software engineer based in our San Francisco office, won the Coding Challenge at the recent JavaOne conference. We got a few minutes from him recently to answer some questions about his accomplishment.<span class="prHead"> [July 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Javaone -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://java.sun.com/javaone/top_coder.html" target="_blank"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://java.sun.com/javaone/top_coder.html" target="_blank">JavaOne Coding Challenge: Meet the Best</A></strong></font><br />
                        The JavaOne Coding Competition is finished, which means three Grand Prize winners and a host of Runners Up have been crowned as this year's top coders. This year, the number of competitors rose to almost double that of last year. There were 188 competitors on day two of the three-day competition.<span class="prHead"> [July 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Mass High Tech article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934" target="_blank">Focus on software talent</A></strong></font><br />
                       CaA confluence of events has set the stage for an interesting scenario over the next several quarters. Companies have pared down staff over the past few years, schools and universities are producing fewer computer science graduates, and offshore outsourcing is meeting with mixed results. Companies are searching for better, cheaper alternatives to software development, fearing a return to 1999, when they paid through the nose for developers to work on projects, most of which failed to see the light of day. <span class="prHead">[July]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Fast Company -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/i/pressroom/FastCompany0704.pdf" target="_blank"><img src="/i/pressroom/fastcompany_logo.gif" alt="fcLogo" width="135" height="33" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/i/pressroom/FastCompany0704.pdf" target="_blank">"There are good people everywhere"</A></strong></font><br />
                       Tomasz Czajka, a 23-year-old Polish university student, has won two big computer-programming contests in a row - and he's ranked first among TopCoder's 38,000 coders.  Is he the world's best geek?<span class="prHead">[June 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Javaone -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/" target="_blank"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/" target="_blank">Who's the Best Coder?</A></strong></font><br />
                        Three days of qualification rounds. Brilliant competitors. Thousands of spectators. Big prizes. Bragging rights. Now check yourself. Any increase in your pulse rate might be the first sign you're a potential competitor. Sweaty palms are a sure sign. If neither happened, but your pulse rate dropped and a shark fin popped out of your back, your seat is waiting.<span class="prHead"> [June]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Workforce -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=art_06_01_04"><img src="/i/pressroom/workforce.gif" alt="" width="135" height="45" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=art_06_01_04">Cracking the Hiring Code</A></strong></font><br />
                         Companies are shelling out anywhere from $35,000 to $150,000 to participate in contests such as those that challenge programmers to write code. For companies, the payoff is twofold: the ability to see the skills of employees that a traditional interview will never deliver, and a chance to spread their brand name.<span class="prHead"> [June 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- WSJO -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html" target="_blank"><img src="/i/pressroom/wsjo.gif" alt="wsjo" width="135" height="50" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html" target="_blank">Win in a Corporate Competition, Land on Square That Offers a Job</A></strong></font><br />
                         More companies are using competitions to discover candidates with standout skills and talent. Fields such as architecture and fashion design have long held competitions to allow students to showcase their work. But others, including technology companies and advertisers, also are interested in seeing how people perform against their peers.<span class="prHead"> [June 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- UPI -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r" target="_blank"><img src="/i/pressroom/upi_logo.gif" alt="UPI" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r" target="_blank">The Web: Search engine wars flare online</A></strong></font><br />
                         Search engine developers, such as Yahoo!, Google and Microsoft, are aggressively seeking new strategies -- and technologies -- that will give them even a slight edge in the struggle for dominance in what is becoming the Internet's most glamorous niche, experts told United Press International.<span class="prHead"> [May 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  USDC -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_05_12_04"><img src="/i/pressroom/usdc_logo.gif" alt="USDC" width="135" height="50" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_05_12_04">TopCoder Announces the Ultimate Software Development Contest</A></strong></font><br />
                        The online competition will give eligible TopCoder members chances to win cash prizes totaling $50,000 during a series of weekly, monthly and quarterly contests, as well as match skills with other members around the globe using TopCoder's unique Competitive Development Methodology.<span class="prHead"> [May 12]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Javaone -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_05_03_04"><img src="/i/pressroom/javaone_event.gif" alt="javaone" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_05_03_04">JavaOne Coding Challenge Powered by TopCoder</A></strong></font><br />
                        "The TopCoder-powered Coding Challenge was one of the highest rated programs by our attendees last year," said Mike Bellisimo, Senior Director of Sun Developer Outreach. "It's an exciting and fun event that creates a buzz among our community and adds a new dimension of interaction and participation to the JavaOne Conference experience."<span class="prHead"> [May 3]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- BWO -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href=" /?&amp;t=news_events&amp;c=art_04_29_04"><img src="/i/pressroom/bwo_logo.gif" alt="bwo_logo" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href=" /?&amp;t=news_events&amp;c=art_04_29_04">And The Champion Coders Are...</A></strong></font><br />
                         In software, no country is hotter than India. But at the Apr. 16 TopCoder Collegiate Challenge, software's world championship in Boston, the programming powerhouse was all but invisible. A 22-year-old Pole, Tomasz Czajka, won the $25,000 prize for the second year in a row, edging out rivals from the U.S., Canada, and Australia.<span class="prHead"> [April 29]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Po  -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://biz.yahoo.com/prnews/040422/dcth080_1.html" target="_blank"><img src="/i/pressroom/po.jpg" alt="Po" width="135" height="136" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://biz.yahoo.com/prnews/040422/dcth080_1.html" target="_blank">ASA Honors Po-Shen Loh</A></strong></font><br />
                        Po-Shen Loh, son of ASA member Wei-Yin Loh and Theresa Loh is the recipient of multiple honors that will enable him to pursue his graduate study and research. A student a California Institute of Technology, Po-Shen grew up in Madison, Wisconsin, where his parents still reside. This academic year, Loh has been offered the National Science Foundation (NSF) award, a Churchill Scholarship, a Hertz fellowship, and a National Defense Science and Engineering Graduate Fellowship.<span class="prHead"> [April 22]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<!-- JavaOne  -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm" target="_blank"><img src="/i/pressroom/tmcnet.gif" alt="TMCNET" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm" target="_blank">Java Technology Spreads Like Wildfire at JavaOne</A></strong></font><br />
                        One of the highest-rated Attendee events in 2003, the JavaOne Coding Challenge is back this year. Sun has teamed up with TopCoder, Inc. to bring Java technology programmers together for coding, competition, and fun.<span class="prHead"> [April 21]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<!-- TCO Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_04_19b_04"><img src="/i/pressroom/tccc04_winners.jpg" alt="TCCC04" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_04_19b_04">Champions Announced In 2004 TCCC Sponsored by Yahoo!&#174;</A></strong></font><br />
                        TopCoder announced today that Tomasz Czajka of Warsaw, Poland, Pavlo Aksonov of the Ukraine and Roman Koshlyak, also of the Ukraine, have won the Coding, Design and Development Component tournaments of the 2004 TopCoder Collegiate Challenge sponsored by Yahoo!<span class="prHead"> [April 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!--  Stage Stores Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_04_19_04"><img src="/i/pressroom/stagestores.gif" alt="stagestores" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_04_19_04">Custom Web Application Enables Online Gift Card Service</A></strong></font><br />
                         Stage Stores has implemented a high quality enterprise solution to reduce the inconvenience and cost of customers having to call an 800 number to purchase gift cards. The customized web solution is compatible across Apache Web Server, Tomcat Servlet Engine and Oracle RDBMS platforms and was designed and developed by TopCoder Software using the company's unique development methodology and catalog of more than 150 reusable components.<span class="prHead"> [April 19]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- BWO Google article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href=" http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm" target="_blank"><img src="/i/pressroom/bwo_logo.gif" alt="bwo_logo" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href=" http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm" target="_blank">Hiring Techies Is as Tricky as Ever</A></strong></font><br />
                         TopCoder rounded up about 100 programmers to participate in this software smackdown, some 10 of whom made it to the final round. DoubleClick Chief Information Officer Mok Choe says the company has already hired a few of the winners. "We can filter out the cream of the crop," says Choe. <span class="prHead">[April 13]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Yahoo TCCC Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_04_06_04"><img src="/i/pressroom/tccc_yahoo.gif" alt="TCCC - Yahoo" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_04_06_04">TopCoder&#174; Announces 32 Semifinalists for 2004 TCCC</A></strong></font><br />
                        The 32 semifinalists endured numerous online elimination rounds to earn a trip to the prestigious onsite finals, and will now compete head-to-head over two days of intense competition to determine the winners who will share the $100,000 prize purse.<span class="prHead">[April 6]</span>
                        </p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- NVIDIA TCCC-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_03_08_04"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_03_08_04">NVIDIA Sponsors 2004 TopCoder Collegiate Challenge</A></strong></font><br />
                        "NVIDIA truly believes that the TopCoder arena fosters an unparalleled competitive spirit among the most brilliant programmers in the world. We are proud to be a part of this initiative again," said Daniel Rohrer, Manager of DirectX Graphics.  "Our corporate culture encourages innovation and excellence and the TopCoder competition model is a perfect complement to that philosophy." <span class="prHead">[March 8]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Fortune  -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.fortune.com/fortune/print/0,15935,594536,00.html" target="_blank"><img src="/i/pressroom/fortune.gif" alt="Computer World" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.fortune.com/fortune/print/0,15935,594536,00.html" target="_blank">Geek Gods</A></strong></font><br />
                        Eleven years of practice and training have brought "Tomek" to this final match. He's spent the past hour in seclusion, meditating to achieve mental focus, then 
                        stretching and hopping to warm up. As the judges call his name, Tomek smiles, flashes peace signs to the spectators, and sits at a computer keyboard. "You may begin," 
                        says an announcer.<span class="prHead"> [March 5]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<!-- Mass High Tech article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&amp;cat_id=3" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&amp;cat_id=3" target="_blank">Regional programmers take the TopCoder challenge</A></strong></font><br />
                       Called the TopCoder Collegiate Challenge and this year sponsored by Yahoo, the event is a nail-biting competition among a field of the world's most promising technologists, all vying for $100,000 in prize money. <span class="prHead">[March 1]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- DoubleClick Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_03_01_04"><img src="/i/pressroom/dccc.gif" alt="DoubleClick" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td> 
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_03_01_04">Columbia University Student Wins DoubleClick's 2004 TopCoder Programming Challenge</A></strong></font><br />
                        Jason Winokur of Columbia University has won the DoubleClick 2004 Coding Challenge.  In the DoubleClick employee competition, 
                        first place finisher was Eliot Horowitz of the New York City office.  The competition was open to all eligible students at Columbia 
                        University and New York University as well as DoubleClick employees. The tournament was designed to highlight the competitors' 
                        relative skills in the analysis of complex algorithmic problems and the ability to write software to solve those problems.<span class="prHead"> [March 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Yahoo TCCC Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_02_16_04"><img src="/i/pressroom/tccc_yahoo.gif" alt="TCCC - Yahoo" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_02_16_04">TopCoder Announces Yahoo! as Title Sponsor for TCCC04</A></strong></font><br />
                        "Yahoo! is proud to sponsor the TopCoder Collegiate Challenge and showcase the programmers and developers of tomorrow as they put their skills to the test," said Libby Sartain, Senior Vice President, Human Resources and Chief People Yahoo. "Many of the participants in this event are as fun, innovative and talented as our own employees and we are excited to have the Yahoo! team on-site to meet the competitors and witness their considerable coding capabilities."<span class="prHead"> [February 16]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- DoubleClick Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_02_02_04"><img src="/i/pressroom/dccc.gif" alt="DoubleClick" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_02_02_04">TopCoder Announces DoubleClick 2004 Coding Challenge</A></strong></font><br />
                        Having self-administered coding competitions for its employees for the last two years, DoubleClick is now 
                        turning to TopCoder to expand this year's competition to include external applicants. The DoubleClick 2004 
                        Coding Challenge is open to all DoubleClick employees worldwide. As an added dimension this year, DoubleClick 
                        is also opening the contest to students at two local universities - Columbia and NYU.<span class="prHead"> [February 2]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Computer World  -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274" target="_blank"><img src="/i/pressroom/computerworld.gif" alt="Computer World" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274" target="_blank">Standards penetrate telecom industry</A></strong></font><br />
                        Transferring phone numbers between telecommunications service providers seems like a logical 
                        feature that should have always existed. However, it took an act of Congress to enable the Federal 
                        Communications Commission to announce that cell phone numbers could be transferred between carriers 
                        beginning last fall. (As if it were so simple that an act of Congress could make it work.).<span class="prHead"> [January 26]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
<!-- Digital Journal.com -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.digitaljournal.com/news/?articleID=3913" target="_blank"><img src="/i/pressroom/digital_journal.gif" alt="Digital Journal" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.digitaljournal.com/news/?articleID=3913" target="_blank">World's Top Coder Takes Home $50,000 in Computing Contest</A></strong></font><br />
                        Czajka began the tournament as the #2 seed, rated second among more than 34,000 developers in the TopCoder online community. 
                        After "out-coding" Jimmy Mardell of Stockholm, Sweden, Bogdan Stanescu of Fairfax, VA, and Jiqing Tang of Hong Kong in the 
                        Championship round, Czajka earned his spot as the highest-rated TopCoder member.<span class="prHead"> [January 9]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />
 
 <!-- Mason Gazette -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://gazette.gmu.edu/articles/index.php?id=5180" target="_blank"><img src="/i/pressroom/mason_gazette.gif" alt="The Daily Mason Gazette" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://gazette.gmu.edu/articles/index.php?id=5180" target="_blank">George Mason Student Wins Third Place in International Coding Competition</A></strong></font><br />
                        Computer science Ph.D. candidate Bogdan Stanescu won third place in the international 2003 TopCoder Open programming tournament 
                        sponsored by Intel. Of the top 4 finishers, he was the only one representing the United States in the contest that concluded in early December. 
                        <span class="prHead"> [January 9]</span></p>
                    </td>
                </tr>
            </table>
            
            <p><br/></p>

<!-- 2003 -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>           
                 
<!-- News Observer Times -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://newsobserver.com/business/technology/story/3118862p-2824913c.html" target="_blank"><img src="/i/pressroom/news_observer.gif" alt="News Observer" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://newsobserver.com/business/technology/story/3118862p-2824913c.html" target="_blank">Cary coder wins contest's top prize</A></strong></font><br />
                        After investing hours of time and traveling about 600 miles from his Cary home to participate in the international competition, Roberts was sure 
                        he had blown his chances in the final round... So he was shocked when his name was called to receive the $10,000 top prize. After hours of fretting, 
                        he was finally at ease.<span class="prHead"> [December 10]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCO Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_12_08_03"><img src="/i/pressroom/tco03_winner.jpg" alt="CRPF" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_12_08_03">Winners Announced in 2003 TopCoder Open sponsored by Intel &#174;</A></strong></font><br />
                        TopCoder announced Tomasz Czajka of Warsaw, Poland, Tim Roberts of Cary, NC, and Rob Nielsen of Carters Ridge, Australia have won the Coding and Component Tournaments.<span class="prHead"> [December 8]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Seattle Times -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?c=1&amp;slug=btdownload08&amp;date=20031208&amp;query=geek+olympics" target="_blank"><img src="/i/pressroom/seattle_times_logo.gif" alt="The Seattle Times" width="135" height="36" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?c=1&amp;slug=btdownload08&amp;date=20031208&amp;query=geek+olympics" target="_blank">'Geek Olympics' features 2 locals</A></strong></font><br />
                        The TopCoder Open - quite possibly the geek equivalent of the Olympics - was held in Connecticut last week and featured two Seattle programmers, 
                        Ben Wilhelm and Mathijs Vogelzang. Both placed in the top 16 out of 1,000 competitors and were able to maintain their rankings in the global-coding 
                        organization.<span class="prHead"> [December 8]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- The Age Times -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.theage.com.au/articles/2003/12/08/1070732124037.html" target="_blank"><img src="/i/pressroom/the_age_logo.gif" alt="The Age" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.theage.com.au/articles/2003/12/08/1070732124037.html" target="_blank">NT programmer wins developer's coding competition</A></strong></font><br />
                        An Australian programmer has once again performed well at the TopCoder coding competitions held at the Mohegan Sun Casino in Uncasville, CT on December 5.<span class="prHead"> [December 8]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Intelligent Enterprise -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.intelligententerprise.com/031210/619celko1_1.shtml" target="_blank"><img src="/i/pressroom/intelligent_enterprise.gif" alt="Intelligent Enterprise" width="135" height="33" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.intelligententerprise.com/031210/619celko1_1.shtml" target="_blank">Code Confessions</A></strong></font><br />
                        You can teach old programmers a new trick, but they still know a better way... But what really brought my aging home was when my company sponsored the 2003 TopCoder Open.<span class="prHead"> [December 8]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CRPF Announcement -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_12_01_03"><img src="/i/pressroom/crpf_winners.gif" alt="CRPF" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_12_01_03">Winners of Charity Programming Tournament Announced</A></strong></font><br />
                        This programming tournament, the first event of its kind, awarded 10 grand prizes.  Four grand prizes were awarded to the fundraisers who raised the most donations for CRPF.  In addition, four grand prizes were awarded to the highest point scorers in the tournament.<span class="prHead"> [December 1]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SJ Mercury article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.bayarea.com/mld/mercurynews/business/7269666.htm" target="_blank"><img src="/i/pressroom/sj_mercury_logo.gif" alt="Mercury" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.bayarea.com/mld/mercurynews/business/7269666.htm" target="_blank">Google puts coders to the test</A></strong></font><br />
                        "Jimmy Mardell, 25, of Stockholm, Sweden, was announced the winner Friday of Google's second annual Code Jam. He beat out more than 5,000 of the world's top programmers who signed up to compete in Google's contest to solve coding problems on deadline" <span class="prHead">&#160;[November 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- 2003 TCO Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_11_12_03"><img src="/i/pressroom/2003_tco_announce.gif" alt="2003 TopCoder Open" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_11_12_03">Finalists Announced for TCO</A></strong></font><br />
                        20 of the World's Best Programmers Will Vie for $130,000 Prize Purse at the 2003 TopCoder Open, Sponsored by Intel&#174;<span class="prHead"> [November 12]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- OSS-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_11_06_03"><img src="/i/pressroom/att_logo.gif" alt="ATT" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_11_06_03">AT&amp;T Foundation to Sponsor Charity Tournament</A></strong></font><br />
                        Telecommunications Giant Supports Christopher Reeve Paralysis Foundation Via Programming Tournament.<span class="prHead">&#160;[November 6]</span></p>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- OSS-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_11_03_03"><img src="/i/pressroom/java_oss.gif" alt="OSS" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_11_03_03">TopCoder Teams with Telecom Leaders in OSS through Java&#153; Initiative</A></strong></font><br />
                        Competitive Software Development Methodology Will Be a Part of Standards Development for Operational Support Systems.<span class="prHead">&#160;[November 3]</span></p>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Mass High Tech article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=63819" target="_blank"><img src="/i/pressroom/mass_high_tech.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=63819" target="_blank">A Call for Leadership</A></strong></font><br />
                        "Does offshore development really reduce costs? Is this the future of IT? Will affirmative answers lead to more layoffs and reduced pay for American IT workers?" <span class="prHead">&#160;[October 20]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CIO article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.cio.com/archive/101503/tl_winner.html" target="_blank"><img src="/i/pressroom/ciocom_logo_1201.gif" alt="cio" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.cio.com/archive/101503/tl_winner.html" target="_blank">Winner's Circle for Sale</A></strong></font><br />
                        "TopCoder, seeking to profit from its contestants' prowess, has created a new division called TopCoder Software that aims to hire out teams of programmers on an outsourced or consulting basis to large corporations." <span class="prHead">[October 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Talbots-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_10_14_03"><img src="/i/pressroom/talbots.gif" alt="talbots" width="135" height="70" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_10_14_03">Talbots Licenses Component Catalog</A></strong></font><br />
                        TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development today announced 
                        that Talbots, a large clothing and specialty retailer, has subscribed to the TopCoder Software .NET Component Catalog. <span class="prHead">[October 14]</span></p>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- artifact northface TCO-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_10_01_03"><img src="/i/pressroom/northface_artifact.gif" alt="intel" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_10_01_03">Artifact and Northface University to sponsor TopCoder Open</A></strong></font><br />
                        Artifact Software and Northface University have signed on as corporate sponsors of the upcoming 2003 TopCoder Open.  Artifact will leverage this international 
                        programming tournament to introduce its suite of products to some of the world's best programmers. Northface University will gain exposure to further their efforts 
                        to establish the finest university in the world for software developers. <span class="prHead">[October 1]</span></p>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Intel TCO-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274" align="center"><A href="/?&amp;t=news_events&amp;c=pr_09_29_03"><img src="/i/pressroom/intel.gif" alt="intel" width="135" height="35" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_29_03">Intel is the Title Sponsor for TopCoder Open</A></strong></font><br />
                        TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced Intel 
                        Corporation as the title sponsor for the 2003 TopCoder Open.  The 2003 TopCoder Open will bring many of the world's best programmers together 
                        in competition for international ranking, notoriety and the $100,000 prize purse, of which $50,000 will be awarded to the tournament champion.<span class="prHead">[September 29]</span></p>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- NVIDIA TCO-->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_09_22_03"><img src="/i/pressroom/nvidia_badge.gif" alt="nvidia" width="135" height="117" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_22_03">NVIDIA To Sponsor 2003 TopCoder Open</A></strong></font><br />
                        TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, today announced NVIDIA as a premier sponsor for its 
                        2003 TopCoder Open.  NVIDIA is seeking exceptional candidates for their open programming positions while continuing to increase exposure of the NVIDIA suite of graphics cards. <span class="prHead">[September 22]</span></p>

                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://finance.lycos.com/qc/news/story.aspx?symbols=PRNEWS:100&amp;story=35762282" target="_blank"><img src="/i/pressroom/lycos_logo_sm.gif" alt="Lycos" width="59" height="20" hspace="3" border="0" /></A></td>
                                <td><A href="http://finance.canada.com/bin/story?StoryId=Cp25ZWbWbtLLnmtm0&amp;Topic=PR_Newswire&amp;Type=&amp;Heading=News%20from%20PR%20Newswire&amp;BC=PR%20Newswire" target="_blank"><img src="/i/pressroom/canada_dotcom_logo_sm.gif" alt="Canada.com" width="102" height="20" hspace="3" border="0" /></A></td>
                            </tr> 
                         </table>

                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- BWO Google article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href=" http://msn-cnet.com.com/2100-1032_3-5078400.html" target="_blank"><img src="/i/pressroom/cnet_news_logo.gif" alt="bwo_logo" width="135" height="36" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href=" http://msn-cnet.com.com/2100-1032_3-5078400.html" target="_blank">Google seeking a few good code jockeys</A></strong></font><br />
                        Google, one of the most aggressive staff recruiters in Silicon Valley, is putting on a programming contest worth up to $10,000 and a possible career at the search company. <span class="prHead">[September 17]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SD Times Article - Battle Royal for Jobs -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.sdtimes.com/news/086/story9.htm" target="_blank"><img src="/i/pressroom/sd_times_logo.gif" alt="SD Times" width="135" height="44" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.sdtimes.com/news/086/story9.htm" target="_blank">TopCoder Software Thrives on Competition</A></strong></font><br />
                        TopCoder Inc., the company that sponsors programming competitions at trade shows, has spun off TopCoder Software as a vehicle for selling software created by the best of the competitors. 

                        <span class="prHead">[September 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SD Times Article - Battle Royal for Jobs -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.informationweek.com/story/showArticle.jhtml?articleID=14704726" target="_blank"><img src="/i/pressroom/info_week_logo.gif" alt="Info Week" width="135" height="20" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.informationweek.com/story/showArticle.jhtml?articleID=14704726" target="_blank">In-House Innovation</A></strong></font><br />
                        Custom code is alive and well and serving a vital role at many companies. Proprietary software, crafted by engineers who are close to a company's inner workings and systems, 
                        continues to be the secret sauce that gives many businesses an edge.

                        <span class="prHead">[September 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- CIO article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.cio.com/archive/091503/staffsurvey.html" target="_blank"><img src="/i/pressroom/ciocom_logo_1201.gif" alt="bwo_logo" width="135" height="60" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.cio.com/archive/091503/staffsurvey.html" target="_blank">What They're Saying About You </A></strong></font><br />
                        "IT staffers have a clear message for their bosses: CIOs better take a break from their budgets and their executive meetings and pay a lot more attention to staff morale" <span class="prHead">[September 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TopCoder Charity Challenge -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_08_13_03"><img src="/i/pressroom/crpf_announce.jpg" alt="CRPF Announcement" width="135" height="100" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_08_13_03">TopCoder Charity Challenge</A></strong></font><br />
                        "By bringing together the world's top programmers to compete in an online tournament fundraiser, significant money will be raised so the world's 
                        top scientists can continue their research to find a cure for paralysis," explained Mitchell Stoller,  President and CEO of the Christopher Reeve 
                        Paralysis Foundation. <span class="prHead">[August 13]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://biz.yahoo.com/prnews/030813/nyw062_1.html" target="_blank"><img src="/i/pressroom/yahoo_finance_logo_sm.gif" alt="Yahoo! Finance" width="149" height="16" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TopCoder Software Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_08_11_03"><img src="/i/pressroom/app_dev_announce.gif" alt="Application Development" width="135" height="72" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_08_11_03">High quality software applications at a low cost</A></strong></font><br />
                        "What makes TopCoder unique among component library vendors is their development strategy," said Rod Davenport, Enterprise Technology Strategist for 
                        DTE Energy (Detroit Edison). TopCoder's strategy ensures quality through rigorous peer review and testing while at the same time providing the 
                        contributors some additional incentive to participate in the process. <span class="prHead">[August 11]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.devx.com/enterprise/HTML/16970" target="_blank"><img src="/i/pressroom/devx_logo_sm.gif" alt="DevX" width="42" height="38" hspace="3" border="0" /></A></td>
                                <td><A href="http://biz.yahoo.com/prnews/030819/nytu051_1.html" target="_blank"><img src="/i/pressroom/yahoo_finance_logo_sm.gif" alt="Yahoo! Finance" width="149" height="16" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Revelation Software Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_07_23_03"><img src="/i/pressroom/revelation_sponsor_announce.gif" alt="Revelation Sponsors the TCO" width="135" height="36" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_07_23_03">TopCoder has a Revelation</A></strong></font><br />
                        "We are delighted to sponsor [the 2003 TopCoder Open]. It's an opportunity for us to show our support for the developer community. Events like this one 
                        bring out the best solutions from the best developers, and those are the type of developers we want," said Mike Ruane, President and CEO of Revelation 
                        Software. <span class="prHead">[July 23]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://biz.yahoo.com/prnews/030723/nyw022_1.html" target="_blank"><img src="/i/pressroom/yahoo_finance_logo_sm.gif" alt="Yahoo! Finance" width="149" height="16" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- VB.NET Added to Competitions -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_07_22_03"><img src="/i/pressroom/dotnet_added_arena.gif" alt="Microsoft VB.NET Added" width="135" height="52" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_07_22_03">I want my VB.NET</A></strong></font><br />
                        "TopCoder is a company created by programmers for programmers, and the addition of VB.NET is yet another validation," said Jack Hughes, founder 
                        and chairman of TopCoder. "Our members have assisted in the design and development of this addition to the competition engine." <span class="prHead">[July 21]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.finanznachrichten.de/nachrichten/artikel-2276932.asp" target="_blank"><img src="/i/pressroom/finanz_nachrichten_logo_sm.gif" alt="Finanz Nachrichten" width="164" height="26" hspace="3" border="0" /></A> <A href="http://biz.yahoo.com/prnews/030721/nym152_1.html" target="_blank"><img src="/i/pressroom/yahoo_finance_logo_sm.gif" alt="Yahoo! Finance" width="149" height="16" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Sweden Added to Competitions -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_06_17_03"><img src="/i/pressroom/sweden_added.gif" alt="Sweden Added" width="135" height="52" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_06_17_03">Sweden Added to TopCoder Developer Community </A></strong></font><br />
                        "We are pleased to welcome the citizens of Sweden to TopCoder's developer community, and are excited about the continued international expansion 
                        of our competitions," said Jack Hughes, Chairman and founder of TopCoder.  "Our Swedish member base continues to grow and in fact, produced a 
                        finalist in our 2003 TopCoder Collegiate Challenge."  <span class="prHead">[June 17]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.nerac.com/webdata/CTC/Soft-2003-8-10.HTM#15" target="_blank"><img src="/i/pressroom/techtrack_logo_sm.gif" alt="TechTrack" width="99" height="20" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- 2003 TCO Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_06_16_03"><img src="/i/pressroom/2003_tco_announce.gif" alt="2003 TopCoder Open" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_06_16_03">Come In, We're Open</A></strong></font><br />
                        "The skill level in the TopCoder tournaments increases dramatically each year and from the caliber of competition we've seen in recent weekly matches, 
                        the 2003 TopCoder Open will be no exception," said Jack Hughes, founder of TopCoder, Inc. "Once again, we are thrilled to bring together the world's 
                        best and brightest programmers for a tournament that promises to deliver plenty of excitement and opportunity." <span class="prHead">[June 16]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.eedesign.com/pressreleases/prnewswire/82547" target="_blank"><img src="/i/pressroom/eetimes_logo_sm.gif" alt="EETimes" width="73" height="18" hspace="3" border="0" /></A> <A href="http://biz.yahoo.com/prnews/030616/nym167_1.html" target="_blank"><img src="/i/pressroom/yahoo_finance_logo_sm.gif" alt="Yahoo! Finance" width="149" height="16" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- 2003 JavaOne Coding Challenge -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_javaone"><img src="/i/pressroom/javaone_event.gif" alt="2003 JavaOne Coding Challenge" width="135" height="40" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_javaone">JavaOne Coding Challenge is Powered by TopCoder</A></strong></font><br />
                        "Sun is dedicated to making the JavaOne conference the essential source for Java technology education and innovation," said Mike Bellissimo, senior 
                        director, Sun Software Developer Marketing and Management. "We are excited that TopCoder will offer onsite attendees a practical application testing 
                        their knowledge of Java technology learned during the JavaOne conference." <span class="prHead">[May 21]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://java.sun.com/industry/news/story/52419-print.do" target="_blank"><img src="/i/pressroom/java_dot_sun_logo_sm.gif" alt="java.sun.com" width="103" height="20" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Amity Wins 2003 TCHS -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_hs"><img src="/i/pressroom/tchs_champions.jpg" alt="Amity wins TCHS" width="135" height="102" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_05_21_03_hs">Amity clinches High School Challenge</A></strong></font><br />
                        Amity Regional Senior High School out-performed 7 other Connecticut high school teams to claim the victory in the tournament, which concluded 
                        yesterday at UConn's Homer Babbidge Library. The team's coach, Frank Barretta, said, "I'm proud of the whole team and we are all grateful to 
                        TopCoder, CAS and UConn for hosting such a great event. We are looking forward to next year." <span class="prHead">[May 21]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://java.sun.com/industry/news/story/52424-print.do" target="_blank"><img src="/i/pressroom/java_dot_sun_logo_sm.gif" alt="java.sun.com" width="103" height="20" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- SD Times Article - Battle Royal for Jobs -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.sdtimes.com/cols/industrywatch_078.htm" target="_blank"><img src="/i/pressroom/sd_times_logo.gif" alt="SD Times" width="135" height="44" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.sdtimes.com/cols/industrywatch_078.htm" target="_blank">Battle royal for jobs</A></strong></font><br />
                        David Rubinstein of Software Development Times writes, "All right, so it's not Tyson and Lewis. Heck, it's not even a 'Celebrity Death Match' 
                        starring Gates and McNealy. But to the finalists of the TopCoder Collegiate Challenge, victory can mean as much as $50,000, the undying 
                        respect of programming peers, and a possible fast track to employment with one of the industry heavyweights." <span class="prHead">[May 15]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- TCHS Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_05_14_03"><img src="/i/pressroom/tchs_logo_white.gif" alt="TopCoder High School" width="135" height="30" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_05_14_03">TopCoder Challenges High School Students</A></strong></font><br />
                        "This competition brings the same platform that we use for college students and professionals every week to these incredibly talented high school 
                        students," said Rob Hughes, President of TopCoder, Inc. "It is clear that these students will be amongst the best and the brightest at whatever institution 
                        they pursue following high school. I'm sure we will see some of these same students in our collegiate and professional tournaments in years to come." 
                        <span class="prHead">[May 14]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.eetimes.com/pressreleases/prnewswire/76344" target="_blank"><img src="/i/pressroom/eetimes_logo_sm.gif" alt="EETimes" width="73" height="18" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- DevX Article - International Collegiate Programming Champion talks shop -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.devx.com/Java/Article/12009" target="_blank"><img src="/i/pressroom/devx_logo.gif" alt="DevX" width="135" height="92" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.devx.com/Java/Article/12009" target="_blank">International Collegiate Programming Champion talks shop</A></strong></font><br />
                        What first got me involved [with TopCoder] was the money. That did a lot to get me the first time, but it quickly became a lot more than that. There 
                        was a time when I was doing it for not a lot of money because I felt I was getting better at competing, and also it really is a lot of fun to solve these 
                        problems. They're sort of like little puzzles, and it's enjoyable to see what the tricks are [necessary to solve them]. <span class="prHead">[April 23]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Java.sun.com Article - TopCoders Vie For College Crown -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://developer.java.sun.com/developer/technicalArticles/Programming/TopCoder/" target="_blank"><img src="/i/pressroom/java_character_sm.gif" alt="java.sun.com" width="135" height="85" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://developer.java.sun.com/developer/technicalArticles/Programming/TopCoder/" target="_blank">TopCoders Vie For College Crown</A></strong></font><br />
                        The 2003 TopCoder Collegiate Challenge began on February 18, 2003, and ended on April 5. With over 10,000 collegiate members on the TopCoder 
                        site, representing over 750 colleges around the world, the tournament's four finalists clearly comprise an elite group of student programmers.  <span class="prHead">[April 17]</span></p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Princeton EQuad News Article - Newlyweds earn nest egg -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.princeton.edu/~seasweb/eqnews/spring03/feature8.html" target="_blank"><img src="/i/pressroom/princeton_equad_logo.gif" alt="Princeton EQuad News" width="135" height="61" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.princeton.edu/~seasweb/eqnews/spring03/feature8.html" target="_blank">Newlyweds earn nest egg</A></strong></font><br />
                        The couple has high aspirations for the ongoing spring competition, particularly for one another. "I think Zhiyan has more potential in the semifinals 
                        than I do," Ruoming said, ignoring Zhiyan's protests to the contrary. "I'm not very comfortable with that style of competition. She's pretty good under 
                        pressure." <span class="prHead">[April 13]</span></p>
                        
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- David Arthur wins 2003 TCCC -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_04_07_03"><img src="/i/pressroom/dgarthur_tccc03_champ.jpg" alt="David Arthur" width="135" height="102" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_04_07_03">David Arthur takes home the Collegiate Challenge crown</A></strong></font><br />
                        "What a great feeling this is to be able to compete against the best programmers in the world. I really didn't think I had much of a chance against these 
                        other guys," said Arthur. "I'm also really thankful to TopCoder, Sun and Nvidia for putting on such an exciting and professional event." <span class="prHead">[April 7]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://www.newswire.ca/releases/April2003/07/c8582.html" target="_blank"><img src="/i/pressroom/canada_newswire_logo_sm.gif" alt="Canada NewsWire" width="51" height="35" hspace="3" border="0" /></A> <A href="http://java.sun.com/industry/news/story/51532.do" target="_blank"><img src="/i/pressroom/java_dot_sun_logo_sm.gif" alt="java.sun.com" width="103" height="20" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- 2003 TCCC Announcment -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="/?&amp;t=news_events&amp;c=pr_03_13_03"><img src="/i/pressroom/tccc03_logo.gif" alt="2003 TopCoder Collegiate Challenge" width="135" height="71" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_03_13_03">2003 Sun Microsystems TopCoder Collegiate Challenge</A></strong></font><br />
                        The 2003 Sun Microsystems and TopCoder Collegiate Challenge brings together the world's highest-rated college-level Java and C&#43;&#43; computer 
                        programmers and members of the TopCoder community. The programmers are ranked based upon their performance during weekly online 
                        competitions and the top ranked members are then invited to participate in four online elimination rounds of regional competition. 
                        <span class="prHead">[March 13]</span></p>
                        
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://java.sun.com/industry/news/story/51041-print.do" target="_blank"><img src="/i/pressroom/java_dot_sun_logo_sm.gif" alt="java.sun.com" width="103" height="20" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

<!-- Seattle Times - Ex-slacker, PLU Grad is world's smartest guy -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=smart010&amp;date=20030201&amp;query=PLU+Grad" target="_blank"><img src="/i/pressroom/seattle_times_logo.gif" alt="The Seattle Times" width="135" height="36" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=smart010&amp;date=20030201&amp;query=PLU+Grad" target="_blank">Ex-slacker, PLU Grad is world's smartest guy </A></strong></font><br />
                        By winning, Nierman receives $500, a plaque he expects to hang in his home office for a laugh, a High IQ T-shirt and a lifetime membership in the society. 
                        The monetary award pales in comparison to the $25,000 he won in 2001 by finishing in the top four of [the TopCoder Collegiate Challenge] 
                        computer-programming competition. <span class="prHead">[February 1]</span></p>
                        
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>