<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="req" value="${requestScope.req}"/>
<html>
<head>
    <title>Visa Letter Request</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
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

                 <span class="bodySubtitle">Visa letter request for <c:out value="${req.event.name}"/></span><br>
                 <strong>Requested on:</strong>
                 <fmt:formatDate value="${req.requestDate}" pattern="MM/dd/yyyy"/>
                 <br>
                 <strong>Status:</strong>

                 <div align="center" style="margin: 20px;">
                     <c:choose>
                         <c:when test="${not empty req.sentDate}">
                             Your Visa request has been <span class="bigGreen">APPROVED</span>.<br>The letter was
                             sent to you on:
                             <strong>
                                 <fmt:formatDate value="${req.sentDate}" pattern="MM/dd/yyyy"/>
                             </strong><br>

                             <div align="center" style="margin: 20px;">
                                 <a href="${sessionInfo.secureAbsoluteServletPath}?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request
                                     again</a>
                             </div>
                         </c:when>
                         <c:when test="${req.denied }">
                             We're sorry, your Visa letter request has been <span class="bigRed">DENIED</span>.
                             <div style="margin: 20px 0px 100px 0px;">
                                 <a href="${sessionInfo.secureAbsoluteServletPath}?module=VisaLetterRequest&eid=${req.event.id }&fr=true" class="button" style="width: 80px;">Request
                                     again</a><br>
                             </div>
                         </c:when>
                         <c:otherwise>
                             Your Visa letter request is <strong>PENDING</strong> approval.<br>Please check again
                             soon.
                         </c:otherwise>
                     </c:choose>
                 </div>

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

<jsp:include page="../foot.jsp"/>

</body>

</html>
