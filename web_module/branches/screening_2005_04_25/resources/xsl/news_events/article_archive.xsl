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

<title>TopCoder Articles Archive</title>

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
                <tr><td class="bodyText"><div align="right"><A href="/?t=news_events&amp;c=index">Current News</A>&#160;&#160;|&#160;&#160;<A href="/?t=news_events&amp;c=press_release_archive">Press Releases Archive</A>&#160;&#160;|&#160;&#160;<strong>Articles Archive</strong></div></td></tr>
            </table>

            <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2005  -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2005</font></td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_04_22_05">How Google Searches - For Talent</A> [April 22 - BusinessWeek]</td></tr>

                            <tr><td class="newsText"><A href="/i/pressroom/SDT_041305.jpg" target="_blank">LogicLibrary, TopCoder Business Brief</A> [April 13 - SDT]</td></tr>

                            <tr><td class="newsText"><A href="http://www.sys-con.com/story/?storyid=49134" target="_blank">LogicLibrary Checks Out TopCoder to Enable SOA</A> [April 9 - .NET Developer's Journal]</td></tr>

                            <tr><td class="newsText"><A href="/i/pressroom/040105.pdf" target="_blank">University computer whiz wins big at tech tourney</A> [April 1 - Barrhaven Independent]</td></tr>

                            <tr><td class="newsText"><A href="http://www.computeruser.com/articles/2404,1,1,1,0401,05.html" target="_blank">Do you have what it takes?</A> [April - ComputerUser]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_02_13_05">Program for life</A> [February 13 - NewsWeek Poland]</td></tr>

                            <tr><td class="newsText"><A href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1" target="_blank">Software Taming Gene Data Pool</A> [February 2 - Wired]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_02_01_05">DE-CODER: The kings of coding</A> [February 1 - ADT]</td></tr>

                            <tr><td class="newsText"><A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html">Code Reuse Pays Off for ING</A> [January 10 - ComputerWorld]</td></tr>

                            <tr><td ><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

<!-- 2004 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2004</font></td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_12_03_04">Top coders seek bigger prize than cash</A> [December 3 - SCMP]</td></tr>

                            <tr><td class="newsText"><A href="/i/pressroom/cnn_110404.pdf">Brain teasers help Google recruit workers</A> [November 4 - CNN]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_10_25_04">Google's creative search for elite programmers</A> [October 25 - Miami Herald]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_10_19_04">Google holds coding contest</A> [October 19 - SJ Mercury]</td></tr>

                            <tr><td class="newsText"><A href="/i/pressroom/tendances_tomek.pdf">Dream Job and Juicy Premiums for Young, Crackshot Programmers</A> [Translation] [October]</td></tr>

                            <tr><td class="newsText"><A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank">Coders win, winners code</A> [October 5 - NewsForge]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_10_03_04">Triple Threat</A> [October - Software Development Magazine]</td></tr>

                            <tr><td class="newsText"><A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank">Hometown hero</A> [October 2 - Brainerd Dispatch]</td></tr>

                            <tr><td class="newsText"><A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank">Outsourcing trend touches independents, too</A> [September 15 - Search CIO]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_08_10_04">Better than You: King of code</A> [August 10 - Red Herring]</td></tr>

                            <tr><td class="newsText"><A href="http://www.devx.com/Java/Article/21602" target="_blank">The Smart Choice for Smart Clients: J2EE or .NET?</A> [July 27 - devX]</td></tr>

                            <tr><td class="newsText"><A href="http://www.computerworld.com/managementtopics/outsourcing/story/0,10801,94452,00.html" target="_blank">BearingPoint Move Raises China's Profile</A> [July 12 - ComputerWorld]</td></tr>

                            <tr><td class="newsText"><A href="http://builder.com.com/5100-6370_14-5260946.html" target="_blank">CNET engineer wins JavaOne Coding Challenge</A> [July 9 - Builder.com]</td></tr>

                            <tr><td class="newsText"><A href="http://java.sun.com/javaone/top_coder.html" target="_blank">JavaOne Coding Challenge: Meet the Best</A> [July 1 - Sun]</td></tr>

                            <tr><td class="newsText"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=65934" target="_blank">Focus on software talent</A> [June 21 - Mass High Tech]</td></tr>

                            <tr><td class="newsText"><A href="/i/pressroom/FastCompany0704.pdf" target="_blank">"There are good people everywhere"</A> [July - Fast Company]</td></tr>

                            <tr><td class="newsText"><A href="http://java.sun.com/developer/technicalArticles/Programming/TopCoder2004/" target="_blank">Who's the Best Coder?</A> [June - Sun]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_06_01_04">Cracking the Hiring Code</A> [June 1 - Workforce Management]</td></tr>

                            <tr><td class="newsText"><A href="http://online.wsj.com/article_email/0,,SB108605863196125506-IVjeoNllaV3nJunZXSGcaaBm4,00.html" target="_blank">Win in a Corporate Competition, Land on Square That Offers a Job</A> [June 1 - WSJ]</td></tr>

                            <tr><td class="newsText"><A href="http://www.upi.com/view.cfm?StoryID=20040525-104135-2776r" target="_blank">The Web: Search engine wars flare online</A> [May 26 - UPI]</td></tr>

                            <tr><td class="newsText"><A href="/?&amp;t=news_events&amp;c=art_04_29_04">And The Champion Coders Are...</A> [April 29 - BusinessWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://biz.yahoo.com/prnews/040422/dcth080_1.html" target="_blank">ASA Honors Po-Shen Loh</A> [April 22 - Yahoo!]</td></tr>

                            <tr><td class="newsText"><A href="http://www.tmcnet.com/usubmit/2004/Apr/1033792.htm" target="_blank">Java Technology Spreads Like Wildfire at JavaOne</A> [April 21 - TMCNET]</td></tr>

                            <tr><td class="newsText"><A href="http://www.businessweek.com/technology/content/apr2004/tc20040413_3592_tc146.htm" target="_blank">Hiring Techies Is as Tricky as Ever</A> [April 13 - BusinessWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://www.fortune.com/fortune/print/0,15935,594536,00.html" target="_blank">Geek Gods</A> [March 5 - Fortune]</td></tr>

                            <tr><td class="newsText"><A href="http://www.masshightech.com/displayarticledetail.asp?art_id=64966&amp;cat_id=3" target="_blank">Regional programmers take the TopCoder challenge</A> [March 1 - Mass High Tech]</td></tr>

                            <tr><td class="newsText"><A href="http://www.computerworld.com/developmenttopics/development/story/0,10801,89274,00.html?SKC=development-89274" target="_blank">Standards penetrate telecom industry</A> [January 26 - Computer World]</td></tr>

                            <tr><td class="newsText"><A href="http://www.digitaljournal.com/news/?articleID=3913" target="_blank">World's Top Coder Takes Home $50,000 in Computing Contest</A> [January 9 - Digital Journal.com]</td></tr>

                            <tr><td class="newsText"><A href="http://gazette.gmu.edu/articles/index.php?id=5180" target="_blank">George Mason Student Wins Third Place in International Coding Competition</A> [January 9 - Mason Gazette]</td></tr>

                            <tr><td ><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

<!-- 2003 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>

                            <tr><td class="newsText"><A href="http://newsobserver.com/business/technology/story/3118862p-2824913c.html" target="_blank">Cary coder wins contest's top prize</A> [December 10 - News &amp; Observer]</td></tr>

                            <tr><td class="newsText"><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?c=1&amp;slug=btdownload08&amp;date=20031208&amp;query=geek+olympics" target="_blank">'Geek Olympics' features 2 locals</A> [December 8 - Seattle Times]</td></tr>

                            <tr><td class="newsText"><A href="http://www.theage.com.au/articles/2003/12/08/1070732124037.html" target="_blank">NT programmer wins developer's coding competition</A> [December 8 - The Age]</td></tr>

                            <tr><td class="newsText"><A href="http://www.intelligententerprise.com/031210/619celko1_1.shtml" target="_blank">Code Confessions</A> [December 8 - Intelligent Enterprise]</td></tr>

                            <tr><td class="newsText"><A href="http://www.bayarea.com/mld/mercurynews/business/7269666.htm" target="_blank">Google puts coders to the test</A> [November 15 - SJM]</td></tr>

                            <tr><td class="newsText"><A href="http://www.masshightech.com/displayarticledetail.asp?Art_ID=63819" target="_blank">A Call for Leadership</A> [October 20 - MHT]</td></tr>

                            <tr><td class="newsText"><A href="http://www.cio.com/archive/101503/tl_winner.html" target="_blank">Winner's Circle for Sale</A> [October 15 - CIO]</td></tr>

                            <tr><td class="newsText"><A href="http://msn-cnet.com.com/2100-1032_3-5078400.html" target="_blank">Google seeking a few good code jockeys</A> [September 17 - CNET News.com]</td></tr>

                            <tr><td class="newsText"><A href="http://www.cio.com/archive/091503/staffsurvey.html" target="_blank">What They're Saying About You</A> [September 15 - CIO]</td></tr>

                            <tr><td class="newsText"><A href="http://www.sdtimes.com/cols/industrywatch_078.htm" target="_blank">Battle royal for jobs</A> [May 15 - SD Times]</td></tr>

                            <tr><td class="newsText"><A href="http://www.devx.com/Java/Article/12009" target="_blank">International Collegiate Programming Champion talks shop</A> [April 23 - DevX]</td></tr>

                            <tr><td class="newsText"><A href="http://developer.java.sun.com/developer/technicalArticles/Programming/TopCoder/" target="_blank">TopCoders Vie For College Crown</A> [April 17 - java.sun.com]</td></tr>

                            <tr><td class="newsText"><A href="http://www.princeton.edu/~seasweb/eqnews/spring03/feature8.html" target="_blank">Newlyweds earn nest egg</A> [April 13 - Princeton EQuad News]</td></tr>

                            <tr><td class="newsText"><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=smart010&amp;date=20030201&amp;query=PLU+Grad" target="_blank">Ex-slacker, PLU Grad is world's smartest guy</A> [February 2 - Seattle Times]</td></tr>

                            <tr><td ><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

<!-- 2002 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2002</font></td></tr>

                            <tr><td class="newsText"><A href="http://www.computerworld.com/careertopics/careers/story/0,10801,76488,00.html" target="_blank">Need Coders?</A> [December 9 - Computerworld]</td></tr>

                            <tr><td class="newsText"><A href="http://www.computerworld.com/careertopics/careers/story/0,10801,76427,00.html" target="_blank">And the Winner Is...</A> [December 9 - Computerworld]</td></tr>

                            <tr><td class="newsText"><A href="http://www.mndaily.com/article.php?id=4148" target="_blank">U computer programmers take first place in contest</A> [November 18 - The Minnesota Daily]</td></tr>

                            <tr><td class="newsText"><A href="http://builder.com.com/article.jhtml?id=u00220021106adm01.htm&amp;rcode=&amp;page=1" target="_blank">You'll find more than competitions at TopCoder these days</A> [November 13 - Builder.com]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20021018S0027" target="_blank">FBI Tries E-Recruiting</A> [October 21 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20021014S0002" target="_blank">A Chance To Win A Contest And A Job</A> [October 14 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://www.business2.com/articles/mag/0,1640,42225,00.html">Show Me the C++</A>[August 7 - Business2.0]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_drdobbs2">And the winner is...</A> [May 1 - Dr. Dobb's]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_contratimes">Computer wiz takes on high on-line stakes</A> [April 10 - Contra Costa Times]</td></tr>

                            <tr><td class="newsText"><A href="http://www.stanforddaily.com/tempo?page=content&amp;id=7865&amp;repository=0001_article" target="_blank">Students advance to TopCoders finals</A> [April 8 - The Stanford Daily]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_marietta">Georgia Tech computer science major to compete in TopCoder . . .</A> [April 6 - Marietta Daily Journal]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_dnvrbizjrnl2">Coder wins big in contests</A> [April 5 - Denver Business Journal]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_clevplain">Digital Playground</A> [April 1 - The Plain Dealer]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20020228S0016" target="_blank">Software Jocks Vie For The Prize</A> [March 4 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20020227S0002" target="_blank">Cultivating Next-Generation IT Talent</A> [February 27 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="http://www.stanforddaily.com/tempo?page=content&amp;id=7592&amp;repository=0001_article" target="_blank">Annual coding competition features student entrants</A> [February 22 - The Stanford Daily]</td></tr>

                            <tr><td ><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>

<!-- 2001 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2001</font></td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_rmnews">Whiz cracks contest code</A> [December 20]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_esj">Sun Sponsors Collegiate Developer Tournament</A> [December 18]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_javaboutique">Sun Microsystems Launches New Way to Reach Java Community . . .</A> [December 17]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_cnet_dec10">Students to compete in Java, C++</A> [December 10]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_brndwk">Sun Microsystems Named Exclusive Sponsor of Computer Challenge</A> [December 10]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_darwin">Five Thoughts about Hiring IT Professionals</A> [December 10]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_houstonchron2">College student outpaces rivals to win contest</A> [November 26]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_mht3">Chips &amp; Drivers: It's a digital shootout at Java corral . . .</A> [November 12]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_lafayettenews">Wright second in TopCoder event</A> [November 12]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20011111S0004" target="_blank">Programmer Wows 'Em</A> [November 12 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_ga_technique">Tech student makes TopCoder semifinals</A> [November 9]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_citybiz">In Depth: High tech survivors</A> [November 9]</td></tr>

                            <tr><td class="newsText"><A href="http://www.informationweek.com/story/IWK20011108S0013" target="_blank">College Junior Wins Programming Contest--And $100K</A> [November 8 - InformationWeek]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_stanforddaily2">TopCoders return rich, triumphant</A> [November 7]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_cornell">Grad Student Emerges at TopCoder '01</A> [November 6]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_courant2">'TopCoder' Outwits His Rivals</A> [November 4]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_cio_trendlines">Performance Metrics - Code for Cash</A> [November 1]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_ucf">Computer Wizard a Finalist for $100,000 Prize</A> [October 31]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_dnvrbizjrnl">Colorado native among nation's top programmers</A> [October 26]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_stanforddaily">TopCoders battle for top prize</A> [October 24]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_oberlin">Oberlin College Student Competes in TopCoder Tournament</A> [October 18]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_sfbiztimes">Geekletes descend upon programming contest</A> [October 12]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_dailyneb">Students compute, compete for dollars on Web site</A> [September 26]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_wenatchee">'Not a typical computer nerd'</A> [September 12]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_bglobe">The new rules</A> [September 10]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_mht2">TopCoder Inc. offers challenge to top programmers</A> [September 4]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_softdev">If You Build It, They Will Come . . .</A> [September 1]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_geekcom">Coding competition for cash</A> [August 30]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_ideamarketers">Programmers Compete For Cash and Recognition</A> [August 24]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_micheng">EECS students excel in computing competitions</A> [July 27]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_vatech">Virginia Tech student places 5th in national computer programming . . .</A> [July 16]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_wpi">Marut Competes in Top Coder Contest</A> [July 12]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_avidpro">Gladiator geeks...</A> [July 2]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_techrepublic">Test your mettle at TopCoder.com</A> [June 26]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_univmich">EECS Students Winners in TopCoder Collegiate Challenge</A> [June 25]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_mht">Code warrior hits big time</A> [June 18]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_stargazette">Erin native wins $100,000 in contest</A> [June 8]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_pcmag">You Are the Fastest Coder</A> [May 29]</td></tr>

                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_courant">A Game Of Their Own</A> [April 24]</td></tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
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