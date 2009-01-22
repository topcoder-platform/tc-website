<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
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
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); %>
<% List lst = (List) request.getAttribute("results");%>
<%
    boolean isComplete = true;
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

                    <h2><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/> -
                    <a href="/tco08?module=ContestProjects&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">View
                    Components</a></h2>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><th colspan="6"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></th></tr>
                    <tr>
                        <th class="header">Handle</th>
                        <th class="headerC">Placement Points</th>
                        <th class="headerC">Complete Projects</th>
                        <th class="headerC" nowrap="nowrap">Projects<br />In Progess</th>
                        <th class="headerC">Projects Submitted</th>
                        <th class="headerC">Results</th>
                    </tr>
                </thead>
                
                    <%for (int i = 0; i < lst.size(); i++) { %>
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <% UserContestDetail result = (UserContestDetail) lst.get(i); %>
                        <td class="value" nowrap="nowrap">
                            <tc-webtag:handle context='<%=tab%>' coderId='<%=result.getUserID()%>' darkBG='true' />
                            <% if (result.getIncomplete() > 0) {
                                isComplete = false;%>*<% } %></td>
                        <td class="valueC"><%=result.getPoints()%>
                        </td>
                        <td class="valueC"><%=result.getComplete()%>
                        </td>
                        <td class="valueC"><%=result.getIncomplete()%>
                        </td>
                        <td class="valueC"><%=result.getSubmissionCount()%>
                        </td>
                        <td class="valueC">
                            <a href="/tco08?module=MemberResults&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;cr=<%=result.getUserID()%>">results</a>
                        </td>
                    </tr>
                    <% }%>

                </table>
                <br /><br />
                <%if (!isComplete) {%>
                * Contains results from projects still in progress, results subject to change
                <br /><br />
                <% } %>


    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>