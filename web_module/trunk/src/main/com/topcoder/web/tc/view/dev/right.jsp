<%@  page language="java"  %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<% ResultSetContainer openProjects = (ResultSetContainer)request.getAttribute("OpenProjects");%>

<div class="devRightSpacer">
<%-- Read Me's begins --%>
            <table width="170" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%">
                        <a href="/index?t=development&amp;c=components"><img src="/i/development/winners_promo.gif" border="0"/></a>
                    </td>
                </tr>
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Read the Component <a href="/index?t=development&c=comp_meth">Methodology</a> before submitting a Component design or development solution.</p>
                        <p><strong>Not sure what to submit?</strong> Go to Component <A href="/index?t=development&c=tcs_sample_docs">Documentation and Sample Submissions</A>.</p>
                    </td>
                </tr>
            </table>
<%-- Read Me's ends --%>
</div>

    </xsl:template>
</xsl:stylesheet>