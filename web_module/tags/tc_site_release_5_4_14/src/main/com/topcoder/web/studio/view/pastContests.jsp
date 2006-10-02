<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <script language="javascript" type="text/javascript">
        <!--
        var objPopUp = null;
        function popUp(objectID) {
            objPopUp = document.getElementById(objectID);
            objPopUp.style.visibility = 'visible';
        }
        function popHide() {
            objPopUp.style.visibility = 'hidden';
            objPopUp = null;
        }
        // -->
    </script>
    <STYLE TYPE="text/css">
        img.emblem {
            float: left;
            margin: 0px 0px 0px 0px;
        }

        div.container {
            display: block;
            text-align: center;
            position: relative;
            margin: 0px;
            padding: 0px;
        }

        div.popUp {
            visibility: hidden;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 1;
        }

        div.popUp div {
            float: left;
            font-size: 11px;
            line-height: normal;
            background: #FFFFCC;
            border: 1px solid #999999;
            padding: 6px;
            text-align: left;
            white-space: nowrap;
        }
    </STYLE>
</head>

<body>

<div align="center">
<div class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer" style="padding-bottom:100px;">

<h1>Past Contests</h1>

<h2 align="right">Need help? Learn how to
    <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get
        started</A>.<br>
        Got <A href="/?module=Static&d1=support&d2=generalFaq">questions</A>?
    </h2>

<table cellpadding="0" cellspacing="0" border="0" style="clear:both; margin-left: 10px;">
    <tr>
        <td width="50%">
            <A href="/?module=ViewActiveContests" class="statTabLinkOff"><span>Active Contests</span></A>
        </td>
        <td width="50%">
            <A href="/?module=ViewPastContests" class="statTabLinkOn"><span>Past Contests</span></A>
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
            <td class="header">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
            </td>
            <td class="header" colspan="2">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests<tc-webtag:sort column="<%=contests.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Winner</a>
            </td>
            <td class="headerR">
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
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=contests%>" id="resultRow">
            <tr class="<%=even?"light":"dark"%>">
                <td class="valueW"><div>&nbsp;</div></td>
                <td class="value">
                    <A href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                        <rsc:item name="name" row="<%=resultRow%>"/></A></td>
                <td class="value">
                    <% if (resultRow.getItem("winner_id").getResultData() != null) { %>
                    <studio:handle coderId="<%=resultRow.getLongItem("winner_id")%>"/>
                    <% } else {%>
                    &#160;
                    <% } %>
                </td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="<%=resultRow.getItem("winning_submission_id").getResultData() != null%>">
                            <div class="container">
                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="winning_submission_id" row="<%=resultRow%>"/>"><img src="/i/layout/magnify.gif" alt="Download submission" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>

                                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            &#160;
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueR">
                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("show_submissions")%>">
                            <A href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="submission_count" row="<%=resultRow%>"/></A>
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
                    <rsc:item name="start_time" row="<%=resultRow%>" format="MM.dd.yyyy HH:mm z" timeZone="${sessionInfo.timezone}"/></td>
                <td class="valueC">
                    <rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy HH:mm z" timeZone="${sessionInfo.timezone}"/></td>
                <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;
                i++; %>
        </rsc:iterator>
        <tr>
            <td class="SW" colspan="8">&nbsp;</td>
            <td class="SE">&nbsp;</td>
        </tr>
    </tbody>
</table>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>