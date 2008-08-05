<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.UserContestResult,
                 java.util.List,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body>

<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rscUser = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("user_details"); %>

<% List lst = (List) request.getAttribute("results");%>
<%
    boolean isComplete = true;
%>
<%
    String tab = "design";
    if (rscContest.getIntItem(0, "phase_id") == 112) {
%>
        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="design"/>
        <jsp:param name="tabLev3" value="results"/>
        </jsp:include>
<%
} else {
    tab = "development";
%>
        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="development"/>
        <jsp:param name="tabLev3" value="results"/>
        </jsp:include>
<%
    }
%>

            <div id="pageBody">

                    <h1><span><A href="/tc?module=TCCC07ContestDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">
                    <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
                </A> -
                <tc-webtag:handle context='<%=tab%>' coderId='<%=rscUser.getIntItem(0, "coder_id")%>' darkBG='true' /></span></h1>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><td class="title" colspan="5"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header" nowrap="nowrap">Component Name</td>
                        <td class="headerC">Submit Date</td>
                        <td class="headerC">Points</td>
                        <td class="headerC">Placed</td>
                        <td class="headerC">Placement Points</td>
                    </tr>
                </thead>
                </tbody>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% UserContestResult result = (UserContestResult) lst.get(i); %>
                        <td class="value" nowrap="nowrap">
                            <% if (result.isViewable()) { %>
                            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=result.getCompID()%>"><%=
                                result.getComponent()%>
                            </A>
                            <% } else { %>
                            <%=result.getComponent()%>
                            <% }%>
                            <% if (!result.isComplete()) {
                                isComplete = false;%>
                            *
                            <% } %>
                            <% if (isComplete) { %>
                            | <A href="/tc?module=CompContestDetails&pj=<%=result.getProjectId()%>">contest details</A>
                            <% } %>

                        </td>
                        <td class="valueC" nowrap=nowrap>
                            <tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                        </td>
                        <td class="valueC"><%=result.getScore()%>
                        </td>
                        <td class="valueC"><%=result.getPlaced()%>
                        </td>
                        <td class="valueC"><%=result.getPoints()%>
                        </td>
                    </tr>
                    <% } %>
                </table>
                <br><br>
                <%if (!isComplete) {%>
                * This project is still in progress, results subject to change
                <br><br>
                <% } %>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>