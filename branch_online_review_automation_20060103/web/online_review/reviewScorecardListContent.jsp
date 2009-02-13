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
								<td class="blackBkgnd" colspan="4"><strong><bean:message key="prompt.reviewScorecards" /></strong></td>
							</tr>
							<tr>
								<td class="forumTitleCenter"><bean:message key="heading.scorecards" /></td>
								<td class="forumTitleCenter"><bean:message key="heading.status" /></td>
								<td class="forumTitleCenter"><bean:message key="heading.dueDate" /></td>
								<td class="forumTitleCenter"><bean:message key="heading.download" /></td>
							</tr>
							<logic:iterate id="scorecard" indexId="cIdx" name="scorecards" type="com.topcoder.apps.review.document.ReviewScorecard">
							    <% String rowClass=(cIdx.intValue()%2==0)?"forumTextOdd":"forumTextEven"; %>
							    <tr>
							    	<td class="<%=rowClass%>">
							    		<bean:define id="actionParam" name="action" />
							    	    <review:linkScorecard page='<%="/reviewScorecard.do?action="+actionParam%>' name="scorecard">
							    	        <bean:message key="prompt.reviewScorecard" /> <review:showSubmissionId name="scorecard" property="submission" />
							    	    </review:linkScorecard></td>
							    	<td class="<%=rowClass%>">
							    	    <bean:message key='<%=scorecard.isCompleted()?"prompt.complete":"prompt.incomplete"%>' /></td>
							    	<td class="<%=rowClass%>"><review:showDate name="projectInfo" property="currentPhaseInstance.endDate" /></td>
							    	<td class="<%=rowClass%>">
							    	    <html:link page='<%="/submissionDownload.do?id="+scorecard.getProject().getId()+"&sid="+scorecard.getSubmission().getId()%>'>
							    			<bean:message key="prompt.download" /> <review:showSubmissionId name="scorecard" property="submission" />
										</html:link></td>
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

<logic:present name="upload_testcases">
    <tr>
      <td class="whiteBkgnd">
			<table width="40%" border="0" cellpadding="0" cellspacing="0">
				<bean:define id="projectId" name="projectInfo" property="id" />
				<bean:define id="url" value='<%="/saveTestCases.do?id="+String.valueOf(projectId)%>' />

                <form action='<html:rewrite page="<%=String.valueOf(url)%>" />' enctype="multipart/form-data" method="post" >
				<tr>
					<td class="blueBkgnd "><img src="/images/clear.gif" alt="" width="1" height="3" border="0"></td>
				</tr>

				<tr>
					<td class="forumTitleCenter">Jar/Zip testcases and testfiles from the project folder and upload it here.</td>
				</tr>
				<tr>
					<td class="blueBkgnd "><img src="/images/clear.gif" alt="" width="1" height="3" border="0"></td>
				</tr>
				<tr>
					<td class="forumTitleCenter"><input type="file" name="testcases"></td>
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
                </form>
			</table>
      </td>
    </tr>
</logic:present>

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

