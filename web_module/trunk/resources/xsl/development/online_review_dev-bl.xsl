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
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>
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
                        <h1 class="devSubhead"><strong>Online Review Application Business Logic: Development</strong></h1>
                                    


<!-- Overview -->
                        <p><strong>Overview</strong><br />
Online Review Application Business Logic Development Project The Online Review Application is designed to implement TopCoder's iterative design/development review process.  The application design has been broken out into three tiers to focus the development effort.  This project encompasses the implementation of the business logic tier for this application.  This application will be used, upon completion, by TopCoder Software to implement the TopCoder Software Component Design and Development Methodology.
                        
                        </p>
                        <p>
The business logic development will be completed following the APIs as described in the UML provided in the design distribution.  The deliverable must include a fully functional business logic tier using stub classes, which should include test data as described in HTML mockup.  The stub classes will implement the persistence layer API.  In addition to the stubb classes, the developer must also implement unit test cases to emulate the front-end.  These test cases should also use test data as described in the HTML mock ups provided.
                        </p>
                        <p>
All developers are encouraged to use as many completed TopCoder Software components as appropriate (from the <a href="http://software.topcoder.com/catalog/c_showroom.jsp" target="NEW">Component Catalog</a>).  Effective use of these components will be taken into account during the review period.  Design documentation is available on the TopCoder Software website.
                        </p>

<!-- Project Type -->
                        <p><strong>Project Type</strong><br />
Application Business Logic Development Project: Provide a complete development solution for the business logic tier of the Online Review Application.
Please review the TopCoder Software <a href="/?t=development&amp;c=app_meth" target="NEW">Application Development Methodology</a> and the <a href="/i/development/downloads/Developer_Application_Deliverables.pdf" target="NEW">Development Deliverables Document</a> before you inquire for the project. If you have questions about the project, contact the TopCoder Application Manager at <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a>.
                        </p>
                            
<!-- Technologies -->
                        <p><strong>Technologies</strong></p>
                        <ul>
                            <li>Java 1.4</li>
                            <li>EJB 2.0</li>
                        </ul>

                        <p><strong>Documentation</strong><br/>
                        Documentation for this project is provided in the <a href="/i/development/downloads/Online_Review_Design.jar">Online Review Design Distribution</a>.  The business logic developer is responsible for all classes highlighted in red.
                        </p>


<!-- Payment -->
                        <p><strong>Payment</strong><br />
                TopCoder will compensate the eligible first and second place submitters. The development payment will be distributed at the completion of the project review period.  The integration payment will be distributed at the completion of the project integration period<sup>*</sup>.  In addition, developers selected for this project will be granted access to the TopCoder Software Component Catalog for the duration of this project.
                </p>

                            
                        <p><strong>Winning Developer</strong><br />
                        Total Payment - $2,400.00<br />
                        Development Payment - $1,800.00<br />
                        Integration Payment - $600.00<br />
                        </p>
                        <strong>Second Place Developer</strong><br />
                        Total Payment - $900.00
                        
                                                    

<!-- Definition of Completion -->
                        <p><sup>*</sup>Completion of the project is defined as follows:</p>
                <p>
                The Initial Submission has been delivered by the Initial Submission date.  The Submission has been reviewed by the board and if required changes have been re-submitted by the developer. Development payment is conditional on receiving a minimum review score of fifty (50) by the Development Review Board.  The Integration Payment is conditional upon acceptance of the fully functional application by the TopCoder Application Manager.
                </p>


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
                        All inquiries must be received by 12 PM EST on the Inquiry Deadline.  <bold>Only two (2) developers will be selected</bold> from the pool of members who have inquired by the Inquiry Deadline.  Selection will be made based upon a combination of a developers rating and their experience in TopCoder Software.  Inquiring for a project does not guarantee selection.
                        <p>
                        </p>
                        The two (2) developers selected will be contracted to submit solutions by the Initial Submission date. Selected members who fail to submit a solution by the initial submission deadline or who earn a review score of less than fifty (50) points on the review may be suspended from TopCoder Software submissions for six (6) weeks following the submission date.  Developers will have access to an online newsgroup, where all questions submitted prior to 6PM EDT on the Initial Submission date will be answered. Following development review, the winning member is given until the Review Fixes Submission date to modify their submission.  Following completion of the development project, the winning developer is required to support their submission and participate in the integration of the application.
                        </p>

                        <p>
                        Posting: 5.20.2003<br/>
                        Inquiry Deadline: 5.27.2003<br/>
                        Developers Announced: 5.27.2003<br/>
                        Initial Submission: 6.16.2003<br/>
                        Winner Announced: 6.23.2003<br/>
                        Review Fixes Submission: 6.30.2003<br/>
                        Integration Submission: 7.11.2003<br/>
                        </p>
                        

<!-- Register at TCS -->
                           <p>
                                <strong><a href="/index?t=development&amp;c=tcs_app_inquire&amp;Project=Online%20Review%20Business%20Logic">Inquire for the project</a></strong> to be selected as one of the two (2) developers for this project.  Each development submission receiving a review score of fifty (50) points or greater will receive the minimum development payment.
                        </p>
                        
                            <p>
                                 If you have questions, email <a href="mailto:submissions@topcodersoftware.com" class="bodyText">submissions@topcodersoftware.com</a>.
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
