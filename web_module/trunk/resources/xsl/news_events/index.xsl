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
            
<!-- 2004 -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

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