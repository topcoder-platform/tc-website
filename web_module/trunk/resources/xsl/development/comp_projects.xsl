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

 <title>TopCoder | Development</title>

    <xsl:call-template name="CSS" />

<style type="text/css">

#totalMoney {
    font: bold 130%;
    color: #FFF;
    }

</style>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY>
    <xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
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

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
                <tr valign="top">
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
                    <td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <xsl:variable name="priceFormat" select="'$###,###.00'" />
                    <td class="statText" colspan="3">
                        <p>Currently open projects total <span id="totalMoney"><xsl:value-of select="format-number(sum(/TC/DEVELOPMENT/projects/project/price), $priceFormat)"/></span> in payments to the winning designers and developers. Send us
                        your solutions today so you can start collecting your share.</p>

                        <p>*And that's before royalty payments. The more <a class="statText" href="http://www.topcodersoftware.com/pages/s_subscriptions.jsp">Component Subscriptions</a> we sell, the more royalties we pay out to our winners!</p></td>
                        <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Open Component Design Projects</h1></td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

<!--                <tr valign="top">
                    <td class="statText">
                        <p>There are no Open Component Design postings.</p>
                    </td>
                </tr>  -->

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                    <td background="/i/steel_bluebv_bg.gif" width="50%" class="statText">Design Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center"># of Inquiries</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Payment*</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Level</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center">Submit by</td>
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                </tr>

                 
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase">
                        <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>
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
                        <tr valign="top">
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            <td background="" class="statText">
                                <a class="statText">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        version <xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td background="" class="statText" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td background="" class="statText" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td background="" class="statText" align="center"><xsl:value-of select="./description"/></td>
                            <td background="" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>


                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">*Total Payment (before royalties) </td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
<!-- Open Component Design Projects ends -->

<!-- Open Component Development Projects begins -->

<!--                <tr valign="top">
                    <td class="statText">
                        <p>There are no Open Component Development postings.</p></td>
                </tr>  -->

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3"><a name="design"></a><h1 class="devSubhead">Open Component Development Projects</h1></td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

                <tr valign="middle">
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>

                    <td background="/i/steel_bluebv_bg.gif" class="statText">Development Projects</td>
                    <td background="/i/steel_bluebv_bg.gif" width="23%" class="statText" align="center"># of Inquiries</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" align="center">Payment*</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" align="center">Level</td>
                    <td background="/i/steel_bluebv_bg.gif" class="statText" align="center">Submit by</td>
                    <td background="/i/steel_bluebv_bg.gif" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="18" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase">
                        <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
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

                        <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>
                        <tr valign="top">
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                            <td background="" class="statText">
                                <a class="statText">
                                    <xsl:attribute name="href"> 
                                        <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        version <xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td background="" class="statText" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td background="" class="statText" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td background="" class="statText" align="center"><xsl:value-of select="./description"/></td>
                            <td background="" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>


                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="statText" colspan="3">*Total Payment (before royalties)</td>
                    <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="5" background=""><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
            </table>
<!-- Open Component Development Projects ends -->

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>    
    
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
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

</BODY>
</html>
    </xsl:template>

</xsl:stylesheet>

