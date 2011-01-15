<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.StudioUserContestsBase" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
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
                                            <span class="coderText"> ${handle}</span> &gt;
                                            In Progress
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                        <A href="/tc?<%=Constants.MODULE_KEY%>=TCCC07StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.CONTEST_NAME_COL%>"/>">Contest</A>
                                    </td>
                                    <td class="headerC">
                                        <A href="/tc?<%=Constants.MODULE_KEY%>=TCCC07StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.START_DATE_COL%>"/>">Start
                                            Date</A>
                                    </td>
                                    <td class="headerC">
                                        <A href="/tc?<%=Constants.MODULE_KEY%>=TCCC07StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.END_DATE_COL%>"/>">End
                                            Date</A>
                                    </td>
                                    <td class="headerC">
                                        <A href="/tc?<%=Constants.MODULE_KEY%>=TCCC07StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.REGISTRANTS_COL%>"/>">Registrants</A>
                                    </td>
                                    <td class="headerC">
                                        <A href="/tc?<%=Constants.MODULE_KEY%>=TCCC07StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=StudioUserContestsBase.SUBMISSIONS_COL%>"/>">Submissions</A>
                                    </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%boolean even = false;%>
                                <c:forEach items="${result}" var="resultRow">
                                    <tr class="<%=(even ? "dark" : "light")%>">
                                        <td class="value">
                                            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;ct=${resultRow.contestId}">
                                                ${resultRow.contestName}
                                            </A>
                                        </td>
                                        <td class="valueC">
                                            <fmt:formatDate value="${resultRow.startDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                                        </td>
                                        <td class="valueC">
                                            <fmt:formatDate value="${resultRow.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
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


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>