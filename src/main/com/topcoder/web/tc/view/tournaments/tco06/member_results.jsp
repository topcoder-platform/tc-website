<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.UserContestResult,
                 java.util.List,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Open - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
</head>

<body>

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
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="design"/>
    <jsp:param name="tabLev3" value="results"/>
</jsp:include>
<%
} else {
    tab = "development";
%>
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="component"/>
    <jsp:param name="tabLev2" value="development"/>
    <jsp:param name="tabLev3" value="results"/>
</jsp:include>
<%
    }
%>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <!-- Body-->
    <tr>
        <td valign="top" align="center">
            <div class="bodySpacer">
                <br>
                <span class="bigTitle"><A href="/tc?module=TCO06ContestDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>" class=usdcTitle>
                    <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></A> -
                <tc-webtag:handle context='<%=tab%>' coderId='<%=rscUser.getIntItem(0, "coder_id")%>' darkBG='true'/></span>
                <br><br>
                <table width="510" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle" nowrap="nowrap">Component Name</td>
                        <td class="sidebarTitle" align="center">Submit Date</td>
                        <td class="sidebarTitle" align="center">Points</td>
                        <td class="sidebarTitle" align="center">Component Prize</td>
                        <td class="sidebarTitle" align="center">Placed</td>
                        <td class="sidebarTitle" align="center">Placement Points</td>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr>
                        <% UserContestResult result = (UserContestResult) lst.get(i); %>
                        <td class="sidebarText" nowrap="nowrap">
                            <% if (result.isViewable()) { %>
                            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=result.getCompID()%>"><%=result.getComponent()%></A>
                            <% } else { %>
                            <%=result.getComponent()%>
                            <% }%>
                            <% if (!result.isComplete()) {
                                isComplete = false;%>
                            *
                            <% } %>
                            <br>
                            <% if (isComplete) { %>
                            <A href="/tc?module=CompContestDetails&pj=<%=result.getProjectId()%>">contest details</A>
                            <% } %>

                        </td>
                        <td class="sidebarText" align=center nowrap=nowrap>
                            <tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="MM.dd.yyyy HH:mm z"/></td>
                        <td class="sidebarText" align="center"><%=result.getScore()%></td>
                        <td class="sidebarText" align=right><%=result.getPayment()%></td>
                        <td class="sidebarText" align="center"><%=result.getPlaced()%></td>
                        <td class="sidebarText" align="center"><%=result.getPoints()%></td>
                    </tr>
                    <% } %>
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