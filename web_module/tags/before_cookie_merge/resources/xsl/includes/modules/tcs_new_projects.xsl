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

    <xsl:template name="tcs_new_projects">
    <xsl:param name="projects"/>

<!-- Declare universal variables -->
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="status_id" select="'301'" />
<!-- Declaration ends -->

            <img src="/i/clear.gif" width="1" height="6" alt="" border="0" /><br />

<!-- Component Design Projects begins -->
            <img src="/i/development/head_comp_des_projects.gif" alt="Component Design Projects" width="244" height="20" border="0" /><br />

<!--            <A class="statText" href="/index?t=development&amp;c=des_bonus_contest_2"><img src="/i/development/tcs_des_bonus2_devpromo.gif" alt="Component Design Bonus Contest" width="244" height="97" border="0" /></A><br />
-->
            <table width="244" border="0" cellspacing="0" cellpadding="0" bgcolor="#093158">
                <tr valign="middle">
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="164" class="statText">Featured Projects</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="70" class="statText" align="center">Submit by</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase and ./status_id=$status_id">

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

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
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText">
                        <a class="statText">

                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price,'&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                    </xsl:attribute><xsl:value-of select="./component_name"/>

                    <xsl:if test="number(./version) &gt;  number('1')">
                        v <xsl:value-of select="./version"/>
                    </xsl:if>

                        </a>
                    </td>
                    <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>
            </table>

            <table width="244" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td width="5" class="statText"><img src="/i/development/list_lower_corner.gif" alt="" width="19" height="19" border="0" /></td>
                    <td class="statText" align="right" bgcolor="#093158"><a class="statText" href="/index?t=development&amp;c=comp_projects"><strong>View all Projects</strong></a></td>
                    <td width="5" class="statText" bgcolor="#093158"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
            </table>
<!-- Component Design Projects ends -->

            <img src="/i/clear.gif" width="1" height="6" alt="" border="0" /><br />

<!-- Component Development Projects begins -->
            <img src="/i/development/head_comp_dev_projects.gif" alt="Component Development Projects" width="244" height="20" border="0" /><br />

            <table width="244" border="0" cellspacing="0" cellpadding="0" bgcolor="#093158">
                <tr valign="middle">
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="164" class="statText">Featured Projects</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="70" class="statText" align="center">Submit by</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                </tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase and ./status_id=$status_id">

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

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
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText">
                        <a class="statText">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/index?t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                        </xsl:attribute><xsl:value-of select="./component_name"/>
                        </a>
                        <xsl:if test="number(./version) &gt;  number('1')">
                            v <xsl:value-of select="./version"/>
                        </xsl:if>
                    </td>
                    <td class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>
            </table>

            <table width="244" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td width="5" class="statText"><img src="/i/development/list_lower_corner.gif" alt="" width="19" height="19" border="0" /></td>
                    <td class="statText" align="right" bgcolor="#093158"><a class="statText" href="/index?t=development&amp;c=comp_projects"><strong>View all Projects</strong></a></td>
                    <td width="5" class="statText" bgcolor="#093158"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
            </table>
<!-- Component Development Projects ends -->

            <img src="/i/clear.gif" width="1" height="6" alt="" border="0" /><br />

<!-- Application Projects begins -->
            <img src="/i/development/head_appl_projects.gif" alt="Application Projects" width="244" height="20" border="0" /><br />

            <table width="244" cellspacing="0" cellpadding="0" border="0" bgcolor="#093158">
                <tr valign="middle">
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="164" class="statText">Featured Projects</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="70" class="statText" align="center">Inquire by</td>
                    <td background="/i/development/bluebv_lite_bg.gif" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                </tr>

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <!--<tr valign="top">
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td colspan="2" class="statText">No Open Application Projects</td>
		    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
                <TR>
                    <TD background="" colSpan="4">
	  	        <IMG height="3" alt="" src="/i/clear.gif" width="1" border="0"/>
	            </TD>
		</TR>
        -->
                <tr valign="top">
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText"><a class="statText" href="?&amp;t=development&amp;c=admin_tool_enhancements">Admin Tool Enhancements</a></td>
                    <td class="statText" align="center">closed</td>
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
                <TR>
                    <TD background="" colSpan="4">
                        <IMG height="3" alt="" src="/i/clear.gif" width="1" border="0"/>
                    </TD>
                </TR>
                <!--tr valign="top">
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText"><a class="statText" href="?&amp;t=development&amp;c=online_review_dev-fe">Online Review Front End</a></td>
                    <td class="statText" align="center">05.27.2003</td>
		    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
                <TR>
                    <TD background="" colSpan="4">
	  	        <IMG height="3" alt="" src="/i/clear.gif" width="1" border="0"/>
	            </TD>
		</TR>

                <tr valign="top">
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText"><a class="statText" href="?&amp;t=development&amp;c=online_review_dev-bl">Online Review Business Logic</a></td>
                    <td class="statText" align="center">05.27.2003</td>
		    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
                <TR>
                    <TD background="" colSpan="4">
	  	        <IMG height="3" alt="" src="/i/clear.gif" width="1" border="0"/>
	            </TD>
		</TR>

                <tr valign="top">
                    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText"><a class="statText" href="?&amp;t=development&amp;c=online_review_dev-pl">Online Review Persistence Layer</a></td>
                    <td class="statText" align="center">05.27.2003</td>
		    <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
                <TR>
                    <TD background="" colSpan="4">
	  	        <IMG height="3" alt="" src="/i/clear.gif" width="1" border="0"/>
	            </TD>
		</TR-->


                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <tr valign="top">
                    <td width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                    <td class="statText"></td>
                    <td class="statText" align="center"></td>
                    <td width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>

                <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>
            </table>

            <table width="244" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td width="5" class="statText"><img src="/i/development/list_lower_corner.gif" alt="" width="19" height="19" border="0" /></td>
                    <td class="statText" align="right" bgcolor="#093158"><a class="statText" href="/index?t=development&amp;c=app_projects"><strong>View all Projects</strong></a></td>
                    <td width="5" class="statText" bgcolor="#093158"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                </tr>
            </table>
<!-- Application Projects ends -->

            <img src="/i/clear.gif" width="1" height="6" alt="" border="0" /><br />

            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Please read the Component Development <a href="/index?t=development&amp;c=comp_meth">Methodology</a> before submitting a Component Design or Development solution.</p>
                        <p>Please read the Application Development <a href="/index?t=development&amp;c=app_meth">Methodology</a> before submitting an Application Design or Development solution.</p>
                        <p>Not sure what to submit? Go to <a href="/index?t=development&amp;c=tcs_sample_docs">Documentation and Sample Submissions</a> for the information that you need.</p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0">
                <tr valign="top"><td height="5"><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td></tr>
            </table>
    </xsl:template>
</xsl:stylesheet>
