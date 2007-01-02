<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
<script language="javascript" type="text/javascript">
function update(action,rid) {
	 document.f.rid.value = rid;
	 document.f.action.value = action;	 
	 document.f.submit();
}

 </script>    
</head>

<body>
<jsp:include page="top.jsp"/>
<table border="1">
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        <form action="/admin/?module=VisaLetters" >
        <input type="hidden" name="module" value="">
        <input type="hidden" name="rid" value="">
        <input type="hidden" name="action" value="">        
        	View request letters with status:<br>
			<tc-webtag:chkBox name="pending" value="true"/>Pending<br>
			<tc-webtag:chkBox name="sent" value="true"/>Sent		<br>	
			<tc-webtag:chkBox name="denied" value="true"/>Denied<br>
			<br>
			
			<tc-webtag:listSelect name="event" list="${requestScope.eventList}"/>
			<input type="submit" value="Search" onClick="docyment.f.action.value='search'">

<table border="1">
<tr>
	<td>Request Date</td>
	<td>Handle</td>
	<td>Status</td>
	<td></td>
</tr>
<c:forEach items="${requestScope.reqs}" var="req">
<tr>
	<td><fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy" /></td>
	<td><c:out value="${req.user.handle }" /></td>
	<c:choose>
	<c:when test="${not empty req.sentDate}">
		<td>Sent on: <fmt:formatDate value="${req.sentDate}"  pattern="MM/dd/yyyy" /></td>
		<td></td>
	</c:when>
	<c:when test="${req.denied }">
		<td>Denied</td>
		<td></td>
	</c:when>
	<c:otherwise>
		<td>Pending</td>
		<td><a href="javascript:update('deny',${req.id }')">deny</a><br>
		<a href="javascript:update('sent',${req.id }')">mark as sent</a><br>
	</c:otherwise>
	</c:choose>
	
	<td></td>
	<td></td>	
</tr>
</c:forEach>
</table>

		</form>
        </td>
    </tr>
</table>
</body>
</html>
