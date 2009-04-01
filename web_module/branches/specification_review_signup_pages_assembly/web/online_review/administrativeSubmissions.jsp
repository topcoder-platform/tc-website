<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType, com.topcoder.apps.review.AdminScreeningScorecardBean" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- the adminProjectDetailContent.jsp exceeds JSP limit! -->

<logic:present name="history">
			<table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
				<tr>
					<td colspan="6" class="forumTextEven"><strong>Administrative Submission</strong></td>
				</tr>
				<tr>
					<td  class="forumTitleCenter">Submitter</td>
					<td  class="forumTitleCenter">Remove</td>
					<td  class="forumTitleCenter">Download Submission</td>
					<td  class="forumTitleCenter">Most Recent</td>
					<td  class="forumTitleCenter">Submission Date</td>
					<td  class="forumTitleCenter">Submission Status</td>
				</tr>
<logic:iterate id="entry" indexId="entryIdx" name="history">
<% String rowClassEntry=(entryIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
				<tr>
					<td class="<%=rowClassEntry%>" nowrap>Submitter <bean:write name="entry" property="submitter" /> (<bean:write name="entry" property="handle" />)</td>
					<td class="<%=rowClassEntry%>" nowrap><a href="removeSubmission.do?id=<bean:write name="project" property="id" />&sid=<bean:write name="entry" property="submitter" />">Remove</a></td>
					<td class="<%=rowClassEntry%>" nowrap><a href="submissionDownload.do?id=<bean:write name="project" property="id" />&vid=<bean:write name="entry" property="submission" />">Submission</a></td>
					<td class="<%=rowClassEntry%>" nowrap>
<logic:equal name="entry" property="current" value="true">
						Yes
</logic:equal>
					</td>
					<td class="<%=rowClassEntry%>" nowrap><review:showDate name="entry" property="date" /></td>
					<td class="<%=rowClassEntry%>" nowrap>
<logic:equal name="entry" property="status" value="Success">
						Passed
</logic:equal>
<logic:equal name="entry" property="status" value="Warning">
						<a href="showScreening.do?id=<bean:write name="project" property="id" />&vid=<bean:write name="entry" property="submission" />">Passed (With Warnings)</a>
</logic:equal>
<logic:equal name="entry" property="status" value="Fatal Error">
						<a href="showScreening.do?id=<bean:write name="project" property="id" />&vid=<bean:write name="entry" property="submission" />">Failed</a>
</logic:equal>
<logic:equal name="entry" property="status" value="N/A">
						N/A
</logic:equal>
					</td>
				</tr>
</logic:iterate>
			</table>
</logic:present>