<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="top.jsp"/>

<jsp:include page="primaryNav.jsp">
    <jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Past Creative Competitions</span>
</div>

<div class="breadcrumb">
    <div style="float:left;"><A href="/?module=Static&amp;d1=competitions">Competitions</A> >&nbsp;</div>
    <div style="float:left; margin-bottom: 10px;">
    <A href="/?module=ViewActiveContests">Active Creative Competitions</A><br>
    <strong>Past Creative Competitions</strong>
    </div>
</div>

<br style="clear: both;" />

<table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
    <tbody>
        <tr>
            <td class="title" colspan="7"><span class="title">Past Creative Competitions</span></td>
        </tr>
        <tr>
            <td class="header" width="100%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
            </td>
            <td class="header" colspan="2">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Winner</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
            </td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Prize</a>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                    Date</a></td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                    Date</a></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
            <tr class="<%=even?"light":"dark"%>">
                <td class="value">
                    <A href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                        <rsc:item name="name" row="<%=resultRow%>"/>
                    </A></td>
                <td class="value" style="border-right: none;" nowrap="nowrap">
                    <% if (resultRow.getItem("winner_id").getResultData() != null) { %>
                    <csf:handle coderId="<%=resultRow.getLongItem("winner_id")%>"/>
                    <% } else {%>
                    &#160;
                    <% } %>
                </td>
                <td class="valueC" style="border-left: none;">
                    <c:choose>
                        <c:when test="<%=resultRow.getItem("winning_submission_id").getResultData() != null%>">
<%--
                            <div id="pop<%=i%>" class="popUp">
                                <div>Download submission</div>
                            </div>
                            <A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="winning_submission_id" row="<%=resultRow%>"/>">
                                <img src="/i/layout/disk.gif" alt="" onMouseOver="popUp(this,'pop<%=i%>')" onMouseOut="popHide()"/>
                            </A>
--%>
                        </c:when>
                        <c:otherwise>
                            &#160;
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueC">
                    <rsc:item name="registrants" row="<%=resultRow%>"/>
                </td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("show_submissions")%>">
                            <A href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="submission_count" row="<%=resultRow%>"/>
                            </A>
                        </c:when>
                        <c:otherwise>
                            <rsc:item name="submission_count" row="<%=resultRow%>"/>
                        </c:otherwise>
                    </c:choose>

                </td>
                <td class="valueR">
                    <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
                </td>
                <td class="valueC">
                    <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueC">
                    <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
            <% even = !even;
                i++; %>
        </rsc:iterator>
    </tbody>
</table>

</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>