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
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<link type="text/css" rel="stylesheet" href="/css/tcReg.css">    
</head>
<body>


<c:set var="payment" value="${requestScope.payment}"/>
<c:set var="user" value="${requestScope.user}"/>
<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />

<div align="center">
<div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

<h1>PACTS</h1>
<h2>Add Affidavit</h2>
<form action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="<%=PactsConstants.TASK_STRING%>" value="<%=PactsConstants.ADD_TASK%>"/>
  <input type="hidden" name="<%=PactsConstants.CMD_STRING%>" value="<%=PactsConstants.AFFIDAVIT_CMD%>"/>

		<table cellpadding="0" cellspacing="0" border="0" class="regFields">
		<tr>
			<td class="name">User</td>
			<td><pacts-tag:handle coderId="${user.id}" handle="${user.handle}"/></td>
		</tr>
		<tr>
			<td class="value">Notarized:</td>
			<td>
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="yes"/>Yes<br/>
				<tc-webtag:radioButton name="<%=PactsConstants.IS_NOTARIZED%>" value="no"/>No			
		</td></tr>
		<tr>
			<td class="name">Status:</td>
			<td class="value">
            	<tc-webtag:rscSelect name="affidavit_status_id" list='${statusList}' fieldText="status_desc" 
            		fieldValue="status_id" useTopValue="Select a status"/>
			</td>
		</tr>
		<tr>
		<td class="name">Description:</td>
		<td class="value">
			<tc-webtag:textInput name="affidavit_desc" size="40" editable="true" />
		</td></tr>
</table>
<input type="submit" value="Save Affidavit">
</form>
<jsp:include page="InternalFooter.jsp" flush="true" />
</div>
</div>

</body>
</html>
