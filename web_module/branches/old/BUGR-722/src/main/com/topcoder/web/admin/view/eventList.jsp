<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.admin.controller.request.VisaLetters"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    
<script language="javascript" type="text/javascript">
 </script>  
 
  
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
        <a href="/admin/?module=VisaLetters">Back to Visa Letters</a><br>
        <a href="/admin/?module=EditEvent">Create new event</a><br>
<table width="100%" >        
<tr class="header">
	<td></td>
	<td>Event Name</td>
	<td>Request start date</td>
	<td>Request end date</td>
	<td>Link for members</td>
</tr>

<% boolean even = true; %>
<c:forEach items="${requestScope.events}" var="event">
<tr class="<%=even?"even":"odd"%>">
	<td>
	     <a href="/admin/?module=EditEvent&eid=${event.id }">edit</a>
	</td>
	<td><c:out value="${event.name}" /></td>
	<td>
		<fmt:formatDate value="${event.startDate}" pattern="MM/dd/yyyy HH:mm" />
	</td>
	<td>
		<fmt:formatDate value="${event.endDate}" pattern="MM/dd/yyyy HH:mm" />
	</td>
	<td><a href="https://www.topcoder.com/tc?module=VisaLetterRequest&eid=<c:out value="${event.id}" />">
		https://www.topcoder.com/tc?module=VisaLetterRequest&amp;eid=<c:out value="${event.id}" />
		</a>
	</td>
</tr>
	<% even = !even; %>

</c:forEach>
</table>
        </td>
    </tr>
</table>
</body>
</html>
