<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
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

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_projects"); %>

<!-- Tab barlinks-->
<%
    if (rscContest.getIntItem(0, "phase_id") == 112) {
%>
        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="design"/>
        <jsp:param name="tabLev3" value="results"/>
        </jsp:include>
<%
} else {
%>
        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="development"/>
        <jsp:param name="tabLev3" value="results"/>
        </jsp:include>
<%
    }
%>
<%
    boolean isComplete = true;
%>


                  <h2><a href="/tco08?module=ContestDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />">
                      <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
                  </a> -
                  Components</h2>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><th colspan="3"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></th></tr>
                    <tr>
                        <th class="header">Component</th>
                        <th class="headerC">Start Date</th>
                        <th class="headerC">End Date</th>
                    </tr>
                </thead>
                
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="value" nowrap="nowrap">
                                <% if (resultRow.getIntItem("viewable") == 1) { %>
                                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>">
                                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                                </a>
                                <% } else { %>
                                <rsc:item name="component_name" row="<%=resultRow%>"/>
                                <% } %>
                                <% if (resultRow.getIntItem("is_complete") == 0) {
                                    isComplete = false;%>
                                *
                                <% } %>
                                | 
                                <a href="/tco08?module=ProjectDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">results</a>
                                <% if (isComplete) { %>
                                |
                                <a href="/tc?module=CompContestDetails&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">contest
                                    details</a>
                                <% } %>
                            </td>
                            <td class="valueC" nowrap="nowrap">
                                <rsc:item name="start_date" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC" nowrap="nowrap">
                                <rsc:item name="end_date" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" row="<%=resultRow%>"/>
                            </td>
                        </tr>
                    <%even=!even;%>
                    </rsc:iterator>
                
                </table>
                <br /><br />
                <%if (!isComplete) {%>
                * This project is still in progress, results subject to change
                <br /><br />
                <% } %>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>