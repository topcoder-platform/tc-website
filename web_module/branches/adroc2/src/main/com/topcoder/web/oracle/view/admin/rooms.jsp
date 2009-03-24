<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Oracle</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="oracle"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Rooms</span>
            </div>

            <table class="stat" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tbody>
                    <tr>
                        <td class="title" colspan="7"><span class="title">Rooms</span></td>
                    </tr>
                    <tr>
                        <td class="header">Name</td>
                        <td class="headerC"></td>
                    </tr>
                    <% boolean even = true;%>
                    <c:forEach items="${rooms}" var="room">
                        <tr class="<%=even?"light":"dark"%>">
                            <td class="value"><strong>${room.name}</strong></td>
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=AdminViewCandidates&amp;<%=Constants.ROOM_ID%>=${room.id}">view candidates</a>
                            </td>
                        </tr>
                        <% even = !even;%>
                    </c:forEach>
                </tbody>
            </table>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>