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

                <title>Seat Service Scheduling Design Project at TopCoder</title>

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

                            <img src="/i/clear.gif" alt="" width="1" height="20" border="0"/>
                            <br/>

                            <xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
                            <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
                            <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>

                            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                <tr valign="top">
                                    <td class="bodyText" width="100%">
                                        <img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
                                        <br/>

                                        <!-- Title -->
                                        <table cellspacing="0" class="formFrame" align="center" width="530">
                                            <tr>
                                                <td class="projectTitles" nowrap="nowrap">Design Application Project - Seat Service Scheduling Design</td>
                                            </tr>
                                            <tr>
                                                <td class="projectHeaders" align="left">Overview</td>
                                            </tr>
                                        </table>

                                        <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/>
                                        <br/>

                                        <table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
                                            <tr valign="top">
                                                <td class="bodyText">
                                                    <!-- Overview -->
                                                    <p>
                                                        The seat service is a stateless service responsible for managing seats at different
                                                        testing locations worldwide.  The service provides mechanisms for scheduling seat
                                                        date-times for events.  The service also facilitates seat inventory management including
                                                        the adding, removing and manipulation of seats and testing locations.
                                                    </p>
                                                    <p>
                                                        The seat service is broken up in to multiple modules for design.  The Seat Service Shell
                                                        module receives and parses all consumer XML requests and then makes the appropriate call
                                                        to either the Scheduling module or Admin module to execute business logic.  When the call
                                                        returns, the Shell module constructs an XML response and sends it to the consumer.  The
                                                        Scheduling module handles all core business logic related to scheduling functionality.
                                                        The Admin module handles all core business logic related to inventory management
                                                        (list, retrieve, add, update, delete).  The final module is the Seat Service Persistence
                                                        module.  The Persistence layer handles all database transactions for both scheduling
                                                        and inventory management.
                                                    </p>
                                                    <p>
                                                        <strong>Business Requirement Specification </strong>
                                                        <br/>
                                                        View the
                                                        <a target="_new" class="bodyText" href="/i/development/downloads/Seat_Service_Scheduling_Spec.pdf">Requirement Specification</a> for this application project.
                                                    </p>
                                                    <!-- Technologies -->
                                                    <p class="noSpListTitle">
                                                        <strong>Technical Architecture Requirements</strong>
                                                    </p>
                                                    <ul class="noSpList">
                                                        <li>.NET 1.1</li>
                                                        <li>C#</li>
                                                        <li>MicroSoft SQL Server 2000</li>
                                                    </ul>

                                                    <!-- Payment -->

                                                    <table cellspacing="0" class="formFrame" align="center" width="530">
                                                        <tr>
                                                            <td class="projectHeaders" align="left">Payment</td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        For each design project, TopCoder will compensate the member with the
                                                        winning solution as well as the second place designer. In order to be
                                                        paid, the submission must pass screening and receive a review score
                                                        above the minimum score of 50.
                                                        <br/>
                                                        <br/>
                                                        <strong> First Place Compensation: </strong>
                                                        <br/>
                                                        Compensation for the winning solution is distributed in two installments.
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;1. First Payment:
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;When the winning solution is submitted and review board suggestions are integrated.
                                                        <br/>
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;2. Second Payment:
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;At the completion of the design project*.
                                                        <br/>
                                                        <br/>
                                                        <strong> Second Place Compensation: </strong>
                                                        <br/>
                                                        Compensation for the second place design will be paid in one installment
                                                        following the completion of the design project.
                                                    </p>

                                                    <p class="noSpListTitle">
                                                        <strong>Winning Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$4,000.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">First Payment -</td>
                                                            <td class="bodyText" align="right">$2,500.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Second Payment - </td>
                                                            <td class="bodyText" align="right">$1,500.00</td>
                                                        </tr>
                                                    </table>

                                                    <p class="noSpListTitle">
                                                        <strong>Second Place Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$1,800.00</td>
                                                        </tr>
                                                    </table>
                                                    <p class="noSpListTitle">
                                                        <strong>Third Place Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$1,800.00</td>
                                                        </tr>
                                                    </table>
                                                    <p class="noSpListTitle">
                                                        <strong>Fourth Place Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$1,800.00</td>
                                                        </tr>
                                                    </table>

                                                    <p class="noSpListTitle">
                                                        <strong>Reviewers</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Primary Design Reviewer -</td>
                                                            <td class="bodyText" align="right">$580.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Reviewer -</td>
                                                            <td class="bodyText" align="right">$500.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Reviewer - </td>
                                                            <td class="bodyText" align="right">$500.00</td>
                                                        </tr>
                                                    </table>

                                                    <br/>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total - </td>
                                                            <td class="bodyText" align="right">$10,980.00</td>
                                                        </tr>
                                                    </table>



                                                    <!-- Definition of Completion -->

                                                    <p class="noSpListTitle">
                                                        <strong>Project Completion</strong>
                                                        <br/>
                                                        *Completion of the project is defined as follows:
                                                    </p>

                                                    <ul class="noSpList">
                                                        <li>The Submission has been selected by the board as the winning submission.</li>
                                                        <li>Final fixes accepted by the design review board.</li>
                                                        <li>Application launch into production environment.</li>
                                                    </ul>

                                                    <!-- Eligibility Requirements -->
                                                    <table cellspacing="0" class="formFrame" align="center" width="530">
                                                        <tr>
                                                            <td class="projectHeaders" align="left">Eligibility</td>
                                                        </tr>
                                                    </table>
                                                    <p class="noSpListTitle">
                                                        You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership
                                                        requirements and fit into one of the following categories:
                                                    </p>

                                                    <ul class="noSpList">
                                                        <li>A US Citizen. </li>
                                                        <li>A Lawful Permanent Resident of the US.</li>
                                                        <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                                                        <li>A Non-US Citizen working in your country of residence.</li>
                                                    </ul>

                                                    <!-- Timeline -->
                                                    <table cellspacing="0" class="formFrame" align="center" width="530">
                                                        <tr>
                                                            <td class="projectHeaders" align="left">Timeline</td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        The Design Submission must be submitted on time. All questions submitted
                                                        with more than 24 hours before the Submission Due Dates will be answered. Following review
                                                        from the board the winning member is given until the Updated Submission Due Date
                                                        to modify their submission.
                                                    </p>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="400">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Application Project Posting:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">09.22.2004</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Register By:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.09.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Member Acceptance:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.09.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Start:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.09.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.22.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Reviewer Screening Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.22.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Review Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.26.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Appeals Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.27.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Appeal Responses Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.27.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Winner Announced:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.28.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Final Fixes Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">11.01.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Reviewer Final Review Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">11.02.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Complete:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">11.02.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                    </table>

                                                    <!-- Register at TCS -->
                                                    <p>
                                                        <a name="requirementspecification"></a>
                                                        <strong>Document and Templates </strong>
                                                        <br/>
                                                        View the
                                                        <a target="_new" class="bodyText" href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=appDocumentation">Documents and Templates</a> for the Application Development Methodology


                                                    </p>

                                                    <p>
                                                        <strong> Registration </strong>
                                                        <br/>
                                                        Closed.
                                                        <!--Register <a href="/index?t=development&amp;c=tcs_app_inquire&amp;Project=Seat%20Service%20Scheduling%20Design&amp;phase=112">here</a> to get selected as a developer and to obtain the information necessary to submit a solution.-->
                                                    </p>
                                                </td>
                                            </tr>
                                        </table>

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
