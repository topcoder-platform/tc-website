<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
    <html:form action="/terminateProject">
    <html:hidden property="action" />
    <html:hidden property="id" />
	<tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="5%" align="left">
<logic:equal name="projectForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="projectForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="projectForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="projectForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="90%" nowrap class="tableHeader">
					    <strong><bean:write name="projectForm" property="name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="projectForm" property="version" /></td>
				</tr>
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
					<td width="95%" class="whiteBkgnd"><strong><bean:message key="prompt.terminateProject" /></strong></td>
				</tr>
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
					<td class="forumTextOdd"><bean:message key="overview.terminateProject" /></td>
				</tr>
<logic:equal name="projectForm" property="valid" value="false">
				<tr>
					<td class="errorText" colspan="3" align="center"><html:errors /></td>
				</tr>
</logic:equal>
				<tr>
					<td class="forumTextCenterOdd" align="center" colspan="2">
					    <html:select property='projectStatus' styleClass="searchForm">
                            <html:options property="terminationTypes" />
                        </html:select></td>
				</tr>
				<tr>
					<td class="forumTextCenterOdd" align="center" colspan="2">
					    <html:textarea property="reason" rows="10" cols="50" /></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="2"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
					<td><html:submit styleClass="submitButton"><bean:message key="button.submit" /></html:submit></td></html:form>
					<form action="javascript:history.back()">
					<td><html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
				</tr>
			</table>
		</td>

	</tr>

</table>

<table width="100%" border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td class="normal"><img src="/images/clear.gif" alt="" width="1" height="50" border="0"></td>
	</tr>
</table>
