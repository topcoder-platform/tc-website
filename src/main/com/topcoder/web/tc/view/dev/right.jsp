<%@  page language="java"  %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer openProjects = (ResultSetContainer)request.getAttribute("OpenProjects");%>

<img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<img src="/i/clear.gif" width="1" height="5" alt="" border="0" /><br />

<%-- Component Design Projects begins --%>
            <A href="/?t=development&c=comp_projects#comp_des"><img src="/i/development/head_comp_des_projects.gif" alt="Component Design Projects" width="180" height="20" border="0" /></A>
            <table width="180" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open projects total <span style="font-size:130%; font-weight:bold; color:#CC0000;"><xsl:value-of select="format-number(sum(/TC/DEVELOPMENT/projects/project[phase_id=$design-phase ]/price) * 1.75, $priceFormat)"/></span>
                                    in payments. </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <rsc:iterator list="<%=openProjects%>" id="resultRow">
                    <% if (resultRow.getIntItem("phase_id")==112&&resultRow.getIntItem("status_id")==301) { %>

                <tr>
                    <td class="devProjectText">
                        <table width="100%" border="0" cellspacing="0" cellpadding="2">
                            <tr>
                                <td class="devProjectText" colspan="2">
                                    <A href="/index/?t=development&c=tcs_inquire-design&comp=<rsc:item row="<%=resultRow%>" name="component_id"/>&phase=<rsc:item row="<%=resultRow%>" name="phase_id"/>&docId=<rsc:item row="<%=resultRow%>" name="document_id"/>&version=<rsc:item row="<%=resultRow%>" name="version"/>&payment=<rsc:item row="<%=resultRow%>" name="price"/>&compvers=<rsc:item row="<%=resultRow%>" name="comp_vers_id"/>&date=<rsc:item row="<%=resultRow%>" name="initial_submission_date" format="MM'%2e'dd'%2e'yyyy"/>&final_submission=<rsc:item row="<%=resultRow%>" name="final_submission_date" format="MM'%2e'dd'%2e'yyyy"/>&winner_announced=<rsc:item row="<%=resultRow%>" name="winner_announced_date" format="MM'%2e'dd'%2e'yyyy"/>&posting_date=<rsc:item row="<%=resultRow%>" name="posting_date" format="MM'%2e'dd'%2e'yyyy"/>&estimated_dev=<rsc:item row="<%=resultRow%>" name="estimated_dev_date" format="MM'%2e'dd'%2e'yyyy"/>"/>
                                        <rsc:item row="<%=resultRow%>" name="component_name"/> <%=resultRow.getIntItem("version")>1?"v " + resultRow.getIntItem("version"):""%>
                                    </A>
                                </td>
                            </tr>

                            <tr>
                                <td class="devProjectWinner">Winning Designer:</td>
                                <td class="devProjectWinnerMoney"><rsc:item row="<%=resultRow%>" name="price" format="#,###.00"/></td>
                            </tr>

                            <tr>
                                <td class="devProjectInquire">Submit By:</td>
                                <td class="devProjectDate"><rsc:item row="<%=resultRow%>" name="initial_submission_date" format="MM.dd.yyyy"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>

                    <% } %>
                </rsc:iterator>

            </table>

            <table width="180" border="0" cellspacing="0" cellpadding="0">
                <tr valign="middle">
                    <td class="statText" width="21" height="20"><img src="/i/development/dev_right_bottom.gif" width="21" height="20" border="0" /></td>
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&c=comp_projects#comp_des"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<%-- Component Design Projects ends --%>

            <img src="/i/clear.gif" width="1" height="10" alt="" border="0" /><br />

<%-- Component Development Projects begins --%>
            <A href="/?t=development&c=comp_projects#comp_dev"><img src="/i/development/head_comp_dev_projects.gif" alt="Component Design Projects" width="180" height="20" border="0" /></A>
            <table width="180" border="0" cellspacing="1" cellpadding="2" bgcolor="#838383">
                <tr valign="top">
                    <td bgcolor="#EEEEEE">
                        <table width="100%" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td class="devProjectText">Currently open projects total <span style="font-size:130%; font-weight:bold; color:#CC0000;"><xsl:value-of select="format-number(sum(/TC/DEVELOPMENT/projects/project[phase_id=$dev-phase ]/price) * 1.75, $priceFormat)"/></span>
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
                            <xsl:value-of select="concat('/index/?t=development&c=tcs_inquire-dev&comp=', ./component_id, '&docId=', ./document_id, '&version=', ./version, '&phase=', ./phase_id, '&payment=', ./price, '&compvers=', ./comp_vers_id, '&date=', $initial_submission, '&final_submission=', $final_submission, '&winner_announced=', $winner_announced, '&posting_date=', $posting_date)"/>
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
				    <td class="devProjectInquire">Submit By:</td>
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
                    <td class="statText" width="99%" height="20" bgcolor="#838383" align="right"><A href="/?t=development&c=comp_projects#comp_dev"><strong>View all projects</strong></A>&#160;</td>
                </tr>
            </table>
<%--  Component Development Projects ends --%>

            <img src="/i/clear.gif" width="1" height="5" alt="" border="0" /><br />

<%-- Read Me's begins --%>
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Read the Component <a href="/index?t=development&c=comp_meth">Methodology</a> before submitting a Component design or development solution.</p>
                        <p><strong>Not sure what to submit?</strong> Go to Component <A href="/index?t=development&c=tcs_sample_docs">Documentation and Sample Submissions</A>.</p>
                    </td>
                </tr>
            </table>
<%-- Read Me's ends --%>

           <p><br/></p>

    </xsl:template>
</xsl:stylesheet>