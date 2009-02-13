<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
                 java.util.List,
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
    <tr valign=top>
        <td valign=top align="center">
            <div class="bodySpacer">
                <br/>
                  <span class="bigTitle"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/> -
                  <a href="/tc?module=TCCC06ContestProjects&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">View
                      Components</a></span>
                <br><br>
                <table width="510" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle">Handle</td>
                        <td class="sidebarTitle" align="center">Position Points</td>
                        <td class="sidebarTitle" align="center">Complete Projects</td>
                        <td class="sidebarTitle" align="center" nowrap="nowrap">Projects<br>In Progess</td>
                        <td class="sidebarTitle" align="center">Projects Submitted</td>
                        <td class="sidebarTitle" align="center">Contest Prize</td>
                        <td class="sidebarTitle" align="center">Results</td>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %><tr>
                    <% UserContestDetail result = (UserContestDetail) lst.get(i); %>
                    <td class="sidebarText" nowrap="nowrap">
                        <tc-webtag:handle context='<%=tab%>' coderId='<%=result.getUserID()%>' darkBG='true'/>
                        <% if (result.getIncomplete() > 0) {
                            isComplete = false;%>*<% } %></td>
                    <td class="sidebarText" align="center"><%=result.getPoints()%></td>
                    <td class="sidebarText" align="center"><%=result.getComplete()%></td>
                    <td class="sidebarText" align="center"><%=result.getIncomplete()%></td>
                    <td class="sidebarText" align="center"><%=result.getSubmissionCount()%></td>
                    <td class="sidebarText" align="right"><%=result.getPayment()%></td>
                    <td class="sidebarText" align="center">
                        <a href="/tc?module=TCCC06MemberResults&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<%=result.getUserID()%>">results</a>
                    </td>
                </tr><% }%>
                </table>
                <br><br>
                <%if (!isComplete) {%>
                * Contains results from projects still in progress, results subject to change
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
