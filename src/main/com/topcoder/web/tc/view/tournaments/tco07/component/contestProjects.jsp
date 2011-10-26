<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
</head>

<body>


<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_projects"); %>

<!-- Tab barlinks-->
<%
    if (rscContest.getIntItem(0, "phase_id") == 112) {
%>
                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="design"/>
                    <jsp:param name="tabLev3" value="results"/>
                    </jsp:include>
<%
} else {
%>
                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="development"/>
                    <jsp:param name="tabLev3" value="results"/>
                    </jsp:include>
<%
    }
%>
<%
    boolean isComplete = true;
%>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                    <h1><span><a href="/tc?module=TCO07ContestDetails&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />">
                      <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
                  </a> -
                  Components</span></h1>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><td class="title" colspan="5"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header">Component</td>
                        <td class="headerC">Start Date</td>
                        <td class="headerC">End Date</td>
                        <td class="headerC" nowrap="nowrap" width="1%">1st Place<br>Prize</td>
                        <td class="headerC" nowrap="nowrap" width="1%">2nd Place<br>Prize</td>
                    </tr>
                </thead>
                </tbody>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr class="<%=even?"light":"dark"%>">
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
                                <A href="/tc?module=TCO07ProjectDetails&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">results</A>
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
                            <td class="valueR">$
                                <rsc:item name="first_prize" format="#,##0" row="<%=resultRow%>"/>
                            </td>
                            <td class="valueR">$
                                <rsc:item name="second_prize" format="#,##0" row="<%=resultRow%>"/>
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
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
