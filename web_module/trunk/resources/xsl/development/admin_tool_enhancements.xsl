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
                <table width="100%" border="0" cellpadding="0" cellspacing="0"  bgcolor="#001B35">
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
                                <xsl:with-param name="image1">steelblue</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Application Development</xsl:with-param>
                            </xsl:call-template>
                            <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                            <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                            <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>
                            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" width="100%">
                                <tr>
                                    <td bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" valign="top" width="11">
                                        <img src="/i/clear.gif" alt="" width="11" height="1" border="0"/>
                                    </td>
                                    <td class="statText" colspan="2" valign="top" bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" width="100%">
                                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                                        <br/>

                                        <!-- Title -->
                                        <h1 class="devSubhead">
                                            <strong>Admin Tool Enhancements Application: Design</strong>
                                        </h1>
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
                                            Members that are chosen for the Admin Tool Enhancements project will be given full access
                                            to the current TopCoder code base and access to our development environments.
                                        </p>
                                        <!-- Project Type -->
                                        <p>
                                            <strong>Project Type</strong>
                                            <br/>
                                            Application Design Project: Provide a complete design for the Online Review
                                            application.   Please review the TopCoder Software
                                            <a class="statText" href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
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
                                        <p>TopCoder will compensate the member with the winning solution as well as the second place designer.
                                            In order to be paid, both the winning submission and the second place designer must pass screening
                                            and receive a review score above the minimum score.</p>
                                        Compensation for the winning solution is distributed in two installments.
                                        <br/>
                                        First Payment: When the winning solution is submitted and review board suggestions are integrated.
                                        <br/>
                                        Final Payment: At the completion of the development project*.
                                        <br/>
                                        <p>Compensation for the second place designer will be paid in one installment following the completion of the design project.</p>
                                        <p>
                                            <strong>Winning Designer</strong>
                                            <br/>
                                            Total Payment - $1,500.00
                                            <br/>
                                            First Payment - $1,200.00
                                            <br/>
                                            Final Payment - $300.00
                                            <br/>
                                        </p>
                                        <strong>Second Place Designer</strong>
                                        <br/>
                                        Total Payment - $750.00
                                        <!-- Definition of Completion -->
                                        <p/>
                                        <sup>*</sup>Completion of the project is defined as follows:
                                        <ul>
                                            <li>The Submission has been selected by the board as the winning submission.</li>
                                            <li>Final payment is conditional on acceptance of the fully functional application by the Development Review Board.</li>
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
                                            The Design Submission must be submitted on time. All questions submitted prior to 6PM EDT on the Submission Due Dates will be
                                            answered. Following review from the board the winning member is given until the Updated Submission Due Date to modify their submission.
                                        </p>
                                        <p>
                                            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" width="100%">
                                                <tr>
                                                    <td class="statText" bgcolor="#001B35" width="100%">Application Project Posting:</td>
                                                    <td class="statText" bgcolor="#001B35" width="100%">7.15.2003</td>
                                                </tr>
                                                <tr>
                                                    <td class="statText" colspan="2" valign="top" bgcolor="#001B35" width="100%">Member Selection:</td>
                                                    <td class="statText" colspan="2" valign="top" bgcolor="#001B35" width="100%">7.18.2003</td>
                                                </tr>
                                            </table>



                                            <br/>Application Project Posting: 7.15.2003 <br/>
                                            <br/>Member Selection: 7.18.2003 <br/>
                                            <br/>Member Acceptance: 7.21.2003 <br/>
                                            <br/>Design Start: 7.22.2003 <br/>
                                            <br/>Phase 1 Due Date: 7.28.2003
                                                <br/>&#160;&#160;&#160;Use Cases
                                                <br/>&#160;&#160;&#160;Class Diagrams
                                                <br/>&#160;&#160;&#160;Sequence Diagrams<br/>
                                            <br/>Phase 2 Due Date: 8.04.2003
                                                 <br/> &#160;&#160;&#160;Design Specification<br/>
                                            <br/>Phase 3 Due Date: 8.11.2003
                                                 <br/>&#160;&#160;&#160;Test Plan
                                                 <br/>&#160;&#160;&#160;Development Scope Document<br/>
                                            <br/>Winner Announced 8.13.3003<br/>
                                            <br/>Updated Submission Due Date: 8.15.2003<br/>
                                            <br/>Estimated Development End Date: 10.6.2003<br/>
                                            <br/>
                                        </p>
                                        <!-- Register at TCS -->
                                        <p>
                                            <strong>View the
                                                <a target="_new" class="statText" href="/i/development/downloads/AdminToolRequirementsSpecification-web.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a class="statText" href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Admin%20Tool%20Enhancements">Register for the Application Project</a> to get information necessary to submit a solution &gt;&gt;
                                            </strong>
                                        </p>
                                        <p>
                                            To submit a solution, email your submissions to
                                            <a href="mailto:submissions@topcodersoftware.com" class="statText">submissions@topcodersoftware.com</a>.
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
                                    <td colspan="4" valign="top" bgcolor="#001B35" background="/i/steel_darkblue_bg.gif" width="100%">
                                        <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/>
                                    </td>
                                </tr>

                            </table>
                            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
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
                        <td width="244" valign="top" bgcolor="#001B35">
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
