<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ page import="com.topcoder.apps.review.document.ComponentScores" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<bean:define id="compScores" name="componentScores" type="com.topcoder.apps.review.document.ComponentScores" />


<logic:equal name="compScores" property='type' value="1">
Design | <html:link href="/ComponentScores.do?type=2">Development</html_link>
</logic:equal>
<logic:equal name="compScores" property='type' value="2">
<a href="/ComponentScores.do?type=1">Design </a> | Development
</logic:equal>


<table border="1">
	<tr>
		<td>Developer</td>
		<td>Submission</td>
		<td>Screening</td>
		<td> 
		
		
		<bean:write name="compScores" property="reviewerName[0]"/> <br>
			<logic:equal name="compScores" property='type' value="2">
			   (<bean:write name="compScores" property="testCasesURL[0]"/> )
			</logic:equal>
		</td>
		<td> <bean:write name="compScores" property="reviewerName[1]"/> <br>
			<logic:equal name="compScores" property='type' value="2">
			   (<bean:write name="compScores" property="testCasesURL[1]"/> )
			</logic:equal>
		</td>
		<td> <bean:write name="compScores" property="reviewerName[2]"/> <br>
			<logic:equal name="compScores" property='type' value="2">
			   (<bean:write name="compScores" property="testCasesURL[2]"/> )
			</logic:equal>
		</td>
		<td>Final Score</td>
		<td>Appeals</td>
		<td>Details</td>
	</tr>
<logic:iterate id="subm" name="compScores" property="submissions">
	<tr>
		<td>
			<bean:write name="subm" property="handle"/>
		</td>
		
		<td>
			<bean:write name="subm" property="submissionURL"/>
		</td>
		<td>
			<bean:write name="subm" property="screeningScore"/>
		</td>
		
<logic:iterate id="reviewerID" indexId="idx" name="compScores" property="reviewerID">
		<td>	
			<a href='<%= "review/reviewScorecard.do?action=view&id=" + compScores.getProjectId() +"&rid=" + reviewerID + " &sid=" + subm.getUserID()  %>' >
				<bean:write name="subm" property='<%="reviewScore["+idx+"]"%>' />
			</a>
		</td>
</logic:iterate>		
		<td>Final Score</td>
		<td>Appeals</td>
		<td>Details</td>

	</tr>
</logic:iterate>
</table>
