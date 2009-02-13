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
<logic:equal name="aggregationWorksheetForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="aggregationWorksheetForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="aggregationWorksheetForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="aggregationWorksheetForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="40%" nowrap class="tableHeader">
					    <strong><bean:write name="aggregationWorksheetForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="aggregationWorksheetForm" property="project.version" /></td>
					<td width="50%" valign="bottom" align="right" class="breadcrumb">
<logic:iterate id="scorecard" name="aggregationWorksheetForm" property="reviewScorecards">
                        <html:link page="/reviewScorecard.do?action=popup" name="scorecard" property="mapping" styleClass="breadcrumbLinks" target="_blank">
                            <bean:write name="scorecard" property="reviewer.handle" />
                        </html:link><br>
</logic:iterate>
                    </td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

<!-- Start Component Design -->
<logic:iterate id="aggregationResponse" indexId="rIdx" name="aggregationWorksheetForm" property="responses">
	<logic:equal name="aggregationResponse" property="firstInGroup" value="true">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="whiteBkgnd"><bean:write name="aggregationResponse" property="question.scorecardSection.sectionGroup.name" /></td>
				</tr>
			</table>
	</logic:equal>
    <logic:equal name="aggregationResponse" property="firstInSection" value="true">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" class="forumBkgd">
				<tr>
					<td class="grayBkgnd">
					    <bean:write name="aggregationResponse" property="question.scorecardSection.name" /></td>
				</tr>
			</table>
    </logic:equal>
    <logic:equal name="aggregationResponse" property="firstInQuestion" value="true">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" class="forumBkgd">
				<tr>
					<td class="forumText" colspan="4">
					    <review:showString name="aggregationResponse" property="questionText" styleClass="scorecardQuestion" /></td>
				</tr>
				<tr>
					<td width="10%" class="forumTextEven"><bean:message key="heading.reviewer" /></td>
					<td width="2%" class="forumTextEven"><bean:message key="heading.number" /></td>
					<td width="70%" class="forumTextEven"><bean:message key="heading.response" /></td>
					<td width="10%" class="forumTextEven"><bean:message key="heading.type" /></td>
					<td width="10%" class="forumTextEven">Status</td>
				</tr>
	</logic:equal>
	<logic:equal name="aggregationResponse" property="questionType" value="testcase">
		<logic:equal name="aggregationResponse" property="location" value="1">
				<tr>
			        <td colspan="7" width="100%" class="forumTextOdd">
			            <bean:write name="aggregationResponse" property="reviewerResponsibility" />
			            (Pass: <bean:write name="aggregationResponse" property="question.totalPass" />
			             Total: <bean:write name="aggregationResponse" property="question.totalTests" />) </td>
			    </tr>
		</logic:equal>
	</logic:equal>
	            <tr>
					<td nowrap valign="top" width="20%" class="forumTextOdd">
                        <bean:write name="aggregationResponse" property="reviewScorecard.reviewer.handle" /></td>
					<td valign="top" width="2%" class="forumTextCenterOdd">
					    <bean:write name="aggregationResponse" property="location" /></td>
					<td valign="top" width="68%" class="forumTextOdd">
					    <review:showString name="aggregationResponse" property="responseText" styleClass="scorecardResponse" /></td>
					<td valign="top" width="10%" class="forumTextCenterOdd">
					    <bean:write name="aggregationResponse" property="responseType" /></td>
					<td valign="top" width="10%" class="forumTextCenterOdd">
					    <bean:write name="aggregationResponse" property="aggregationResponseStatus" /></td>
				</tr>
    <logic:equal name="aggregationResponse" property="lastInQuestion" value="true">
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td class="whiteBkgnd" colspan="3"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>
    </logic:equal>
</logic:iterate>

		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="2">
				<tr>
				    <form action="javascript:history.back()">
					<td>
					    <html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
				</tr>
			</table>
		</td>
	</tr>
</table>