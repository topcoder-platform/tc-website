<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
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
                <span class="pageName">Contests</span>
            </div>

            <div align="right">
                <a href="${sessionInfo.servletPath}?module=AdminViewContest" class="button" style="width: 90px;">Add
                    Competition</a></div>

            <table class="stat" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tbody>
                    <tr>
                        <td class="title" colspan="7"><span class="title">Contests</span></td>
                    </tr>
                    <tr>
                        <td class="header">Name</td>
                        <td class="header">Status</td>
                        <td class="headerC">Start</td>
                        <td class="headerC">End</td>
                        <td class="headerC">Submissions</td>
                        <td class="headerC"></td>
                        <td class="headerC"></td>
                    </tr>
                    <% boolean even = true;%>
                    <c:forEach items="${contests}" var="contest">
                        <tr class="<%=even?"light":"dark"%>">
                            <td class="value"><strong>${contest.name}</strong></td>
                            <td class="value">${contest.status.description}</td>
                            <td class="valueC" nowrap="nowrap">
                                <tc-webtag:format object="${contest.startTime}" format="MMMM d, yyyy 'at<br>' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                            </td>
                            <td class="valueC" nowrap="nowrap">
                                <tc-webtag:format object="${contest.endTime}" format="MMMM d, yyyy 'at<br>' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                            </td>
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">${fn:length(contest.submissions)}</a>
                            </td>
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${contest.id}">edit</a>
                            </td>
                            <td class="valueC">
                                <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}">view</a>
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