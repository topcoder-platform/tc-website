<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("results"));%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
</head>
<body>

<div align="center" style="background: transparent;">
<div id="content">

<jsp:include page="../header.jsp"/>

<table cellpadding="0" cellspacing="0" id="spacer">
<tbody>
<tr>
<td id="navSpacer">

    <jsp:include page="../nav.jsp">
        <jsp:param name="tabLev1" value="studio"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="leaderboard"/>
    </jsp:include>

</td>
<td id="bodySpacer" width="100%">
    <div id="pageBody">

        <h1><span>Studio Leaderboard</span></h1>

        <p><strong>NOTE:</strong> this ranking does not consider the
            <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=rules#scoring">tiebreaker
                rules</A>.</p>

        <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
            <thead>
                <tr>
                    <td class="title" colspan="7">
                        Studio Leaderboard
                    </td>
                </tr>
                <tr>
                    <td class="headerC" rowspan="2" width="1%">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("rank")%>"/>">Rank</A>
                    </td>
                    <td class="header" rowspan="2">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</A>
                    </td>
                    <td class="headerC" colspan="2" nowrap="nowrap" style="border-right: 1px solid #999999;">
                        Completed
                    </td>
                    <td class="headerC" colspan="2" nowrap="nowrap">
                        In Progress
                    </td>
                    <td class="headerC" rowspan="2" nowrap="nowrap">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("total_potential_points")%>"/>">Potential
                            Total<br>Points</A>
                    </td>
                </tr>
                <tr>
                    <td class="headerC">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("completed_contests")%>"/>">Contests</A>
                    </td>
                    <td class="headerC" style="border-right: 1px solid #999999;">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("points")%>"/>">Points</A>
                    </td>
                    <td class="headerC">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("current_contests")%>"/>">Contests</A>
                    </td>
                    <td class="headerC">
                        <A href="/tc?<%=Constants.MODULE_KEY%>=StudioLeaderboard<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("potential_points")%>"/>">Points</A>
                    </td>
                </tr>
            </thead>
            <tbody>
                <c:set value="<%=Constants.EVENT_ID%>" var="eventId"/>
                <c:set value="<%=Constants.USER_ID%>" var="userId"/>
                <c:set value="<%=Constants.MODULE_KEY%>" var="module"/>
                <%int i = 0;%>
                <rsc:iterator list='<%=rsc%>' id="resultRow">
                    <tr class="<%=(i%2==0 ? "dark" : "light")%>">
                        <td class="valueC">
                            <span class="<%= resultRow.getIntItem("rank")<=8? "bigGreen" : "bigRed"%>"><rsc:item name="rank" row="<%=resultRow%>"/></span>
                        </td>
                        <td class="value">
                            <strong>
                                <rsc:item name="handle" row="<%=resultRow%>"/>
                            </strong>
                        </td>
                        <td class="valueC">
                            <a href="tc?${module}=StudioUserContests&amp;${eventId}=${param[eventId]}&amp;${userId}=<rsc:item name="user_id" row="<%=resultRow%>"/>&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=completedContests">
                                <rsc:item name="completed_contests" row="<%=resultRow%>" ifNull="&nbsp;"/>
                            </A>
                        </td>
                        <td class="valueC" style="border-right: 1px solid #999999;">
                            <span class="<%=(resultRow.getIntItem("rank")<=8 ? "bigGreen" : "bigRed")%>"><rsc:item name="points" row="<%=resultRow%>" ifNull="&nbsp;"/></span>
                        </td>
                        <td class="valueC">
                            <a href="tc?${module}=StudioUserContests&amp;${eventId}=${param[eventId]}&amp;${userId}=<rsc:item name="user_id" row="<%=resultRow%>"/>&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=currentContests">
                                <rsc:item name="current_contests" row="<%=resultRow%>" ifNull="&nbsp;"/>
                            </A>
                        </td>
                        <td class="valueC">
                            <rsc:item name="potential_points" row="<%=resultRow%>" format="#" ifNull="&nbsp;"/>
                        </td>
                        <td class="valueC">
                            <rsc:item name="total_potential_points" row="<%=resultRow%>" format="#" ifNull="&nbsp;"/>
                        </td>
                    </tr>

                    <%i++;%>
                </rsc:iterator>


            </tbody>
        </table>


    </div>
</td>
</tr>
</table>


<jsp:include page="../footer.jsp"/>
</div>
</div>

</body>

</html>
