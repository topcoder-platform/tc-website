<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
</head>

<body>

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_projects"); %>

<!-- Tab barlinks-->
<%
    if (rscContest.getIntItem(0, "phase_id") == 112) {
%>
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="design"/>
    <jsp:param name="tabLev3" value="results"/>
</jsp:include>
<%
} else {
%>
<jsp:include page="links.jsp">
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
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <!-- Body-->
    <tr valign=top>
        <td valign=top align=center>
            <div class="bodySpacer">
                <br/>
                  <span class="bigTitle"><a href="/tc?module=TCCC06ContestDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />">
                      <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></a> -
                  Components</span>
                <br><br>

                <table width="510" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle" nowrap="nowrap">Component</td>
                        <td class="sidebarTitle" align="center">Start Date</td>
                        <td class="sidebarTitle" align="center">End Date</td>
                        <td class="sidebarTitle" align="right" nowrap="nowrap">1st Place<br>Prize</td>
                        <td class="sidebarTitle" align="right" nowrap="nowrap">2nd Place<br>Prize</td>
                    </tr>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr>
                            <td class="sidebarText" nowrap="nowrap">
                                <% if (resultRow.getIntItem("viewable") == 1) { %>
                                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>">
                                    <rsc:item name="component_name" row="<%=resultRow%>"/></A>
                                <% } else { %>
                                <rsc:item name="component_name" row="<%=resultRow%>"/>
                                <% } %>
                                <% if (resultRow.getIntItem("is_complete") == 0) {
                                    isComplete = false;%>
                                *
                                <% } %>

                                <br>
                                <A href="/tc?module=TCCC06ProjectDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">results</A>
                                <% if (isComplete) { %>
                                |
                                <A href="/tc?module=ProjectDetail&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>&tab=results">contest
                                    details</A>
                                <% } %>
                            </td>
                            <td class="sidebarText" align=center nowrap=nowrap>
                                <rsc:item name="start_date" format="MM.dd.yyyy HH:mm z" row="<%=resultRow%>"/></td>
                            <td class="sidebarText" align=center nowrap=nowrap>
                                <rsc:item name="end_date" format="MM.dd.yyyy HH:mm z" row="<%=resultRow%>"/></td>
                            <td class="sidebarText" align=right>$
                                <rsc:item name="first_prize" format="#,##0" row="<%=resultRow%>"/></td>
                            <td class="sidebarText" align=right>$
                                <rsc:item name="second_prize" format="#,##0" row="<%=resultRow%>"/></td>
                        </tr>
                    </rsc:iterator>
                </table>
                <br><br>
                <%if (!isComplete) {%>
                * This project is still in progress, results subject to change
                <br><br>
                <% } %>

            </div>
        </td>


        <!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>

</body>

</html>
