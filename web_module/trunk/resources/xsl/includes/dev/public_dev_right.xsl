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
                <xsl:variable name="status_id" select="'303'" />
<!-- Declaration ends -->

            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<!-- Application Projects begins -->
            <A href="/?t=development&amp;c=app_projects"><img src="/i/header_app_projects.gif" alt="Application Projects" width="238" height="20" border="0" /></A>
            <table width="238" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open Application projects total <span style="font-size:130%; font-weight:bold;">$10,555</span> in payments. 
                                    <strong><A href="/?t=development&amp;c=app_projects">Inquire today</A></strong></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText" colspan="2"><A href="/?&amp;t=development&amp;c=admin_tool_enhancements_dev"><strong>Admin Tool Enhancements: Development</strong></A><br/>
                                    Requirements for this project have been broken down into three groups...</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Winning Developer Group 1:</td>
                                <td class="devProjectWinner">$2,200</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Second Place Group 1:</td>
                                <td class="devProjectPlace">$665</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Winning Developer Group 2:</td>
                                <td class="devProjectWinner">$2,200</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Second Place Group 2:</td>
                                <td class="devProjectPlace">$665</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Winning Developer Group 3:</td>
                                <td class="devProjectWinner">$2,200</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Second Place Group 3:</td>
                                <td class="devProjectPlace">$665</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Inquire By:</td>
                                <td class="devProjectPlace">10.20.2003</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText" colspan="2"><A href="/?&amp;t=development&amp;c=email_tool_enhancements"><strong>Email Tool Enhancements: Design</strong></A><br/>
                                    The main goals of this project include adding support for HTML emails, and improving the user interface....</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Winning Designer:</td>
                                <td class="devProjectWinner">$1,290</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Second Place:</td>
                                <td class="devProjectPlace">$420</td>
                            </tr>

                            <tr>
                                <td class="devProjectMember">Inquire By:</td>
                                <td class="devProjectPlace">10.20.2003</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <table width="238" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td class="statText" width="21" height="20"><img src="/i/development/dev_right_bottom.gif" width="21" height="20" border="0" /></td>
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&amp;c=app_projects"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<!-- Application Projects ends -->

            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<!-- Component Design Projects begins -->
            <A href="/index?t=tournaments&amp;c=tco03_comp_overview"><img src="/i/development/tco_sidebar_top.gif" alt="2003 TCO Component Contest" width="238" height="61" border="0" /></A>

            <A href="/index?t=development&amp;c=comp_projects#tco_des"><img src="/i/development/tco_sidebar_round2_des.gif" alt="Round 2: Design" width="238" height="47" border="0" /></A>

            <table width="238" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#002C1E">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%" class="statTextLarge" nowrap="nowrap">Featured Projects</td>
                                <td width="1%" class="statTextLarge" align="center" nowrap="nowrap">Submit by&#160;</td>
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

                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#004B33">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%" class="statText">
                                    <a class="statText">

                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('/index?tco=t&amp;t=development&amp;c=tcs_inquire-design&amp;comp=', ./component_id, '&amp;phase=', ./phase_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;payment=', ./price,'&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date, '&amp;estimated_dev=', $estimated_dev)"/>
                    </xsl:attribute><xsl:value-of select="./component_name"/>

                    <xsl:if test="number(./version) &gt;  number('1')">
                        v <xsl:value-of select="./version"/>
                    </xsl:if>

                                    </a>
                                </td>
                                <td width="1%" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template>&#160;</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

               <xsl:variable name="designtco" select="//TC/DEVELOPMENT/projects/project[phase_id=$design-phase
                                                   and status_id=303]"/>
               <xsl:if test="not($designtco)">
               <tr valign="middle">
                   <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt=""
                         width="11" height="10" border="0" /></td>

                   <td bgcolor="#004B33">
                       <table border="0" cellspacing="3" cellpadding="0">
                           <tr valign="middle">
                               <td width="99%" class="statText">
                             Round 2 of the Design TCO begins on 10/9/2003
                               </td>
                               <td width="1%" class="statText" align="center"></td>
                           </tr>
                       </table>
                   </td>
               </tr>
               </xsl:if>

            </table>

            <table width="238" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#002C1E">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%">&#160;</td>
                                <td width="1%" class="statText" nowrap="nowrap"><a class="statText" href="/index?t=development&amp;c=comp_projects#tco_des"><strong>View all Projects</strong></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
<!-- Component Design Projects ends -->

            <A href="/index?t=development&amp;c=comp_projects#tco_dev"><img src="/i/development/tco_sidebar_round2_dev.gif" alt="Round 2: Development" width="238" height="63" border="0" /></A>

<!-- Component Development Projects begins -->
            <table width="238" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#002C1E">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%" class="statTextLarge" nowrap="nowrap">Featured Projects</td>
                                <td width="1%" class="statTextLarge" align="center" nowrap="nowrap">Submit by&#160;</td>
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

                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#004B33">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%" class="statText">
                                    <a class="statText">

                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/index?tco=t&amp;t=development&amp;c=tcs_inquire-dev&amp;comp=', ./component_id, '&amp;docId=', ./document_id, '&amp;version=', ./version, '&amp;phase=', ./phase_id, '&amp;payment=', ./price, '&amp;compvers=', ./comp_vers_id, '&amp;date=', $initial_submission, '&amp;final_submission=', $final_submission, '&amp;winner_announced=', $winner_announced, '&amp;posting_date=', $posting_date)"/>
                        </xsl:attribute><xsl:value-of select="./component_name"/>
                        
                        <xsl:if test="number(./version) &gt;  number('1')">
                            v <xsl:value-of select="./version"/>
                        </xsl:if>

                                    </a>
                                </td>
                                <td width="1%" class="statText" align="center"><xsl:call-template name="formatmmddyyyy"><xsl:with-param name="DATE" select="initial_submission_date"/></xsl:call-template>&#160;</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                    </xsl:if>
                </xsl:for-each>

               <xsl:variable name="devtco" select="//TC/DEVELOPMENT/projects/project[phase_id=$dev-phase
                                                   and status_id=303]"/>
               <xsl:if test="not($devtco)">
               <tr valign="middle">
                   <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt=""
                         width="11" height="10" border="0" /></td>

                   <td bgcolor="#004B33">
                       <table border="0" cellspacing="3" cellpadding="0">
                           <tr valign="middle">
                               <td width="99%" class="statText">
                             Round 2 of the Development TCO begins on 10/7/2003
                               </td>
                               <td width="1%" class="statText" align="center"></td>
                           </tr>
                       </table>
                   </td>
               </tr>
               </xsl:if>

            </table>

            <table width="238" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">
                <tr valign="middle">
                    <td background="/i/development/tco_sidebar_side.gif" width="11"><img src="/i/clear.gif" alt="" width="11" height="10" border="0" /></td>
                    <td bgcolor="#002C1E">
                        <table border="0" cellspacing="3" cellpadding="0">
                            <tr valign="middle">
                                <td width="99%">&#160;</td>
                                <td width="1%" class="statText" nowrap="nowrap"><a class="statText" href="/index?t=development&amp;c=comp_projects#tco_dev"><strong>View all Projects</strong></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
<!-- Component Development Projects ends -->

            <img src="/i/development/tco_sidebar_bottom.gif" alt="" width="238" height="39" border="0" /><br/>
            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Please read the Component Development <a href="/index?t=development&amp;c=comp_meth">Methodology</a> before submitting a Component Design or Development solution.</p>
                        <p>Please read the Application Development <a href="/index?t=development&amp;c=app_meth">Methodology</a> before submitting an Application Design or Development solution.</p>
                        <p>Not sure what to submit? Go to Component <a href="/index?t=development&amp;c=tcs_sample_docs">Documentation and Sample Submissions</a> for the information that you need.</p>
                    </td>
                </tr>
            </table>

           <p><br/></p>
           
    </xsl:template>
</xsl:stylesheet>
