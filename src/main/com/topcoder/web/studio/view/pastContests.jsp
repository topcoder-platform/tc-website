<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<h1>Past Contests</h1>

<h2 align="right">Need help? Learn how to
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get
        started</a>.<br>
    Got <a href="/?module=Static&amp;d1=support&amp;d2=generalFaq">questions</a>?
</h2>

<table cellpadding="0" cellspacing="0" border="0" style="clear:both; margin-left: 10px;">
    <tr>
        <td width="50%">
            <a href="/?module=ViewActiveContests" class="statTabLinkOff"><span>Active Contests</span></a>
        </td>
        <td width="50%">
            <a href="/?module=ViewPastContests" class="statTabLinkOn"><span>Past Contests</span></a>
        </td>
    </tr>
</table>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
    <tbody>
        <tr>
            <td class="NW">&nbsp;</td>
            <td class="title" colspan="7">Past Contests</td>
            <td class="NE">&nbsp;</td>
        </tr>
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
<%--
            <td class="headerC">
                &nbsp;
            </td>
            <td class="headerC">
                &nbsp;
            </td>
--%>
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
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
                        <c:if test="${resultRow.map['forum_id']!=null}">| <studio:forumLink forumID="${resultRow.map['forum_id']}" message="discuss"/></c:if>
                        <% if (resultRow.getBooleanItem("results_available")) { %>
                        |
                        <a href="/?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                        <% } %>
                    </div>
                </td>
                <td class="valueC">
                    <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueC">
                    <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueR">
                    <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
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
                    <%--
                                    <td class="valueC">
                                        <% if (resultRow.getBooleanItem("results_available")) { %>
                                        <a href="/?<%=Constants.MODULE_KEY%>=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">winners</a>
                                        <% } else {%>
                                        &#160;
                                        <% } %>
                                    </td>
                                    <td class="valueC" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">contest details</a>
                                    </td>
                    --%>
                <td class="valueE">
                    <div>&nbsp;</div>
                </td>
            </tr>
            <% even = !even; i++; %>
        </rsc:iterator>
        <tr>
            <td class="SW" colspan="8">&nbsp;</td>
            <td class="SE">&nbsp;</td>
        </tr>
    </tbody>
</table>

<div align="right" style="padding-top: 10px;"><strong>Would you like to see some of our <a href="/?module=Static&amp;d1=oldcontests&amp;d2=archive">older logo design contests</a>?</strong></div>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>