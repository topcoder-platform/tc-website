<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />  
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />  
    <xsl:import href="../includes/global_left.xsl"/>  
    <xsl:import href="../includes/dev/public_dev_right.xsl" />     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template match="/">

<html>
<head>

    <xsl:call-template name="Preload" />      

 <title>Component Methdology for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />


</head>

<BODY>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">comp_meth</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>
            
            <img src="/i/clear.gif" alt="" width="240" height="20" border="0" />
                            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText"><div align="center"><h2 class="devSubhead"><strong>TopCoder Software Component Development Methodology</strong></h2></div></td>
                </tr>

                <tr valign="top">
                    <td width="100%">
                        <div align="center">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td><a href="#certification"><img src="/i/development/methodology_02.gif" width="161" height="67" alt="Certification" border="0" /></a></td>
                                <td><img src="/i/development/methodology_03.gif" width="118" height="67" alt="" /></td>
                                <td><a href="#collaboration"><img src="/i/development/methodology_04.gif" width="177" height="67" alt="Collaboration" border="0" /></a></td>
                            </tr>
                        
                            <tr>
                                <td><img src="/i/development/methodology_06.gif" width="161" height="56" alt="" /></td>
                                <td><img src="/i/development/methodology_07.gif" width="118" height="56" alt="" /></td>
                                <td><img src="/i/development/methodology_08.gif" width="177" height="56" alt="" /></td>
                            </tr>

                            <tr>
                                <td><a href="#development"><img src="/i/development/methodology_09.gif" width="161" height="81" alt="Development" border="0" /></a></td>
                                <td><img src="/i/development/methodology_10.gif" width="118" height="81" alt="" /></td>
                                <td><a href="#design"><img src="/i/development/methodology_11.gif" width="177" height="81" alt="Design" border="0" /></a></td>
                            </tr>
                        </table></div>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="bodyText">
                        <p>The Component Development Methodology combines the best of traditional software development methodologies with the power 
                        of community-based development.  The four stages of the methodology make up one release of a component.  If any one of the 
                        phases does not pass required acceptance that phase of the project is restarted.</p></td>
                </tr>

<!-- Specification begins -->
                <tr valign="top">
                    <td width="100%"><a name="collaboration"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                            <tr valign="top">
                                <td class="methNav" width="98%"><span class="bodyText"><strong>Specification</strong></span>&#160;&#160;| &#160;<a class="methNav" href="#design">Architecture&#160;and&#160;Design</a>&#160;&#160;| &#160;<a class="methNav" href="#development">Development&#160;and&#160;Testing</a>&#160;&#160;| &#160;<a class="methNav" href="#certification">Certification</a>&#160;&#160;&#160;&#160;</td>
                                <td class="methNav" width="2%" nowrap="nowrap"><div class="topPage"><a href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText">
                        <p>Gather component scope by collaborating with customers and TopCoder members through online 
                        <a href="http://software.topcoder.com/forum/c_active_collab.jsp">Customer Forums.</a>  For new components this 
                        is a new request for a component. For existing components it is a request for additional functionality.</p>
                                    
                        <p><strong>Participants</strong><br />
                        Product Manager (PM)<br />
                        TopCoder Software Customers<br />
                        TopCoder Members</p>
                                    
                        <p><strong>Details</strong><br />
                        <ol>
                            <li>PM moderates <a href="http://software.topcoder.com/forum/c_active_collab.jsp">Customer Forums</a> on 
                            topcodersoftware.com to gather component requirements.</li>
                            
                            <li>The Customer Forums are open to view by all TopCoder Software visitors, but only registered members are allowed to post messages 
                            to the forums.</li>
                            
                            <li>Once the project scope has been determined, the PM creates a Requirements Specification for the Design Phase of that component.</li>
                            
                            <li>The project is <a href="index?t=development&amp;c=comp_projects">posted</a> on the Development Section of 
                            topcoder.com, and an email is sent out notifying members of the new development opportunity.  The posting includes the payment details and 
                            submission deadline for all design submissions.</li>
                            
                            <li>Eligible TopCoder members who inquire about Design Projects are granted secure access to the Project Specification and Project 
                            Deliverable documents in the online Development Forums.</li>
                        </ol></p></td>
                </tr>
<!-- Collaboration ends -->

<!-- Design begins -->
                <tr valign="top">
                    <td width="100%"><a name="design"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                            <tr valign="top">
                                <td class="methNav" width="98%"><a class="methNav" href="#collaboration">Specification</a>&#160;&#160;| &#160;<span class="bodyText"><strong>Architecture&#160;and&#160;Design</strong></span>&#160;&#160;| &#160;<a class="methNav" href="#development">Development&#160;and&#160;Testing</a>&#160;&#160;| &#160;<a class="methNav" href="#certification">Certification</a>&#160;&#160;&#160;&#160;</td>
                                <td class="methNav" width="2%" nowrap="nowrap"><div class="topPage"><a href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText">
                        <p>Eligible TopCoder Members submit design proposals, which are scored by an Architecture Review Board in a peer review process to 
                        determine the best design. If an acceptable design is not found the phase is restarted.</p>
                                    
                        <p><strong>Participants</strong><br />
                        Product Manager (PM)<br />
                        Designer<br />
                        Architecture Review Board<br />
                        Invited TopCoder Software Customers*</p>

                        <p>* Customers will be invited if deemed necessary by the PM, or is requested by the customer.</p>
                                    
                        <p><strong>Details</strong><br />
                        <ol>
                            <li>The PM creates an Architecture Review Board made up of 3 members of the Architect Pool.  The Architect Pool consists of Level III 
                            developers and invited architects according to TC Rating. The more winning designs you submit, the closer you get to Level III and an 
                            invitation to join the Architect Pool. </li>
                            
                            <li>One member of the Architecture Review Board is assigned the Role of Primary Reviewer.  The Primary Reviewer fills out a Design 
                            Screening Score Card for each submitted design.  The score card consists of two parts: first is a checklist for required elements of the 
                            design submission; second is a series of objective questions used by the Primary Reviewer to score the designs. </li>
                            
                            <li>All eligible TopCoder members can submit design proposals.</li>
                            
                            <li>At a minimum, proposals consist of: Use-Case Diagram, Class Diagram, Sequence Diagram, Component Specification, Test Cases. </li>
                            
                            <li>Proposals that do not pass** the screening are sent back to the designer with the Design Screening Score card.</li>
                            
                            <li>Proposals that pass** the screening will be reviewed in greater detail by all members of the Architecture Review Board.</li>
                            
                            <li>Each Architecture Review Board member reviews all passing proposals and scores them using the Design Review Score card.  The 
                            Design Review Score card consists of a series of subjective questions that require both a score and comments to explain the score.</li>
                            
                            <li>The design with the best score above the minimum score** is chosen for the project.  If there is a tie in score, then the member's TC 
                            ranking is used to break the tie.  The Design Screening Score card and the Design Review Score card are returned to all designers whose 
                            designs passed the initial screening.</li>
                            
                            <li>The Primary Reviewer aggregates all of the comments and handles all conflicts in the board by communicating with the 
                            architects through a secure online forum on topcodersoftware.com.  The Primary Reviewer may declare some suggestions as mandatory 
                            with the approval of the PM.  </li>
                            
                            <li>The winning designer is given additional time to incorporate the aggregated design suggestions from the Architecture Review Board.  
                            If the time frame is not met, the designer will be disqualified and the next design in order of score will be declared the winner.</li>
                            
                            <li>The Primary Reviewer gives the updated submission a final review to make sure that all mandatory suggestions were implemented 
                            and any optional suggestions were implemented correctly.</li>
                            
                            <li>If no proposals pass the design review**, the design phase starts over and all designers are allowed to re-submit modified designs.</li>
                            
                            <li>75% of the payment is paid out once the final version of the winning design is approved by the Architecture Review Board.  The 
                            remaining 25% of the payment is sent out following the Development Phase.</li>
                            
                            <li>Once a winning design is determined, the PM posts the Development Phase of the project in the Development Section of topcoder.com.  
                            The posting includes the submission deadline and the payment details.  Once eligible TopCoder members inquire about the project they 
                            are granted access to the design and specification documents in a secure online forum.</li>
                        </ol></p>
                        
                        <p>** Minimum passing score is determined by TopCoder for both the screening and architecture review.</p></td>
                </tr>
<!-- Design ends -->

<!-- Development begins -->
                <tr valign="top">
                    <td width="100%"><a name="development"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                            <tr valign="top">
                                <td class="methNav" width="98%"><a class="methNav" href="#collaboration">Specification</a>&#160;&#160;| &#160;<a class="methNav" href="#design">Architecture&#160;and&#160;Design</a>&#160;&#160;| &#160;<span class="bodyText"><strong>Development&#160;and&#160;Testing</strong></span>&#160;&#160;| &#160;<a class="methNav" href="#certification">Certification</a>&#160;&#160;&#160;&#160;</td>
                                <td class="methNav" width="2%" nowrap="nowrap"><div class="topPage"><a href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText">
                        <p><strong>Please note: Members who submit the winning design for a project are not eligible to submit development solutions for that project.</strong></p>
                        
                        <p>Eligible TopCoder Members submit development solutions, which are reviewed by the Development Review Board in a peer review process to determine 
                        the winning solution.  If an acceptable solution is not found the phase starts over.</p>
                                    
                        <p><strong>Participants</strong><br />
                        Product Manager (PM)<br />
                        Designer<br />
                        Developer<br />
                        Development Review Board</p>
                                    
                        <p><strong>Details</strong><br />
                        <ol>
                            <li>The PM creates a Development Review Board made up of 3 members of the Development Review Pool.  The Development Review Pool is 
                            created of Level II and Level III developers and invited members according to TC Rating.</li>
                            
                            <li>The Designer is required to be available for questions during the Development Phase. All communication will occur in the online forums 
                            of topcodersoftware.com.</li>
                            
                            <li>One member of the Development Review Board is assigned the Role of Primary Reviewer.  The Primary Reviewer examines all 
                            development submissions and fills out a Development Screening Score card.  The score card consists of three parts: first, a checklist for 
                            required elements of the design submission; second, the component is run through the designer's test cases; third, a series of objective 
                            questions used by the Primary Reviewer to score the submission. At a minimum, submissions consist of: Source Code, Executable Code, Build 
                            Script, Unit Test Cases, Developer Guide. Any submissions that do not pass the checklist or the designer's test cases are rejected.</li>
                            
                            <li>All eligible TopCoder members can submit development solutions for the project.</li>
                            
                            <li>Development submissions that do not pass** the screening are sent back to the Developer with the Development Screening Score card.</li>
                            
                            <li>Proposals that pass** the screening will be reviewed in greater detail by all members of the Development Review Board.</li>
                            
                            <li>Each Development Review Board Member reviews all passing submissions and scores them using the Development Review Score card.  
                            The Development Review Score card consists of a series of questions that require both a score and comments to explain the score. The 
                            questions are answered by testing the solution with the appropriate test cases.</li>
                            
                            <li>Each Development Review Board Member is assigned a different QA role. 
                                <ul>
                                    <li>Stress Tester&#151;Tests the submissions to ensure acceptable performance and throughput.</li>
                                    
                                    <li>Accuracy Tester&#151;Tests the submissions for the accuracy of results when using the component.</li>
                                    
                                    <li>Failure Tester&#151;Tests the submission's ability to handle bad data and incorrect usage.</li>
                                </ul>
                                Each role is required to submit test cases and results for each component. These results directly affect the overall score of the component.</li>
                                
                            <li>The development submission with the best score above the minimum score** is chosen for the project.  If there is a tie in score, then 
                            the members' TC rankings are used to break the tie.  Both the Development Screening Score card and the Development Review Score card 
                            are sent to all developers whose submissions passed the initial screening.</li>
                            
                            <li>The winning developer is given additional time to incorporate the aggregated suggestions from the Development Review 
                            Board.  If the time frame is not met, the developer will be disqualified and the next design in order of score will be declared the winner.</li>
                            
                            <li>The Primary Reviewer gives the updated submission a final review to make sure that all mandatory suggestions were implemented 
                            and any optional suggestions were implemented correctly.  At that point the submission is regression tested with all test cases.</li>
                            
                            <li>If no submissions pass the Development Review**, the Development Phase starts over and all developers are allowed to re-submit their 
                            modified implementations.</li>
                            
                            <li>100% of the payment is paid out once the final version of the winning development solution is approved by the Development Review 
                            Board.</li>
                        </ol></p>
                                                
                        <p>** Minimum passing score is determined by TopCoder for both the screening and development review.</p></td>
                </tr>
<!-- Development ends -->

<!-- Certification begins -->
                <tr valign="top">
                    <td width="100%"><a name="qa"></a>
                        <table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#EEEEEE">
                            <tr valign="top">
                                <td class="methNav" width="98%"><a class="methNav" href="#collaboration">Specification</a>&#160;&#160;| &#160;<a class="methNav" href="#design">Architecture&#160;and&#160;Design</a>&#160;&#160;| &#160;<a class="methNav" href="#development">Development&#160;and&#160;Testing</a>&#160;&#160;| &#160;<span class="bodyText"><strong>Certification</strong></span>&#160;&#160;&#160;&#160;</td>
                                <td class="methNav" width="2%" nowrap="nowrap"><div class="topPage"><a href="#top">[Top of Page]</a></div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText">
                        <p>Additional environment certifications.</p>
                                    
                        <p><strong>Participants</strong><br />
                        Product Manager (PM)<br />
                        Developer</p>
                                    
                        <p><strong>Details</strong><br />
                        <ol>
                            <li>Completed components often need to be certified on additional platforms for specific customers.</li>
                            <li>Certification projects will be posted on the TopCoder web site and developers will be selected from the resulting inquiries.</li>
                            <li>Developers will be responsible for testing the component on the specified platform and reporting the results.</li>
                            <li>Developers will be paid a fixed amount.</li>
                        </ol></p>
                        
                        <p><br /></p>
                    </td>
                </tr>
<!-- Certification ends -->
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
    
    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
    </xsl:template>
</xsl:stylesheet>

