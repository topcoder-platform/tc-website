<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getHeader("Referer");
    if (nextpage == null) nextpage = "http://" + request.getServerName();
    String type = (String) request.getAttribute(Constants.TYPE_KEY);
    ResultSetContainer stages = (ResultSetContainer) request.getAttribute(Constants.STAGE_LIST_KEY);
%>

<html>
<head>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.leaderBoardForm.submit();
                return false;
            } else return true;
        }
        function next() {
            var myForm = document.leaderBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.leaderBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myFsorm.<%=DataAccessConstants.START_RANK%>.value) - parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        var objPopUp = null;
        function popUp(objectID) {
            objPopUp = document.getElementById(objectID);
            objPopUp.style.visibility = 'visible';
        }
        function popHide() {
            objPopUp.style.visibility = 'hidden';
            objPopUp = null;
        }
    </script>
    <style type="text/css">
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
            font-size: 11px;
            width: 200px;
            background: #FFFFCC;
            border: 1px solid #999999;
            padding: 6px;
            text-align: left;
        }
    </style>
</head>

<body>

<jsp:include page="/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<TD WIDTH="180">
    <!-- Left nav begins -->
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="digital_run"/>
    </jsp:include>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

    <% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="digital_run"/>
        <jsp:param name="title" value="Development Cup Series Leaderboard"/>
    </jsp:include>
    <% } else { %>
    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="digital_run"/>
        <jsp:param name="title" value="Design Cup Series Leaderboard"/>
    </jsp:include>
    <% } %>


    <div style="float:right; text-align:left; whitespace: no-wrap;">
        <A href="/stat?c=top_designers" class="bcLink">Top Ranked Designers</a><br>
        <A href="/stat?c=top_developers" class="bcLink">Top Ranked Developers</a>
    </div>
    <% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
    <A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Design Cup Series Leaderboard</a><br>
    Development Cup Series Leaderboard</a><br>
<% } else { %>
Design Cup Series Leaderboard<br>
<A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Development Cup Series Leaderboard</a><br>
<% } %>
<A href="/tc?module=RookieBoard&ph=112" class="bcLink">Design Cup Series ROTY Leaderboard</a><br>
<A href="/tc?module=RookieBoard&ph=113" class="bcLink">Development Cup Series ROTY Leaderboard</a>

<br><br>

<div align="center">
<form name="leaderBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="LeaderBoard"/>
<tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
<!--tc-webtag:hiddenInput name="<%=Constants.STAGE_ID%>"/-->
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

Please select a <strong>season</strong> and <strong>stage</strong><br>
<SELECT CLASS="dropdown" NAME="<%=Constants.STAGE_ID%>" onchange="document.leaderBoardForm.submit()">
    <rsc:iterator list="<%=stages%>" id="resultRow">
        <% if (String.valueOf(resultRow.getLongItem("stage_id")).equals(request.getParameter(Constants.STAGE_ID))) { %>
        <OPTION value="<rsc:item name="stage_id" row="<%=resultRow%>"/>" selected>
            <rsc:item name="season_name" row="<%=resultRow%>"/> &gt;
            <rsc:item name="stage_name" row="<%=resultRow%>"/></OPTION>
        <% } else { %>
        <OPTION value="<rsc:item name="stage_id" row="<%=resultRow%>"/>">
            <rsc:item name="season_name" row="<%=resultRow%>"/> &gt;
            <rsc:item name="stage_name" row="<%=resultRow%>"/></OPTION>
        <% } %>
    </rsc:iterator>
</SELECT>

<c:choose>
    <c:when test="${fn:length(boardList) > 0}">

        <div class="pagingBox" style="width:300px;">
            <c:choose>
                <c:when test="${croppedDataBefore}">
                    <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                </c:when>
                <c:otherwise>
                    &lt;&lt; prev
                </c:otherwise>
            </c:choose>
            |
            <c:choose>
                <c:when test="${croppedDataAfter}">
                    <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                </c:when>
                <c:otherwise>
                    next &gt;&gt;
                </c:otherwise>
            </c:choose>
        </div>

        <table class="stat" cellpadding="0" cellspacing="0" width="510">
            <tr>
                <td class="title" colspan="9">
                    <% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
                    Development Cup Series Leaderboard
                    <% } else { %>
                    Design Cup Series Leaderboard
                    <% } %>
                </td>
            </tr>
            <tr>
                <td class="headerC">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rank</a>
                </td>
                <td class="header" width="100%">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
                </td>
                <td class="headerR" colspan="4">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a>
                </td>
                <td class="headerR" nowrap="nowrap">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top
                        Five<br>Prize</a>*</td>
                <td class="headerR" nowrap="nowrap">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top
                        Third<br>Prize</a>*</td>
                <td class="headerR">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Total
                        Prizes</a>*</td>
            </tr>

            <% boolean even = false;%>
            <% int i = 0;%>
            <c:forEach items="${boardList}" var="boardRow">
                <tr class="<%=even?"dark":"light"%>">
                    <td class="valueC">${boardRow.rank}</td>
                    <td class="value" width="100%">
                        <tc-webtag:handle coderId='${boardRow.userId}' context='<%=type%>'/></td>
                    <td class="valueC">
                        <c:if test="${boardRow.winTrip}">
                            <div class="container">
                                <img src="/i/interface/emblem/trip.gif" class="emblem" alt="" border="0" onmouseover="popUp('pop<%=i%>a')" onmouseout="popHide()"/>

                                <div id="pop<%=i%>a" class="popUp"><div>Trip to the next TCO Finals for placing in the
                                    <strong>Top Five</strong></div></div>
                            </div>
                        </c:if>
                    </td>
                    <td class="valueC">
                        <c:if test="${boardRow.winTrip}">
                            <div class="container">
                                <img src="/i/interface/emblem/prize.gif" class="emblem" alt="" border="0" onmouseover="popUp('pop<%=i%>b')" onmouseout="popHide()"/>

                                <div id="pop<%=i%>b" class="popUp"><div>Cash prize for placing in the <strong>Top
                                    Five</strong></div></div>
                            </div>
                        </c:if>
                    </td>
                    <td class="valueC">
                        <c:if test="${boardRow.topThird}">
                            <div class="container" id="container<%=i%>b">
                                <img src="/i/interface/emblem/prize.gif" class="emblem" alt="" border="0" onmouseover="popUp('pop<%=i%>c')" onmouseout="popHide()"/>

                                <div id="pop<%=i%>c" class="popUp"><div>Cash prize for placing in the <strong>Top
                                    Third</strong></div></div>
                            </div>
                        </c:if>
                    </td>
                    <td class="valueR">${boardRow.points}</td>
                    <td class="valueR"><c:if test="${boardRow.placementPrize>0}">
                        <fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/>
                    </c:if></td>
                    <td class="valueR"><c:if test="${boardRow.pointsPrize>0}">
                        <fmt:formatNumber value="${boardRow.pointsPrize}" type="currency" currencySymbol="$"/>
                    </c:if></td>
                    <td class="valueR"><c:if test="${boardRow.totalPrize>0}">
                        <fmt:formatNumber value="${boardRow.totalPrize}" type="currency" currencySymbol="$"/>
                    </c:if></td>
                </tr>
                <%i++;%>
                <%even = !even;%>
            </c:forEach>
        </table>
<p class="small" align="left">
* Prizes are based on current earned points and the dollar per point value for completed projects.  Current and future projects may affect the final results.
</p>

        <div class="pagingBox" style="width:300px;">
            View
            <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
            at a time starting with
            <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
            <a href="javascript:document.leaderBoardForm.submit();" class="bcLink">[submit]</a>
        </div>

    </c:when>
    <c:otherwise>
        <br><br>
        The selected stage is underway and results will start coming in soon.
    </c:otherwise>
</c:choose>
</div>
</div>
</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="profile"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>