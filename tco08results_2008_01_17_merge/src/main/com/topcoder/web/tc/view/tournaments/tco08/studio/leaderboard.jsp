<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.web.tc.Constants, 
                 com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="leaderboard"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Leaderboard</span></h1>

        <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
            <thead>
                <tr>
                    <td class="title" colspan="5">
                        Studio Leaderboard
                    </td>
                </tr>
                <tr>
                    <td class="headerC" rowspan="2" width="1%">
                        <A href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.RANK_COL%>"/>">Rank</A>
                    </td>
                    <td class="header" rowspan="2">
                        <A href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.HANDLE_COL%>"/>">Handle</A>
                    </td>
                    <td class="headerC" colspan="2" nowrap="nowrap" style="border-right: 1px solid #999999;">
                        Completed
                    </td>
                    <td class="headerC" colspan="1" nowrap="nowrap">
                        In Progress
                    </td>
                </tr>
                <tr>
                    <td class="headerC">
                        <A href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.COMPLETED_CONTESTS_COL%>"/>">Contests</A>
                    </td>
                    <td class="headerC" style="border-right: 1px solid #999999;">
                        <A href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.COMPLETED_POINTS_COL%>"/>">Points</A>
                    </td>
                    <td class="headerC">
                        <A href="/tco08?<%=Constants.MODULE_KEY%>=StudioLeaders<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioLeaderboardBase.CURRENT_CONTESTS_COL%>"/>">Contests</A>
                    </td>
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
                            <a href="tco08?${module}=StudioContests&amp;complete=1&amp;${eventId}=${param[eventId]}&amp;${userId}=${resultRow.userId}"/>
                                <c:choose>
                                    <c:when test="${resultRow.completedContests > 0}">
                                        ${resultRow.completedContests}
                                    </c:when>
                                    <c:otherwise>
                                        &nbsp;                                        
                                    </c:otherwise>
                                </c:choose>
                            </A>
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
                            </A>
                        </td>
                    </tr>

                    <%i++;%>
                </c:forEach>


            </tbody>
        </table>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>