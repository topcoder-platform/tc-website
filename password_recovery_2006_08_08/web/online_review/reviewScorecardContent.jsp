<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ page import="com.topcoder.apps.review.projecttracker.Phase" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.topcoder.apps.review.document.Appeal" %>
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
<logic:equal name="reviewScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="reviewScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="reviewScorecardForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="reviewScorecardForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="40%" nowrap class="tableHeader">
					    <strong><bean:write name="reviewScorecardForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="reviewScorecardForm" property="project.version" /></td>
					<td width="50%" valign="bottom" align="right" class="breadcrumb">
                        <bean:define id="theForm" name="reviewScorecardForm" type="com.topcoder.apps.review.AbstractScorecardForm" />
					    <html:link page='<%="/submissionDownload.do?id="+theForm.getProject().getId()+"&sid="+theForm.getSubmissionId()%>' styleClass="breadcrumbLinks"><bean:message key="prompt.download" /></html:link></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
				<tr>
					<td class="blackBkgnd" colspan="2">
					    <bean:write name="reviewScorecardForm" property="project.projectType.name" /> Review Scorecard
					    - <bean:message key="prompt.submission" />
					    <review:showSubmissionId name="reviewScorecardForm" property="submission" />
					    (Reviewer <bean:write name="reviewScorecardForm" property="author" />)</td>
				</tr>
				<tr>
					<td colspan="2" class="forumTextOdd">For the <bean:write name="reviewScorecardForm" property="project.projectType.name" /> Checklist, mark each deliverable as Yes, it exists; No, it does not exist; N/A, this deliverable was not required. For the <bean:write name="reviewScorecardForm" property="project.projectType.name" /> Review, provide a score for each statement according to the dropdown answers.</td>
				</tr>
			</table>

<!-- Start Text -->
<bean:define id="projectId" name="projectInfo" property="id" />
<logic:iterate id="question" indexId="qIdx" name="reviewScorecardForm" property="questions">
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
<logic:notPresent name="appeals">
			    	<td width="80%" class="forumTitle">
</logic:notPresent>
<logic:present name="appeals">
			    	<td width="60%" class="forumTitle">
</logic:present>
			    	    <strong><bean:write name="question" property="scorecardSection" /></strong></td>
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong>Weight: <bean:write name="question" property="question.scorecardSection.weight" /></strong>
			    	</td>
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong><bean:message key="heading.response" /></strong></td>
<logic:present name="appeals">
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong><bean:message key="heading.appealstatus" /></strong></td>
			    	<td width="10%" class="forumTitleCenter">
			    	    <strong><bean:message key="heading.appeal" /></strong></td>
</logic:present>
			    </tr>
    </logic:equal>
			    <tr>
<logic:notPresent name="appeals">
			    	<td width="80%" class="forumTextOdd">
</logic:notPresent>
<logic:present name="appeals">
			    	<td width="60%" class="forumTextOdd">
</logic:present>
			    	    <review:showString name="question" property="questionText" styleClass="scorecardQuestion" /></td>
			    	<td width="10%" valign="top" class="forumTextOdd">
			    	    Weight: <bean:write name="question" property="question.weight"/>
			    	</td>
			    	<td width="10%" valign="top" class="forumTextOdd">
	<logic:equal name="question" property="type" value="testcase">
						&nbsp;Pass: <bean:write name="question" property="totalPass" /><br>
						&nbsp;Total: <bean:write name="question" property="totalTests" />
                  <br>
                  <bean:define id="reviewerId" name="reviewScorecardForm" property="authorId"/>
                  <html:link page='<%="/testCaseDownload.do?id="+projectId+"&rid="+reviewerId%>'>
                    Download Testcases
                  </html:link>
	</logic:equal>
	<logic:notEqual name="question" property="type" value="testcase">
			    	    <bean:write name="question" property="evaluation" />
	</logic:notEqual>
			    	</td>
<logic:present name="appeals">
                    <bean:define id="qidValue" name="question" property="id" />
                    <bean:define id="aidValue" name="user" property="id" />
                    <bean:define id="appMap" name="appeals" />
			    	<td width="10%" valign="top" class="forumTextOdd">
<%
String appealStatus = "";
Appeal appeal = (Appeal)((HashMap)appMap).get((Long)qidValue);
if (appeal != null) {
  if (appeal.isResolved()) appealStatus = "Exists & Resolved";
  else appealStatus = "Exists & Unresolved";
}
%>
  			    	<%=appealStatus%></td>
			    	<td width="10%" valign="top" class="forumTextOdd">


<%     if ((appeal != null) || (theForm.getProject().getCurrentPhase().getId() == Phase.ID_APPEALS)) {

%>
			    	<input type="button" onClick='document.location="<%= response.encodeURL("/review/appeal.do?id="+theForm.getProject().getId()+"&qid="+qidValue+"&aid="+aidValue) %>"' value="Appeal" class="submitButton"/></td>
<%}
%>


</logic:present>
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
<logic:notEqual name="reviewScorecardForm" property="action" value="popup">
					<form action="javascript:history.back()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
</logic:notEqual>
<logic:equal name="reviewScorecardForm" property="action" value="popup">
					<form action="javascript:window.close()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.close" /></html:submit></td></form>
</logic:equal>
				</tr>
			</table>
		</td>
	</tr>
</table>

