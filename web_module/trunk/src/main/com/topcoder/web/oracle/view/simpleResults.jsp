<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

            <h1>TopCoder Homepage Design > Prediction Results</h1>

            <div class="pagingBox">
                Room 1
                | <A href="?module=Static&d1=results&d2=tcdotcomPredRd1Rm2">Room 2</A>
            </div>

            <div align="center">
                <table cellpadding="0" cellspacing="0" class="stat" width="400px;">
                <thead>
                    <tr>
                        <td class="headerC">Place</td>
                        <td class="header" width="100%">Handle</td>
                        <td class="headerR">Points</td>
                    </tr>
                </thead>
                <tbody>
                    <% boolean even = false;%>
                    <c:forEach items="${results}" var="result">
                        <tr class="<%=even?"light":"dar"%>">
                            <td class="valueC">${result.placed}</td>
                            <td class="value"><tc-webtag:handle coderId="${result.user.id}" /></td>
                            <td class="valueR"><fmt:formatNumber value="${result.score}" pattern="#,###.000"/></td>
                        </tr>
                        <%even=!even;%>
                     </c:forEach>
                </tbody>
                </table>
            </div>

        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>