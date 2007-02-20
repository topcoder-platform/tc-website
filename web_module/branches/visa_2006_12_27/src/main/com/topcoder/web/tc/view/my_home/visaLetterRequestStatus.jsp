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
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="visa"/>
    <jsp:param name="title" value="&nbsp;"/>
</jsp:include>

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
    <span class="bodySubtitle">Visa Letter Request for <c:out value="${req.event.name}"/></span><br>
    <strong>Requested on:</strong> <fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy" /><br>
    <strong>Status:</strong>
    <c:choose>
    <c:when test="${not empty req.sentDate}">
            Your Visa request has been <span class="bigGreen">approved</span>.<br>The letter was sent to you on: 
            <strong><fmt:formatDate value="${req.sentDate}"  pattern="MM/dd/yyyy" /></strong><br>
            <div align="center" style="margin: 20px;">
                <a href="/tc?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request again</a>
            </div>
    </c:when>
    <c:when test="${req.denied }">
        We're sorry, TopCoder has <span class="bigRed">denied</span> to send you a Visa Letter.
    </c:when>
    <c:otherwise>
        Your Visa Letter request is <strong>pending</strong> approval.  Please check again soon.
            <div style="margin: 20px 0px 100px 0px;">
                <a href="/tc?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request again</a><br>
            </div>
    </c:otherwise>
    </c:choose>
</c:otherwise>
</c:choose>

            </div>
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
