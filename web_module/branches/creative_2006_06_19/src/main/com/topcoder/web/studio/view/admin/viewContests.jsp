<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder FX</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="adminLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <h1>Contest List</h1>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="6">Contests</td>
                    </tr>
                    <tr>
                        <td class="header" colspan="6">
                            <a href="${sessionInfo.servletPath}?module=AdminViewContest">add</a></td>
                    </tr>
                    <tr>
                        <td class="headerC"></td>
                        <td class="headerC"></td>
                        <td class="header">Name</td>
                        <td class="header">Status</td>
                        <td class="headerC">Start</td>
                        <td class="headerC">End</td>
                    </tr>
                    <c:forEach items="${contests}" var="contest">
                        <tr class="light">
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${contest.id}">edit</a>
                            </td>
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">submissions</a>
                            </td>
                            <td class="value">${contest.name}</td>
                            <td class="value">${contest.status.description}</td>
                            <td class="valueC">
                                <fmt:formatDate value="${contest.startTime}" pattern="<%=Constants.JAVA_DATE_FORMAT%>"/></td>
                            <td class="valueC">
                                <fmt:formatDate value="${contest.endTime}" pattern="<%=Constants.JAVA_DATE_FORMAT%>"/></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>
</body>
</html>
