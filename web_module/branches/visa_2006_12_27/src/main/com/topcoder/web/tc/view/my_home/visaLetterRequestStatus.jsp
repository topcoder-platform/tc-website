<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
          %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="req" value="${requestScope.req}"/>
<html>
<head>
<title>Visa Letter Request</title>
         
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<c:choose>
<c:when test="${not empty requestScope.tooEarly}">
	<h2>Visa Letter Request for <c:out value="${requestScope.event_name}"/></h2>
You can't request a Visa letter for this event yet.
</c:when>
<c:when test="${not empty requestScope.tooLate}">
	<h2>Visa Letter Request for <c:out value="${requestScope.event_name}"/></h2>
You are not able to request for a Visa letter for this event anymore.
</c:when>

<c:when test="${empty req}">
You don't have any Visa Letter requested.
</c:when>
<c:otherwise>
	<h2>Visa Letter Request for <c:out value="${req.event.name}"/></h2>
		
		Requested on: <fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy" /><br>
	<c:choose>
	<c:when test="${not empty req.sentDate}">
		Sent on: <fmt:formatDate value="${req.sentDate}"  pattern="MM/dd/yyyy" /><br>
		<a href="/tc?module=VisaLetterRequest&eid=${req.event.id }&fr=true">Request again</a><br>
	</c:when>
	<c:when test="${req.denied }">
		TopCoder has denied to send you a Visa Letter.
	</c:when>
	<c:otherwise>
		The Visa Letter was not yet sent.
		<a href="/tc?module=VisaLetterRequest&eid=${req.event.id }&fr=true">Request again</a><br>
	</c:otherwise>
	</c:choose>
</c:otherwise>
</c:choose>

</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
