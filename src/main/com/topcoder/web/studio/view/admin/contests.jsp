<%@ page import="com.topcoder.web.studio.Constants" %>
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
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<div align="center">
    <div class="contentOut">
        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Contests</h1>

                <table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
                    <tbody>
                        <tr>
                            <td class="NW">&nbsp;</td>
                            <td class="title" colspan="6">Contests</td>
                            <td class="titleR">
                                <h2><a href="${sessionInfo.servletPath}?module=AdminViewContest">add contest</a></h2>
                            </td>
                            <td class="NE">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="headerW"><div>&nbsp;</div></td>
                            <td class="header">Name</td>
                            <td class="header">Status</td>
                            <td class="headerC">Start</td>
                            <td class="headerC">End</td>
                            <td class="headerC">Submissions</td>
                            <td class="headerC"></td>
                            <td class="headerC"></td>
                            <td class="headerE"><div>&nbsp;</div></td>
                        </tr>
                        <% boolean even = true;%>
                        <c:forEach items="${contests}" var="contest">
                            <tr class="<%=even?"light":"dark"%>">
                                <td class="valueW"><div>&nbsp;</div></td>
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
                                <td class="valueE"><div>&nbsp;</div></td>
                            </tr>
                            <% even = !even;%>
                        </c:forEach>
                        <tr>
                            <td class="SW" colspan="8">&nbsp;</td>
                            <td class="SE">&nbsp;</td>
                        </tr>

                    </tbody>
                </table>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="../foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>