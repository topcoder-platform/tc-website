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
<logic:equal name="submissionForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="submissionForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="submissionForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="submissionForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="90%" nowrap class="tableHeader">
						<strong><bean:write name="submissionForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="submissionForm" property="project.version" />
    				</td>
				</tr>
				<html:form action="/savePMReview">
				<html:hidden property="id" />
				<tr>
					<td align="center" class="whiteBkgnd" colspan="2">
						<table border="0" cellpadding="0" cellspacing="1" width="50%" class="forumBkgd">
						    <tr>
			                    <td class="errorText"><html:errors /></td>
			                </tr>
							<tr>
								<td nowrap class="forumTextEven">
									<strong>What Response do you want to send to this Submission (<bean:write name="submissionForm" property="submission.submitter.handle" />)?</strong></td>
							</tr>
<logic:equal name="submissionForm" property="isScreening" value="true">
							<tr>
								<td class="whiteBkgnd" align="center" colspan="2">
								    Advance to Review: <html:checkbox property="advanced" /></td>
							</tr>
                                                        <tr>
								<td class="whiteBkgnd" align="center" colspan="2">
								    <html:textarea rows="10" cols="50" property="screeningMessage" /></td>
							</tr>
</logic:equal>
<logic:equal name="submissionForm" property="isScreening" value="false">
							<tr>
								<td class="whiteBkgnd" align="center" colspan="2">
								    <html:textarea rows="10" cols="50" property="reviewMessage" /></td>
							</tr>
</logic:equal>
						</table>
					</td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
					<td><html:submit styleClass="submitButton">
					        <bean:message key="button.send"/></html:submit></td>
					<td><html:cancel styleClass="submitButton">
					        <bean:message key="button.cancel"/></html:cancel></td>
				</tr>
			</table>
		</td>
	</tr>
	</html:form>
</table>


