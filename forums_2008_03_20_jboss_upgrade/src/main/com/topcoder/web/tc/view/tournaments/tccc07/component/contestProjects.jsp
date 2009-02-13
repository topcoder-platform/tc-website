<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
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


            <div id="pageBody">

                    <h1><span><a href="/tc?module=TCCC07ContestDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />">
                      <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
                  </a> -
                  Components</span></h1>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><td class="title" colspan="3"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header">Component</td>
                        <td class="headerC">Start Date</td>
                        <td class="headerC">End Date</td>
                    </tr>
                </thead>
                </tbody>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="value" nowrap="nowrap">
                                <% if (resultRow.getIntItem("viewable") == 1) { %>
                                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>">
                                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                                </A>
                                <% } else { %>
                                <rsc:item name="component_name" row="<%=resultRow%>"/>
                                <% } %>
                                <% if (resultRow.getIntItem("is_complete") == 0) {
                                    isComplete = false;%>
                                *
                                <% } %>
                                | 
                                <A href="/tc?module=TCCC07ProjectDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">results</A>
                                <% if (isComplete) { %>
                                |
                                <A href="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">contest
                                    details</A>
                                <% } %>
                            </td>
                            <td class="valueC" nowrap="nowrap">
                                <rsc:item name="start_date" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueC" nowrap="nowrap">
                                <rsc:item name="end_date" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" row="<%=resultRow%>"/>
                            </td>
                        </tr>
                    <%even=!even;%>
                    </rsc:iterator>
                </tbody>
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