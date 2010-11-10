<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 *
 * This JSP shows studio track leaderboard page.
 *
 * Version 1.1 (2009 TopCoder Open Site Integration 1.1.1) changes: leaderboard was implemented.
 *
 * Author TCSDEVELOPER
 * Version 1.1
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.Constants, com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase,
                 com.topcoder.shared.util.ApplicationServer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tc-webtag" uri="tc-webtags.tld" %>

<%-- Setting up some variables to use JSTL --%>
<c:set var="RANK_COL" value="<%=StudioLeaderboardBase.RANK_COL%>" />
<c:set var="HANDLE_COL" value="<%=StudioLeaderboardBase.HANDLE_COL%>" />
<c:set var="COMPLETED_CONTESTS_COL" value="<%=StudioLeaderboardBase.COMPLETED_CONTESTS_COL%>" />
<c:set var="COMPLETED_POINTS_COL" value="<%=StudioLeaderboardBase.COMPLETED_POINTS_COL%>" />
<c:set var="CURRENT_CONTESTS_COL" value="<%=StudioLeaderboardBase.CURRENT_CONTESTS_COL%>" />
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>" />
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>" />
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" />
<c:set var="EVENT_ID" value="<%=Constants.EVENT_ID%>" />
<c:set var="USER_ID" value="<%=Constants.USER_ID%>" />
<c:set var="eventId" value="${param[EVENT_ID]}" />
<c:set var="TOP_ONSITE_RANK" value="<%=Constants.TCO09_STUDIO_TOP_ONSITE_RANK%>" />
<c:set var="COMPLETE_KEY" value="<%=Constants.COMPLETE_KEY%>" />
<c:set var="INCOMPLETE_CONTESTS_DETAILS_URL"
    value="${sessionInfo.servletPath}?${MODULE_KEY}=StudioContests&amp;${COMPLETE_KEY}=0&amp;${EVENT_ID}=${eventId}&amp;${USER_ID}=" />
<c:set var="COMPLETE_CONTESTS_DETAILS_URL"
    value="${sessionInfo.servletPath}?${MODULE_KEY}=StudioContests&amp;${COMPLETE_KEY}=1&amp;${EVENT_ID}=${eventId}&amp;${USER_ID}=" />
<c:set var="STUDIO_SERVER_URL" value="<%="http://"+ApplicationServer.STUDIO_SERVER_NAME + "/"%>" />
<c:set var="STUDIO_PROFILE_URL" value="${STUDIO_SERVER_URL}?module=ViewMemberProfile&ha=" />

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>TCO 09 : Studio Competition</title>

        <!-- Meta Tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- External CSS -->
        <link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />

        <!-- External JavaScripts -->
        <script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
        <script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
        <script type="text/javascript" src="/js/arena.js"></script>
    </head>

    <body id="page">
        <div id="wrapper">
            <div id="wrapperInner">
                <div id="wrapperContent">
                    <div id="wrapperContentInner">
                        <jsp:include page="../../header.jsp"/>

                        <jsp:include page="../../mainNav.jsp" >
                            <jsp:param name="mainTab" value="studio"/>
                        </jsp:include>

                        <div id="content">
                            <div class="contentTopLeft">
                                <div class="contentTopRight">
                                    <div class="contentTopInner">
                                    </div>
                                </div>
                            </div>

                            <div id="contentInner" class="contentInner">
                                <div id="contentInnerInner">
                                    <div class="bottomArea">
                                        <div class="bottomLeft">
                                            <div class="bottomRight">
                                                <jsp:include page="../../secondaryNav.jsp" >
                                                    <jsp:param name="mainTab" value="studio"/>
                                                    <jsp:param name="secondaryTab" value="advancers"/>
                                                </jsp:include>

                                                <jsp:include page="../../tertiaryNav.jsp" >
                                                    <jsp:param name="mainTab" value="studio"/>
                                                    <jsp:param name="secondaryTab" value="advancers"/>
                                                    <jsp:param name="tertiaryTab" value="leaderboard"/>
                                                </jsp:include>

                                                <div class="bottomAreaContent">
                                                    <div class="mainContent">
                                                        <div id="mainContentInner">
                                                            <div>
                                                                <div class="pageContent">
                                                                    <h2 class="title">
                                                                        Studio Design Competition Leaderboard
                                                                    </h2>
                                                                    <br/>
                                                                    <form name="advancersForm" action='${sessionInfo.servletPath}' method="get">
                                                                        <tc-webtag:hiddenInput name="${MODULE_KEY}" value="StudioLeaders"/>
                                                                        <tc-webtag:hiddenInput name="${EVENT_ID}" value="${eventId}"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                                                                        <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>

                                                                        <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <th rowspan="2" class="first">&nbsp;</th>
                                                                                <th rowspan="2">
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${RANK_COL}'/>">
                                                                                        Rank
                                                                                    </a>
                                                                                </th>
                                                                                <th rowspan="2">
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${HANDLE_COL}'/>">
                                                                                        Handle
                                                                                    </a>
                                                                                </th>
                                                                                <th colspan="2">
                                                                                    Completed
                                                                                </th>
                                                                                <th colspan="1">
                                                                                    In Progress
                                                                                </th>
                                                                                <th rowspan="2" class="last">&nbsp;</th>
                                                                            </tr>
                                                                            <tr>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${COMPLETED_CONTESTS_COL}'/>">
                                                                                        Contests
                                                                                    </a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${COMPLETED_POINTS_COL}'/>">
                                                                                        Points
                                                                                    </a>
                                                                                </th>
                                                                                <th>
                                                                                    <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${CURRENT_CONTESTS_COL}'/>">
                                                                                        Contests
                                                                                    </a>
                                                                                </th>
                                                                            </tr>
                                                                            <c:forEach items="${result}" var="resultRow">
                                                                                <tr>
                                                                                    <td class="first">&nbsp;</td>
                                                                                    <td class="first last alignText">
                                                                                        <c:choose>
                                                                                            <c:when test="${resultRow.rank <= TOP_ONSITE_RANK}">
                                                                                                <span class="bigGreen">
                                                                                                    ${resultRow.rank}
                                                                                                </span>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <span class="bigRed">
                                                                                                    ${resultRow.rank}
                                                                                                </span>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </td>
                                                                                    <td class="first last alignText">
                                                                                        <strong>
                                                                                            <a href="${STUDIO_PROFILE_URL}${resultRow.handle}">
                                                                                                ${resultRow.handle}
                                                                                            </a>
                                                                                        </strong>
                                                                                    </td>
                                                                                    <td class="first last alignText">
                                                                                        <a href="${COMPLETE_CONTESTS_DETAILS_URL}${resultRow.userId}">
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
                                                                                    <td class="first last alignText">
                                                                                        <c:choose>
                                                                                            <c:when test="${resultRow.rank <= TOP_ONSITE_RANK}">
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
                                                                                    <td class="first last alignText">
                                                                                        <a href="${INCOMPLETE_CONTESTS_DETAILS_URL}${resultRow.userId}">
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
                                                                                    <td class="last">&nbsp;</td>
                                                                                </tr>
                                                                            </c:forEach>
                                                                        </table>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div><!-- End #mainContentInner -->
                                                    </div><!-- End #mainContent -->

                                                    <jsp:include page="../../sponsors.jsp"/>
                                                </div><!-- End .bottomAreaContent -->
                                            </div>
                                        </div>
                                    </div><!-- End .bottomArea -->
                                </div><!-- End #contentInnerInner -->
                            </div><!-- End #contentInner -->

                            <div class="contentBottomLeft">
                                <div class="contentBottomRight">
                                    <div class="contentTopInner">
                                    </div>
                                </div>
                            </div>
                        </div><!-- End #content -->
                    </div><!-- End #wrapperContentInner -->
                </div>
            </div><!-- End #wrapperInner -->
        </div><!-- End #wrapper -->

        <jsp:include page="../../footer.jsp"/>
    </body>
</html>
