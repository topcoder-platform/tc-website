<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_old"/>
    </jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="past_contests"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <div class="breadcrumb">
            Passed Contests
        </div>

        <h1>Passed Contests</h1>


        <h2 align="right">Need help? Learn how to <strong><A href="">get started</A></strong></h2>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                <tbody>
                    <tr>
                        <td class="title" colspan="4">Passed Contests</td>
                    </tr>
                    <tr>

                        <td class="header" colspan="1">
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
                        </td>
                        <td class="headerC">
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                                Date</a></td>
                        <td class="headerC">
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                                Date</a></td>
                    </tr>
                    <% boolean even = true;%>
                    <rsc:iterator list="<%=contests%>" id="resultRow">
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="value">
                                <A href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                    <rsc:item name="name" row="<%=resultRow%>"/></A></td>
                            <td class="valueC">
                                <rsc:item name="start_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                            <td class="valueC">
                                <rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/></td>
                        </tr>
                        <% even = !even;%>
                    </rsc:iterator>
                </tbody>
            </table>
        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
