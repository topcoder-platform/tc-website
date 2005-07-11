<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ page import="com.topcoder.apps.review.document.ComponentScores" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<bean:define id="compScores" name="componentScores" type="com.topcoder.apps.review.document.ComponentScores" />


<logic:equal name="compScores" property='type' value="1">
Design | <a href="/ComponentScores.do?type=2">Development</a>
</logic>
<logic:equal name="compScores" property='type' value="1">
<a href="/ComponentScores.do?type=1">Design </a> | Development
</logic>


<table border="1">
	<tr>
		<td>Developer</td>
		<td>Submission</td>
		<td>compScores.getReviewerName(0)<br>() </td>
		<td>compScores.getReviewerName(1)<br>() </td>
		<td>compScores.getReviewerName(2)<br>() </td>
		<td>Final Score</td>
		<td>Appeals</td>
		<td>Details</td>
	</tr>
</table>
