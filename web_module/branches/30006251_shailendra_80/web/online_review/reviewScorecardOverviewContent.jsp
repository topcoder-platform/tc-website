<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- Start Title -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
	<tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="5%" align="left">
<logic:equal name="reviews" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="reviews" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="reviews" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="reviews" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="40%" nowrap class="tableHeader">
					    <strong><bean:write name="reviews" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="reviews" property="project.version" /></td>
					<td width="50%" valign="bottom" align="right" class="breadcrumb">
                        <bean:define id="theSubmission" name="reviews" property="submission" type="com.topcoder.apps.review.document.AbstractSubmission" />
					    <html:link page='<%="/submissionDownload.do?id="+theSubmission.getProject().getId()+"&sid="+theSubmission.getId()%>' styleClass="breadcrumbLinks"><bean:message key="prompt.download" /></html:link></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
				<tr>
					<td class="blackBkgnd" colspan="2">
					    <bean:message key="prompt.designReview" /> - <bean:message key="prompt.submission" />
					    (<bean:write name="reviews" property="submission.submitter.handle" />)</td>
				</tr>
				<tr>
					<td colspan="2" class="forumTextOdd">For the <bean:write name="reviews" property="project.projectType.name" /> Checklist, mark each deliverable as Yes, it exists; No, it does not exist; N/A, this deliverable was not required. For the <bean:write name="reviews" property="project.projectType.name" /> Review, provide a score for each statement according to the dropdown answers.</td>
				</tr>
			</table>

<!-- Start Text -->
<logic:iterate id="question" indexId="qIdx" name="reviews" property="questions">
	<logic:equal name="question" property="groupFirst" value="true">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="whiteBkgnd"><bean:write name="question" property="sectionGroup" /></td>
				</tr>
			</table>
	</logic:equal>
    <logic:equal name="question" property="first" value="true">
		    <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">

			    <tr>
			    	<td width="90%" class="forumTitle">
			    	    <strong><bean:write name="question" property="scorecardSection" /></strong></td>
		<logic:iterate id="scorecard" name="reviews" property="scorecards">
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong><bean:message key="prompt.reviewer" /> (<bean:write name="scorecard" property="author.handle" />)</strong></td>
		</logic:iterate>
					<td width="10%" class="forumTitleCenter">
			    	    <strong>Average</strong></td>
			    </tr>
    </logic:equal>
			    <tr>
			    	<td width="90%" class="forumTextOdd"><review:showString name="question" property="questionText" styleClass="scorecardQuestion" /></td>
		<logic:iterate id="scorecard" indexId="sIdx" name="reviews" property="scorecards">
			    	<td width="10%" class="forumTextOdd">
			<logic:notEqual name="reviews" property='<%="testCaseSQ["+qIdx+"]"%>' value="true">
						<bean:write name="scorecard" property='<%="questions["+qIdx+"].evaluation.value"%>' />
			</logic:notEqual>
			<logic:equal name="reviews" property='<%="testCaseSQ["+qIdx+"]"%>' value="true">
						<bean:write name="scorecard" property='<%="questions["+qIdx+"].totalPass"%>' /> / <bean:write name="scorecard" property='<%="questions["+qIdx+"].totalTests"%>' />
			</logic:equal>
			    	</td>
		</logic:iterate>
					<td width="10%" class="forumTextOdd">
			    	    <bean:write name="reviews" property='<%="questionAvgScore["+qIdx+"]"%>' /></td>
			    </tr>
    <logic:equal name="question" property="last" value="true">
		    </table>
<!-- spacer  -->
		    <table width="100%" border="0" cellpadding="2" cellspacing="0">
		    	<tr>
		    		<td class="normal"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
		    	</tr>
		    </table>

	</logic:equal>
</logic:iterate>
			<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
				<tr>
					<td width="90%" class="forumTitleCenter"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
<logic:iterate id="scorecard" name="reviews" property="scorecards">
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong>Total</strong></td>
</logic:iterate>
					<td width="10%" class="forumTitleCenter"><strong>Average Total</strong></td>
				</tr>
				<tr>
					<td width="90%"  class="forumTextOdd"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
<logic:iterate id="scorecard" indexId="sIdx" name="reviews" property="scorecards">
			    	<td width="10%" class="forumTextCenterOdd">
			    	    <bean:write name="reviews" property='<%="score["+sIdx+"]"%>' /></td>
</logic:iterate>
					<td width="10%" valign="top" class="forumTextCenterOdd">
						<bean:write name="reviews" property="avgScore" /></td>
				</tr>
			</table>
	</td></tr>

<!-- Bottom Buttons -->

	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
					<form action="javascript:history.back()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
				</tr>
			</table>
		</td>
	</tr>
</table>

