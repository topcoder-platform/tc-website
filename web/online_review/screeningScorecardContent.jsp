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
<logic:equal name="screeningScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="screeningScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="screeningScorecardForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="screeningScorecardForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="40%" nowrap class="tableHeader">
					    <strong><bean:write name="screeningScorecardForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="screeningScorecardForm" property="project.version" /></td>
					<td width="50%" valign="bottom" align="right" class="breadcrumb">
                        <bean:define id="theForm" name="screeningScorecardForm" type="com.topcoder.apps.review.AbstractScorecardForm" />
					    <html:link page='<%="/submissionDownload.do?id="+theForm.getProject().getId()+"&sid="+theForm.getSubmissionId()%>' styleClass="breadcrumbLinks"><bean:message key="prompt.download" /></html:link></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
				<tr>
					<td class="blackBkgnd" colspan="2">
					    <bean:write name="screeningScorecardForm" property="project.projectType.name" /> Screening Scorecard
					    - <bean:message key="prompt.submission" />
					    <review:showSubmissionId name="screeningScorecardForm" property="submission" /></td>
				</tr>
				<tr>
					<td colspan="2" class="forumTextOdd">For the <bean:write name="screeningScorecardForm" property="project.projectType.name" /> Checklist, mark each deliverable as Yes, it exists; No, it does not exist; N/A, this deliverable was not required. For the <bean:write name="screeningScorecardForm" property="project.projectType.name" /> Review, provide a score for each statement according to the dropdown answers.</td>
				</tr>
			</table>

<!-- Start Text -->
<logic:iterate id="question" indexId="qIdx" name="screeningScorecardForm" property="questions">
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
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong><bean:message key="heading.response" /></strong></td>
			    </tr>
    </logic:equal>
			    <tr>
			    	<td width="90%" class="forumTextOdd"><review:showString name="question" property="questionText" styleClass="scorecardQuestion" /></td>
			    	<td width="10%" valign="top" class="forumTextOdd">
	<logic:equal name="question" property="type" value="testcase">
						&nbsp;Pass: <bean:write name="question" property="totalPass" /><br>
						&nbsp;Total: <bean:write name="question" property="totalTests" />
	</logic:equal>
	<logic:notEqual name="question" property="type" value="testcase">
			    	    <bean:write name="question" property="evaluation" />
	</logic:notEqual>
			    	</td>
			    </tr>
	<logic:notEqual name="question" property="type" value="objective">
	    <logic:iterate id="rspns" indexId="rIdx" name="question" property="responses">
			    <tr>
			        <td colspan="2">
			            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="whiteBkgnd">
				        	<tr>
				        		<td width="15%" class="forumTextOdd" nowrap>
				        		    <strong><bean:message key="prompt.response" /> <%=rIdx.intValue()+1%>:</strong></td>
				        		<td width="60%" class="forumTextOdd">
				        		    <review:showString name="rspns" property="responseText" styleClass="scorecardResponse" /></td>
				        		<td width="105%" valign="middle" class="forumTextOdd">&nbsp;
				        		    <bean:write name="rspns" property="responseType" />
			                    </td>
				        	</tr>
				        </table>
				    </td>
				</tr>
		</logic:iterate>
	</logic:notEqual>
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


	</td></tr>

<!-- Bottom Buttons -->

	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
<logic:notEqual name="screeningScorecardForm" property="action" value="popup">
					<form action="javascript:history.back()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
</logic:notEqual>
<logic:equal name="screeningScorecardForm" property="action" value="popup">
					<form action="javascript:window.close()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.close" /></html:submit></td></form>
</logic:equal>
				</tr>
			</table>
		</td>
	</tr>
</table>

