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

                <title>EDI Certification Website Application Design Project at TopCoder</title>

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
                                                <td class="projectTitles" nowrap="nowrap">Design Application Project - EDI Certification Website Application</td>
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
                                                        CLIENT (CLIENT) has identified the need to create an automated system to test the Electronic Data Interchange (EDI)
                                                        capabilities of their vendors.  Vendor communication such as purchase orders, inventory and shipping notifications
                                                        are vital to CLIENT to ensure minimum product shelf life and the ability to provide just-in-time inventory to the
                                                        stores.  The previous testing and vendor verification system was outsourced by CLIENT to a third party.  The new
                                                        EDI Testing System (ETS) will replace and improve on the shortcomings of the existing process.

                                                        The testing process will be automated by the new ETS system, thereby replacing the existing manual process with
                                                        more accurate EDI testing rules.  The new system will provide the ability to manage, monitor and report on a
                                                        vendors EDI testing progress.
                                                    </p>

                                                    <p>
                                                        <strong>Business Requirements Specification </strong>
                                                        <br/>
                                                        View the <a target="_new" class="bodyText" href="/i/development/downloads/EDI_Certification_Website.pdf">Business Requirements Specification</a> for this project.
                                                    </p>


                                                    <!-- Technologies -->
                                                    <p class="noSpListTitle">
                                                        <strong>Technical Architecture Requirements</strong>
                                                    </p>
                                                    <ul class="noSpList">
                                                        <li>Linux</li>
                                                        <li>Java 1.4</li>
                                                        <li>Oracle 8.1.7.3</li>
                                                        <li>Tomcat</li>
                                                        <li>Apache</li>
                                                    </ul>

                                                    <!-- Payment -->

                                                    <table cellspacing="0" class="formFrame" align="center" width="530">
                                                        <tr>
                                                            <td class="projectHeaders" align="left">Payment</td>
                                                        </tr>
                                                    </table>
                                                    <p>

                                                        For each team application project, TopCoder will compensate the team with the winning solution
                                                        as well as the second place team. In order for a team to be paid, the team's submission must
                                                        pass the minimum screening criteria.
                                                        <br/>
                                                        <br/>
                                                        <strong>Winning Application Team</strong>
                                                        <br/>
                                                        Payment: $12,600
                                                        <br/>
                                                        <strong>Second Place Application Team</strong>
                                                        <br/>
                                                        Payment: $8,400
                                                        <br/>
                                                        Total: $21,000
                                                        <br/>
                                                        All payments will be subject to any prize penalties that were assessed by a team during the
                                                        application design and development process.  Any payments will be sent upon project completion.
                                                        Payments will be divided evenly between the two named team members and sent separately.

                                                    </p>

                                                    <!-- Definition of Completion -->

                                                    <p class="noSpListTitle">
                                                        <strong>Project Completion</strong>
                                                        <br/>
                                                        *Completion of the project is defined as follows:
                                                    </p>

                                                    <ul class="noSpList">
                                                        <li>The Submission has been selected by TopCoder and a TopCoder review board member as the winning submission.</li>
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
                                                        All Submissions must be submitted on time. All questions submitted
                                                        with more than 24 hours before a due date will be answered.
                                                    </p>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="400">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Team Application Project Posting:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">09.10.2004</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Register By:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">09.30.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Proposal Submission:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">09.30.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Teams Chosen:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">09.30.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Remaining Design Begins:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.11.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Complete Design Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.12.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Development Checkpoint:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.15.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Final Application Submission Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.18.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Winner Selected:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">10.18.2004 &#160;&#160;5:00 PM ET</td>
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
                                                        Closed.
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
