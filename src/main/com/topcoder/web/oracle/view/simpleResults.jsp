<%@ page import="com.topcoder.web.oracle.Constants" %>
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
    <link type="text/css" rel="stylesheet" href="/css/oracle/coders.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">


            <div style="margin-bottom: 20px;">
                <A href="/"><img src="/i/oracle/layout/topcoder.png" alt="TopCoder" /></A>
            </div>

            <jsp:include page="nav.jsp" >
            <jsp:param name="selectedTab" value="${room.id}Pred"/>
            </jsp:include>

            <%--
            <p><strong>${room.round.contest.name} &gt; ${room.round.name} &gt; Prediction Results</strong></p>
            --%>

            <div id="bodyColumn">

                <div class="pagingBox">
                    |
                    <c:forEach items="${room.round.rooms}" var="myRoom">
                        <c:choose>
                            <c:when test="${room.id==myRoom.id}">
                                ${myRoom.name}
                            </c:when>
                            <c:otherwise>
                                <A href="?module=ViewSimpleResults&amp;<%=Constants.ROOM_ID%>=${myRoom.id}">${myRoom.name}</A>
                            </c:otherwise>
                        </c:choose>
                    |
                    </c:forEach>
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
                        <% boolean even = true;%>
                        <c:forEach items="${results}" var="result">
                            <tr class="<%=even?"light":"dark"%>">
                                <td class="valueC">${result.placed}</td>
                                <td class="value"><tc-webtag:handle coderId="${result.user.id}" /></td>
                                <td class="valueR"><fmt:formatNumber value="${result.score}" pattern="#,###.00"/></td>
                            </tr>
                            <%even=!even;%>
                         </c:forEach>
                    </tbody>
                    </table>
                </div>

            </div>

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>