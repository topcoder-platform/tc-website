                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
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

                <title>Project Management Dashboard Application Design Project at TopCoder</title>

                <xsl:call-template name="CSS"/>

                <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

            </head>

            <body>

                <!-- Header Begins -->
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>
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
                                        <h1 class="devSubhead">Project Management Dashboard Application: Design</h1>

                                        <p class="smallText">&#160;&#160;&#160;&#160;
                                            <a href="#overview">Overview</a> |
                                            <a href="#projecttype">Project Type</a> |
                                            <a href="#payment">Payment</a> |
                                            <a href="#eligibility">Eligibility</a> |
                                            <a href="#timeline">Timeline</a> |
                                            <a target="_new" href="/i/development/downloads/ServiceAbstract.pdf">Service Requirement Specification</a> |
                                            <a target="_new" href="/i/development/downloads/ReportsAbstract.pdf">Reports Requirement Specification</a> |
                                            Inquire
                                        </p>

                                        <!-- Overview -->
                                        <p>
                                            <strong>
                                                <a name="overview">Overview</a>
                                            </strong>
                                            <br/>
TopCoder Software has engaged with a client to build and deploy a custom Project Management Dashboard application using existing components from the TopCoder Component Catalog as well as specific code to interface with the client's environment.  The design of this application has been split into two separate design projects, Project Management Dashboard Service and Project Management Dashboard Reports, described in detail below.</p>

                                            <p>The client environment contains a legacy sales management system, generally accessed through 3270 terminal sessions.  This terminal interface is not ideal for reporting on sales performance at many levels, and the client wishes to deploy a more full-featured reporting application, allowing users to interact with an HTML based system that allows for user drilling of data from the top level to very low level details.
</p>

                                        <p>
                                            <strong><a name="requirementspecification">View the</a>
                                                <a target="_new" class="bodyText" href="/i/development/downloads/ServiceAbstract.pdf">Project Management Dashboard Service Requirement Specification</a> for this application project.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>View the
                                                <a target="_new" class="bodyText" href="/i/development/downloads/ReportsAbstract.pdf">Project Management Dashboard Reports Requirement Specification</a> for this application project.
                                            </strong>
                                        </p>

                                        <!-- Project Type -->
                                        <p>
                                            <strong>
                                                <a name="projecttype">Project Type</a>
                                            </strong>
                                            <br/>
                                            Application Design Project: Provide a complete design for the Project Management Dashboard Service project or the 
                                            Project Management Dashboard Reports project.  Each project will be designed and reviewed separately, 
                                            the dependencies will be defined in the Specification documentation.  Please review the TopCoder Software
                                            <a href="/?t=development&amp;c=app_meth">Application Development Methodology</a> before you submit a solution.
                                        </p>

                                        <!-- Technologies -->
                                        <p>
                                            <strong>Technologies</strong>
                                        </p>
                                        <ul>
					    <li>.NET 1.1</li>
                                            <li>C#</li>
                                            <li>ADO</li>
                                            <li>SQL</li>
                                            <li>HTML</li>
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
                                            <strong>Project Management Dashboard Service<br/>
                                            Winning Designer</strong>
                                            <br/>
                                            Total Payment - $1,770.00
                                            <br/>
                                            First Payment - $1,062.00
                                            <br/>
                                            Second Payment - $708.00
                                        </p>

                                        <p>
                                            <strong>Second Place Designer</strong>
                                            <br/>
                                            Total Payment - $570.00
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Design Reviewer - $475.00
                                            <br/>
                                            Design Reviewer - $415.00
                                            <br/>
                                            Design Reviewer - $415.00
                                            <br/><br/>
                                            Total - $3,645.00
                                        </p>

                                        <p>
                                            <strong>Project Management Dashboard Reports<br/>
                                            Winning Designer</strong>
                                            <br/>
                                            Total Payment - $2,250.00
                                            <br/>
                                            First Payment - $1,350.00
                                            <br/>
                                            Second Payment - $900.00
                                        </p>

                                        <p>
                                            <strong>Second Place Designer</strong>
                                            <br/>
                                            Total Payment - $720.00
                                            <br/>
                                        </p>

                                        <p>
                                            <strong>Reviewers</strong>
                                            <br/>
                                            Primary Design Reviewer - $565.00
                                            <br/>
                                            Design Reviewer - $505.00
                                            <br/>
                                            Design Reviewer - $505.00
                                            <br/><br/>
                                            Total - $4,545.00
                                            <br/><br/>
                                            Project Total - $8,190.00
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
                                            <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
                                            <li>A Non-US resident authorized to perform services as an independent contractor.</li>
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
                                                    <b/>07.07.2004
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="sidebarText">Member Selection:</td>
                                                <td class="sidebarText" align="right">07.09.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Member Acceptance:</td>
                                                <td class="sidebarText" align="right">07.11.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Start:</td>
                                                <td class="sidebarText" align="right">07.12.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Due:</td>
                                                <td class="sidebarText" align="right">07.19.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Reviews Due:</td>
                                                <td class="sidebarText" align="right">07.22.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Winner Announced:</td>
                                                <td class="sidebarText" align="right">07.26.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Final Fixes Due Date:</td>
                                                <td class="sidebarText" align="right">07.28.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Design Complete:</td>
                                                <td class="sidebarText" align="right">07.29.2004</td>
                                            </tr>

                                            <tr>
                                                <td class="sidebarText">Estimated Development End Date:</td>
                                                <td class="sidebarText" align="right">08.27.2004</td>
                                            </tr>
                                        </table>

                                        <!-- Register at TCS -->
<!--
                                        <p>
                                            <strong>
                                            Inquiry is closed.
                                            </strong>
                                        </p>
-->
                                        <p>
                                            <strong>
                                                <a href="/index?t=development&amp;c=tcs_app_inquire&amp;Project=Project%20Management%20Dashboard%20Service">Inquire for the Project Management Dashboard Service Project</a> to get selected as a designer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
                                        <p>
                                            <strong>
                                                <a href="/index?t=development&amp;c=tcs_app_inquire&amp;Project=Project%20Management%20Dashboard%20Reports">Inquire for the Project Management Dashboard Reports Project</a> to get selected as a designer and to obtain the information necessary to submit a solution.
                                            </strong>
                                        </p>
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
