<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.web.tc.Constants, 
                 com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../../script.jsp" />
</head>
<body id="page_sub">

<div id="wrapper">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="leaderboard"/>
        </jsp:include>

        <h2>Leaderboard</h2>

        <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
            <thead>
                <tr>
                    <th colspan="5">
                        Studio Leaderboard
                    </th>
                </tr>
                <tr>
                    <th class="headerC" rowspan="2" width="1%">
                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.RANK_COL%>"/>">Rank</a>
                    </th>
                    <th class="header" rowspan="2">
                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.HANDLE_COL%>"/>">Handle</a>
                    </th>
                    <th class="headerC" colspan="2" nowrap="nowrap" style="border-right: 1px solid #999999;">
                        Completed
                    </th>
                    <th class="headerC" colspan="1" nowrap="nowrap">
                        In Progress
                    </th>
                </tr>
                <tr>
                    <th class="headerC">
                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.COMPLETED_CONTESTS_COL%>"/>">Contests</a>
                    </th>
                    <th class="headerC" style="border-right: 1px solid #999999;">
                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.COMPLETED_POINTS_COL%>"/>">Points</a>
                    </th>
                    <th class="headerC">
                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.CURRENT_CONTESTS_COL%>"/>">Contests</a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:set value="<%=Constants.EVENT_ID%>" var="eventId"/>
                <c:set value="<%=Constants.USER_ID%>" var="userId"/>
                <c:set value="<%=Constants.MODULE_KEY%>" var="module"/>
                <%int i = 0;%>
                <c:forEach items="${result}" var="resultRow">
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <td class="valueC">
                            <c:choose>
                                <c:when test="${resultRow.rank <= 12}">
                                    <span class="bigGreen">${resultRow.rank}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="bigRed">${resultRow.rank}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="value">
                            <strong>
                                ${resultRow.handle}
                            </strong>
                        </td>
                        <td class="valueC">
                            <a href="tco08?${module}=StudioContests&amp;complete=1&amp;${eventId}=${param[eventId]}&amp;${userId}=${resultRow.userId}">
                                <c:choose>
                                    <c:when test="${resultRow.completedContests > 0}">
                                        ${resultRow.completedContests}
                                    </c:when>
                                    <c:otherwise>
                                        &nbsp;                                        
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </td>
                        <td class="valueC" style="border-right: 1px solid #999999;">
                            <c:choose>
                                <c:when test="${resultRow.rank <= 12}">
                                    <span class="bigGreen">
                                        <c:choose>
                                            <c:when test="${resultRow.bestPoints > 0}">
                                                ${resultRow.bestPoints}
                                            </c:when>
                                            <c:otherwise>
                                                &nbsp;                                        
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="bigRed">
                                        <c:choose>
                                            <c:when test="${resultRow.bestPoints > 0}">
                                                ${resultRow.bestPoints}
                                            </c:when>
                                            <c:otherwise>
                                                &nbsp;                                        
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="valueC">
                            <a href="tco08?${module}=StudioContests&amp;complete=0&amp;${eventId}=${param[eventId]}&amp;${userId}=${resultRow.userId}">
                                <c:choose>
                                    <c:when test="${resultRow.currentContests > 0}">
                                        ${resultRow.currentContests}
                                    </c:when>
                                    <c:otherwise>
                                        &nbsp;                                        
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </td>
                    </tr>

                    <%i++;%>
                </c:forEach>


            </tbody>
        </table>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>