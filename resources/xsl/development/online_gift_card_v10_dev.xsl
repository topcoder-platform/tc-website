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

                <title>Online Gift Card Sales Development Project at TopCoder</title>

                <xsl:call-template name="CSS"/>

                <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

            </head>

            <body>

                <!-- Header Begins -->
                <xsl:call-template name="Top"/>
                <!-- Header Ends -->

                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">

                        <!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">applications</xsl:with-param>
                <xsl:with-param name="level3">app_projects</xsl:with-param>
            </xsl:call-template>
          </td>
                        <!-- Left Column Ends -->

                        <!-- Gutter Begins -->
                        <td width="15" valign="top">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Center Column Begins -->
                        <td class="bodyText" width="99%" valign="top">
                            <img src="/i/clear.gif" width="240" height="10" alt="" border="0"/>
                            <br/>

                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Application Development</xsl:with-param>
                            </xsl:call-template>

                            <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                            <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                            <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>

                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr valign="top">
                                    <td class="bodyText" width="100%">
                                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                                        <br/>

                                        <!-- Title -->
                                        <h1 class="devSubhead">Online Gift Card Sales Application: Development</h1>

                                        <p class="smallText">&#160;&#160;&#160;&#160;
                                            <a href="#overview">Overview</a> |
                                            <a href="#projecttype">Project Type</a> |
                                            <a href="#payment">Payment</a> |
                                            <a href="#eligibility">Eligibility</a> |
                                            <a href="#timeline">Timeline</a> |
                                            <a target="_new" href="/i/development/downloads/GiftCardApplicationSpec_v10.pdf">Requirement Specification</a>
                                        </p>

                                        <!-- Overview -->
                                        <p>
                                            <strong>
                                                <a name="overview">Overview</a>
                                            </strong>
                                            <br/>
                                            TopCoder Software has engaged with a customer to build and integrate an online gift card order processing application using existing components from the TopCoder Component Catalog as well as specific code to interface with the client's environment. </p>

                                            <p>The Online Gift Card application project Design Phase is almost complete and will enter Development Phase soon.  The functional requirements for the Online Gift Card Application have been separated into two groups.  Two members will be selected for each functional group in order to compete for the winning submission.  The TopCoder Project Manager will provide all of the design documents to the selected members once the inquiry phase has completed.  In order to inquire for this project please click on the appropriate link at the bottom of this page.</p>

                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/GiftCardApplicationSpec_v10.pdf">Business Requirement Specification</a> for this application project.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>Site Development</strong> - Must implement the following functionality according to the design:
                                            <br/>
                                            &#160;&#160;&#160;Order Placement and Persistence
                                            <br/>
                                            &#160;&#160;&#160;Real-Time Credit Card Authorization
                                            <br/>
                                            &#160;&#160;&#160;Order Fulfillment Application
                                        </p>

                                        <p>
                                            <strong>Supporting Operations</strong> - Must implement the following functionality according to the design:
                                            <br/>
                                            &#160;&#160;&#160;Order Confirmation and Shipment Notification Emails
                                            <br/>
                                            &#160;&#160;&#160;Sales Audit Daily Extract
                                            <br/>
                                            &#160;&#160;&#160;System Maintenance Window
                                        </p>

                                        <!-- Project Type -->
                                        <p>
                                            <strong>
                                                <a name="projecttype">Project Type</a>
                                            </strong>
                                            <br/>
                                            Application Development Project: Provide a completed development solution according to the design requirements for the Online Gift Card Sales application.  Please review the TopCoder Software
                                            <a href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                        </p>

                                        <!-- Technologies -->
                                        <p>
                                            <strong>Technologies</strong>
                                        </p>
                                        <ul>
                                            <li>Java 1.4</li>
                                            <li>JSP</li>
                                            <li>Java Servlets</li>
                                            <li>JDBC</li>
                                            <li>Oracle SQL</li>
                                            <li>Oracle SQL*Loader</li>
                                        </ul>

                                        <!-- Payment -->
                                        <p>
                                            <strong>
                                                <a name="payment">Payment</a>
                                            </strong>
                                            <br/>
                                             TopCoder will compensate the member with the winning solution as well as the second place developer. In order to be paid, both the winning submission must and the second place submission must pass screening and receive a review score above the minimum score of 50.
                                             <br/><br/>
                                             Compensation for the winning solution is distributed in two installments.
                                             <br/><br/>
                                            <strong>First Payment:</strong>
                                            <br/>
                                             When the winning solution is submitted and review board suggestions are integrated. 
                                             <br/><br/>
                                            <strong>Second Payment:</strong>
                                            <br/>
                                             At the completion of the integration project*. 
                                             <br/><br/>
                                             Compensation for the second place developer will be paid in one installment following the completion of the integration project.
                                        </p>

                                        <p>
                                            <strong>Site Development<br/><br/>
                                            Winning Developer</strong>
                                            <br/>
                                            Total Payment - $833.00
                                            <br/>
                                            First Payment - $625.00
                                            <br/>
                                            Second Payment - $208.00
                                        </p>

                                        <p>
                                            <strong>Second Place Developer</strong>
                                            <br/>
                                            Total Payment - $313.00
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Development Reviewer - $244.00
                                            <br/>
                                            Development Reviewer - $189.00
                                            <br/>
                                            Development Reviewer - $189.00
                                            <br/><br/>
                                            Total - $1,768.00
                                        </p>
                                        <p></p>
                                        <p>
                                            <strong>Supporting Operations<br/><br/>
                                            Winning Developer</strong>
                                            <br/>
                                            Total Payment - $333.00
                                            <br/>
                                            First Payment - $250.00
                                            <br/>
                                            Second Payment - $83.00
                                        </p>

                                        <p>
                                            <strong>Second Place Developer</strong>
                                            <br/>
                                            Total Payment - $125.00
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Development Reviewer - $181.00
                                            <br/>
                                            Development Reviewer - $126.00
                                            <br/>
                                            Development Reviewer - $126.00
                                            <br/><br/>
                                            Total - $891.00
                                        </p>
                                        <!-- Definition of Completion -->

                                        <p>
                                            <sup>*</sup>Completion of the project is defined as follows:
                                        </p>

                                        <ul>
                                            <li>The Submission has been selected by the board as the winning submission.</li>
                                            <li>Final fixes accepted by the development review board.</li>
                                            <li>Application launch into production environment.</li>
                                        </ul>

                                        <!-- Eligibility Requirements -->
                                        <p>
                                            <strong>
                                                <a name="eligibility">Eligibility</a>
                                            </strong>
                                            <br/>
                                            You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership
                                            requirements and fit into one of the following categories:
                                        </p>

                                        <ol>
                                            <li>A US Citizen. </li>
                                            <li>A Lawful Permanent Resident of the US.</li>
                                            <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                                            <li>A Non-US Citizen working in your country of residence.</li>
                                        </ol>

                                        <!-- Timeline -->
                                        <p>
                                            <strong>
                                                <a name="timeline">Timeline</a>
                                            </strong>
                                            <br/>
                                            The Design Submission must be submitted on time. All questions submitted
                                            prior to 6PM EDT on the Submission Due Dates will be answered. Following review
                                            from the board the winning member is given until the Updated Submission Due Date
                                            to modify their submission.
                                        </p>

                                        <table border="0" cellspacing="2" cellpadding="3" class="sidebarBox">
                                            <tr>
                                                <td class="sidebarText">
                                                    <b/>Application Project Posting:
                                                </td>
                                                <td class="sidebarText" align="right">
                                                    <b/>12.16.2003
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Inquire By:</td>
                                                <td class="sidebarText" align="right">12.19.2003</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Member Selection:</td>
                                                <td class="sidebarText" align="right">12.22.2003</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Member Acceptance:</td>
                                                <td class="sidebarText" align="right">12.23.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Development Start:</td>
                                                <td class="sidebarText" align="right">12.24.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Development Due:</td>
                                                <td class="sidebarText" valign="top" align="right">01.05.2004 6:00 PM ET</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Winner Announced:</td>
                                                <td class="sidebarText" align="right">01.07.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Updated Submission Due Date:</td>
                                                <td class="sidebarText" align="right">01.08.2004 6:00 PM ET</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Integration Start:</td>
                                                <td class="sidebarText" align="right">01.19.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">QA Start:</td>
                                                <td class="sidebarText" align="right">01.20.2004</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Acceptance:</td>
                                                <td class="sidebarText" align="right">01.21.2004</td>
                                            </tr>                                            
                                        </table>

                                        <!-- Register at TCS -->
                                        <p>
                                            <a name="requirementspecification"></a>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/GiftCardApplicationSpec_v10.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>

                                        <p>
                                            <strong>
                                               <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Online%20Gift%20Card%20Site%20Development">Inquire for the Site Development Development Tasks of the Online Gift Card Sales Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                               <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Online%20Gift%20Card%20Supporting%20Operations">Inquire for the Supporting Operations Development Tasks of the Online Gift Card Sales Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>                                        
                                        <!--
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group2">Inquire for the Group 2 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group3">Inquire for the Group 3 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        -->
                                        <!--<p>To submit a solution, email your submissions to
                                        <a href="mailto:submissions@topcodersoftware.com" class="bodyText">submissions@topcodersoftware.com</a>.</p> -->

                                        <p>
                                            <br/>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <!-- Center Column Ends -->

                        <!-- Gutter begins -->
                        <td width="15">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Right Column Begins -->
                        <td width="244" valign="top">
                            <xsl:call-template name="public_dev_right"/>
                        </td>
                        <!-- Right Column Ends -->
                    </tr>
                </table>

                <!-- Footer begins -->
                <xsl:call-template name="Foot"/>
                <!-- Footer ends -->

            </body>

        </html>

    </xsl:template>
</xsl:stylesheet>
