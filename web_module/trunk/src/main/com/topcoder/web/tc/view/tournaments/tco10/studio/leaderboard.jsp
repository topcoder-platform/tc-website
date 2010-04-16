<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the leaderboard for Studio track.
--%>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase" %>
<%@ page import="com.topcoder.web.tc.TCO10Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition Leaderboard" area="studio" menu="advancers" subMenu="leaderboard"/>

<c:set var="eventId" value="${param[EVENT_ID]}" />
<c:set var="RANK_COL" value="<%=StudioLeaderboardBase.RANK_COL%>" />
<c:set var="HANDLE_COL" value="<%=StudioLeaderboardBase.HANDLE_COL%>" />
<c:set var="COMPLETED_CONTESTS_COL" value="<%=StudioLeaderboardBase.COMPLETED_CONTESTS_COL%>" />
<c:set var="COMPLETED_POINTS_COL" value="<%=StudioLeaderboardBase.COMPLETED_POINTS_COL%>" />
<c:set var="CURRENT_CONTESTS_COL" value="<%=StudioLeaderboardBase.CURRENT_CONTESTS_COL%>" />
<c:set var="INCOMPLETE_CONTESTS_DETAILS_URL"
    value="${sessionInfo.servletPath}?${MODULE_KEY}=StudioContests&amp;${COMPLETE_KEY}=0&amp;${EVENT_ID}=${eventId}&amp;${USER_ID}=" />
<c:set var="COMPLETE_CONTESTS_DETAILS_URL"
    value="${sessionInfo.servletPath}?${MODULE_KEY}=StudioContests&amp;${COMPLETE_KEY}=1&amp;${EVENT_ID}=${eventId}&amp;${USER_ID}=" />
<c:set var="STUDIO_SERVER_URL" value="<%="http://"+ApplicationServer.STUDIO_SERVER_NAME + "/"%>" />
<c:set var="STUDIO_PROFILE_URL" value="${STUDIO_SERVER_URL}?module=ViewMemberProfile&ha=" />
<c:set var="TOP_ONSITE_RANK" value="<%=TCO10Constants.TCO10_STUDIO_TOP_ONSITE_RANK%>" />
<c:set var="result" value="${requestScope.result}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Leaderboard</h2>
                        <form name="mainForm" id="advancersForm" action='${sessionInfo.servletPath}' method="get">
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="StudioLeaders"/>
                            <tc-webtag:hiddenInput name="${EVENT_ID}" value="${eventId}"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>

                            <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th rowspan="2" class="first"><span class="left"></span>&nbsp;</th>
                                    <th rowspan="2">
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${RANK_COL}'/>">
                                            Rank</a>
                                    </th>
                                    <th rowspan="2">
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${HANDLE_COL}'/>">
                                            Handle</a>
                                    </th>
                                    <th colspan="2" class="top">Completed</th>
                                    <th colspan="1" class="top">In Progress</th>
                                    <th rowspan="2" class="last"><span class="right"></span></th>
                                </tr>
                                <tr>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${COMPLETED_CONTESTS_COL}'/>">
                                            Contests</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${COMPLETED_POINTS_COL}'/>">
                                            Points</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${CURRENT_CONTESTS_COL}'/>">
                                            Contests</a>
                                    </th>
                                </tr>
                                <c:forEach items="${result}" var="resultRow">
                                    <tr>
                                        <td class="first">&nbsp;</td>
                                        <td class="first last alignText">
                                            <c:choose>
                                                <c:when test="${resultRow.rank <= TOP_ONSITE_RANK}">
                                                    <span class="bigGreen">${resultRow.rank}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="bigRed">${resultRow.rank}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="first last alignText">
                                            <strong>
                                                <a href="${STUDIO_PROFILE_URL}${resultRow.handle}">
                                                    ${resultRow.handle}</a>
                                            </strong>
                                        </td>
                                        <td class="first last alignText">
                                            <a href="${COMPLETE_CONTESTS_DETAILS_URL}${resultRow.userId}">
                                                <c:choose>
                                                    <c:when test="${resultRow.completedContests > 0}">
                                                        ${resultRow.completedContests}
                                                    </c:when>
                                                    <c:otherwise>&nbsp;</c:otherwise>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td class="first last alignText">
                                            <c:choose>
                                                <c:when test="${resultRow.rank <= TOP_ONSITE_RANK}">
                                                    <span class="bigGreen">
                                                        <c:choose>
                                                            <c:when test="${resultRow.bestPoints > 0}">
                                                                ${resultRow.bestPoints}
                                                            </c:when>
                                                            <c:otherwise>&nbsp;</c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="bigRed">
                                                        <c:choose>
                                                            <c:when test="${resultRow.bestPoints > 0}">
                                                                ${resultRow.bestPoints}
                                                            </c:when>
                                                            <c:otherwise>&nbsp;</c:otherwise>
                                                        </c:choose>
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="first last alignText">
                                            <a href="${INCOMPLETE_CONTESTS_DETAILS_URL}${resultRow.userId}">
                                                <c:choose>
                                                    <c:when test="${resultRow.currentContests > 0}">
                                                        ${resultRow.currentContests}
                                                    </c:when>
                                                    <c:otherwise>&nbsp;</c:otherwise>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td class="last">&nbsp;</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </form>

                    </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
