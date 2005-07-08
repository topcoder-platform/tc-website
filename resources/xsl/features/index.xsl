<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>
 
<xsl:call-template name="Preload" />      

<title>Feature articles written by TopCoder members</title>

<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/spacer.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
            
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">Feature Article Archive</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr><td height="3"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
                <tr valign="top">
                    <td class="bodyText" width="100%">         
<!-- 2005 Features -->
                        <table width="100%" border="0" cellpadding="3" cellspacing="0">
                            <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>2005 Features</strong></font></td></tr>        

                            <tr valign="middle">
                                <td width="20%" class="bodySubtitle"><strong>Date</strong></td>
                                <td width="20%" class="bodySubtitle"><strong>Author</strong></td>
                                <td width="60%" class="bodySubtitle"><strong>Feature</strong></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 8</td>
                                <td valign="middle" class="bodyText"><a class="bodyText" href="/tc?module=MemberProfile&amp;cr=7371063">supernova</a></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=070805" class="bodyText">The Story of Petr Mitrichev - Target in Six Steps</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 4</td>
                                <td valign="middle" class="bodyText"><a class="bodyText" href="/tc?module=MemberProfile&amp;cr=7465390">Dan[Popovici]</a> &amp; <a class="bodyText" href="/tc?module=MemberProfile&amp;cr=294328">mariusmuja</a></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=050305" class="bodyText">Using Regular Expressions</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 25</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=042505" class="bodyText">The Design Process - Section 4: the wrap up</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 19</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=041905" class="bodyText">The Design Process - Section 3: appeals phase do's</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 11</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=041105" class="bodyText">The Design Process - Section 2: appeals phase don'ts</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 4</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=features&amp;d2=040405" class="bodyText">The Design Process - Section 1: some advice</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">March 2</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=269886">n0vice</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_030205" class="bodyText">Performance and Optimization in the "Real World"</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">February 9</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=8357090">misof</A></td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=Static&amp;d1=tutorials&amp;d2=complexity1" class="bodyText">Computational Complexity: Section 1</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 5</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=276230">dimkadimon</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_010505" class="bodyText">Mathematics for TopCoders</A></td>
                            </tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        </table>

                        <table width="100%" border="0" cellpadding="3" cellspacing="0">
                            <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>2004 Features</strong></font></td></tr>        

                            <tr valign="middle">
                                <td width="20%" class="bodySubtitle"><strong>Date</strong></td>
                                <td width="20%" class="bodySubtitle"><strong>Author</strong></td>
                                <td width="60%" class="bodySubtitle"><strong>Feature</strong></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">December 7</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=10407399">timmac</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_120704" class="bodyText">More on Encryption and Security</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">November 2</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=10407399">timmac</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_110204" class="bodyText">Encryption Algorithms</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 4</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=159052">lbackstrom</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_100404b" class="bodyText">The Importance of Algorithms</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 4</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=10135324">AryanI</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_100404" class="bodyText">Peer 2 Fear: Solutions for developers for designing secure P2P applications</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">September 1</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=282560">leadhyena_inran</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_090104" class="bodyText">On Sentinels</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 3</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=156859">ivern</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_080304" class="bodyText">Reviewing Software for Fun and Profit</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 7</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=276230">dimkadimon</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_070704" class="bodyText">Healthy Computing</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 2</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=251184">dplass</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_060204" class="bodyText">Java for C++ coders, and vice versa</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 29</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=251184">dplass</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_042904" class="bodyText">All I really need to know about Software Development I learned from TopCoder</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 1</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=299177">vorthys</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_040104" class="bodyText">Dynamic Programming</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">March 1</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=290395">pmadden</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_030104" class="bodyText">The Educational Component of TopCoding</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">February 10</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_021004" class="bodyText">The 5 Most Common Design Mistakes</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 14</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=251184">dplass</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_011404" class="bodyText">An Enterprise Java Overview</A></td>
                            </tr>
                            
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        </table>

                        <table width="100%" border="0" cellpadding="3" cellspacing="0">
                            <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>2003 Features</strong></font></td></tr>        

                            <tr valign="middle">
                                <td width="20%" class="bodySubtitle"><strong>Date</strong></td>
                                <td width="20%" class="bodySubtitle"><strong>Author</strong></td>
                                <td width="60%" class="bodySubtitle"><strong>Feature</strong></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">December 22</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=273434">Eeyore</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_122203" class="bodyText">Not Round, Not a Table</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 24</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=299709">Modulator</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_102403" class="bodyText">Challenging 101</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">September 17</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=271144">goongas</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_091703" class="bodyText">A Crash Course in the Java Collections Framework</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 28</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=269554">Yarin</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_082803" class="bodyText">A Crash Course in the C++ STL</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 29</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=119676">Pops</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_072903" class="bodyText">The TopCoder Design Contest #2</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 10</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=299177">vorthys</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_071003" class="bodyText">Immutable Objects</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 26</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=271917">slowjoe</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_062603" class="bodyText">Simple Performance Improvement</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 27</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=273217">schveiguy</A></td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_052703" class="bodyText">Threads and Atomicity</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 8</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=303718">nicomp</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_040803" class="bodyText">TopCoder Competitions vs. The Real World</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">March 17</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=296145">srowen</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_031703" class="bodyText">Component-Based Development: TopCoder Style</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">February 20</td>
                                <td valign="middle" class="bodyText">David Tanacea</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_022003" class="bodyText">Component-Based Development: Why Hasn't the Vision Met Reality?</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 22</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=292607">the_gigi</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_012203" class="bodyText">Who needs another UI framework?</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 8</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=277659">radeye</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_010803" class="bodyText">Functional Programming</a></td>
                            </tr>

                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        </table>
        
<!-- 2002 Features -->
                        <table width="100%" border="0" cellpadding="3" cellspacing="0">
                            <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>2002 Features</strong></font></td></tr>        

                            <tr valign="middle">
                                <td width="20%" class="bodySubtitle"><strong>Date</strong></td>
                                <td width="20%" class="bodySubtitle"><strong>Author</strong></td>
                                <td width="60%" class="bodySubtitle"><strong>Feature</strong></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">December 20</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=264761">KaiEl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_122002" class="bodyText">The Big Rerun</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">December 9</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=264761">KaiEl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_120902" class="bodyText">It's Sink or Swim During the Challenge Phase</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">November 20</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=282560">leadhyena_inran</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_112002" class="bodyText">The eight seconds of death: Tips on preventing timeout</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">November 13</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=295939">RevenantChaos</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_111302" class="bodyText">King of the Silicon Hill: Today's High-End Microprocessors</a></td>
                            </tr>
                
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 9</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=150527">Penwiper</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100902" class="bodyText">Graphics Programming for Motion Capture</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 2</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=274323">pearl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100202" class="bodyText">Finding a Job is a Job</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">September 11</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=264761">KaiEl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_091102" class="bodyText">...A Problem is Born</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 21</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=153650">polgara</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_082102" class="bodyText">Wireless Woes and Winners</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 7</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=264761">KaiEl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_080702" class="bodyText">Match Strategy</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 24</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=153650">polgara</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_072402" class="bodyText">Attack of the Moans: Building Applications for Users</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 10</td>
                                <td valign="middle" class="bodyText">bitbucket43</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_071002" class="bodyText">From the Field - Avoid Overloading!</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 26</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=277956">kpsmith</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_062602" class="bodyText">From the Field</a></td>
                            </tr>        
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 12</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=153650">polgara</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_061202" class="bodyText">To in-house or to out-source, that is the question</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 5</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_060502" class="bodyText">Where Has The Time Gone?</a></td></tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 29</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_052902" class="bodyText">The Outsiders</a></td>
                            </tr>        
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 22</td>
                                <td valign="middle" class="bodyText"><A href="/tc?module=MemberProfile&amp;cr=264761">KaiEl</A></td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_052202" class="bodyText">Obfu-What?</a></td>
                            </tr>        
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 15</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_051502" class="bodyText">First Time Phenomenal</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 8</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_050802" class="bodyText">Working Their Way Up</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 1</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_050102" class="bodyText">The Women of TopCoder</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 24</td>
                                <td valign="middle" class="bodyText">TopCoder Staff</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=statistics&amp;c=2002tccc_feature" class="bodyText">A Matter of Time</a></td>
                            </tr>
                            
                            <tr><td valign="middle" class="bodyText" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
                        </table>
                        
                        <p><a href="/index?t=features&amp;c=feat_topics">Write feature articles for TopCoder.com</a></p>
                        
                        <p><br/></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
        <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

</xsl:template>
</xsl:stylesheet>
