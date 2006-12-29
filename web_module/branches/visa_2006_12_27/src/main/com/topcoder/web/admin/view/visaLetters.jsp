<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        <form action="/admin/?module=VisaLetters" >
        	View request letters with status:<br>
			<tc-webtag:chkBox name="pending" value="true"/>Pending<br>
			<tc-webtag:chkBox name="sent" value="true"/>Sent		<br>	
			<tc-webtag:chkBox name="denied" value="true"/>Denied<br>
			<br>
			
			<tc-webtag:listSelect name="event" list="${requestScope.eventList}"/>
			<input type="submit" value="Search">

<table>
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
		<td>deny - mark as sent</td>
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
