<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.ProjectDetail,
                 java.util.List,
                 java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../../script.jsp" />
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>

<body id="page_sub">

<div id="wrapper">

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


                    <h2><a href="/tco08?module=ContestDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">
                   <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
               </a> -
               <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>">
                   <rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/>
               </a>
               <%if (!isComplete) {%>*<%}%></h2><br />
                <% if (isComplete) { %>
                <a href="/tc?module=CompContestDetails&amp;pj=<rsc:item name="project_id" set="<%=rscProject%>"/>">contest details</a>
                <% } %>


                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                
                    <tr><th colspan="5"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></th></tr>
                    <tr>
                        <th class="header" nowrap="nowrap">Competitor</th>
                        <th class="headerC" nowrap="nowrap">Submission Date</th>
                        <th class="headerC">Place</th>
                        <th class="headerC">Placement Points</th>
                        <th class="headerC">Score</th>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% ProjectDetail result = (ProjectDetail) lst.get(i); %>
                        <td class="value">
                            <tc-webtag:handle coderId='<%=result.getUserID()%>' context='<%=tab%>' darkBG='true' />
                        </td>
                        <td class="valueC" nowrap="nowrap"><tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
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
                <br /><br />
                * This project is still in progress, results subject to change
                <% } %>
                <br /><br />


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>