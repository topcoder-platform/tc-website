<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- Start Title -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
    <html:form action="/saveTestCaseReview">
    <html:hidden property="id" />
	<tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">

				<tr>
					<td width="5%" align="left">
<logic:equal name="testCaseReviewForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="testCaseReviewForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="testCaseReviewForm" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="testCaseReviewForm" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="90%" nowrap class="tableHeader">
					    <strong><bean:write name="testCaseReviewForm" property="project.name" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="testCaseReviewForm" property="project.version" /></td>
				</tr>
				<tr>
					<td class="forumTextOdd" colspan="4"><bean:message key="overview.testCaseReview" /></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="2" cellspacing="0">
				<tr>
					<td class="whiteBkgnd"><bean:message key="prompt.testCases" /></td>
				</tr>

			</table>

<!-- Start Text -->

			<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">

				<tr valign="top">
					<td width="10%" class="forumTitleCenter" valign="top">
					    <bean:message key="heading.testCase" /></td>
					<td width="10%" class="forumTitleCenter"valign="top">
					    <bean:message key="heading.approval" /></td>
					<td width="50%" class="forumTitleCenter"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>

				</tr>
<logic:iterate id="testCaseReview" indexId="tIdx" name="testCaseReviewForm" property="otherTestCaseReviews">
    <% String rowClass=(tIdx.intValue()%2==1)?"forumTextOdd":"forumTextEven"; %>
    <logic:equal name="testCaseReview" property="valid" value="false">
			    <tr>
			        <td colspan="3" width="100%" class="errorText">
			            <html:errors property='<%="testCaseReviews["+tIdx+"]"%>' /></td>
			    </tr>
	</logic:equal>
				<tr>
					<td width="10%" class="<%=rowClass%>" valign="top">
					    <bean:write name="testCaseReview" property="testCaseName" /></td>
					<td width="10%" class="<%=rowClass%>" valign="top">
	<logic:iterate id="approval" name="testCaseReview" property="approvalAnswers">
					    <html:radio property='<%="otherTestCaseReviews["+tIdx+"].testCaseReviewStatus"%>' value="<%=approval.toString()%>" />
					    &nbsp;<bean:write name="approval" /><br>
    </logic:iterate>
					</td>
					<td width="50%" class="<%=rowClass%>">
					    <html:textarea property='<%="otherTestCaseReviews["+tIdx+"].reviewText"%>' rows="5" cols="80" /></td>
				</tr>
</logic:iterate>
				<tr>
					<td class="normal" colspan="3"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
				</tr>
<logic:iterate id="testCaseReview" indexId="tIdx" name="testCaseReviewForm" property="selfTestCaseReviews">
    <% String rowClass2=(tIdx.intValue()%2==1)?"forumTextOdd":"forumTextEven"; %>
    <logic:equal name="testCaseReview" property="valid" value="false">
			    <tr>
			        <td colspan="3" width="100%" class="errorText">
			            <html:errors property='<%="testCaseReviews["+tIdx+"]"%>' /></td>
			    </tr>
	</logic:equal>
				<tr>
					<td width="10%" class="<%=rowClass2%>" valign="top">
					    <bean:write name="testCaseReview" property="reviewer" /></td>
					<td width="10%" class="<%=rowClass2%>" valign="top">
					    <bean:write name="testCaseReview" property="testCaseReviewStatus" />
					</td>
					<td width="50%" class="<%=rowClass2%>">
					    <review:showString name="testCaseReview" property="reviewText" /></td>
				</tr>
</logic:iterate>
			</table>

			<table width="80%" border="0" cellpadding="3" cellspacing="1" align="center">
				<tr>
					<td class="normal"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
				</tr>
				<tr>
					<td class="normal" colspan="2"><img src="/images/clear.gif" alt="" width="1" height="8" border="0"></td>
				</tr>
				<tr>
					<td class="forumTextCenterOdd"><bean:message key="overview.testCaseReview2" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
					<td><html:submit styleClass="submitButton"><bean:message key="button.submitTestCaseReview" /></html:submit></td>
				</tr>
			</table>
		</td>
	</tr>
	</html:form>
</table>

<!-- End lists -->
