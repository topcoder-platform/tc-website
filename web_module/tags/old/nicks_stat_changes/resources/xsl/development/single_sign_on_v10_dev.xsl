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

                <title>Single Sign-On Development Project at TopCoder</title>

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
                                        <h1 class="devSubhead">Single Sign-On Application: Development</h1>

                                        <p class="smallText">&#160;&#160;&#160;&#160;
                                            <a href="#overview">Overview</a> |
                                            <a href="#projecttype">Project Type</a> |
                                            <a href="#payment">Payment</a> |
                                            <a href="#eligibility">Eligibility</a> |
                                            <a href="#timeline">Timeline</a> |
                                            <a target="_new" href="/i/development/downloads/SSODevelopmentRFI1.pdf">Requirement Specification</a> 
                                            
                                        </p>

                                        <!-- Overview -->
                                        <p>
                                            <strong>
                                                <a name="overview">Overview</a>
                                            </strong>
                                            <br/>
                                             TopCoder Software has engaged with a customer to build and integrate a custom Single Sign-On (SSO) application
                                             using existing components from the TopCoder Component Catalog as well as specific code to interface with the client's environment.
                                             </p>
                                             <p>
                                             The client environment contains a set of web-enabled applications that each have separate logon procedures.  This causes
                                             various difficulties for users, developers and administrators.  For example, given multiple usernames and passwords to remember,
                                             users often forget one of their passwords and must get in touch with support staff to reset their profiles.  The client wishes to provide
                                             SSO functionality for this group of applications.  This involves allowing a user to have a single identity that allows them to seamlessly
                                             access any one of these applications without logging in.
                                             </p>
                                             <p>
                                             The design of this application was broken into two parts, SSO Security Server and SSO Application Authentication.  Based on these
                                             designs, development has been further broken down in to five development projects.
                                             </p>

                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/SSODevelopmentRFI1.pdf">Business Requirement Specification</a> for this application project.  The following documentation will be available to the developers during the development phase:

                                            </strong>
                                        <br/>
                                        <ul>
                                            <li>Class Diagram.</li>
                                            <li>Use-Case Diagram.</li>
                                            <li>Sequence Diagrams.</li>
                                            <li>Application Design Specification.</li>
                                            <li>Database Schema.</li>
                                            <li>Test Plan.</li>
                                        </ul>
                                        </p>

                                          <p>
                                          <strong>Functionality to be implemented for each design:</strong>
                                          </p>
                                          <p>
                                          <strong>Security Server EJB Interface</strong>
                                          <br/>
                                          &#160;&#160;&#160;Updating of user accounts
                                          <br/>
                                          &#160;&#160;&#160;Use of Security Server database tables
                                          </p>
                                          <p>
                                          <strong>Security Server SAML Interface</strong>
                                          <br/>
                                          &#160;&#160;&#160;SAML-compliant lookup of user account information
                                          <br/>
                                          &#160;&#160;&#160;Use of Security Server database tables
                                          </p>
                                          <p>
                                          <strong>Portal Adapter</strong>
                                          <br/>
                                          &#160;&#160;&#160;Handle user requests
                                          <br/>
                                          &#160;&#160;&#160;Query and update Security Server data
                                          <br/>
                                          &#160;&#160;&#160;Authenticate users using Application Authenticators
                                          </p>
                                          <p>
                                          <strong>JSP-Based Application Authenticators</strong>
                                          <br/>
                                          &#160;&#160;&#160;Authenticate users against various JSP-based client applications
                                          <br/>
                                          &#160;&#160;&#160;Parse responses to verify successful login
                                          </p>

                                          <p>
                                          <strong>WebConnect-based Application Authentication</strong><br/>
                                          Interact with WebConnect terminal emulation software through Java API
                                          </p>

                                          <p>
                                            <strong>
                                                <a name="projecttype">Project Type</a>
                                            </strong>
                                            <br/>
                                          Application Development Project: Provide a completed development solution according to the design requirements for the Single Sign-On application. Please review the TopCoder Software <a href="/?t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                          </p>

                                          <p>
                                          <strong>Technologies</strong>
                                          <ul>
                                          <li>Java 1.3</li>
                                          <li>JSP</li>
                                          <li>Java Servlets</li>
                                          <li>JDBC</li>
                                          <li>Oracle SQL</li>
                                          <li>SAML</li>
                                          <li>J2EE</li>
                                          <li>EJB</li>
                                          </ul>
                                          </p>

                                          <p>
                                            <strong>
                                                <a name="payment">Payment</a>
                                            </strong>
                                            <br/>
                                          TopCoder will compensate the member with the winning solution as well as the second place developer. In order to be paid, both the winning submission and the second place submission must pass screening and receive a review score above the minimum score of 50.
                                          </p>
                                          <p>
                                          Compensation for the winning solution is distributed in two installments.
                                          </p>
                                          <p>
                                          <strong>First Payment:</strong><br/>
                                          When the winning solution is submitted and review board suggestions are integrated.
                                          </p>
                                          <p>
                                          <strong>Second Payment:</strong><br/>
                                          At the completion of the integration project*.
                                          </p>
                                          <p>
                                          Compensation for the second place developer will be paid in one installment following the completion of the integration project.
                                          </p>

                                          <p>
                                          <strong>Security Server EJB Interfaces</strong>
                                          </p>

                                          <p>
                                          <strong>Winning Developer</strong><br/>
Total Payment - $980.00<br/>
First Payment - $700.00<br/>
Second Payment - $280.00
</p>

                                          <p>
                                          <strong>Second Place Developer</strong><br/>
Total Payment - $350.00
</p>

                                          <p>
                                          <strong>Reviewers</strong><br/>
Primary Development Reviewer - $313.00<br/>
Development Reviewer - $202.00<br/>
Development Reviewer - $202.00
</p>

<p>
Total - $2,047.00
</p>


                                          <p>
                                          <strong>Security Server SAML Interfaces</strong>
                                          </p>


                                          <p>
                                          <strong>Winning Developer</strong><br/>
Total Payment - $980.00<br/>
First Payment - $700.00<br/>
Second Payment - $280.00
</p>


                                          <p>
                                          <strong>Second Place Developer</strong><br/>
Total Payment - $350.00
</p>

                                          <p>
                                          <strong>Reviewers</strong><br/>
Primary Development Reviewer - $313.00<br/>
Development Reviewer - $202.00<br/>
Development Reviewer - $202.00
</p>

<p>
Total - $2,047.00
</p>

                                          <p>
                                          <strong>Portal Adapter</strong>
                                          </p>

                                          <p>
                                          <strong>Winning Developer</strong><br/>
Total Payment - $630.00<br/>
First Payment - $450.00<br/>
Second Payment - $180.00
</p>

                                          <p>
                                          <strong>Second Place Developer</strong><br/>
Total Payment - $225.00
</p>

                                          <p>
                                          <strong>Reviewers</strong><br/>
Primary Development Reviewer - $270.00<br/>
Development Reviewer - $160.00<br/>
Development Reviewer - $160.00
</p>

<p>
Total - $1,445.00
</p>

                                          <p>
                                          <strong>JSP-Based Application Authenticators</strong>
                                          </p>

                                          <p>
                                          <strong>Winning Developer</strong><br/>
Total Payment - $805.00<br/>
First Payment - $575.00<br/>
Second Payment - $230.00
</p>

                                          <p>
                                          <strong>Second Place Developer</strong><br/>
Total Payment - $287.00
</p>

                                          <p>
                                          <strong>Reviewers</strong><br/>
Primary Development Reviewer - $292.00<br/>
Development Reviewer - $181.00<br/>
Development Reviewer - $181.00
</p>

<p>
Total - $1,746.50
</p>

                                          <p>
                                          <strong>WebConnect-Based Application Authenticators</strong>
                                          </p>

                                          <p>
                                          <strong>Winning Developer</strong><br/>
Total Payment - $805.00<br/>
First Payment - $575.00<br/>
Second Payment - $230.00
</p>

                                          <p>
                                          <strong>Second Place Developer</strong><br/>
Total Payment - $287.00
</p>

                                          <p>
                                          <strong>Reviewers</strong><br/>
Primary Development Reviewer - $292.00<br/>
Development Reviewer - $181.00<br/>
Development Reviewer - $181.00
</p>

<p>
Total - $1,746.50
</p>


                                          <p>
                                          *Completion of the project is defined as follows:
                                          <ul>
                                          <li>The Submission has been selected by the board as the winning submission.</li>
                                          <li>Final fixes accepted by the development review board.</li>
                                          <li>Application launch into production environment.</li>
                                          </ul>
                                          </p>

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
                                             The Development Submission must be submitted on time. All questions submitted prior to 6PM EDT on the Submission Due Dates
                                             will be answered. Following review from the board the winning member is given until the Updated Submission Due Date to modify
                                             their submission.
                                        </p>

                                        <table border="0" cellspacing="2" cellpadding="3" class="sidebarBox">
                                            <tr>
                                                <td class="sidebarText">Application Project Posting:</td>
                                                <td class="sidebarText" align="right">12.16.2003</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Inquire By:</td>
                                                <td class="sidebarText" align="right">12.29.2003 12:00PM</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Member Selection:</td>
                                                <td class="sidebarText" align="right">12.29.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Member Acceptance:</td>
                                                <td class="sidebarText" align="right">12.29.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Development Start:</td>
                                                <td class="sidebarText" valign="top" align="right">12.30.2003</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Development Due:</td>
                                                <td class="sidebarText" align="right">01.19.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Winner Announced:</td>
                                                <td class="sidebarText" align="right">01.24.2004 6:00PM</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Integration Start:</td>
                                                <td class="sidebarText" align="right">01.26.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">QA Start:</td>
                                                <td class="sidebarText" align="right">02.02.2004</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Acceptance:</td>
                                                <td class="sidebarText" align="right">02.11.2004</td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Deployment to Client:</td>
                                                <td class="sidebarText" align="right">03.08.2004</td>
                                            </tr>
                                        </table>

                                        <!-- Register at TCS -->
                                        <p>
                                            <a name="requirementspecification"></a>
                                            <strong>View the Requirement Specification for this application project
                                                <a target="_new" class="bodyText" href="/i/development/downloads/SSODevelopmentRFI1.pdf">Requirement Specification</a> for this application project &gt;&gt;
                                            </strong>
                                        </p>

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
