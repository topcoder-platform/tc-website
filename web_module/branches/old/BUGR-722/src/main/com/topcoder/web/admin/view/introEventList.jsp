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

Create new Introductory Event: <a href="/admin/?module=AddIntroEvent&ha=1">algo</a>, <a href="/admin/?module=AddIntroEvent&hc=1">comp</a>, <a href="/admin/?module=AddIntroEvent&ha=1&hc=1">algo &amp; comp</a>
<br>
<br>
<br>
<table width="100%" >        
<tr class="header">
	<td></td>
	<td>Event Name</td>
	<td>Type</td>
	<td></td>
	<td></td>
</tr>

<% boolean even = true; %>
<c:forEach items="${events}" var="event">
<tr class="<%=even?"even":"odd"%>">
	<td>
	     <a href="/admin/?module=EditIntroEvent&eid=${event.id }">edit</a>
	</td>
	<td><c:out value="${event.description}" /></td>
	<td>
		<c:set var="compId" value=""/>
		<c:forEach items="${event.children}" var="child">
			<c:if test="${child.type.id == 12 }">
				<a href="/tc?module=IntroEventAlgoOverview&eid=${child.id }">algo</a>
			</c:if>
			<c:if test="${child.type.id == 13 }">
				<a href="/tc?module=IntroEventCompOverview&eid=${child.id }">comp</a>
				<c:set var="compId" value="${child.id }"/>
			</c:if>
		</c:forEach>
	</td>
	<td>
		<c:if test="${not empty compId }">
			<a href="/admin/?module=PassedReview&eid=${compId}">Passed Review</a>
		</c:if>
		
	</td>
	<td>
		<c:if test="${not empty compId }">
			<a href="/PactsInternalServlet?module=ListIntroEventCompPayments&eid=${compId}">Create Payments</a>
		</c:if>
	</td>
</tr>
	<% even = !even; %>

</c:forEach>
</table>

<c:choose>
	<c:when test="${sr == 0}">&lt;&lt; prev</c:when>
	<c:otherwise><a href="/admin/?module=IntroEventList&sr=${sr-20}">&lt;&lt; prev</a></c:otherwise>
</c:choose> 
| 
<c:choose>
	<c:when test="${hasNext}"><a href="/admin/?module=IntroEventList&sr=${sr+20}">next &gt;&gt;</a></c:when>
	<c:otherwise>next &gt;&gt;</c:otherwise>
</c:choose> 

        </td>
    </tr>
</table>
</body>
</html>
