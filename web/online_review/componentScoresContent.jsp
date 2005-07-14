<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ page import="com.topcoder.apps.review.document.ComponentScores" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<bean:define id="compScores" name="componentScores" type="com.topcoder.apps.review.document.ComponentScores" />


<logic:equal name="compScores" property='type' value="1">
Design | <html:link href='<%= "ComponentScores.do?type=2&pid=" + compScores.getProjectId() %>'> Development</html:link>
</logic:equal>
<logic:equal name="compScores" property='type' value="2">
<html:link href='<%= "ComponentScores.do?type=1&pid=" + compScores.getProjectId() %>'>Design </html:link> | Development
</logic:equal>

<br>

<table border="1">
	<tr>
		<td>Placement</td>
		<td>Developer</td>
		<td>Submission</td>
		<td>Screening</td>
		<td> 
		   <html:link href='<%= "http://www.topcoder.com/tc?module=MemberProfile&cr=" + compScores.getReviewerID(0) %>' >
			<bean:write name="compScores" property="reviewerNames[0]"/> 
		   </html:link>
		
			<logic:equal name="compScores" property='type' value="2">
			<br>
			   (<bean:write name="compScores" property="testCasesURL[0]"/> )
			</logic:equal>
		</td>
		<td> 
		   <html:link href='<%= "http://www.topcoder.com/tc?module=MemberProfile&cr=" + compScores.getReviewerID(1) %>' >
			<bean:write name="compScores" property="reviewerNames[1]"/> 
		   </html:link>
			<logic:equal name="compScores" property='type' value="2">
			<br>
			   (<bean:write name="compScores" property="testCasesURL[1]"/> )
			</logic:equal>
		</td>
		<td> 
		<html:link href='<%= "http://www.topcoder.com/tc?module=MemberProfile&cr=" + compScores.getReviewerID(2) %>' >
			<bean:write name="compScores" property="reviewerNames[2]"/> 
		   </html:link>

			<logic:equal name="compScores" property='type' value="2">
			<br>
			   (<bean:write name="compScores" property="testCasesURL[2]"/> )
			</logic:equal>
		</td>
		<td>Final Score</td>
		<td>Appeals</td>
		<td>Details</td>
	</tr>
<logic:iterate id="subm" name="compScores" property="submissions" type="com.topcoder.apps.review.document.SubmissionScores">
	<tr>
		<td>
			<bean:write name="subm" property="placement"/>
			
		</td>
		<td>
		   <html:link href='<%= "http://www.topcoder.com/tc?module=MemberProfile&cr=" + subm.getUserID() %>' >
			<bean:write name="subm" property="handle"/>
		   </html:link>
			
		</td>
		
	
		<td>
			<html:link href='<%= "submissionDownload.do?id=" + compScores.getProjectId() + "&sid=" + subm.getSubmissionID() %>' >
			download
			</html:link>
			<logic:equal name="name="subm" property="placement" value="1">
			( <html:link href='<%= "submissionDownload.do?id=" + compScores.getProjectId() + "&sid=-1" %>' >
			  final submission
			  </html:link>
			)
			</logic:equal>
			
		</td>
		<td>
		  <html:link href='<%= "screeningScorecard.do?action=view&id=" + compScores.getProjectId() + "&sid=" + subm.getUserID()  %>' >
			<bean:write name="subm" property="screeningScore"/>
		   </html:link>
		</td>
		
		<td>	
			<html:link href='<%= "reviewScorecard.do?action=view&id=" + compScores.getProjectId() +"&rid=" + compScores.getReviewerID(0) + "&sid=" + subm.getUserID()  %>' >
				<bean:write name="subm" property="reviewScore[0]" />
			</html:link>
		</td>
		<td>	
			<html:link href='<%= "reviewScorecard.do?action=view&id=" + compScores.getProjectId() +"&rid=" + compScores.getReviewerID(1) + "&sid=" + subm.getUserID()  %>' >
				<bean:write name="subm" property="reviewScore[1]" />
			</html:link>
		</td>
		<td>	
			<html:link href='<%= "reviewScorecard.do?action=view&id=" + compScores.getProjectId() +"&rid=" + compScores.getReviewerID(2) + "&sid=" + subm.getUserID()  %>' >
				<bean:write name="subm" property="reviewScore[2]" />
			</html:link>
		</td>
		<td>
		<logic:equal name="name="subm" property="placement" value="1">
		<html:link href='<%= "aggregation.do?action=view&id=" + compScores.getProjectId() %>' >
			<bean:write name="subm" property="finalScore" />
		</html:link>
		</logic:equal>
		
		<logic:notEqual name="name="subm" property="placement" value="1">
			<bean:write name="subm" property="finalScore" />
		</logic:notEqual>
		</td>
		<td>Appeals</td>
		<td>Details</td>

	</tr>
</logic:iterate>
</table>
