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

    <xsl:call-template name="Top" />

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

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td><A name="tco_des"><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></A></td></tr>

                <tr>
                    <xsl:variable name="priceFormat" select="'$###,###.00'" />
                    <td class="bodyText" colspan="8">
                        <p><strong>Only the projects below are designated as TCCC projects.
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_comp_description">Click here</A>
                        for the rules and more information about the 2004 TCCC Component Competition. At the <A href="#comp_des">bottom</A> of this page are regular component projects that do not qualify for the TCCC.</strong></p>
                       Be the first submitter for any TCCC project and earn yourself the multiplier.  Now from the
                       <a href='?t=development&amp;c=multiplier_status'>Project Submission</a> page you can view who has inquired, submitted and who has the multiplier!

                    </td>
                </tr>

                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">

<!-- TCO Design Begins -->
                <tr>
                    <td colspan="8" class="tccc04SubNav"><a name="design"></a>2004 TopCoder Collegiate Challenge Component Design Projects</td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Design Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Inquiries</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Payment*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Complexity</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submit by</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Multiplier</td>
                </tr>

                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase and ./status_id=303">
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
                            <td class="formTextOdd">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/index?tccc=t&amp;t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./catalog_name"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_submissions"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./description"/></td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>
                    <td class="formTextOdd" align="center">
                    <xsl:if test="./total_submissions &gt; 0">
                             <a>
                                <xsl:attribute name="href">
                                     <xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/>
                                </xsl:attribute>
                                     <img src="/i/development/multiplier.gif" width="23" height="21" alt="" border="0"/>
                             </a>
                    </xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
                <xsl:variable name="designtco" select="//TC/DEVELOPMENT/projects/project[phase_id=$design-phase
                                                    and status_id=303]"/>
                <xsl:if test="not($designtco)">
                        <tr valign="top">
                            <td class="formTextOdd" colspan="8"><strong>The second round of the 2004 TCCC Component Design Competition begins on 2/17/2004</strong></td>
                        </tr>
                </xsl:if>
<!--
                <tr>
                    <td class="bodyText" colspan="8"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_bracket_interact#bracket">Eligible Competitors</a> </td>
                </tr>
-->
                <tr>
                    <td class="bodyText" colspan="8">
                    	<p>*Total Payment (before royalties)</p>
                    	<p><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=comp_des_rd1">View</A> TCCC04 project submitters.</p>
                    </td>
                </tr>

                <tr><td colspan="8"><A name="tco_dev"><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></A></td></tr>
<!-- TCO Design Ends -->

<!-- TCO Development Begins -->
                <tr>
                    <td class="tccc04SubNav" colspan="8">2004 TopCoder Collegiate Challenge Component Development Projects</td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Development Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Inquiries</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Payment*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Complexity</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submit by</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Multiplier</td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase and ./status_id=303">
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

                        <tr valign="top">
                            <td class="formTextOdd">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/index?tccc=t&amp;t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./catalog_name"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_submissions"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./description"/></td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>
                    <td class="formTextOdd" align="center">
                    <xsl:if test="./total_submissions &gt; 0">
                             <a>
                                <xsl:attribute name="href">
                                     <xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/>
                                </xsl:attribute>
                              <img src="/i/development/multiplier.gif" width="23" height="21" alt="" border="0"/>
                             </a>
                    </xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <xsl:variable name="devtco" select="//TC/DEVELOPMENT/projects/project[phase_id=$dev-phase
                                                    and status_id=303]"/>
                <xsl:if test="not($devtco)">
                        <tr valign="top">
                            <td class="formTextOdd" colspan="8"><strong>The first round of the 2004 TCCC Component Development Competition begins on 2/17/2004</strong></td>
                        </tr>
                </xsl:if>
<!--
                <tr>
                    <td class="bodyText" colspan="8"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_comp_bracket_interact#bracket">Eligible Competitors</a> </td>
                </tr>
-->
                <tr>
                    <td class="bodyText" colspan="8">*Total Payment (before royalties) </td>
                </tr>

                <tr><td colspan="8"><A name="comp_des"><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></A></td></tr>
<!-- TCO Development Ends -->

<!-- Open Component Design Projects begins -->

<!--                <tr><td><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr> -->
                <tr>
                    <xsl:variable name="priceFormat" select="'$###,###.00'" />
                    <td class="bodyText" colspan="8">
                        <p>Currently open projects total <span id="totalMoney"><xsl:value-of select="format-number(/TC/DEVELOPMENT/Project/Total/total, $priceFormat)"/></span>
                        in payments to the winning designers and developers. Send us your solutions today so you can start collecting your share.</p>
                    </td>
                </tr>

                <tr>
                    <td class="header" colspan="8">Component Design Projects</td>
                </tr>

<!--                <tr valign="top">
                    <td class="bodyText">
                        <p>There are no Open Component Design postings.</p>
                    </td>
                </tr>  -->

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Design Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Inquiries</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Payment*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Complexity</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submit by</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Multiplier</td>
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
                        <tr valign="top">
                            <td class="formTextOdd">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./catalog_name"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_submissions"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./description"/></td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>
                    <td class="formTextOdd" align="center">
                    <xsl:if test="./total_submissions &gt; 0">
                             <a>
                                <xsl:attribute name="href">
                                     <xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/>
                                </xsl:attribute>
                              <img src="/i/development/multiplier.gif" width="23" height="21" alt="" border="0"/>
                             </a>
                    </xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <tr>
                    <td class="bodyText" colspan="8">*Total Payment (before royalties) </td>
                </tr>

                <tr><td colspan="8"><A name="comp_dev"><img src="/i/clear.gif" width="1" height="20" alt="" border="0" /></A></td></tr>
<!-- Open Component Design Projects ends -->

<!-- Open Component Development Projects begins -->

<!--                <tr valign="top">
                    <td class="bodyText">
                        <p>There are no Open Component Development postings.</p></td>
                </tr>  -->

                <tr>
                    <td class="header" colspan="8">Component Development Projects</td>
                </tr>

                <tr valign="middle">
                    <td background="/i/graybv_bg.gif" width="30%" class="statTextLarge">Development Projects</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Catalog</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Inquiries</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center"># of Submissions</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Payment*</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Complexity</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Submit by</td>
                    <td background="/i/graybv_bg.gif" class="statTextLarge" align="center">Multiplier</td>
                </tr>

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

                        <tr valign="top">
                            <td class="formTextOdd">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                                    </xsl:attribute><xsl:value-of select="./component_name"/>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        Version&#160;<xsl:value-of select="./version"/>
                                    </xsl:if>
                                </a>
                            </td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./catalog_name"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_inquiries"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./total_submissions"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="format-number(./price, $priceFormat)"/></td>
                            <td class="formTextOdd" align="center"><xsl:value-of select="./description"/></td>
                            <td class="formTextOdd" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template> 9:00 AM ET</td>
                    <td class="formTextOdd" align="center">
                    <xsl:if test="./total_submissions &gt; 0">
                             <a>
                                <xsl:attribute name="href">
                                     <xsl:value-of select="concat('?t=development&amp;c=multiplier_status&amp;pj=', ./project_id)"/>
                                </xsl:attribute>
                              <img src="/i/development/multiplier.gif" width="23" height="21" alt="" border="0"/>
                             </a>
                    </xsl:if>
                    </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <tr>
                    <td class="bodyText" colspan="8">*Total Payment (before royalties)</td>
                </tr>
            </table>

            <p>*And that's before royalty payments. The more Component <A href="http://software.topcoder.com/components/s_subscriptions.jsp">Subscriptions</A>
            we sell, the more royalties we pay out to our winners!</p>

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

