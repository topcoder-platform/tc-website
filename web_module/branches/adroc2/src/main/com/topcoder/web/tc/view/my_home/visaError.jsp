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

                <c:choose>

                    <c:when test="${not empty requestScope.tooEarly}">
                        <span class="bodySubtitle">Visa letter request for <c:out value="${requestScope.event_name}"/></span>

                        <div align="center" style="margin: 20px;">
                            TopCoder is not currently accepting Visa requests for this event.<br>Please check again
                            later.
                        </div>
                    </c:when>

                    <c:when test="${not empty requestScope.tooLate}">
                        <span class="bodySubtitle">Visa letter request for <c:out value="${requestScope.event_name}"/></span><br>

                        <div align="center" style="margin: 20px;">
                            We're sorry, TopCoder is no longer accepting Visa requests for this event.
                        </div>
                    </c:when>

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

<jsp:include page="../foot.jsp"/>

</body>

</html>
