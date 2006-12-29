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
<c:when test="${empty req}">
You don't have any current request letter.
</c:when>
<c:otherwise>
	<h2>Visa Letter Request for <c:out value="${req.event.name}"/></h2>
		
		Requested on: <fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy" /><br>
	<c:choose>
	<c:when test="${not empty req.sentDate}">
		Sent on: <fmt:formatDate value="${req.sentDate}"  pattern="MM/dd/yyyy" /><br>
	</c:when>
	<c:when test="${req.denied }">
		TopCoder has denied to send you a visa request letter.
	</c:when>
	<c:otherwise>
		The request letter was not yet sent.
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
