<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    ResultSetContainer seasons = (ResultSetContainer) request.getAttribute(Constants.SEASON_LIST_KEY);
    String type = (String) request.getAttribute(Constants.TYPE_KEY);
%>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>


<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript">
        function changePeriod() {
            var myForm = document.rookieBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = "";
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = "";
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = "";
            document.rookieBoardForm.submit()
        }
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.rookieBoardForm.submit();
                return false;
            } else return true;
        }
        function next() {
            var myForm = document.rookieBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = <c:out value="${requestScope[defaults][startRank]}"/> + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.rookieBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = <c:out value="${requestScope[defaults][startRank]}"/> - parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
    </script>
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

<div align="center">
<div class="maxWidthBody">

<% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="digital_run_20061031"/>
    <jsp:param name="title" value="Development Cup Series ROTY Leaderboard"/>
</jsp:include>
<% } else { %>
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="digital_run_20061031"/>
    <jsp:param name="title" value="Design Cup Series ROTY Leaderboard"/>
</jsp:include>
<% } %>


<div class="fixedWidthBody">
    <div style="float:right; text-align:left; white-space: nowrap;">
        <A href="/stat?c=top_designers" class="bcLink">Top Ranked Designers</a><br>
        <A href="/stat?c=top_developers" class="bcLink">Top Ranked Developers</a>
    </div>
    <A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Design Cup Series Leaderboard</a><br>
    <A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Development Cup Series Leaderboard</a><br>
    <% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
    <A href="/tc?module=RookieBoard&ph=112" class="bcLink">Design Cup Series ROTY Leaderboard</a><br>
    Development Cup Series ROTY Leaderboard
    <% } else { %>
    Design Cup Series ROTY Leaderboard<br>
    <A href="/tc?module=RookieBoard&ph=113" class="bcLink">Development Cup Series ROTY Leaderboard</a>
    <% } %>
</div>

<br><br>

<form name="rookieBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RookieBoard"/>
<tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
<!--tc-webtag:hiddenInput name="<%=Constants.SEASON_ID%>"/-->
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

Please select a <strong>season</strong><br>
<SELECT CLASS="dropdown" NAME="<%=Constants.SEASON_ID%>" onchange="changePeriod()">
    <rsc:iterator list="<%=seasons%>" id="resultRow">
        <% if (String.valueOf(resultRow.getLongItem("season_id")).equals(request.getParameter(Constants.SEASON_ID))) { %>
        <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>" selected>
            <rsc:item name="name" row="<%=resultRow%>"/></OPTION>
        <% } else { %>
        <OPTION value="<rsc:item name="season_id" row="<%=resultRow%>"/>">
            <rsc:item name="name" row="<%=resultRow%>"/></OPTION>
        <% } %>
    </rsc:iterator>
</SELECT>
<c:choose>
<c:when test="${fn:length(boardList) > 0}">

<!-- crop -->
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

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="8">
            <% if (request.getParameter(Constants.PHASE_ID).equals("113")) { %>
            Development Cup Series Rookie of the Year Leaderboard
            <% } else { %>
            Design Cup Series Rookie of the Year Leaderboard
            <% } %>
        </td>
    </tr>
    <tr>
        <td class="header" colspan="2" style="border-right: 1px solid #999999;">&#160;</td>
        <td class="headerC" colspan="4" style="border-right: 1px solid #999999;">Completed Contests</td>
        <td class="headerC" colspan="2" nowrap="nowrap">Current Contests</td>
    </tr>
    <tr>
        <td class="headerC">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rank</a>
        </td>
        <td class="header" style="border-right: 1px solid #999999;" width="25%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
        </td>
        <td class="headerR" colspan="3">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a>
        </td>
        <td class="headerR" style="border-right: 1px solid #999999;" width="25%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top 10<br>
                Prize</a>*
        </td>
        <td class="headerR" width="25%" nowrap="nowrap">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Potential<br>
                Points</a>**
        </td>
        <td class="headerR" width="25%" nowrap="nowrap">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Potential
                Total<br>Points</a>**
        </td>
    </tr>

        <%boolean even = false;%>
        <% int i = 0;%>
    <c:forEach items="${boardList}" var="boardRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">${boardRow.rank}</td>
        <td class="value" style="border-right: 1px solid #999999;">
            <tc-webtag:handle coderId='${boardRow.userId}' context='<%=type%>'/>
            <c:if test="${boardRow.potential}">***</c:if></td>
        <td class="valueC">
            <c:if test="${boardRow.winTrip}">
                <div id="pop<%=i%>a" class="popUp"><div>Trip to the next TCO Finals for finishing as the <strong>Rookie of the Year</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/trip.gif" alt="" border="0" onmouseover="popUp(this,'pop<%=i%>a')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueC">
            <c:if test="${boardRow.placementPrize>0}">
                <div id="pop<%=i%>b" class="popUp"><div>Cash prize for placing in the <strong>Top Ten</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/prize.gif" alt="" border="0" onmouseover="popUp(this,'pop<%=i%>b')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueR">
            <c:if test="${boardRow.points>0}">
            <A href="/tc?module=CompetitionHistory&ph=${boardRow.phase}&cr=${boardRow.userId}" class="bcLink">${boardRow.points}</a>
        </td>
</c:if></td>
<td class="valueR" style="border-right: 1px solid #999999;"><c:if test="${boardRow.placementPrize>0}">
    <fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/>
</c:if>
    <c:if test="${boardRow.placementPrize==0}">
        &#160;
    </c:if>
</td>
<td class="valueR"><c:if test="${boardRow.outstandingPoints>0}">
    <A href="/tc?module=OutstandingProjects&ph=${boardRow.phase}&seid=${boardRow.period}&cr=${boardRow.userId}" class="bcLink">${boardRow.outstandingPoints}</a>
</c:if></td>
<td class="valueR">${boardRow.totalPoints}</td>
</tr>
<%i++;%>
<%even = !even;%>
</c:forEach>
</table>

<p class="small" align="left">
    * Prizes are based on current earned points and the dollar per point value for completed projects. Current and
    future projects may affect the final results.<br>
    ** Assuming first place finish with all current contests with all competitors passing review<br>
    *** Has not yet passed review enough times this season to qualify as a rookie
</p>

<div class="pagingBox">
    View &#160;
    <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
    &#160;at a time starting with &#160;
    <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
    <a href="javascript:document.rookieBoardForm.submit();" class="bcLink">&#160;[ submit ]</a>
</div>

</c:when>
<c:otherwise>
    <br><br>
    The selected season is underway and results will start coming in soon.
</c:otherwise>
</c:choose>
</form>
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