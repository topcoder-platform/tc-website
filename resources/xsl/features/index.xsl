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
<!-- 2003 Features -->
                        <table width="100%" border="0" cellpadding="3" cellspacing="0">
                            <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong>2003 Features</strong></font></td></tr>        

                            <tr valign="middle">
                                <td width="20%" class="bodySubtitle"><strong>Date</strong></td>
                                <td width="20%" class="bodySubtitle"><strong>Author</strong></td>
                                <td width="60%" class="bodySubtitle"><strong>Feature</strong></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 24</td>
                                <td valign="middle" class="bodyText">Modulator</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_102403" class="bodyText">Challenging 101</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">September 17</td>
                                <td valign="middle" class="bodyText">goongas</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_091703" class="bodyText">A Crash Course in the Java Collections Framework</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 28</td>
                                <td valign="middle" class="bodyText">Yarin</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_082803" class="bodyText">A Crash Course in the C++ STL</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 29</td>
                                <td valign="middle" class="bodyText">Pops</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_072903" class="bodyText">The TopCoder Design Contest #2</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 10</td>
                                <td valign="middle" class="bodyText">vorthys</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_071003" class="bodyText">Immutable Objects</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 26</td>
                                <td valign="middle" class="bodyText">slowjoe</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_062603" class="bodyText">Simple Performance Improvement</A></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">May 27</td>
                                <td valign="middle" class="bodyText">schveiguy</td>
                                <td valign="middle" class="bodyText"><A href="/index?t=features&amp;c=feat_052703" class="bodyText">Threads and Atomicity</A></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">April 8</td>
                                <td valign="middle" class="bodyText">nicomp</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_040803" class="bodyText">TopCoder Competitions vs. The Real World</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">March 17</td>
                                <td valign="middle" class="bodyText">srowen</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_031703" class="bodyText">Component-Based Development: TopCoder Style</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">February 20</td>
                                <td valign="middle" class="bodyText">David Tanacea</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_022003" class="bodyText">Component-Based Development: Why Hasn't the Vision Met Reality?</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 22</td>
                                <td valign="middle" class="bodyText">the_gigi</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_012203" class="bodyText">Who needs another UI framework?</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">January 8</td>
                                <td valign="middle" class="bodyText">radeye</td>
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
                                <td valign="middle" class="bodyText">KaiEl</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_122002" class="bodyText">The Big Rerun</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">December 9</td>
                                <td valign="middle" class="bodyText">KaiEl</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_120902" class="bodyText">It's Sink or Swim During the Challenge Phase</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">November 20</td>
                                <td valign="middle" class="bodyText">leadhyena_inran</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_112002" class="bodyText">The eight seconds of death: Tips on preventing timeout</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">November 13</td>
                                <td valign="middle" class="bodyText">RevenantChaos</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_111302" class="bodyText">King of the Silicon Hill: Today's High-End Microprocessors</a></td>
                            </tr>
                
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 9</td>
                                <td valign="middle" class="bodyText">Penwiper</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100902" class="bodyText">Graphics Programming for Motion Capture</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">October 2</td>
                                <td valign="middle" class="bodyText">pearl</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_100202" class="bodyText">Finding a Job is a Job</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">September 11</td>
                                <td valign="middle" class="bodyText">KaiEl</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_091102" class="bodyText">...A Problem is Born</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 21</td>
                                <td valign="middle" class="bodyText">polgara</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_082102" class="bodyText">Wireless Woes and Winners</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">August 7</td>
                                <td valign="middle" class="bodyText">KaiEl</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_080702" class="bodyText">Match Strategy</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 24</td>
                                <td valign="middle" class="bodyText">polgara</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_072402" class="bodyText">Attack of the Moans: Building Applications for Users</a></td>
                            </tr>
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">July 10</td>
                                <td valign="middle" class="bodyText">bitbucket43</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_071002" class="bodyText">From the Field - Avoid Overloading!</a></td>
                            </tr>

                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 26</td>
                                <td valign="middle" class="bodyText">kpsmith</td>
                                <td valign="middle" class="bodyText"><a href="/index?t=features&amp;c=feat_062602" class="bodyText">From the Field</a></td>
                            </tr>        
                            
                            <tr>
                                <td valign="middle" class="bodyText" height="14">June 12</td>
                                <td valign="middle" class="bodyText">polgara</td>
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
                                <td valign="middle" class="bodyText">KaiEl</td>
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
