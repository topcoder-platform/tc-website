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
            <table width="244" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000"> 
                <tr valign="middle"><td height="46"><img src="/i/development/right_col_head_tcs.gif" alt="TopCoder Software" width="244" height="46" border="0" /></td></tr>
                
                <tr><td colspan="4" background="" height="10"><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
                
<!-- Component Design Projects begins -->
                <tr valign="middle"><td height="28"><img src="/i/development/head_new_components.gif" alt="NEW Component Projects" width="244" height="28" border="0" /></td></tr>
                
                <tr valign="top">
                    <td bgcolor="#000000"> 
                        <table width="244" cellspacing="0" cellpadding="0" border="0" background="/i/steel_gray_bg2.gif" bgcolor="#000000">                
                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="164" class="statText">Design Projects</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="70" class="statText" align="center">Submit by</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                            </tr>

                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>
                            

                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="status_id" select="'301'" />
                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$design-phase and ./status_id=$status_id">
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
                            <td background="" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>



                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>



                              <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="10" alt="" border="0" /></td></tr>
<!-- Component Design Projects ends -->

<!-- Component Development Projects begins -->
                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="164" class="statText">Development Projects</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="70" class="statText" align="center">Submit by</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                            </tr>

                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                <xsl:for-each select="/TC/DEVELOPMENT/projects/project">
                    <xsl:if test="./phase_id=$dev-phase and ./status_id=$status_id">
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
                                </a>
                                    <xsl:if test="number(./version) &gt;  number('1')">
                                        version <xsl:value-of select="./version"/>
                                    </xsl:if>
                            </td>
                            <td background="" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template></td>
                            <td background="" width="10" class="statText"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr>

                            <tr valign="top">
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                                <td colspan="2" background="" class="openProjects"><a class="openProjects" href="/index?t=development&amp;c=comp_projects">&#62;&#160;See all open Component Projects</a></td>
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                            </tr>
                            
                            <tr><td colspan="4" background="" height="15"><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
                        </table>
                    </td>
                </tr>
<!-- Component Development Projects ends -->

<!-- Application Projects begins -->
                <tr valign="middle"><td height="28"><img src="/i/development/head_new_app.gif" alt="NEW Application Projects" width="244" height="28" border="0" /></td></tr>

                <tr valign="top">
                    <td bgcolor="#000000"> 
                        <table width="244" cellspacing="0" cellpadding="0" border="0" bgcolor="#000000">                
                            <tr valign="middle">
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="164" class="statText">Project Title</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="70" class="statText" align="center">Inquire by</td>
                                <td background="/i/graybv_bg.gif" bgcolor="#666666" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="18" border="0" /></td>
                            </tr>
                            
                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                            <!-- 
                            <tr valign="top">
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                                <td background="" class="statText" colspan="2">There are no new Application Projects this week.</td>
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                            </tr>
                            -->
                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="3" alt="" border="0" /></td></tr>

                            <tr valign="top">
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                                <td background="" class="statText"><a class="statText" href="/index?t=development&amp;c=online_review&amp;t=app">Online Review</a></td>
                                <td background="" class="statText" align="center">12.14.2003</td>
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                            </tr>                            
                            
                            <tr><td colspan="4" background=""><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td></tr> -->

                            <tr valign="top">
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                                <td colspan="2" background="" class="openProjects"><a class="openProjects" href="/index?t=development&amp;c=app_projects">&#62;&#160;See all open Application Projects</a></td>
                                <td background="" width="5" class="statText"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>
                            </tr>
                            
                            <tr><td colspan="4" background="" height="15"><img src="/i/clear.gif" width="1" height="15" alt="" border="0" /></td></tr>
                        </table>
                    </td>
                </tr>
<!-- Application Projects ends -->
            </table>

            <table width="244" border="0" cellspacing="0" cellpadding="5" bgcolor="#000000"> 
                <tr valign="top">
                    <td width="100%" bgcolor="#000000"> 
                        <table width="100%" border="0" cellspacing="0" cellpadding="5" bgcolor="#003366">                
                            <tr valign="top">
                                <td width="100%" background="/i/steel_blue_bg.gif" bgcolor="#003366" class="statTextSmall">
                                    <p>Please read the Component Development <a class="statTextSmall" href="/index?t=development&amp;c=comp_meth">Methodology</a> before submitting a Component Design or Development solution.</p>
                                    <p>Not sure what to submit? Go to <a class="statTextSmall" href="/index?t=development&amp;c=tcs_sample_docs">Documentation and Sample Submissions</a> for the information that you need.</p></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0"> 
                <tr valign="top"><td height="5"><img src="/i/clear.gif" alt="" width="5" height="5" border="0" /></td></tr>
            </table>
    </xsl:template>
</xsl:stylesheet>
