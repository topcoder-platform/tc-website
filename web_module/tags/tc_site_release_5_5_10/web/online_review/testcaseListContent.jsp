<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
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
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

<!-- Start Text -->

			<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center">
				<tr>
					<td class="normal" colspan="2"><img src="/images/clear.gif" alt="" width="1" height="8" border="0"></td>
				</tr>

				<tr>
					<td>
						<table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="75%">
							<tr>
								<td class="blackBkgnd" colspan="2"><strong><bean:message key="prompt.testcases" /></strong></td>
							</tr>
							<tr>
								<td class="forumTitleCenter">Reviewer</td>
								<td class="forumTitleCenter">Testcase Type</td>
							</tr>
				<bean:define id="projectId" name="projectInfo" property="id" />
							<logic:iterate id="testcase" indexId="tIdx" name="testcases" type="com.topcoder.apps.review.document.TestCase">
							    <tr>
							    	<td class="forumTextOdd">
                                        <bean:define id="reviewerId" name="testcase" property="reviewer.id"/>
							    	    <html:link page='<%="/testCaseDownload.do?id="+projectId+"&rid="+reviewerId%>'>
							    			<bean:write name="testcase" property="reviewer.handle"/>
										</html:link>
								    </td>
							    	<td class="forumTextOdd"><bean:write name="testcase" property="type.name"/></td>
							    </tr>
							</logic:iterate>
						</table>
					</td>
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
				    <form action="javascript:history.back()">
					<td><html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
				</tr>
			</table>
		</td>

	</tr>

<!-- End lists -->


</table>

