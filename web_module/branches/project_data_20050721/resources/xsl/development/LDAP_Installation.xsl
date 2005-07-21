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

                <title>LDAP Installation Project at TopCoder</title>

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
                                                <td class="projectTitles" nowrap="nowrap">Infrastructure Project - LDAP Installation</td>
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
TopCoder needs to install and run the SecureWay LDAP server by IBM.  The selected individual will be required to set up and configure the SecureWay server on an internal TopCoder Solaris box.  Furthermore, the SecureWay product may be configured to use a database or the file system.  The installation document will describe configuring and setting up the application both ways.  Additionally, the participant will create a document outlining the advantages and disadvantages for using the database and the file system methods as storage for the LDAP server taking into consideration reliability, fault tolerance, clustering and scalability.
                                                        <br/>
                                                        <br/>
                                                    </p>
                                                    <p class="noSpListTitle">
                                                        <strong>Objectives</strong>
                                                    </p>
                                                    <ul class="noSpList">
                                                        <li>Provide a comprehensive installation guide.  This guide will be used to install the LDAP server at various clients.</li>
                                                        <li>Deliver document outlining the advantages and disadvantages using a database or file system with the LDAP server.</li>

                                                    </ul>
                                                    <!-- Technologies -->
                                                    <p class="noSpListTitle">
                                                        <strong>Technical Architecture Requirements</strong>
                                                    </p>
                                                    <ul class="noSpList">
                                                        <li>Solaris</li>
                                                        <li>SecureWay</li>
                                                        <li>IBM Commerce Server</li>
                                                        <li>Java</li>
                                                    </ul>

                                                    <!-- Payment -->

                                                    <table cellspacing="0" class="formFrame" align="center" width="530">
                                                        <tr>
                                                            <td class="projectHeaders" align="left">Payment</td>
                                                        </tr>
                                                    </table>
                                                    <p>
                                                        TopCoder will compensate the member with the
                                                        who completes the task. In order to be
                                                        paid, the submission must pass the approval of the project manager.
                                                        <br/>
                                                        <br/>
                                                        <strong>Compensation: </strong>
                                                        <br/>
                                                        Compensation for the task is as follows.
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;1. Payment:
                                                        <br/>
                                                        &#160;&#160;&#160;&#160;&#160;When the task is completed and project manager suggestions are integrated.
                                                        <br/>
                                                        <br/>
                                                    </p>

                                                    <p class="noSpListTitle">
                                                        <strong>Task completion</strong>
                                                    </p>
                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="200">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Total Payment -</td>
                                                            <td class="bodyText" align="right">$500.00</td>
                                                        </tr>
                                                    </table>



                                                    <br/>


                                                    <!-- Definition of Completion -->

                                                    <p class="noSpListTitle">
                                                        <strong>Project Completion</strong>
                                                        <br/>
                                                        *Completion of the project is defined as follows:
                                                    </p>

                                                    <ul class="noSpList">
                                                        <li>The Submission has been approved by the project manager as complete.</li>
                                                        <li>Final fixes accepted by the project manager.</li>
                                                        <li>The production environment is configured properly.</li>
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
                                                        The Infrastucture Submission must be submitted on time. All questions submitted
                                                        prior to 6PM EDT on the Submission Due Dates will be answered. Following review
                                                        from the project manager the member is given until the Updated Submission Due Date
                                                        to modify their submission.
                                                    </p>

                                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="400">
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Infrastructure Project Posting:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.24.2004</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Register By:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.26.2004 &#160;&#160;5:00 PM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Member Acceptance:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.27.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Project Start:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">05.28.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Project Due:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">06.04.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Updated Project Due Date:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">06.08.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bodyText" nowrap="nowrap">Installation Complete:</td>
                                                            <td class="bodyText" nowrap="nowrap" align="left">06.10.2004 &#160;&#160;9:00 AM ET</td>
                                                        </tr>
                                                        <tr>
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
