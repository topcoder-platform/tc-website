<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
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
    <span class="pageName">Active Competitions</span>
</div>

<%--
    <div align="right" style="float:right;"><strong>Need help? Learn how to
        <A href="/?module=Static&amp;d1=support&amp;d2=getStarted">get
            started</A>.<br>
        Got <A href="/?module=Static&amp;d1=support&amp;d2=generalFaq">questions</A>?</strong>
    </div>
--%>

<div class="breadcrumb">
    <A href="/?module=Static&amp;d1=competitions">Competitions</A>
    > Active Creative Competitions
</div>

<table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
    <thead>
        <tr>
            <td class="title" colspan="7"><span class="title">Competitions</span></td>
        </tr>
        <tr>
            <td class="header" width="100%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start
                    Date</a></td>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End
                    Date</a></td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("amount")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Payment</a>
            </td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
            </td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
            </td>
            <td class="header">&nbsp;</td>
        </tr>
        <c:choose>
            <c:when test="${fn:length(contests)==0}">
                <tr class="light">
                    <td class="valueC" colspan="7">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no active contests, but check back soon.
                        </div>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>

                <% boolean even = true;%>
                <rsc:iterator list="<%=contests%>" id="resultRow">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value">
                            <A href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="name" row="<%=resultRow%>"/>
                            </A></td>
                        <td class="valueC" nowrap="nowrap">
                            <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                        </td>
                        <td class="valueC" nowrap="nowrap">
                            <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                        </td>
                        <td class="valueR" nowrap="nowrap">
                            <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                        </td>
                        <td class="valueR">
                            <rsc:item name="registrants" row="<%=resultRow%>"/>
                        </td>
                        <td class="valueR">
                            <rsc:item name="submission_count" row="<%=resultRow%>"/>
                        </td>

                        <td class="valueR" nowrap="nowrap">
                            <% if (resultRow.getIntItem("is_user_registered") == 1) { %>
                            <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" class="button" style="margin: 4px;">Submit
                                &amp; Rank</A>
                            <% } else { %>
                            <A href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" class="button" style="margin: 4px;">Register</A>
                            <% } %>
                        </td>
                    </tr>
                    <% even = !even;%>
                </rsc:iterator>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>


<%-- ASSEMBLY

    <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
        <thead>
            <tr>
                <td class="title" colspan="6"><span class="title">Competitions</span></td>
            </tr>
            <tr>
                <td class="header" width="100%">
                    <a href="">Project</a>
                </td>
                <td class="headerC">
                    <a href="">Registration ends</a></td>
                <td class="headerC">
                    <a href="">Submit by</a></td>
                <td class="headerR">
                    <a href="">Payment</a>
                </td>
                <td class="headerR">
                    <a href="">Submissions</a>
                </td>
                <td class="header">&nbsp;</td>
            </tr>
        <% boolean even = true;%>
            <tr class="<%=even?"light":"dark"%>">
                <td class="value">
                    <A href="">Project</A>
                </td>
                <td class="valueC" nowrap="nowrap">
                     03.01.2007 15:07 EST
                </td>
                <td class="valueC" nowrap="nowrap">
                     03.01.2007 15:07 EST
                </td>
                <td class="valueR" nowrap="nowrap">
                    $1,000.00
                </td>
                <td class="valueR">
                    0
                </td>
                <td class="valueR" nowrap="nowrap">
                    <A href="" class="button" style="margin: 4px;">Submit</A>
                </td>
            </tr>
            <% even = !even;%>
        </tbody>
    </table>
--%>


</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>