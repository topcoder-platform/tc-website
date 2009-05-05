<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Winformula Developer Challenge :: Powered by TopCoder</title>
<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_winformula"/>
</jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../tcTop.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Contests</h1>

                <div align="right" style="margin-bottom: 10px;"><a href="${sessionInfo.servletPath}?module=ViewContest"><img src="/i/v2/interface/btnAddContest.png" alt="Add contest" /></a></div>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr><td class="title" colspan="8">Contests</td></tr>
                        <tr>
                            <td class="headerW"><div>&nbsp;</div></td>
                            <td class="header" width="100%">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Name</a>
                            </td>
                            <td class="header"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("contest_status_desc")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Status</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a></td>
                            <td class="headerC">&nbsp;</td>
                            <td class="headerE"><div>&nbsp;</div></td>
                        </tr>
                        <% boolean even = true;%>
                        <rsc:iterator list="<%=contests%>" id="resultRow">
                            <tr><td class="space" colspan="8">&nbsp;</td></tr>
                            <tr class="<%=even?"light":"dark"%>">
                                <td class="valueW"><div>&nbsp;</div></td>
                                <td class="value"><a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['name']}</a></td>
                                <td class="value" nowrap="nowrap">${resultRow.map['contest_status_desc']}</td>
                                <td class="valueC" nowrap="nowrap">
                                    <tc-webtag:format object="${resultRow.map['start_time']}" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC" nowrap="nowrap">
                                    <tc-webtag:format object="${resultRow.map['end_time']}" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['submission_count']}</a>
                                </td>
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?module=ViewContest&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">edit</a>
                                </td>
                                <td class="valueE"><div>&nbsp;</div></td>
                            </tr>
                            <% even = !even;%>
                        </rsc:iterator>
                    </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../tcFoot.jsp"/>

    </div>
</body>
</html>