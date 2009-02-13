<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("results"));%>

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

                            <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
                                <thead>
                                    <tr>
                                        <td class="title" colspan="5">
                                            <span class="coderText"><rsc:item name="handle" set="<%=rsc%>"/></span> &gt;
                                            In Progress
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            <A href="/tc?<%=Constants.MODULE_KEY%>=StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>" column="<%=rsc.getColumnIndex("contest_name")%>"/>">Contest</A>
                                        </td>
                                        <td class="headerC">
                                            <A href="/tc?<%=Constants.MODULE_KEY%>=StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("start_time")%>"/>">Start
                                                Date</A>
                                        </td>
                                        <td class="headerC">
                                            <A href="/tc?<%=Constants.MODULE_KEY%>=StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("end_time")%>"/>">End
                                                Date</A>
                                        </td>
                                        <td class="headerC">
                                            <A href="/tc?<%=Constants.MODULE_KEY%>=StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("registrants")%>"/>">Registrants</A>
                                        </td>
                                        <td class="headerC">
                                            <A href="/tc?<%=Constants.MODULE_KEY%>=StudioUserContests<tc-webtag:sort includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"  column="<%=rsc.getColumnIndex("submissions")%>"/>">Submissions</A>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%boolean even = false;%>
                                    <rsc:iterator list='<%=rsc%>' id="resultRow">
                                        <% if (!resultRow.getBooleanItem("completed")) { %>
                                        <tr class="<%=(even ? "dark" : "light")%>">
                                            <td class="value">
                                                <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                                    <rsc:item name="contest_name" row="<%=resultRow%>"/>
                                                </A>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="registrants" row="<%=resultRow%>"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="submissions" row="<%=resultRow%>"/>
                                            </td>
                                        </tr>
                                        <%even = !even;%>
                                        <% } %>
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
