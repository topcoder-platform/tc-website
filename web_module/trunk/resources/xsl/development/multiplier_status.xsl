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
            <xsl:value-of select="substring($DATE, 6,2)"/>.<xsl:value-of select="substring($DATE, 9,2)"/>.<xsl:value-of select="substring($DATE, 1,4)"/> -  <xsl:value-of select="substring($DATE, 9,8)"/> 
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

 <title>Component Project Status for TopCoder Software Development</title>

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
                <xsl:with-param name="level3">comp_archive</xsl:with-param>
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

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></td></tr>

                <tr>
                    <td class="bodyText" colspan="5">
                        <p>This page will be updated when a project date changes.  If you have specific questions about any projects, 
                        email <a href="mailto:service@topcodersoftware.com" class="bodyText">service@topcodersoftware.com</a>.</p> 
                        <p>Note that project winners will not be announced until after the Review Complete date.</p>
                    </td>
                </tr>

                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
            </table>

<!-- Component Design Projects begin -->
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle"><td bgcolor="#999999" class="statText" colspan="6"><a name="design"></a><font size="3"><strong>Component Design Project Status</strong></font></td></tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="35" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Design Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Designer</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Design<br />Rating</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Inquiry<br />Date</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submission<br />Date</td>
                </tr>


                <xsl:for-each select="/TC/DEVELOPMENT/projects/project"> 
                    <xsl:if test="./phase=$design-phase">
                        <tr>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                               <xsl:when test="./root_category_id = 5801776">
                                  <img src="/i/development/smJava.gif"/>
                               </xsl:when>
                               <xsl:otherwise>
                                  <img src="/i/development/netSm.gif"/>
                               </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="formTextOdd" >                            
                                <a target="_new">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./user_id"/></td>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                                <xsl:when test="./rating != ''"> 
                                   <xsl:value-of select="./rating"/>
                                </xsl:when>
                                <xsl:otherwise>
                                   Not Rated 	
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="inquiry_date"/></xsl:call-template></td>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                                <xsl:when test="./submission_date != ''"> 
                                    <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="submission_date"/></xsl:call-template>
                                    <xsl:if test="./submission_date = ./min_sub_date">
                                        MULTIPLIER 
        			    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    -
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                        </tr>                 
                    </xsl:if>
                </xsl:for-each> 

                <tr><td colspan="6"><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
<!-- Component Design Projects ends -->

<!-- Component Dev Projects begin -->
                <tr valign="middle"><td bgcolor="#999999" class="statText" colspan="6"><a name="development"></a><font size="3"><strong>Component Development Project Status</strong></font></td></tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width ="10%" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Development Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Developer</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Developer<br />Rating</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Inquiry<br />Date</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submission<br />Date</td>
                </tr>
                
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project"> 
                    <xsl:if test="./phase=$dev-phase">
                        <tr>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                               <xsl:when test="./root_category_id = 5801776">
                                  <img src="/i/development/smJava.gif"/>
                               </xsl:when>
                               <xsl:otherwise>
                                  <img src="/i/development/netSm.gif"/>
                               </xsl:otherwise>
                            </xsl:choose>
                            </td>

                            <td class="formTextOdd" >                            
                                <a target="_new">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('http://software.topcoder.com/catalog/c_component.jsp?comp=', ./component_id)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./user_id"/></td>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                                <xsl:when test="./rating != ''"> 
                                   <xsl:value-of select="./rating"/>
                                </xsl:when>
                                <xsl:otherwise>
                                   Not Rated 	
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="inquiry_date"/></xsl:call-template></td>
                            <td class="formTextOdd" align="center">
                            <xsl:choose>
                                <xsl:when test="./submission_date != ''"> 
                                    <xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="submission_date"/></xsl:call-template>
                                    <xsl:if test="./submission_date = ./min_sub_date">
                                        MULTIPLIER 
        			    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    -
                                </xsl:otherwise>
                            </xsl:choose>
                            </td>
                        </tr>                 
                    </xsl:if>
                </xsl:for-each> 
            </table>
<!-- Component Dev Projects ends -->

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

