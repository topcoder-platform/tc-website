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
            <xsl:value-of select="substring($DATE, 6,2)"/>.<xsl:value-of select="substring($DATE, 9,2)"/>.<xsl:value-of select="substring($DATE, 1,4)"/>
        </xsl:if>
    </xsl:template>
    <xsl:template name="urldate">
        <!--MM&#47;DD&#47;YYYY-->
        <xsl:param name="DATE"/>
        <xsl:if test='boolean($DATE)'>
            <xsl:value-of select="substring($DATE, 6,2)"/>%2e<xsl:value-of select="substring($DATE, 9,2)"/>%2e<xsl:value-of select="substring($DATE, 1,4)"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/">

<html>
<head>
    <xsl:call-template name="Preload" />

<title>Open Component Projects Available for TopCoder Software Development</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

    <xsl:call-template name="CSS" />

<style type="text/css">

#totalMoney {
    font-size: 130%;
    font-weight: bold;
    }

</style>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

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
                <xsl:with-param name="level2">components</xsl:with-param>
                <xsl:with-param name="level3">comp_projects</xsl:with-param>
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
            <xsl:with-param name="title">&#160;Components</xsl:with-param>
            </xsl:call-template>

            <p><h2 align="left">Projects for Design and/or Development currently available!</h2></p>
            <p>
                <span class="bigRed">In order to participate in a component project, you MUST register for that project.</span>
                Please note that by registering for the project, you are agreeing to the requirements and committing to
                perform the work outlined in the requirement specifications.
            </p>

<!-- Open Component Design Projects begins -->

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr>
                    <td class="usdc_banner" colspan="9">USDC Component Design Projects</td>
                </tr>
                <tr valign="middle">
                    <td class="projectHeaders" align="center">Catalog</td>
                    <td width="15%" class="projectHeaders">Project</td>
                    <td class="projectHeaders" align="center">Registrants<br/>Rated/Unrated</td>
                    <td class="projectHeaders" align="center">Registration Ends</td>
                    <td class="projectHeaders" align="center">Submissions</td>
                    <td class="projectHeaders" align="center">Payment*</td>
                    <td class="projectHeaders" align="center">Complexity</td>
                    <td class="projectHeaders" align="center">Submit by</td>
                    <td class="projectHeaders" align="center">Details</td>
                </tr>


                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase and ./status_id!=303">
                        <xsl:variable name="initial_submission">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="posting_date">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="posting_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="winner_announced">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="winner_announced_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="final_submission">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="final_submission_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="estimated_dev">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="estimated_dev_date"/></xsl:call-template>
                        </xsl:variable>
			<xsl:variable name="reg_end">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="reg_end_date"/></xsl:call-template> 9:00 AM ET
                        </xsl:variable>
                        <tr valign="top">
                            <td class="projectCells" align="center">
                            <xsl:choose>
                               <xsl:when test="./catalog_name = 'Java' ">
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
                            <td class="projectCells">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/tc?module=ProjectDetail&amp;pj=',./project_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version_text"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="projectCells" align="center">
                                        <xsl:value-of select="./total_rated_inquiries"/>/<xsl:value-of select="./total_unrated_inquiries"/>
                            </td>
                            <td class="projectCells" align="center">
                                <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="reg_end_date"/></xsl:call-template> 9:00 AM ET
                            </td>
                            <td class="projectCells" align="center">
                               <xsl:value-of select="./total_submissions"/>
                            </td>
                            <td class="projectCells" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="projectCells" align="center"><xsl:value-of select="./description"/></td>
                            <td class="projectCells" align="center" nowrap="nowrap"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>
                    <td class="projectCells" align="center">
                             <xsl:if test="number(./total_inquiries)>0"><A><xsl:attribute name="href"><xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/></xsl:attribute>details</A></xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
<!-- Open Component Design Projects ends -->

            <br/>

<!-- Open Component Development Projects begins -->

            <table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
                <tr>
                    <td class="usdc_banner" colspan="9">USDC Component Development Projects</td>
                </tr>

                <tr valign="middle">
                    <td class="projectHeaders" align="center">Catalog</td>
                    <td width="15%" class="projectHeaders">Project</td>
                    <td class="projectHeaders" align="center">Registrants<br/>Rated/Unrated</td>
                    <td class="projectHeaders" align="center">Registration Ends</td>
                    <td class="projectHeaders" align="center">Submissions</td>
                    <td class="projectHeaders" align="center">Payment*</td>
                    <td class="projectHeaders" align="center">Complexity</td>
                    <td class="projectHeaders" align="center">Submit by</td>
                    <td class="projectHeaders" align="center">Details</td>
                </tr>

                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase and ./status_id!=303">
                        <xsl:variable name="initial_submission">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="posting_date">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="posting_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="winner_announced">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="winner_announced_date"/></xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="final_submission">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="final_submission_date"/></xsl:call-template>
                        </xsl:variable>
			<xsl:variable name="reg_end">
                            <xsl:call-template name="urldate"><xsl:with-param name="DATE" select="reg_end_date"/></xsl:call-template> 9:00 AM ET

                        </xsl:variable>
                        <tr valign="top">
                            <td class="projectCells" align="center">
                            <xsl:choose>
                               <xsl:when test="./catalog_name = 'Java' ">
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
                            <td class="projectCells">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/tc?module=ProjectDetail&amp;pj=',./project_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version_text"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="projectCells" align="center">
                                        <xsl:value-of select="./total_rated_inquiries"/>/<xsl:value-of select="./total_unrated_inquiries"/>
                            </td>
                            <td class="projectCells" align="center">
                                <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="reg_end_date"/></xsl:call-template>  9:00 AM ET

                            </td>
                            <td class="projectCells" align="center">
                               <xsl:value-of select="./total_submissions"/>
                            </td>
                            <td class="projectCells" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="projectCells" align="center"><xsl:value-of select="./description"/></td>
                            <td class="projectCells" align="center" nowrap="nowrap"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>

                    <td class="projectCells" align="center">
                             <xsl:if test="number(./total_inquiries)>0"><A><xsl:attribute name="href"><xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/></xsl:attribute>details</A></xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>

            <p>*And that's before royalty payments. The more Component <A href="http://software.topcoder.com/components/subscriptions.jsp">Subscriptions</A> we sell, the more royalties we pay out to our winners!</p>

            <p><br/></p>
<!-- Open Component Development Projects ends -->
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="10" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="180">
            <xsl:call-template name="public_dev_right"><xsl:with-param name="projects" select="."/></xsl:call-template>
        </td>
<!-- Right Column Ends -->

    </tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</BODY>
</html>
    </xsl:template>

</xsl:stylesheet>

