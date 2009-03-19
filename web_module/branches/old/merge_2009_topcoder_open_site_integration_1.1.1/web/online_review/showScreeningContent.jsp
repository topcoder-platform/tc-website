<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
	<tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="5%" align="left">
<logic:equal name="projectInfo" property="projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="projectInfo" property="projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="projectInfo" property="catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="projectInfo" property="catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="90%" nowrap class="tableHeader">
<logic:present name="projectInfo">
						<strong><bean:write name="projectInfo" property="projectName" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="projectInfo" property="projectVersion" />
</logic:present>
    				</td>
				</tr>
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
					<td width="95%" class="whiteBkgnd"><strong>Screening Responses:</strong></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="2"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
<logic:present name="errors">
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="forumTitle">Fatal Errors:</td>
                </tr>
<logic:iterate id="error" indexId="errorIdx" name="errors">
                <tr>
                     <td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                     <td class="forumTextOdd">
                        <span class="screeningErrorText"><bean:write name="error" property="code" />: <bean:write name="error" property="response" /></span>
                        <ul>
<bean:define id="texts" name="error" property="text" />
<logic:iterate id="text" indexId="textIdx" name="texts">
                            <li><bean:write name="text" /></li>
</logic:iterate>
                        </ul>
                     </td>
                 </tr>
</logic:iterate>
</logic:present>
<logic:present name="warnings">
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <td class="forumTitle">Warnings:</td>
                </tr>
<logic:iterate id="warning" indexId="warningIdx" name="warnings">
                <tr>
                     <td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                     <td class="forumTextOdd">
                        <span class="screeningErrorText"><bean:write name="warning" property="code" />: <bean:write name="warning" property="response" /></span>
                        <ul>
<bean:define id="texts" name="warning" property="text" />
<logic:iterate id="text" indexId="textIdx" name="texts">
                            <li><bean:write name="text" /></li>
</logic:iterate>
                        </ul>
                     </td>
                 </tr>
</logic:iterate>
</logic:present>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
					<form action='<html:rewrite page="/viewOpenProjects.do" />'>
					<td><html:submit styleClass="submitButton"><bean:message key="button.viewProjects" /></html:submit></td></form>
<logic:present name="projectInfo">
					<bean:define id="projectId" name="projectInfo" property="id" />
					<bean:define id="url" value='<%="/projectDetail.do?id="+projectId%>' />
					<form action='<html:rewrite page="<%=String.valueOf(url)%>" />' method="post" >
					<td><html:submit styleClass="submitButton"><bean:message key="button.backToProject" /></html:submit></td></form>
</logic:present>
				</tr>
			</table>
		</td>

	</tr>
</table>


			