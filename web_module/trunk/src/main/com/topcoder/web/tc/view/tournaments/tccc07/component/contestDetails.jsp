<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
                 java.util.List,
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

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

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

            <div id="pageBody">

                    <h1><span><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/> -
                    <a href="/tc?module=TCCC07ContestProjects&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">View
                    Components</a></span></h1>

                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr><td class="title" colspan="6"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></td></tr>
                    <tr>
                        <td class="header">Handle</td>
                        <td class="headerC">Placement Points</td>
                        <td class="headerC">Complete Projects</td>
                        <td class="headerC" nowrap="nowrap">Projects<br>In Progess</td>
                        <td class="headerC">Projects Submitted</td>
                        <td class="headerC">Results</td>
                    </tr>
                </thead>
                </tbody>
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
                            <a href="/tc?module=TCCC07MemberResults&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<%=result.getUserID()%>">results</a>
                        </td>
                    </tr>
                    <% }%>
                    </tr>
                </tbody>
                </table>
                <br><br>
                <%if (!isComplete) {%>
                * Contains results from projects still in progress, results subject to change
                <br><br>
                <% } %>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>