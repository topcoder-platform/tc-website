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

                <title>Single Sign-On Application Design Project at TopCoder</title>

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
                                        <h1 class="devSubhead">Single Sign-On Application: Design</h1>

                                        <p class="smallText">&#160;&#160;&#160;&#160;
                                            <a href="#overview">Overview</a> |
                                            <a href="#projecttype">Project Type</a> |
                                            <a href="#payment">Payment</a> |
                                            <a href="#eligibility">Eligibility</a> |
                                            <a href="#timeline">Timeline</a> |
                                            <a href="#requirementspecification">Requirement Specification</a>
                                        </p>

                                        <!-- Overview -->
                                        <p>
                                            <strong>
                                                <a name="overview">Overview</a>
                                            </strong>
                                            <br/>
                                            TopCoder Software has engaged with a customer to build and integrate a custom Single Sign-On (SSO) 
                                            application using existing components from the TopCoder Component Catalog as well as specific code to 
                                            interface with the client's environment. The design of this application has been split into two separate 
                                            design projects, SSO Security Server and SSO Application Authentication, described in detail below.</p>

                                            <p>The client environment contains a set of web-enabled applications that each have separate logon 
                                            procedures.  This causes various difficulties for users, developers and administrators.  For example, 
                                            given multiple usernames and passwords to remember, users often forget one of their passwords and 
                                            must get in touch with support staff to reset their profiles.  The client wishes to provide SSO functionality 
                                            for this group of applications.  This involves allowing a user to have a single identity that allows them to 
                                            seamlessly access any one of these applications without logging in.</p>

                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/SingleSignOn_v10-web.pdf">Business Requirement Specification</a> for this application project.
                                            </strong>
                                        </p>

                                        <!-- Project Type -->
                                        <p>
                                            <strong>
                                                <a name="projecttype">Project Type</a>
                                            </strong>
                                            <br/>
                                            Application Design Project: Provide a complete design for the SSO Security Server project and the 
                                            SSO Application Authentication project.  Each project will be designed and reviewed separately, 
                                            the dependencies will be defined in the Specification documentation.  Please review the TopCoder Software
                                            <a href="/?&amp;t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                        </p>

                                        <!-- Technologies -->
                                        <p>
                                            <strong>Technologies</strong>
                                        </p>
                                        <ul>
                                            <li>Java 1.3</li>
                                            <li>SAML</li>
                                            <li>J2EE</li>
                                            <li>JDBC</li>
                                            <li>JSP</li>
                                        </ul>

                                        <!-- Payment -->
                                        <p>
                                            <strong>
                                                <a name="payment">Payment</a>
                                            </strong>
                                            <br/>
                                             For each design project, TopCoder will compensate the member with the winning solution as well as the second place designer. In order to be paid, the submission must pass screening and receive a review score above the minimum score of 50.
                                             <br/><br/>
                                             Compensation for the winning solution is distributed in two installments.
                                             <br/><br/>
                                            <strong>First Payment:</strong>
                                            <br/>
                                             When the winning solution is submitted and review board suggestions are integrated. 
                                             <br/><br/>
                                            <strong>Second Payment:</strong>
                                            <br/>
                                             At the completion of the development project*. 
                                             <br/><br/>
                                             Compensation for the second place designer will be paid in one installment following the completion of the design project.
                                        </p>

                                        <p>
                                            <strong>SSO Security Server<br/>
                                            Winning Designer</strong>
                                            <br/>
                                            Total Payment - $3,306.00
                                            <br/>
                                            First Payment - $2,010.00
                                            <br/>
                                            Second Payment - $1,296.00
                                        </p>

                                        <p>
                                            <strong>Second Place Designer</strong>
                                            <br/>
                                            Total Payment - $1,005.00
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Design Reviewer - $723.00
                                            <br/>
                                            Design Reviewer - $703.00
                                            <br/>
                                            Design Reviewer - $703.00
                                            <br/><br/>
                                            Total - $6,440.00
                                        </p>

                                        <p>
                                            <strong>SSO Application Authentication<br/>
                                            Winning Designer</strong>
                                            <br/>
                                            Total Payment - $2,826.00
                                            <br/>
                                            First Payment - $1,710.00
                                            <br/>
                                            Second Payment - $1,116.00
                                        </p>

                                        <p>
                                            <strong>Second Place Designer</strong>
                                            <br/>
                                            Total Payment - $855.00
                                            <br/>
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Design Reviewer - $633.00
                                            <br/>
                                            Design Reviewer - $613.00
                                            <br/>
                                            Design Reviewer - $613.00
                                            <br/><br/>
                                            Total - $5,540.00
                                            <br/><br/>
                                            Project Total - $11,980.00
                                        </p>

                                        <!-- Definition of Completion -->

                                        <p>
                                            <sup>*</sup>Completion of the project is defined as follows:
                                        </p>

                                        <ul>
                                            <li>The Submission has been selected by the board as the winning submission.</li>
                                            <li>Final fixes accepted by the design review board.</li>
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
                                            <li>A US Citizen </li>
                                            <li>A Lawful Permanent Resident of the US</li>
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
                                                    <b/>10.29.2003
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Member Selection:</td>
                                                <td class="sidebarText" align="right">11.04.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Member Acceptance:</td>
                                                <td class="sidebarText" align="right">11.05.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Start:</td>
                                                <td class="sidebarText" align="right">11.06.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Phase 1 Due:
                                                    <br/>
                                                    &#160;&#160;&#160;Use Cases
                                                    <br/>
                                                    &#160;&#160;&#160;Class Diagrams
                                                    <br/>
                                                    &#160;&#160;&#160;Sequence Diagrams
                                                </td>
                                                <td class="sidebarText" valign="top" align="right">11.18.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Phase 2 Due:
                                                    <br/>
                                                    &#160;&#160;&#160;Design Specification
                                                </td>
                                                <td class="sidebarText" valign="top" align="right">11.25.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Phase 3 Due:
                                                    <br/>
                                                    &#160;&#160;&#160;Test Plan
                                                    <br/>
                                                    &#160;&#160;&#160;Development Scope
                                                    <br/>
                                                    &#160;&#160;&#160;Document
                                                </td>
                                                <td class="sidebarText" valign="top" align="right">12.02.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Winner Announced:</td>
                                                <td class="sidebarText" align="right">12.09.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Updated Submission Due Date:</td>
                                                <td class="sidebarText" align="right">12.16.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Complete:</td>
                                                <td class="sidebarText" align="right">12.17.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Estimated Development End Date:</td>
                                                <td class="sidebarText" align="right">02.12.2004</td>
                                            </tr>
                                        </table>

                                        <!-- Register at TCS -->
                                        <p>
                                            <a name="requirementspecification"></a>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/SingleSignOn_v10-web.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>

                                        <p>
                                            <strong>
                                                <a href="/index?&amp;t=development&amp;c=tcs_app_inquire&amp;Project=Single%20Sign%20On">Inquire for the Single Sign-On Project</a> to get selected as a designer and to obtain the information necessary to submit a solution.
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
