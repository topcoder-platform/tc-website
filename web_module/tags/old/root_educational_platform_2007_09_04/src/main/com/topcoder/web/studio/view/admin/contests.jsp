<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>
<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>
<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_studio"/>
</jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <jsp:include page="../top.jsp">
            <jsp:param name="section" value="admin"/>
        </jsp:include>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Contests</h1>

                <table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
                    <tbody>
                        <tr>
                            <td class="NW">&nbsp;</td>
                            <td class="title" colspan="4">Contests</td>
                            <td class="titleR" colspan="2">
                                <h2><a href="${sessionInfo.servletPath}?module=AdminViewContest">add contest</a></h2>
                            </td>
                            <td class="NE">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="headerW"><div>&nbsp;</div></td>
                            <td class="header" width="100%">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Name</a>
                            </td>
                            <td class="header"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("contest_status_desc")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Status</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End</a></td>
                            <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a></td>
                            <td class="headerC">&nbsp;</td>
                            <td class="headerE"><div>&nbsp;</div></td>
                        </tr>
                        <% boolean even = true;%>
                        <rsc:iterator list="<%=contests%>" id="resultRow">
                            <tr class="<%=even?"light":"dark"%>">
                                <td class="valueW"><div>&nbsp;</div></td>
                                <td class="value"><a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['name']}</A></td>
                                <td class="value" nowrap="nowrap">${resultRow.map['contest_status_desc']}</td>
                                <td class="valueC" nowrap="nowrap">
                                    <tc-webtag:format object="${resultRow.map['start_time']}" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC" nowrap="nowrap">
                                    <tc-webtag:format object="${resultRow.map['end_time']}" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?module=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['submission_count']}</a>
                                </td>
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">edit</a>
                                </td>
                                <td class="valueE"><div>&nbsp;</div></td>
                            </tr>
                            <% even = !even;%>
                        </rsc:iterator>
                        <tr>
                            <td class="SW" colspan="9">&nbsp;</td>
                            <td class="SE">&nbsp;</td>
                        </tr>

                    </tbody>
                </table>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="../foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>