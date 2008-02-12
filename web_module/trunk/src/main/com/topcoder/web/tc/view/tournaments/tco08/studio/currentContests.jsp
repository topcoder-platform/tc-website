<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase" %>
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
                                            <span class="coderText"> ${handle}</span> &gt;
                                            In Progress
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>
                                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.CONTEST_NAME_COL%>"/>">Contest</a>
                                    </th>
                                    <th>
                                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.START_DATE_COL%>"/>">Start
                                            Date</a>
                                    </th>
                                    <th>
                                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.END_DATE_COL%>"/>">End
                                            Date</a>
                                    </th>
                                    <th>
                                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.REGISTRANTS_COL%>"/>">Registrants</a>
                                    </th>
                                    <th>
                                        <a href="/tco08?<%=Constants.MODULE_KEY%>=StudioContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.SUBMISSIONS_COL%>"/>">Submissions</a>
                                    </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%boolean even = false;%>
                                <c:forEach items="${result}" var="resultRow">
                                    <tr class="<%=(even ? "dark" : "light")%>">
                                        <td class="value">
                                            <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;ct=${resultRow.contestId}">
                                                ${resultRow.contestName}
                                            </a>
                                        </td>
                                        <td class="valueC">
                                            <fmt:formatDate value="${resultRow.startDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="valueC">
                                            <fmt:formatDate value="${resultRow.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                                        </td>
                                        <td class="valueC">
                                            ${resultRow.registrants}
                                        </td>
                                        <td class="valueC">
                                            ${resultRow.submissions}
                                        </td>
                                    </tr>
                                <%even = !even;%>
                                </c:forEach>
                                </tbody>
                            </table>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>