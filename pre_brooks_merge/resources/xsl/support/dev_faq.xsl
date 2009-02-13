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
                        
                        <p class="bodySubtitle">Component Submissions</p><!-- Use subtitles only if necessary to break up many questions into categories -->
                        
                        <p><A href="#1" class="bodyText">I've inquired. What's next?</A></p>
                                
                        <p><A href="#2" class="bodyText">How do I go about doing a design?</A></p>
                            
                        <p><A href="#3" class="bodyText">Can other TopCoder components be used in my design?</A></p>
                        
                        <p><A href="#3" class="bodyText">Can 3rd party components be used in my design?</A></p>
                        
                        <p><A href="#3" class="bodyText">What software do I need to get started?</A></p>
                        
                        <p><A href="#3" class="bodyText">What are unit test cases?</A></p>
                        
                        <p><A href="#3" class="bodyText">Do I have to use Poseidon? Can't I just submit images of my diagrams?</A></p>
                        
                        <p><A href="#3" class="bodyText">How are submissions scored?</A></p>
                        
                        <p><A href="#3" class="bodyText">I would like to help define component requirements, how can I do so?</A></p>
                        
                        <p><A href="#3" class="bodyText">Are there examle submissions?</A></p>
                        
                        <p><A href="#3" class="bodyText">Are there example unit tests?</A></p>

                        <p class="bodySubtitle">Architecture Review Board</p><!-- Use subtitles only if necessary to break up many questions into categories -->
                        
                        <p><A href="#4" class="bodyText">Are board members able to submit design or development submissions as a regular developer?</A></p>

                        <p><A href="#5" class="bodyText">Is there a screening process for members that are invited to the board?</A></p>
                        
                        <p><A href="#5" class="bodyText">With what frequency do I need to review designs (i.e. one review per-week, per-month, etc.)?</A></p>

                        <p><A href="#5" class="bodyText">Are all review board members eligible to be primary reviewers?</A></p>

                        <p><A href="#5" class="bodyText">What does the primary reviewer do in addition to a regular reviewer's responsibilities?</A></p>

                        <p><A href="#5" class="bodyText">Can I belong to both architecture and design review boards, or may I only commit to one?</A></p>

                        <p><A href="#5" class="bodyText">Can you provide me with any more details on compensation and time commitment?</A></p>

                        <p><A href="#5" class="bodyText">Who chooses which components I will review?</A></p>

                        <p><A href="#5" class="bodyText">Am I able to review more than 4 per quarter if I wish?</A></p>

                        <p><A href="#5" class="bodyText">How many designs are expected per component that I will review?</A></p>
                        
                        <p><A href="#5" class="bodyText">The first requirement is a winning design or development submission. Does this means I have to submit a design or development that wins before I can be on the board?</A></p>
                        
                        <p><A href="#5" class="bodyText">Will there be opportunities for me to add my creativity to a Component design?</A></p>
                        
                        <p><A href="#5" class="bodyText">How much time will I have from the moment I receive materials until the component review deadline?</A></p>
                        
                        <p><A href="#5" class="bodyText">Is all work done by e-mail or are there also chats and conference calls required? </A></p>
                        
                        <p><A href="#5" class="bodyText">What kind of third-party software is required for this?  Do I need to install any specific platform, compiler, etc?</A></p>
                        
                        <p><A href="#5" class="bodyText">Am I allowed to submit for a development project if I was on the review board for the design project of the same component?</A></p>
                        
                        <p><A href="#5" class="bodyText">Are winning designers allowed to submit for development projects to implement their component designs?</A></p>
                        
                        <p><A href="#5" class="bodyText">If I am on the Architecture Review Board for a component project and no designs pass the review stage, am I allowed to submit a design for the project when it is re-posted?</A></p>
                        
                        <p class="bodySubtitle">Architecture Review Board</p><!-- Use subtitles only if necessary to break up many questions into categories -->
                        
                        <p><A href="#5" class="bodyText">Are board members allowed to submit development solutions as a regular developer? </A></p>
                        
                        <p><A href="#5" class="bodyText">Is there a screening process for members that are invited to the Development Review Board?</A></p>
                        
                        <p><A href="#5" class="bodyText">With what frequency do I need to review development submissions (i.e. one review per-week, per-month, etc.)?</A></p>
                        
                        <p><A href="#5" class="bodyText">Are all review board members eligible to be primary reviewers?</A></p>
                        
                        <p><A href="#5" class="bodyText">What does the primary reviewer do in addition to a regular reviewer's responsibilities?</A></p>
                        
                        <p><A href="#5" class="bodyText">Can you provide me with any more details on compensation and time commitment?</A></p>
                        
                        <p><A href="#5" class="bodyText">Who chooses which components I will review?</A></p>

                        <p><A href="#5" class="bodyText">How many designs are expected per component that I will review?</A></p>

                        <p><A href="#5" class="bodyText">The first requirement is a winning design or development submission. Does this means I have to submit a design or development that wins before I can be on the board?</A></p>

                        <p><A href="#5" class="bodyText">Will there be opportunities for me to add my creativity to a component development solution?</A></p>

                        <p><A href="#5" class="bodyText">How much time would I have from the moment I receive materials until the deadline?</A></p>

                        <p><A href="#5" class="bodyText">Is all work done by e-mail or are there also chats and conference calls required?</A></p>
                        
                        <p><A href="#5" class="bodyText">Am I allowed to submit for a development project if I am on the review board for the component?</A></p>
                        
                        <p><A href="#5" class="bodyText">Am I allowed to be on the development review board for a component design that I submitted?</A></p>
                        
                        <p><A href="#5" class="bodyText">If I am on the Development Review Board for a component project and no solutions pass the review stage, am I allowed to submit a solution for the project when it is re-posted?</A></p>
                        
                        <p><A href="#5" class="bodyText">In the second review phase, are reviewers assigned a specific aspect of testing or do we volunteer for a section?</A></p>

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

