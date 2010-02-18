<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.aolicq.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="aolicq.tld" prefix="aolicq" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ribbit - $100,000 Killer App Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq"/>
    </jsp:include>
    
</head>

<body>

<%--
    <!-- wrapper -->
    <div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<h1>Past Contests</h1>

<div align="right"><strong>Need help? Learn how to
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get
        started</a>.<br />
    Got <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=generalFaq">questions</a>?</strong>
</div>

<div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
<div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
<br  clear="all"/>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
<table class="stat" cellpadding="0" cellspacing="0">
    <tbody>
        <tr><td class="title" colspan="11">Past Contests</td></tr>
        <tr>
            <td class="headerW"><div>&nbsp;</div></td>
            <td class="header" width="100%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                    Date</a></td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                    Date</a></td>
            <td class="headerR" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">First Prize</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("passing_submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Passed Screening</a>
            </td>
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
            <tr><td class="space" colspan="11">&nbsp;</td></tr>
            <tr class="<%=even?"light":"dark"%>">
                <td class="valueW">
                    <div>&nbsp;</div>
                </td>
                <td class="value">
                    <strong><a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                        <rsc:item name="name" row="<%=resultRow%>"/>
                    </a></strong>

                    <div style="margin: 6px 10px;">
                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">contest
                            details</a>
                        <c:if test="${resultRow.map['forum_id']!=null}">| <aolicq:forumLink forumID="${resultRow.map['forum_id']}" message="discuss"/></c:if>
                        <% if (resultRow.getBooleanItem("results_available")) { %>
                        |
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                        <% } %>
                    </div>
                </td>
                <td class="valueC">
                    <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueC">
                    <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueR">
                    <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                </td>
                <td class="valueC">
                    <rsc:item name="registrants" row="<%=resultRow%>"/>
                </td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("show_submissions")%>">
                            <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="submission_count" row="<%=resultRow%>"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <rsc:item name="submission_count" row="<%=resultRow%>"/>
                        </c:otherwise>
                    </c:choose>

                </td>
                <td class="valueC">
                    <rsc:item name="passing_submission_count" row="<%=resultRow%>"/>
                </td>
                <td class="valueE">
                    <div>&nbsp;</div>
                </td>
            </tr>
            <% even = !even; i++; %>
        </rsc:iterator>
    </tbody>
</table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>

<div align="right" style="padding-top: 10px;"><strong>Would you like to see some of our <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=archive">older logo design contests</a>?</strong></div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="tcFoot.jsp"/>

    </div>
--%>
</body>
</html>