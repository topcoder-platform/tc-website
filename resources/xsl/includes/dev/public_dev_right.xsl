<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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

    <xsl:template name="public_dev_right">
    <xsl:param name="projects"/>

<!-- Declare universal variables -->
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="status_id" select="'301'" />
<!-- Declaration ends -->

            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<!-- Application Projects begins -->
            <A href="/?t=development&amp;c=app_projects"><img src="/i/development/head_app_projects.gif" alt="Application Projects" width="180" height="20" border="0" /></A>
            <table width="180" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open projects total <span style="font-size:130%; font-weight:bold; color:#CC0000;">$11,980</span> in payments.</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2"><A href="/?&amp;t=development&amp;c=single_sign_on_v10_des"><strong>Single Sign-On (SSO): Design</strong></A><br/>
                                    Requirements for this project are broken down into two groups:</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2">SSO Security Server</td>
                            </tr>

                            <tr>
                                <td class="devProjectWinner">Winning Designer:</td>
                                <td class="devProjectWinnerMoney">$3,306</td>
                            </tr>

                            <tr>
                                <td class="devProjectSecond">Second Place:</td>
                                <td class="devProjectSecondMoney">$1,005</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2">SSO Application Authentication</td>
                            </tr>

                            <tr>
                                <td class="devProjectWinner">Winning Designer:</td>
                                <td class="devProjectWinnerMoney">$2,826</td>
                            </tr>

                            <tr>
                                <td class="devProjectSecond">Second Place:</td>
                                <td class="devProjectSecondMoney">$855</td>
                            </tr>

                            <tr>
                                <td class="devProjectInquire">Inquire By:</td>
                                <td class="devProjectDate">11.03.2003</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="180" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td class="statText" width="21" height="20"><img src="/i/development/dev_right_bottom.gif" width="21" height="20" border="0" /></td>
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&amp;c=app_projects"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<!-- Application Projects ends -->

            <img src="/i/clear.gif" width="1" height="5" alt="" border="0" /><br />

<!-- Read Me's begins -->
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Read the Application <a href="/index?t=development&amp;c=app_meth">Methodology</a> before submitting an Application design or development solution.</p>
                        <p><strong>Not sure what to submit?</strong> Go to Application <A href="/index?t=development&amp;c=tcs_sample_docs">Documentation</A>.</p>
                    </td>
                </tr>
            </table>
<!-- Read Me's ends -->

            <img src="/i/clear.gif" width="1" height="5" alt="" border="0" /><br />

<!-- Component Design Projects begins -->
            <A href="/?t=development&amp;c=comp_projects#comp_des"><img src="/i/development/head_comp_des_projects.gif" alt="Component Design Projects" width="180" height="20" border="0" /></A>
            <table width="180" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open projects total <span style="font-size:130%; font-weight:bold; color:#CC0000;"><xsl:value-of select="format-number(sum(/TC/DEVELOPMENT/projects/project[phase_id=$design-phase and status_id=$status_id]/price) * 1.75, $priceFormat)"/></span> 
                                    in payments. </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase and ./status_id=$status_id">

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

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2">
                                    <A>

                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('/index/?t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price,'&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                    </xsl:attribute><xsl:value-of select="./component_name"/>

                    <xsl:if test="number(./version) &gt;  number('1')">
                        v <xsl:value-of select="./version"/>
                    </xsl:if>

                                    </A>
                                </td>
                            </tr>

                            <tr>
                                <td class="devProjectWinner">Winning Designer:</td>
                                <td class="devProjectWinnerMoney"><xsl:value-of select="format-number(price, $priceFormat)"/></td>
                            </tr>

                            <tr>
                                <td class="devProjectInquire">Inquire By:</td>
                                <td class="devProjectDate"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

            </table>

            <table width="180" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td class="statText" width="21" height="20"><img src="/i/development/dev_right_bottom.gif" width="21" height="20" border="0" /></td>
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&amp;c=comp_projects#comp_des"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<!-- Component Design Projects ends -->

            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<!-- Component Development Projects begins -->
            <A href="/?t=development&amp;c=comp_projects#comp_dev"><img src="/i/development/head_comp_dev_projects.gif" alt="Component Design Projects" width="180" height="20" border="0" /></A>
            <table width="180" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open projects total <span style="font-size:130%; font-weight:bold; color:#CC0000;"><xsl:value-of select="format-number(sum(/TC/DEVELOPMENT/projects/project[phase_id=$dev-phase and status_id=$status_id]/price) * 1.75, $priceFormat)"/></span> 
                                    in payments. </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase and ./status_id=$status_id">

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

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2">
                                    <A>

                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/index/?t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                        </xsl:attribute><xsl:value-of select="./component_name"/>
                        
                        <xsl:if test="number(./version) &gt;  number('1')">
                            v <xsl:value-of select="./version"/>
                        </xsl:if>

                                    </A>
                                </td>
                            </tr>

                            <tr>
                                <td class="devProjectWinner">Winning Developer:</td>
                                <td class="devProjectWinnerMoney"><xsl:value-of select="format-number(price, $priceFormat)"/></td>
                            </tr>

                            <tr>
                                <td class="devProjectInquire">Inquire By:</td>
                                <td class="devProjectDate"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

            </table>

            <table width="180" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td class="statText" width="21" height="20"><img src="/i/development/dev_right_bottom.gif" width="21" height="20" border="0" /></td>
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&amp;c=comp_projects#comp_dev"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<!--  Component Development Projects ends -->

            <img src="/i/clear.gif" width="1" height="5" alt="" border="0" /><br />

<!-- Read Me's begins -->
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Read the Component <a href="/index?t=development&amp;c=comp_meth">Methodology</a> before submitting a Component design or development solution.</p>
                        <p><strong>Not sure what to submit?</strong> Go to Component <A href="/index?t=development&amp;c=tcs_sample_docs">Documentation and Sample Submissions</A>.</p>
                    </td>
                </tr>
            </table>
<!-- Read Me's ends -->

           <p><br/></p>
           
    </xsl:template>
</xsl:stylesheet>
