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
    <xsl:variable name="priceFormat" select="'$###,###.00'" />
    <xsl:variable name="design-phase" select="'112'" />
    <xsl:variable name="dev-phase" select="'113'" />


    <xsl:template match="/">

<html>
<head>
    <xsl:call-template name="Preload" />

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#001B35">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
            <xsl:with-param name="image1">steelblue</xsl:with-param>
            <xsl:with-param name="image">development</xsl:with-param>
            <xsl:with-param name="title">&#160;Component Development</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td bgcolor="#001B35" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td bgcolor="#001B35" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td bgcolor="#001B35" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" bgcolor="#001B35" width="100%">
                <tr><td colspan="7"><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    <td class="statText" colspan="5">
                        <p>This page will be updated when a project date changes.  If you have specific questions about any projects, email <a href="mailto:service@topcodersoftware.com" class="statText">service@topcodersoftware.com</a>.</p> 
                        <p>Note that project winners will not be announced until after the Review Complete date.</p>
                    </td>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="7"><img src="/i/clear.gif" width="1" height="14" alt="" border="0" /></td></tr>

<!-- Component Design Projects begin -->

                <tr>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    <td class="statText" colspan="5"><a name="design"></a><h1 class="devSubhead">Component Design Project Status</h1></td>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="40%" class="statText">Design Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Initial<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Review<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Final<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Design<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                </tr>


                <xsl:for-each select="/TC/DEVELOPMENT/reviews/status"> 
                    <xsl:if test="./phase_id=$design-phase">
                        <tr>
                            <td><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                            <td class="statText" >                            
                                <a class="statText" target="_new">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('http://software.topcoder.com/pages/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        version <xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="review_complete_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="final_submission_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="phase_complete_date"/></xsl:call-template></td>
                            <td><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                        </tr>                 
                    </xsl:if>
                </xsl:for-each> 

                <tr><td colspan="7"><img src="/i/clear.gif" width="1" height="14" alt="" border="0" /></td></tr>
<!-- Component Design Projects ends -->

<!-- Component Dev Projects begin -->
                 <tr>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    <td class="statText" colspan="5"><a name="design"></a><h1 class="devSubhead">Component Development Project Status</h1></td>
                    <td width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                </tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="30%" class="statText">Development Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Initial<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Review<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Final<br />Submit</td>
                    <td background="/i/steel_bluebv_bg.gif" width="15%" class="statText" align="center">Development<br />Complete</td>
                    <td background="/i/steel_bluebv_bg.gif" width="3" class="statText"><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                </tr>
                
                <xsl:for-each select="/TC/DEVELOPMENT/reviews/status"> 
                    <xsl:if test="./phase_id=$dev-phase">
                        <tr>
                            <td><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                            <td class="statText" >                            
                                <a class="statText" target="_new">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('http://software.topcoder.com/pages/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        version <xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="review_complete_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="final_submission_date"/></xsl:call-template></td>
                            <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="phase_complete_date"/></xsl:call-template></td>
                            <td><img src="/i/clear.gif" alt="" width="3" height="1" border="0" /></td>
                        </tr>                 
                    </xsl:if>
                </xsl:for-each> 

                <tr><td colspan="7"><img src="/i/clear.gif" width="1" height="14" alt="" border="0" /></td></tr>
            </table>
<!-- Component Dev Projects ends -->

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top"><td width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>    
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="244" bgcolor="#001B35">
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

