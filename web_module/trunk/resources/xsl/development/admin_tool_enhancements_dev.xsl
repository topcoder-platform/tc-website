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
                        <td width="6" valign="top">
                            <img src="/i/clear.gif" width="6" height="8" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->
                        <!-- Center Column Begins -->
                        <td class="bodyText" width="100%" valign="top">
                            <img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0"/>
                            <br/>
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Application Development</xsl:with-param>
                            </xsl:call-template>
                            <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                            <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                            <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>
                            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                                <tr>
                                    <td  valign="top" width="11">
                                        <img src="/i/clear.gif" alt="" width="11" height="1" border="0"/>
                                    </td>
                                    <td class="bodyText" colspan="2" valign="top"  width="100%">
                                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                                        <br/>

                                        <!-- Title -->
                                        <h1 class="devSubhead">
                                            <strong>Admin Tool Enhancements Application: Development</strong>
                                        </h1>
                                        <p>
                                            <font size="-2">&nbsp; &nbsp; &nbsp; &nbsp;
                                            <a href="#summary">Summary of the Tournament</a> |
                                            <a href="#about">About the Tournament</a> |
                                            <a href="#prizes">About the Prizes</a> |
                                            <a href="#conditions">Conditions of Participation</a>
                                            </font>
                                        </p>
                                        <!-- Overview -->
                                        <p>
                                            <strong>Overview</strong>
                                            <br/>
                                            The Admin Tool Enhancements project has one major goal in mind; allow users to
                                            administer TopCoder competitions over the Internet without requiring any access
                                            to the TopCoder internal network.  The current Admin Tool does work over the Internet
                                            and provide a significant level of administration for contests.  However, in order
                                            to completely administer competitions administrators need access to physical production
                                            servers to accomplish specific tasks.  TopCoder would like to enhance the functionality
                                            of the Admin Tool to provide complete contest administration capabilities from a single
                                            application interface.
                                        </p>
                                        <p>
                                            The Admin Tool Enhancement project has completed the Design Phase and will now enter
                                            the Development Phase.  The functional requirements for the Admin Tool project have
                                            been seperated into three groups.  Two members will be selected per functional
                                            group in order to compete for the winning submission.  The TopCoder Project Manager will
                                            provide all of the design documents to the selected members once the inquiry phase has
                                            completed.  In order to inquire for this project please click on the appropriate link at
                                            the bottom of this page.
                                            <br/>
                                            <br/>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/AdminToolRequirementsSpecification-web.pdf">Business Requirement Specification</a> for this application project.
                                            </strong>

                                            <br/><br/>Group 1 - Must implement the following functionality according to the design:
                                            <br/>&#160;&#160;&#160;Add Time
                                            <br/>&#160;&#160;&#160;Advance Contest Phase
                                            <br/>&#160;&#160;&#160;Compiler and Tester Restart
                                            <br/>&#160;&#160;&#160;Dynamic Loading of Terms

                                            <br/><br/>Group 2 - Must implement the following functionality according to the design:
                                            <br/>&#160;&#160;&#160;Implement Round Sequence
                                            <br/>&#160;&#160;&#160;Auto room assigments
                                            <br/>&#160;&#160;&#160;Security Object Upgrade

                                            <br/><br/>Group 3 - Must implement the following functionality according to the design:
                                            <br/>&#160;&#160;&#160;Admin Broadcast Problem
                                            <br/>&#160;&#160;&#160;Backup and Restore Tables
                                            <br/>&#160;&#160;&#160;Statistics Warehouse Load

                                        </p>
                                        <p>
                                            Members that are chosen for the Admin Tool Enhancements project will be given full access
                                            to the current TopCoder code base and access to our development database.
                                        </p>
                                        <!-- Project Type -->
                                        <p>
                                            <strong>Project Type</strong>
                                            <br/>
                                            Application Development Project: Provide a completed development solution according to the design requirements
                                            for the Admin Tool application.   Please review the TopCoder Software
                                            <a href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                        </p>
                                        <!-- Technologies -->
                                        <p>
                                            <strong>Technologies</strong>
                                        </p>
                                        <ul>
                                            <li>Java 1.4</li>
                                            <li>J2EE</li>
                                            <li>C#</li>
                                            <li>SQL</li>
                                            <li>Shell Scripts</li>
                                        </ul>
                                        <!-- Payment -->
                                        <p>
                                            <strong>Payment</strong>
                                            <br/>
                                        </p>
                                        <p>TopCoder will compensate the member with the winning solution as well as the second place developer.
                                            In order to be paid, both the winning submission and the second place developer must pass screening
                                            and receive a review score above the minimum score of 50.</p>
                                        Compensation for the winning solution is distributed in two installments.
                                        <br/>
                                        First Payment: When the winning solution is submitted and review board suggestions are integrated.
                                        <br/>
                                        Final Payment: At the completion of the integration project*.
                                        <br/>
                                        <p>Compensation for the second place developer will be paid in one installment following the completion of the development project.</p>
                                        <p>
                                            <strong>Winning Developer</strong>
                                            <br/>
                                            Total Payment - $2,200.00
                                            <br/>
                                            First Payment - $1,325.00
                                            <br/>
                                            Final Payment - $875.00
                                            <br/>
                                        </p>
                                        <strong>Second Place Developer</strong>
                                        <br/>
                                        Total Payment - 665.00
                                        <!-- Definition of Completion -->
                                        <p/>
                                        <strong>Integration Lead Developer</strong>
                                        <br/>Once the winning members have been identified the TopCoder Project Manager will select
                                        one of the members as the lead developer.  The lead developer will get compensated an additional
                                        $250.00 to manage the integration process.
                                        <br/>
                                        <br/>


                                        <sup>*</sup>Completion of the integration project is defined as follows:
                                        <ul>
                                            <li>The Submission has been selected by the board as the winning submission.</li>
                                            <li>Acceptance of the fully integrated functional application by the Development Review Board.</li>
                                            <li>Application launch into production environment.</li>
                                        </ul>
                                        <!-- Eligibility Requirements -->
                                        <p>
                                            <strong>Eligibility</strong>
                                            <br/>
                                            You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
                                        </p>
                                        <ol>
                                            <li>A US Citizen </li>
                                            <li>A Lawful Permanent Resident of the US</li>
                                            <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                                            <li>A Non-US Citizen working in your country of residence.</li>
                                        </ol>
                                        <!-- Time Line -->
                                        <p>
                                            <strong>Time Line</strong>
                                            <br/>
                                            The Development Submission must be submitted on time. All questions submitted
                                            prior to 6PM EDT on the Submission Due Dates will be answered. Following review
                                            from the board the winning member is given until the Updated Submission Due Date
                                            to modify their submission.  The TopCoder Software Project Manager will assign
                                            the development tasks for each phase at the start of the development phase.
                                        </p>
                                        <p>
                                            <table border="0" cellspacing="0" cellpadding="0"  width="40%">
                                                <tr>
                                                    <td class="bodyText" ><b/>Application Project Posting:</td>
                                                    <td class="bodyText" align="right"><b/>9.22.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Member Selection:</td>
                                                    <td class="bodyText" align="right">9.30.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Member Acceptance:</td>
                                                    <td class="bodyText" align="right">10.2.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Development Start:</td>
                                                    <td class="bodyText" align="right">10.06.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Phase 1 Due:
                                                        <br/>&#160;&#160;&#160;Develop Test Cases
                                                        <br/>&#160;&#160;&#160;Functionality Development
                                                        <br/>&#160;&#160;&#160;Documentation
                                                    </td>
                                                    <td class="bodyText" valign="top" align="right">10.10.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Phase 2 Due:
                                                        <br/>&#160;&#160;&#160;Develop Test Cases
                                                        <br/>&#160;&#160;&#160;Functionality Development
                                                        <br/>&#160;&#160;&#160;Documentation
                                                    </td>
                                                    <td class="bodyText" valign="top" align="right">10.21.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Phase 3 Due:
                                                        <br/>&#160;&#160;&#160;Develop Test Cases
                                                        <br/>&#160;&#160;&#160;Functionality Development
                                                        <br/>&#160;&#160;&#160;Documentation
                                                    </td>
                                                    <td class="bodyText" valign="top" align="right">10.29.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Winner Announced:</td>
                                                    <td class="bodyText" align="right">11.3.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Updated Submission Due Date:</td>
                                                    <td class="bodyText" align="right">11.7.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Integration Start:</td>
                                                    <td class="bodyText" align="right">11.12.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">QA Start:</td>
                                                    <td class="bodyText" align="right">11.24.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText">Acceptance:</td>
                                                    <td class="bodyText" align="right">12.3.2003</td>
                                                </tr>

                                            </table>
                                        </p>
                                        <!-- Register at TCS -->
                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/AdminToolRequirementsSpecification-web.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group1">Inquire for the Group 1 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                                <!--Inquiry is closed. -->
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group2">Inquire for the Group 2 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                                <!--Inquiry is closed. -->
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements%20Group3">Inquire for the Group 3 Development Tasks of the Application Project</a> to get selected as a developer and to obtain the information necessary to submit a solution.
                                                <!--Inquiry is closed. -->
                                            </strong>
                                        </p>
                                        <p>
                                            <!--To submit a solution, email your submissions to
                                            <a href="mailto:submissions@topcodersoftware.com" class="bodyText">submissions@topcodersoftware.com</a>.
                                            -->
                                        </p>
                                        <p>
                                            <br/>
                                        </p>
                                    </td>
                                    <td valign="top" width="10">
                                        <img src="/i/clear.gif" alt="" width="10" height="1" border="0"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" valign="top"  width="100%">
                                        <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/>
                                    </td>
                                </tr>

                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr valign="top">
                                    <td height="10"><img src="/i/clear.gif" alt="" width="10" height="20" border="0" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <!-- Center Column Ends -->
                        <!-- Gutter begins -->
                        <td width="6">
                            <img src="/i/clear.gif" width="6" height="1" alt="" border="0"/>
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
