<%--
  - Author: TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists active CloudSpokes challenges.
  -
--%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Active Contests</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp"/>
    <script language="JavaScript" type="text/javascript" src="/js/jquery.tablesorter.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/cloudspokes.js"></script>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="cs_active_contests"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="left" class="bodyColumn">
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="cloudspokes"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td width="100%" height="23px">&nbsp;</td>

        <td align="right">
            <a href="http://www.cloudspokes.com/how-it-works-members"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a><br/><br/>
        </td>
    </tr>
</table>

<div align="right">
    Competition opportunities via RSS -
    <a href="http://www.cloudspokes.com/challenges.rss">Subscribe Now</a>
    <a href="http://www.cloudspokes.com/challenges.rss"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
    <br/><br/>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%" id="cloudSpokesActiveContests">
    <thead>
        <tr>
            <th class="title" colspan="5">
                Active CloudSpokes Contests
            </th>
        </tr>
        <tr>
            <th class="header" width="40%"><a href="javascript:;">Contest</a></th>
            <th class="headerC" width="15%" style="text-align: center"><a href="javascript:;">Register by</a></th>
            <th class="headerC" width="15%" style="text-align: center"><a href="javascript:;">Submit by</a></th>
            <th class="headerC" width="15%" style="text-align: center"><a href="javascript:;">Payment</a></th>
            <th class="headerC" width="15%" style="text-align: center"><a href="javascript:;">Registrants</a></th>
        </tr>
    </thead>
    
    <% boolean even = false; %>
    <c:forEach var="challenge" items="${challenges}">
        <tr class="<%=even?"light":"dark"%>">
            <td class="value"><a target="_blank" href="http://www.cloudspokes.com/challenges/${challenge.challengeId}"><c:out value="${challenge.name}"/></a></td>
            <fmt:setTimeZone value="America/New_York" />
            <td class="valueC" nowrap="nowrap">
                <fmt:formatDate value="${challenge.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
            <td class="valueC" nowrap="nowrap"><fmt:formatDate value="${challenge.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
            <td class="valueC"><fmt:formatNumber type="number" pattern="$###,###.00" value="${challenge.prize}" /></td>
            <td class="valueC">
                <a target="_blank" href="http://www.cloudspokes.com/challenges/${challenge.challengeId}/participants"><c:out value="${challenge.registrantsNumber}"/></a>
            </td>
        </tr>
        <% even = !even;%>
    </c:forEach>
</table>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

</tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
