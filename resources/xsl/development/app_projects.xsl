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

                <title>Open Application Projects for TopCoder Software Development</title>

                <xsl:call-template name="CSS"/>

                <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

            </head>

            <BODY>
                <xsl:call-template name="Top">
                    <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

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
                        <td width="1">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Center Column Begins -->
                        <td class="bodyText" width="100%">
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">development</xsl:with-param>
                                <xsl:with-param name="title">&#160;Applications</xsl:with-param>
                            </xsl:call-template>

                            <img src="/i/clear.gif" alt="" width="240" height="10" border="0"/>

                            <p>There are also
                                <A href="/index?t=development&amp;c=comp_projects">Component Projects</A> available.
                            </p>

                            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                                <tr valign="middle">
                                    <td class="projectTitles" colspan="4">Open Application Design Projects</td>
                                </tr>

                                <tr valign="middle">
                                    <td class="projectHeaders" nowrap="nowrap" width="75%">Project</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Winning Designer</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Second Place</td>
                                    <td class="projectHeaders" align="right" nowrap="nowrap" width="25%">Register By</td>
                                </tr>
<!--
                                <tr valign="top">
                                    <td class="projectCells">
                                        <a href="?t=development&amp;c=Palm_StockCount_App_Design">Palm Stock Count Application</a>
                                    </td>
                                    <td class="projectCells" align="right">$2,800 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">$700 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">Closed</td>
                                </tr>
-->

                            </table>

                            <br/>

                            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                                <tr valign="middle">
                                    <td class="projectTitles" colspan="4">Open Application Development Projects</td>
                                </tr>

                                <tr valign="middle">
                                    <td class="projectHeaders" nowrap="nowrap" width="75%">Project</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Winning Developer</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Second Place</td>
                                    <td class="projectHeaders" align="right" nowrap="nowrap" width="25%">Register By</td>
                                </tr>


                            </table>


                            <br/>

                            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                                <tr valign="middle">
                                    <td class="projectTitles" colspan="3">Recent Application Development Projects</td>
                                </tr>

                                <tr valign="middle">
                                    <td class="projectHeaders" nowrap="nowrap" width="75%">Project</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Winning Developer</td>
                                    <td class="projectHeaders" align="center" nowrap="nowrap">Second Place</td>
                                </tr>
                                <tr valign="top">
                                    <td class="projectCells">
                                        <a href="?t=development&amp;c=GeneChip_Data_Interface_Front_End_Dev">GeneChip Data Interface - Front End</a>
                                    </td>
                                    <td class="projectCells" align="right">$1,560 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">$625 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="projectCells">
                                        <a href="?t=development&amp;c=PMD_Service_Dev">Project Management Dashboard Service</a>
                                    </td>
                                    <td class="projectCells" align="right">$3,000 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">$1,100 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                </tr>
                                <tr valign="top">
                                    <td class="projectCells">
                                        <a href="?t=development&amp;c=PMD_Reports_Formatting_Dev">Project Management Dashboard Reports - Formatting</a>
                                    </td>
                                    <td class="projectCells" align="right">$2,800 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">$1,000 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                <tr valign="top">
                                    <td class="projectCells">
                                        <a href="?t=development&amp;c=PMD_Reports_Execution_Dev">Project Management Dashboard Reports - Execution</a>
                                    </td>
                                    <td class="projectCells" align="right">$2,400 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                    <td class="projectCells" align="right">$900 &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</td>
                                </tr>


                            </table>


                            <p>
                                <br/>
                            </p>

                        </td>
                        <!-- Center Column Ends -->

                        <!-- Gutter Begins -->
                        <td width="15">
                            <img src="/i/clear.gif" width="15" height="5" alt="" border="0"/>
                        </td>
                        <!-- Gutter Ends -->

                        <!-- Right Column Begins -->
                        <td width="244">
                            <xsl:call-template name="public_dev_right"/>
                        </td>
                        <!-- Right Column Ends -->

                    </tr>
                </table>

                <!-- Footer Begins -->
                <xsl:call-template name="Foot"/>
                <!-- Footer Endss -->

            </BODY>
        </html>
    </xsl:template>
</xsl:stylesheet>

