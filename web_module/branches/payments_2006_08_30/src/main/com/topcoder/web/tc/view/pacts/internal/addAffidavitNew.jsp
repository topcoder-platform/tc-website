<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts-tag" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add Affidavit</title>
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="isNotarizedx" value="<%= request.getParameter(PactsConstants.IS_NOTARIZED) %>" />
<c:set var="statusList" value="<%= request.getParameter(PactsConstants.STATUS_CODE_LIST) %>" />

<h1>PACTS</h1>
<h2>Add Affidavit</h2>

		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
			<td><b>User</b></td>
			<td><pacts-tag:handle coderId="${payment.header.user.id}" handle="${payment.header.user.handle}"/></td>
		</tr>
		<tr>
			<td><b>Notarized:</b></td>
			<td>
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="true"/>Yes<br/>
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="false"/>No			
		</td></tr>
		<tr>
			<td><b>Status:</b></td>
			<td>
            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
            		fieldValue="status_id" useTopValue="Select a status"/>
			</td>
		</tr>
		<tr>
		<td><b>Description:</b></td><td>
			<tc-webtag:textInput name="affidavit_desc" size="40" editable="true" />
		</td></tr>
</table>


<jsp:include page="InternalFooter.jsp" flush="true" />
</body>
</html>
