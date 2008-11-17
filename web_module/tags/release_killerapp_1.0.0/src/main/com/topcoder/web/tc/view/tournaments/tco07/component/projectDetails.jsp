<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.ProjectDetail,
                 java.util.List,
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
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="design"/>
                    <jsp:param name="tabLev3" value="results"/>
                    </jsp:include>
<%
} else {
    tab = "development";
%>
                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="development"/>
                    <jsp:param name="tabLev3" value="results"/>
                    </jsp:include>
<%
    }
%>
                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                    <h1><span><A href="/tc?module=TCO07ContestDetails&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">
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
                    <tr><td class="title" colspan="6"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header" nowrap="nowrap">Competitor</td>
                        <td class="headerC" nowrap="nowrap">Submission Date</td>
                        <td class="headerC">Place</td>
                        <td class="headerC">Placement Points</td>
                        <td class="headerC">Score</td>
                        <td class="header" align=right>Prizes</td>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% ProjectDetail result = (ProjectDetail) lst.get(i); %>
                        <td class="value">
                            <tc-webtag:handle coderId='<%=result.getUserID()%>' context='<%=tab%>'/>
                        </td>
                        <td class="valueC" nowrap="nowrap"><tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                        </td>
                        <td class="valueC"><%=result.getPlaced()%>
                        </td>
                        <td class="valueC"><%=result.getPoints()%>
                        </td>
                        <td class="valueC"><%=result.getScore()%>
                        </td>
                        <td class="value" align=right><%=result.getPayment()%>
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
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
