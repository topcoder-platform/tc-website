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
            
<!-- 2003 -->
            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>
            </table>
            
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
                 
<!-- BWO Google article -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="274"><A href="http://www.businessweek.com/technology/cnet/stories/5078400.htm" target="_blank"><img src="/i/pressroom/bwo_logo.gif" alt="bwo_logo" width="135" height="25" border="0" /></A></td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"/></td>
                    <td width="99%" class="bodyText">
                        <p><font size="3"><strong><A href="http://www.businessweek.com/technology/cnet/stories/5078400.htm" target="_blank">Google seeking a few good code jockeys</A></strong></font><br />
                        "Google, one of the most aggressive staff recruiters in Silicon Valley, is putting on a programming contest worth up to $10,000 and a possible career at the search company. <span class="prHead">[September 24]</span></p>
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
                        <p><font size="3"><strong><A href="/?&amp;t=news_events&amp;c=pr_09_22_03">NVIDIA Signs On To Sponsor 2003 TopCoder Open</A></strong></font><br />
                        "TopCoder, Inc., the leader in on-line programming competition, skills assessment and competitive software development, today announced NVIDIA as a premier sponsor for its 
                        2003 TopCoder Open.  NVIDIA is seeking exceptional candidates for their open programming positions while continuing to increase exposure of the NVIDIA suite of graphics cards. <span class="prHead">[September 22]</span></p>

                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="prOtherPubs">AS SEEN ON:</td>
                                <td><A href="http://finance.lycos.com/qc/news/story.aspx?symbols=PRNEWS:100&amp;story=35762282" target="_blank"><img src="/i/pressroom/lycos_logo_sm.gif" alt="Lycos" width="59" height="20" hspace="3" border="0" /></A></td>
                                <td><A href="http://finance.canada.com/bin/story?StoryId=Cp25ZWbWbtLLnmtm0&amp;Topic=PR_Newswire&amp;Type=&amp;Heading=News%20from%20PR%20Newswire&amp;BC=PR%20Newswire" target="_blank"><img src="/i/pressroom/canada_dotcom_logo_sm.gif" alt="Canada.com" width="140" height="27" hspace="3" border="0" /></A></td>
                            </tr>
                         </table>

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

            <hr width="100%" size="1" noshade="noshade" />

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
