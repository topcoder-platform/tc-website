<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the leaderboard details for single competitor for Studio track.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase" %>
<%@ page import="com.topcoder.web.tc.TCO10Constants" %>

<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Studio Competition Leaderboard" area="studio" menu="advancers" subMenu="leaderboard"/>

<c:set var="eventId" value="${param[EVENT_ID]}" />
<c:set var="userId" value="${param[USER_ID]}" />
<c:set var="complete" value="${param[COMPLETE_KEY] == 1}" />

<c:set var="handle" value="${requestScope.handle}"/>
<c:set var="result" value="${requestScope.result}"/>

<c:set var="CONTEST_NAME_COL" value="<%=StudioUserContestsBase.CONTEST_NAME_COL%>" />
<c:set var="START_DATE_COL" value="<%=StudioUserContestsBase.START_DATE_COL%>" />
<c:set var="END_DATE_COL" value="<%=StudioUserContestsBase.END_DATE_COL%>" />
<c:set var="REGISTRANTS_COL" value="<%=StudioUserContestsBase.REGISTRANTS_COL%>" />
<c:set var="SUBMISSIONS_COL" value="<%=StudioUserContestsBase.SUBMISSIONS_COL%>" />
<c:set var="PLACED_COL" value="<%=StudioUserContestsBase.PLACED_COL%>" />
<c:set var="POINTS_COL" value="<%=StudioUserContestsBase.POINTS_COL%>" />

<c:set var="STUDIO_SERVER_URL" value="<%="http://"+ApplicationServer.STUDIO_SERVER_NAME + "/"%>" />
<c:set var="MORE_CONTEST_DETAILS_URL"
    value="${STUDIO_SERVER_URL}?${MODULE_KEY}=${complete ? 'ViewContestResults' : 'ViewContestDetails'}&amp;${CONTEST_ID_KEY}=" />
<c:set var="DOWNLOAD_SUBMISSION_URL"
    value="${STUDIO_SERVER_URL}?${MODULE_KEY}=DownloadSubmission&amp;sbmid=" />
<c:set var="DATE_FORMAT_PATTERN" value="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" />
<c:set var="STUDIO_PROFILE_URL" value="${STUDIO_SERVER_URL}?module=ViewMemberProfile&ha=" />

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
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="StudioContests"/>
                            <tc-webtag:hiddenInput name="${EVENT_ID}" value="${eventId}"/>
                            <tc-webtag:hiddenInput name="${USER_ID}" value="${userId}"/>
                            <tc-webtag:hiddenInput name="${COMPLETE_KEY}" value="${complete}"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>

                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="${complete ? '10' : '7'}"><h3>
                                        <span>
                                            <a href="${STUDIO_PROFILE_URL}${handle}"><c:out value="${handle}"/></a>
                                        </span> &gt;
                                        ${complete ? "Completed" : "In Progress"}</h3>
                                    </td>
                                </tr>
                            </table>
                            <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th class="first"><span class="left"></span>&nbsp;</th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${CONTEST_NAME_COL}'/>">
                                            Contest</a>
                                    </th>
                                    <th nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${START_DATE_COL}'/>">
                                            Start Date</a>
                                    </th>
                                    <th nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${END_DATE_COL}'/>">
                                            End Date</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${REGISTRANTS_COL}'/>">
                                            Registrants</a>
                                    </th>
                                    <th>
                                        <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${SUBMISSIONS_COL}'/>">
                                            Sub.</a>
                                    </th>
                                    <c:if test="${complete}">
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${PLACED_COL}'/>">
                                                Placed</a>
                                        </th>
                                        <th>
                                            <a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column='${POINTS_COL}'/>">
                                                Points</a>
                                        </th>
                                        <th>&nbsp;</th>
                                    </c:if>
                                    <th class="last"><span class="right"></span></th>
                                </tr>
                                <c:forEach items="${result}" var="resultRow">
                                    <tr>
                                        <td class="first">&nbsp;</td>
                                        <td class="first last alignText">
                                            <a href="${MORE_CONTEST_DETAILS_URL}${resultRow.contestId}">
                                                ${resultRow.contestName}
                                            </a>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${resultRow.startDate}"
                                                pattern="${DATE_FORMAT_PATTERN}"/>
                                        </td>
                                        <td class="first last alignText">
                                            <fmt:formatDate value="${resultRow.endDate}"
                                                pattern="${DATE_FORMAT_PATTERN}"/>
                                        </td>
                                        <td class="first last alignText">
                                            ${resultRow.registrants}
                                        </td>
                                        <td class="first last alignText">
                                            ${resultRow.submissions}
                                        </td>
                                        <c:if test="${complete}">
                                            <td class="first last alignText">
                                                <c:choose>
                                                    <c:when test="${resultRow.points > 0}">
                                                        ${resultRow.placed}
                                                    </c:when>
                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="first last alignText">
                                                ${resultRow.points}
                                            </td>
                                            <td class="first last alignText">
                                                <c:choose>
                                                    <c:when test="${(not empty resultRow.submissionId) and (resultRow.submissionId > 0)}">
                                                        <a href="${DOWNLOAD_SUBMISSION_URL}${resultRow.submissionId}">
                                                            <img src="/i/tournament/tco10/magnify.png" alt="View submission" title="View submission" />
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        &nbsp;
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </c:if>
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
