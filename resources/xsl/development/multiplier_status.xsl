<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl" />
    <xsl:import href="../script.xsl" />
    <xsl:import href="../includes/body_top.xsl" />
    <xsl:import href="../foot.xsl" />
    <xsl:import href="../includes/modules/stats_intro.xsl" />
  <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/dev/public_dev_right.xsl" />
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
    <xsl:template name="formatmmddyyyy">
        <xsl:param name="DATE"/>
        <xsl:if test='boolean($DATE)'>
            <xsl:value-of select="substring($DATE, 6,2)"/>.<xsl:value-of select="substring($DATE, 9,2)"/>.<xsl:value-of select="substring($DATE, 1,4)"/> <br/>  <xsl:value-of select="substring($DATE, 12,8)"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="urldate">
        <!--MM&#47;DD&#47;YYYY-->
        <xsl:param name="DATE"/>
        <xsl:if test='boolean($DATE)'>
            <xsl:value-of select="substring($DATE, 6,2)"/>%2e<xsl:value-of select="substring($DATE, 9,2)"/>%2e<xsl:value-of select="substring($DATE, 1,4)"/>
        </xsl:if>
    </xsl:template>
    <xsl:variable name="priceFormat" select="'$###,###.00'" />
    <xsl:variable name="design-phase" select="'112'" />
    <xsl:variable name="dev-phase" select="'113'" />


    <xsl:template match="/">

<html>
<head>
    <xsl:call-template name="Preload" />

 <title>Status for TopCoder Software Development</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left">
                <xsl:with-param name="level1">development</xsl:with-param>
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">comp_proj_sub</xsl:with-param>
            </xsl:call-template>
          </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="10" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">white</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Submissions</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></td></tr>
                <tr>
                    <td class="bodyText" colspan="5">
                        <p>
                        View who has inquired and submitted for each project!  The multiplier graphic displays who
                        currently has the multiplier, if the multiplier is still up for grabs, the project will not have a graphic.   Read below for the multiplier rules.

                        </p>
                    </td>
                </tr>
            </table>

            <br/><br/>

<!-- Component Design Projects begin -->
            <table class="formFrame" cellspacing="0" cellpadding="3" width="100%">
                    <xsl:if test="/TC/DEVELOPMENT/multiplier/status/phase=$design-phase">
                <tr valign="middle"><td class="projectTitles" colspan="7"><a name="design"></a>Component Design Multiplier Status</td></tr>

                <tr valign="middle">
                    <td width="35" class="projectHeaders" align="center">Catalog</td>
                    <td width="30%" class="projectHeaders">Projects</td>
                    <td class="projectHeaders" align="center">Designer</td>
                    <td class="projectHeaders" align="center">Design<br />Rating</td>
                    <td class="projectHeaders" align="center">Inquiry<br />Date</td>
                    <td class="projectHeaders" align="center">Submission<br />Date</td>
                    <td class="projectHeaders" align="center">Multiplier</td>
                </tr>


                <xsl:for-each select="/TC/DEVELOPMENT/multiplier/status">
                        <tr>
                            <td class="projectCells" align="center">
                            <xsl:choose>
                               <xsl:when test="./root_category_id = 5801776">
                                  <img src="/i/development/smJava.gif"/>
                               </xsl:when>
                                <xsl:when test="./catalog_name = 'Flash' ">
                                    <img src="/i/development/flashSm.gif"/>
                                </xsl:when>
                               <xsl:otherwise>
                                  <img src="/i/development/netSm.gif"/>
                               </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="projectCells" >
                                <a target="_new">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version_text"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="projectCells" align="center"><xsl:value-of select="./user_id"/></td>
                            <td class="projectCells" align="center">
                            <xsl:choose>
                                <xsl:when test="./rating != ''">
                                   <xsl:value-of select="./rating"/>
                                </xsl:when>
                                <xsl:otherwise>
                                   Not Rated
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="projectCells" align="center" nowrap="0"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="inquiry_date"/></xsl:call-template></td>
                            <td class="projectCells" align="center" nowrap="0">
                            <xsl:choose>
                                <xsl:when test="./submission_date != ''">
                                    <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="submission_date"/></xsl:call-template>

                                </xsl:when>
                                <xsl:otherwise>
                                    -
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="projectCells">
                                    <xsl:if test="./submission_date = ./min_sub_date and not(./submission_date='')">
                                        <img src="/i/development/multiplierLGray.gif" width="23" height="21" alt="" border="0" />
                    			    </xsl:if>
                            </td>
                        </tr>
                </xsl:for-each>

<!-- Component Design Projects ends -->
                    </xsl:if>

<!-- Component Dev Projects begin -->
                    <xsl:if test="/TC/DEVELOPMENT/multiplier/status/phase=$dev-phase">
                <tr valign="middle"><td bgcolor="#999999" class="statText" colspan="7"><a name="development"></a><font size="3"><strong>Component Development Multiplier Status</strong></font></td></tr>

                <tr valign="middle">
                    <td width ="35" class="projectHeaders" align="center">Catalog</td>
                    <td width="30%" class="projectHeaders">Projects</td>
                    <td class="projectHeaders" align="center">Developer</td>
                    <td class="projectHeaders" align="center">Developer<br />Rating</td>
                    <td class="projectHeaders" align="center">Inquiry<br />Date</td>
                    <td class="projectHeaders" align="center">Submission<br />Date</td>
                    <td class="projectHeaders" align="center">Multiplier</td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/multiplier/status">
                        <tr>
                            <td class="projectCells" align="center">
                            <xsl:choose>
                               <xsl:when test="./root_category_id = 5801776">
                                  <img src="/i/development/smJava.gif"/>
                               </xsl:when>
                                <xsl:when test="./catalog_name = 'Flash' ">
                                    <img src="/i/development/flashSm.gif"/>
                                </xsl:when>
                               <xsl:otherwise>
                                  <img src="/i/development/netSm.gif"/>
                               </xsl:otherwise>
                            </xsl:choose>
                            </td>

                            <td class="projectCells" >
                                <a target="_new">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version_text"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="projectCells" align="center"><xsl:value-of select="./user_id"/></td>
                            <td class="projectCells" align="center">
                            <xsl:choose>
                                <xsl:when test="./rating != ''">
                                   <xsl:value-of select="./rating"/>
                                </xsl:when>
                                <xsl:otherwise>
                                   Not Rated
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="projectCells" align="center" nowrap="0"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="inquiry_date"/></xsl:call-template></td>
                            <td class="projectCells" align="center" nowrap="0">
                            <xsl:choose>
                                <xsl:when test="./submission_date != ''">
                                    <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="submission_date"/></xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    -
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="projectCells">
                                    <xsl:if test="./submission_date = ./min_sub_date and not(./submission_date='')">
                                        <img src="/i/development/multiplierLGray.gif" width="23" height="21" alt="" border="0" />
                    			    </xsl:if>
                            </td>
                        </tr>
                </xsl:for-each>
                    </xsl:if>
            </table>
<!-- Component Dev Projects ends -->

            <br/><br/>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="bodyText" colspan="5">

                        <ul><strong>Multiplier Rules</strong>
                        <li>
                            The member with the first submission for each component will be given the multiplier.
                        </li>
                        <li>
                            The multiplier will be used to double the component payment <strong>IF</strong> the member places in 1st or 2nd place for that component.  <br />
                            There will be no 3rd place prizes.
                        </li>
                        <li>
                            If a member resubmits a solution, the new submission date is used to determine who has recieved the multiplier.
                        </li>
                        <li>
                            As with the standard competition, 1st and 2nd place is limited to those submissions that pass screening <br />
                           and receive a review score greater than 75.
                        </li>
                        </ul>

                        <p>If you have specific questions about any projects,
                        email <a href="mailto:service@topcodersoftware.com" class="bodyText">service@topcodersoftware.com</a>.</p>
                    </td>
                </tr>
            </table>


            <p><br /></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="10" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244">
            <xsl:call-template name="public_dev_right"><xsl:with-param name="projects" select="."/></xsl:call-template>
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</body>
</html>
    </xsl:template>

</xsl:stylesheet>

