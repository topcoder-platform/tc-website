<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ page import="com.topcoder.apps.review.ApplicationServer" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
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
					    <strong><bean:write name="projectInfo" property="projectName" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="projectInfo" property="projectVersion" /></td>
				</tr>
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
					<td width="95%" class="whiteBkgnd"><strong><bean:message key="prompt.submitSolution" /></strong></td>
				</tr>
				<tr>
					<td width="5%" class="whiteBkgnd"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
					<td class="forumTextOdd"><bean:message key="overview.submitSolution" /></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="3"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>


<!-- Upload Solution File -->

			<table width="40%" border="0" cellpadding="0" cellspacing="0" align="center">
				<bean:define id="projectId" name="projectInfo" property="id" />
				<bean:define id="url" value='<%="/saveSolution.do?id="+String.valueOf(projectId)%>' />

                <form action='<html:rewrite page="<%=String.valueOf(url)%>" />' enctype="multipart/form-data" method="post" >
				<tr>
					<td class="blueBkgnd "><img src="/images/clear.gif" alt="" width="1" height="3" border="0"></td>
				</tr>

				<tr>
					<td class="forumTitleCenter"><bean:message key="prompt.submitSolution2" /></td>
				</tr>

				<tr>
					<td class="blueBkgnd "><img src="/images/clear.gif" alt="" width="1" height="3" border="0"></td>
				</tr>
				<tr>
					<td class="forumTitleCenter"><input type="file" name="submission"></td>
				</tr>
				<tr>
					<td class="blueBkgnd " align="center">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td class="forumText">
								    <html:submit styleClass="submitButton">
								        <bean:message key="button.send" /></html:submit></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="blueBkgnd"><img src="/images/clear.gif" alt="" width="1" height="8" border="0"></td>
				</tr>
				<tr>
					<td class="forumTextsrc="Odd">Not sure what to send? A <a href='<%="http://"+ApplicationServer.TC_SERVER+"/tc?module=Static&d1=dev&d2=support&d3=compDocumentation"%>'>sample submission and Documentation</a> are available on Topcoder.com</td>
				</tr>
                </form>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td><img src="/images/clear.gif" alt="" width="10" height="30" border="0"/></td></tr>
</table>
