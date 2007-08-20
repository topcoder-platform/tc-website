<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.UserContestResult,
                 java.util.List,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2005 TopCoder Open - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
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
    <tr valign=top>
        <td valign=top align=center>
            <div class=bodySpacer>
                <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                    <tr>
                        <td class="usdcTitle" colspan=5 align=left>
                            <%String module = rscContest.getIntItem(0, "contest_type_id") == 8 ? "TCO05ContestDetails" : "TCO05ContestDetailsOverall";%>
                            <A href="/tc?module=<%=module%>&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>" class=usdcTitle>
                                <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></A> -
                            <tc-webtag:handle context='<%=tab%>' coderId='<%=rscUser.getIntItem(0, "coder_id")%>'/>
                        </td>
                    </tr>
                </table>
                <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle" nowrap=nowrap>Component Name</td>
                        <td class="sidebarTitle" align=center>Submit Date</td>
                        <td class="sidebarTitle" align=center>Points</td>
                        <td class="sidebarTitle" align=right>Component Prize</td>
                        <td class="sidebarTitle" align=center>Placed</td>
                        <td class="sidebarTitle" align=center>Placement Points</td>
                    </tr>
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr>
                        <% UserContestResult result = (UserContestResult) lst.get(i); %>
                        <td class="sidebarText">
                            <% if (result.isViewable()) { %>
                            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=result.getCompID()%>"><%=result.getComponent()%></A>
                            <% } else { %>
                            <%=result.getComponent()%>
                            <% }%>
                            <% if (!result.isComplete()) {
                                isComplete = false;%>
                            *
                            <% } %>
                        </td>
                        <td class="sidebarText" align=center nowrap=nowrap>
                            <tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="MM.dd.yyyy HH:mm z"/></td>
                        <td class="sidebarText" align=center><%=result.getScore()%></td>
                        <td class="sidebarText" align=right><%=result.getPayment()%></td>
                        <td class="sidebarText" align=center><%=result.getPlaced()%></td>
                        <td class="sidebarText" align=center><%=result.getPoints()%></td>
                    </tr>
                    <% } %>
                </table>
                <%if (!isComplete) {%>
                <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                    <tr>
                        <td class="bodyText">* This project is still in progress, results subject to change</td>
                    </tr>
                </table>
                <% } %>
                <br/>

            </div>
        </td>


        <!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="tco05"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>

</body>

</html>
