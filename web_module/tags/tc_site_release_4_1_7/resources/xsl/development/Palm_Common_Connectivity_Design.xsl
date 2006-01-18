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

                <title>Palm Common Connectivit Design Project at TopCoder</title>

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
                                                <td class="projectTitles" nowrap="nowrap">Design Application Project - Palm Common Connectivity</td>
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
                                                        A TopCoder client has existing infrastructure and software to support
                                                        certain in-store Palm applications at all of their stores.  One of these
                                                        is a merchandise transfers and receiving application.   In order to minimize
                                                        the number of transferred cartons that are lost or stolen, the client would
                                                        like to begin storing transfers and receipts in a corporate database on a
                                                        real-time basis as they are being scanned on the Palm at the store.
                                                        <br/>
                                                        <br/>
                                                        In order to support the connectivity between Palms at a store and the corporate
                                                        server, a component called Data Access Socket Server is being developed.  This
                                                        component will accept socket connections from the Palm applications, which will
                                                        then pass through delimited strings in order to execute SQL queries/stored procedure
                                                        calls within an Oracle database.  The Palm applications will also need to function in
                                                        both a batch mode (which they currently do) and an online mode depending on network
                                                        connectivity.
                                                        <br/>
                                                        <br/>
                                                        The Palm Common Remote Connectivity Application module will contain the various common Palm
                                                        utilities and functions to support the connectivity requirements that are common among the various Palm
                                                        applications that will be modified/developed. The scope of this project DOES NOT include the design
                                                        and/or development of the individual Palm applications that will utilize the Common Library. However, the
                                                        full application requirements will be provided to the designer as a reference to understand what the
                                                        ultimate usage of the Common Remote Connectivity will be and how it fits into the overall application
                                                        architecture.
architecture.
                                                        <br/>
                                                        <br/>

                                                        <strong>Note:</strong>
                                                        <br/>
                                                        TopCoder will supply Code Warrior 8 to all participating members.


                                                    </p>

                                                    <p>
                                                        <strong>Business Requirement Specification </strong>
                                                        <br/>
                                                        View the <a target="_new" class="bodyText" href="/i/development/downloads/Palm_Common_Remote_Connectivity_App_Req_Spec2.pdf">Business Requirement Specification</a> for this application project.
                                                    </p>


                                                    <!-- Technologies -->
                                                    <p class="noSpListTitle">
                                                        <strong>Technical Architecture Requirements</strong>
                                                    </p>
                                                    <ul class="noSpList">
                                                        <li>Palm OS 3.5.2</li>
                                                        <li>C++</li>
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
                                                        &#160;&#160;&#160;&#160;&#160;At the completion of the development project*.
                                                        <br/>
                                                        <br/>
                                                        <strong> Second Place Compensation: </strong>
                                                        <br/>
                                                        Compensation for the second place designer will be paid in one installment
                                                        following the completion of the design project.
                                                    </p>

                                                    <p class="noSpListTitle">
                                                        <strong>Winning Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$1200.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">First Payment -</td>
                                                            <td class="bodyText" align="right">$800.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Second Payment - </td>
                                                            <td class="bodyText" align="right">$400.00</td>
                                                        </tr>
                                                    </table>

                                                    <p class="noSpListTitle">
                                                        <strong>Second Place Designer</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$400.00</td>
                                                        </tr>
                                                    </table>

                                                    <p class="noSpListTitle">
                                                        <strong>Reviewers</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Primary Design Reviewer -</td>
                                                            <td class="bodyText" align="right">$260.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Reviewer -</td>
                                                            <td class="bodyText" align="right">$235.00</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Reviewer - </td>
                                                            <td class="bodyText" align="right">$235.00</td>
                                                        </tr>
                                                    </table>

                                                    <br/>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total - </td>
                                                            <td class="bodyText" align="right">$2,335.00</td>
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
                                                        prior to 6PM EDT on the Submission Due Dates will be answered. Following review
                                                        from the board the winning member is given until the Updated Submission Due Date
                                                        to modify their submission.
                                                    </p>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="400">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Application Project Posting:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.06.2004</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Register By:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.20.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Member Acceptance:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.20.2004 &#160;&#160;12:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Start:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.20.2004 &#160;&#160;12:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.27.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Winner Announced:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.30.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Updated Submission Due Date:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">06.02.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Design Complete:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">06.04.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Estimated Development End Date:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">07.10.2004</td>
                                                        </tr>
                                                    </table>

                                                    <!-- Register at TCS -->
                                                    <p>
                                                        <a name="requirementspecification"></a>
                                                        <strong>Document and Templates </strong>
                                                        <br/>
                                                        View the <a target="_new" class="bodyText" href="/tc?module=Static&amp;d1=dev&amp;d2=support&amp;d3=appDocumentation">Documents and Templates</a> for the Application Development Methodology


                                                    </p>

                                                    <p>
                                                        <strong> Registration </strong>
                                                        <br/>
                                                        Closed
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
