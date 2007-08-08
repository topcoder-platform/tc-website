<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.ProjectDetail,
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

<% ResultSetContainer rscProject = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("project_details"); %>
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% List lst = (List) request.getAttribute("results");%>
<%
    boolean isComplete = false;
    if (rscProject.getIntItem(0, "complete_status") == 1) {
        isComplete = true;
    }
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
               <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>">
                   <rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/>
               </A>
               <%if (!isComplete) {%>*<%}%></span></h1>
                <% if (isComplete) { %>
                <A href="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" set="<%=rscProject%>"/>">contest
                    details</span></h1>
                <% } %>


                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><td class="title" colspan="5"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header" nowrap="nowrap">Competitor</td>
                        <td class="headerC" nowrap="nowrap">Submission Date</td>
                        <td class="headerC">Place</td>
                        <td class="headerC">Placement Points</td>
                        <td class="headerC">Score</td>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% ProjectDetail result = (ProjectDetail) lst.get(i); %>
                        <td class="value">
                            <tc-webtag:handle coderId='<%=result.getUserID()%>' context='<%=tab%>' darkBG='true' />
                        </td>
                        <td class="valueC" nowrap="nowrap"><tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                        </td>
                        <td class="valueC"><%=result.getPlaced()%>
                        </td>
                        <td class="valueC"><%=result.getPoints()%>
                        </td>
                        <td class="valueC"><%=result.getScore()%>
                        </td>
                    </tr>
                    <% }%>
                </table>
                <%if (!isComplete) {%>
                <br><br>
                * This project is still in progress, results subject to change
                <% } %>
                <br><br>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>