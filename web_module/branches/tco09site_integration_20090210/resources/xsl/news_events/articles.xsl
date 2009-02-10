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

<title>TopCoder: Press Releases and Articles in other publications</title>

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
        <td width="6"><img src="/i/clear.gif" width="6" height="5" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">Articles</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr><td class="bodyText"><div align="right"><A href="/tc?module=Static&amp;d1=pressroom&amp;d2=index">Go to Press Releases</A></div></td></tr>
            
                <tr valign="top">
                    <td class="bodyText" width="100%">          
                        <table width="100%" border="0" cellpadding="4" cellspacing="0">

<!-- 2003 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2003</font></td></tr>
                            
                            <tr><td class="newsText"><A href="http://www.sdtimes.com/cols/industrywatch_078.htm" target="_blank">Battle Royal for Jobs</A> [May 15 - SD Times]</td></tr>    
                
                            <tr><td class="newsText"><A href="http://www.devx.com/cplus/article/12009" target="_blank">International Collegiate Programming Champion Talks Shop</A> [April 23 - DevX]</td></tr>  
                    
                            <tr><td class="newsText"><A href="http://www.princeton.edu/~seasweb/eqnews/spring03/feature8.html" target="_blank">Newlyweds Earn Nest Egg</A> [April 13 - EQuad News]</td></tr> 
                     
                            <tr><td class="newsText"><A href="http://archives.seattletimes.nwsource.com/cgi-bin/texis.cgi/web/vortex/display?slug=smart010&amp;date=20030201&amp;query=World%27s+Smartest+Guy" target="_blank">2001 TopCoder Collegiate Challenge Winner is World's Smartest Guy</A> [February 1 - The Seattle Times]</td></tr>  

                            <tr><td ><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
        
<!-- 2003 -->
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
        
<!-- 2003 -->
                            <tr><td class="statTextBig" bgcolor="#858B91"><font size="3">2001</font></td></tr>
                            
                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_rmnews">Whiz cracks contest code</A> [December 20]</td></tr>
     
                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_esj">Sun Sponsors Collegiate Developer Tournament</A> [December 18]</td></tr>
     
                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_javaboutique">Sun Microsystems Launches New Way to Reach Java Community . . .</A> [December 17]</td></tr>
     
                            <tr><td class="newsText"><A href="/index?t=news_events&amp;c=article_cnet_dec10">Students to compete in Java, C++ </A> [December 10]</td></tr>
     
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
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
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
