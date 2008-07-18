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
<logic:equal name="finalReviewForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="finalReviewForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="finalReviewForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="finalReviewForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="40%" nowrap class="tableHeader">
					    <strong><bean:write name="finalReviewForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="finalReviewForm" property="project.version" /></td>
					<td align="right">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="50%" class="breadcrumb">
<logic:iterate id="scorecard" name="finalReviewForm" property="reviewScorecards">
                                    <html:link page="/reviewScorecard.do?action=popup" name="scorecard" property="mapping" styleClass="breadcrumbLinks" target="_blank">
                                        <bean:write name="scorecard" property="reviewer.handle" />
                                    </html:link><br>
</logic:iterate>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4">Final Review</td>
				</tr>
			</table>

<!-- Start Text -->
<logic:iterate id="aggregationResponse" indexId="rIdx" name="finalReviewForm" property="responses">
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
					<td class="grayBkgnd" colspan="6">
					    <bean:write name="aggregationResponse" property="question.scorecardSection.name" /></td>
				</tr>
			</table>
    </logic:equal>
    <logic:equal name="aggregationResponse" property="firstInQuestion" value="true">
            <table width="100%" border="0" cellpadding="3" cellspacing="1" align="center" class="forumBkgd">
				<tr>
					<td class="forumText" colspan="6">
					    <review:showString name="aggregationResponse" property="questionText" styleClass="scorecardQuestion" /></td>
				</tr>
				<tr>
					<td width="10%" class="forumTextEven"><bean:message key="heading.reviewer" /></td>
					<td width="2%" class="forumTextEven"><bean:message key="heading.number" /></td>
					<td width="70%" class="forumTextEven"><bean:message key="heading.response" /></td>
					<td width="10%" class="forumTextEven"><bean:message key="heading.type" /></td>
					<td width="2%" class="forumTextEven"><bean:message key="prompt.status" /></td>
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
					    <html:link page="/reviewScorecard.do?action=popup" name="aggregationResponse" property="reviewScorecard.mapping" styleClass="breadcrumbLinks" target="_blank">
                            <bean:write name="aggregationResponse" property="reviewScorecard.reviewer.handle" />
                        </html:link></td>
					<td valign="top" width="2%" class="forumTextCenterOdd">
					    <bean:write name="aggregationResponse" property="location" /></td>
					<td valign="top" width="68%" class="forumTextOdd">
					    <review:showString name="aggregationResponse" property="responseText" styleClass="scorecardResponse" /></td>
					<td valign="top" width="10%" class="forumTextCenterOdd">
					    <bean:write name="aggregationResponse" property="responseType" /></td>
					<td valign="top" width="2%" class="forumTextCenterOdd">
					    <bean:write name="finalReviewForm" property='<%="fixItem["+rIdx+"]"%>' /></td>
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


            <table class="forumBkgd" align="center" border="0" cellpadding="3" cellspacing="1" width="100%">
				<tbody><tr>
					<td class="forumText" colspan="6">
					    <p class="scorecardQuestion">Comments for Final Fixes</p></td>
				</tr>
	            	<tr>
					<td class="forumTextOdd"  colspan="6">
					<bean:write name="finalReviewForm" property="comments" />
					</td>
				</tr>
			</tbody></table>

		</td>


	</tr>
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
<!-- End lists -->
