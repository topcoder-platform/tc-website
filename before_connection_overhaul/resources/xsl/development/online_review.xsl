<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>  
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/stats_intro.xsl"/>  
    <xsl:import href="../includes/global_left.xsl"/> 
    <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>
    
    <xsl:call-template name="Preload"/>      

<title>TopCoder | Application</title>

    <xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>



<!-- Header Begins -->
    <xsl:call-template name="Top"/>
<!-- Header Begins -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6" valign="top"><img src="/i/clear.gif" width="6" height="8" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0"/><br/>
<xsl:call-template name="BodyTop">
    <xsl:with-param name="image1">white</xsl:with-param>
    <xsl:with-param name="image">development</xsl:with-param>
    <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
</xsl:call-template>
                <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>                
            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr>
                    <td  valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" colspan="2" valign="top"  width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                            
<!-- Title -->
                        <h1 class="devSubhead"><strong>Online Review Application: Design</strong></h1>
                                    


<!-- Overview -->
                        <p><strong>Overview</strong><br />
                        The Online Review Application will automate the process of TopCoder Software's peer review for both Component Design and Component Development projects.   Reviewers will be able to login, check the status of their assignments, download submissions for review, fill in online review forms and perform aggregation of reviews.  There is an admin section that allows users to set up reviews, assign members and score components.
                        </p>

<!-- Project Type -->
                        <p><strong>Project Type</strong><br />
                        Application Design Project: Provide a complete design for the Online Review application.   Please review the TopCoder Software <a href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution. 
                        </p>
                            
<!-- Technologies -->
                        <p><strong>Technologies</strong></p>
                        <ul>
                            <li>Java 1.4</li>
                            <li>J2EE</li>
                        </ul>


<!-- Payment -->
                        <p><strong>Payment</strong><br /></p>
                            <p>TopCoder will compensate the member with the winning solution as well as the second place designer. In order to be paid, both the winning submission and the second place designer must pass screening and receive a review score above the minimum score.</p>
                            Compensation for the winning solution is distributed in two installments.<br />
                            First Payment: When the winning solution is submitted and review board suggestions are integrated.<br />
                            Final Payment: At the completion of the development project*.<br />
                            <p>Compensation for the second place designer will be paid in one installment following the completion of the design project.</p>

                            
                        <p><strong>Winning Designer</strong><br />
                        Total Payment - $1,500.00<br />
                        First Payment - $1,125.00<br />
                        Final Payment - $375.00<br />
                        </p>
                        <strong>Second Place Designer</strong><br />
                        Total Payment - $225.00
                        
                                                    

<!-- Definition of Completion -->
                        <p /><sup>*</sup>Completion of the project is defined as follows:
                        <ul>
                            <li>The Submission has been selected by the board as the winning submission.</li>
                            <li>Final payment is conditional on acceptance of the fully functional application by the Development Review Board.</li>
                        </ul>

<!-- Eligibility Requirements -->
                        <p><strong>Eligibility</strong><br />
                        You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:</p>

                        <ol>
                            <li>A US Citizen </li>
                            <li>A Lawful Permanent Resident of the US</li>
                            <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                            <li>A Non-US Citizen working in your country of residence.</li>
                        </ol>

<!-- Time Line -->
                        <p><strong>Time Line</strong><br/>
                        The Design Submission must be submitted on time. All questions submitted prior to 6PM EDT on the Submission Due Dates will be answered. Following review from the board the winning member is given until the Updated Submission Due Date to modify their submission.</p>

                        <p><br/>
                        Component Posting: 2.27.2003<br/>
                        Design Submission Due Date: 3.31.2003<br/>
                        Winner Announced: 4.9.2003<br/>
                        Updated Submission Due Date: 5.12.2003<br/>
                        Estimated Development End Date: 7.11.2003<br/>
                        </p>
                        

<!-- Register at TCS -->
                           <p>
                                <strong>View the <a target="_new" class="bodyText" href="/i/development/downloads/Online-Review-Spec.html">Requirement Specification</a> for this application project &gt;&gt;</strong>
                            </p>
                        

                           <p>
                                <strong><a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Online%20Review">Register for the Application Project</a> to get information necessary to submit a solution &gt;&gt;</strong>
                            </p>
                            <p>
                                 To submit a solution, email your submissions to <a href="mailto:submissions@topcodersoftware.com" class="bodyText">submissions@topcodersoftware.com</a>.
                            </p>
                        <p><br /></p>
                    </td>

                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="4" valign="top"  width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>     

                <tr>
                    <td valign="top" background="" bgcolor="#FFFFFF" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td valign="top" background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                </tr>  

                <tr>
                    <td valign="top" background="" width="11" align="right" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
                    <td valign="top" background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td valign="top" background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td valign="top" background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" valign="top">
            <xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer begins -->
    <xsl:call-template name="Foot" />
<!-- Footer ends -->

</body>
</html>
    </xsl:template>
</xsl:stylesheet>
