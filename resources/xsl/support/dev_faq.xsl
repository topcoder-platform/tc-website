<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl" />
  <xsl:import href="../script.xsl" />
  <xsl:import href="../includes/body_top.xsl" />  
  <xsl:import href="../foot.xsl" />
  <xsl:import href="../includes/modules/practice_room.xsl" />
  <xsl:import href="../includes/modules/calendar.xsl" />
  <xsl:import href="../includes/global_left.xsl" /> 
  <xsl:import href="../includes/public_right_col.xsl" />     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
  <xsl:template match="/">
<html>
<head>

    <xsl:call-template name="Preload" />      

<title>Development FAQ for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      
 
<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left" />
        </td>
    <!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%"><IMG src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0" /><br />
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">support</xsl:with-param>
            <xsl:with-param name="title">Development FAQ</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <IMG src="/i/clear.gif" width="10" height="5" alt="" border="0" /><br />
                        
                        <p class="bodySubtitle">This text makes up Subtitle 1</p><!-- Use subtitles only if necessary to break up many questions into categories -->
                        
                        <p><A href="#1" class="bodyText">What would be the best way to word Question 1?</A></p>
                                
                        <p><A href="#2" class="bodyText">How about Question 2?</A></p>
                            
                        <p><A href="#3" class="bodyText">Maybe you'll think of something for Question 3?</A></p>

                        <p class="bodySubtitle">This text makes up Subtitle 2</p><!-- Use subtitles only if necessary to break up many questions into categories -->
                        
                        <p><A href="#4" class="bodyText">Certainly you can figure out how to word Question 4?</A></p>

                        <p><A href="#5" class="bodyText">Fifth times' the charm for Question 5?</A></p>

                        <p><strong>More Questions? </strong><A href="/?t=contacts&amp;c=index" class="bodyText"><strong>Contact Us</strong></A></p>
                      
                        <IMG src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

                        <p><A name="1" class="bodyText"><strong>What would be the best way to word Question 1?</strong></A><br />
                        Points are determined based on two factors: the difficulty of the problem and time it took to code once it was opened. 
                        The longer it takes to code, the fewer points will be awarded upon submission, and vice versa. 
                        <nobr><A href="#top" class="bodyText">[back to top]</A></nobr></p>
                                    
                        <p><A name="2" class="bodyText"><strong>How about Question 2?</strong></A><br />
                        There is no advancement for the Single Round Matches.  For tournaments, at the end of each round, a certain number 
                        of coders from each arena (room) will advance to the next round. The number of coders who advance will depend on 
                        the structure of the specific tournament. A specific tournament's advancement structure can be viewed under the 
                        details of a specific tournament. In all cases, in order to be considered for advancement, a coder must have either 
                        submitted a problem or a submitted a challenge. Otherwise, we would have nothing to go on! 
                        <nobr><A href="#top" class="bodyText">[back to top]</A></nobr></p>
                                    
                        <p><A name="3" class="bodyText"><strong>Maybe you'll think of something for Question 3?</strong></A><br />
                        In the event that there is a tie, the rules vary for each event.  Check the tie breaker rules for a specific 
                        event under the Tournaments section of the web site. 
                        <nobr><A href="#top" class="bodyText">[back to top]</A></nobr></p>
                                    
                        <p><A name="4" class="bodyText"><strong>Certainly you can figure out how to word Question 4?</strong></A><br />
                        Rating events occur at the completion of every round, following the system tests. 
                        Single round matches and tournament rounds are considered rated events, and therefore rating will be adjusted 
                        after each.  Finishing first and advancing does not necessarily guarantee your rating will go up. It is 
                        based on your performance compared everyone else participating in that round, taking into account relative 
                        ratings. 
                        <nobr><A href="#top" class="bodyText">[back to top]</A></nobr></p>
                                    
                        <p><A name="5" class="bodyText"><strong>Fifth times' the charm for Question 5?</strong></A><br />
                        That's exactly what we're saying. The reason the point system needs to be so complex is so that ties are avoided. 
                        Time is the only factor we could use to differentiate two coders who otherwise did the same work. 
                        <nobr><A href="#top" class="bodyText">[back to top]</A></nobr></p>
                            
                        <IMG src="/i/clear.gif" width="5" height="5" alt="" border="0" /><br />
                    </td>
                </tr>
            </table>       
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins-->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <xsl:call-template name="public_right_col" />       
        </td>
<!-- Right Column Ends -->

<!-- Gutter begins-->
        <td width="10"><IMG src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!--Footer begins-->
    <xsl:call-template name="Foot" />
<!--Footer ends-->

</body>
</html>

    </xsl:template>
</xsl:stylesheet>

