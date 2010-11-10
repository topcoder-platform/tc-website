<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.common.BaseProcessor" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="context" value='${isDevelopment ? "development" : isDesign ? "design" : "component"}' />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Digital Run Leaderboard</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        function changePeriod() {
            var myForm = document.leaderBoardForm;
            <c:if test="${fn:length(resultObject.results) > 0}">
            myForm.<%=DataAccessConstants.START_RANK%>.value = '';
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '';
            </c:if>
            document.leaderBoardForm.submit()
        }
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
            myForm.<%=DataAccessConstants.START_RANK%>.value = <%=((java.util.Map) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get(DataAccessConstants.START_RANK)%> + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.leaderBoardForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value =<%=((java.util.Map) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get(DataAccessConstants.START_RANK)%>  - parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
    </script>    
</head>
    
<body>
<jsp:include page="/top.jsp"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="digital_run_20061031"/>
        <jsp:param name="title" value="${trackInfo.trackDesc} Leaderboard"/>
    </jsp:include>

    <div class="fixedWidthBody">
        <div style="float:right; text-align:left; white-space: nowrap;">
            <a href="/stat?c=top_designers" class="bcLink">Top Ranked Designers</a><br />
            <a href="/stat?c=top_developers" class="bcLink">Top Ranked Developers</a>
        </div>
    <c:choose>
        <c:when test="${isDevelopment}">
            <a href="/dr?&amp;module=ViewLeaderBoard&amp;tid=${concurrentTrack}" class="bcLink">Design Cup Series Leaderboard</a><br />
            Development Cup Series Leaderboard</a><br />
        </c:when>
        <c:when test="${isDesign}">
            Design Cup Series Leaderboard<br />
            <a href="/dr?&amp;module=ViewLeaderBoard&amp;tid=${concurrentTrack}" class="bcLink">Development Cup Series Leaderboard</a><br />
        </c:when>
    </c:choose>
</div>

<%-- Commented out for Pablo 
<br />
<div class="fixedWidthBody">
    <div align="center" style="font-size:18px; color:#ff0000;"><strong>MONTH Prize Pool: POOL VALUE</strong></div>
</div>
--%>

<br /><br />


<form name="leaderBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewLeaderBoard"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

Please select a <strong>${trackInfo.trackTypeDesc} Track</strong><br />

<tc-webtag:rscSelect name="<%=Constants.TRACK_ID%>" styleClass="dropdown" onChange="changePeriod()" 
          list="${tracks}" fieldText="track_desc" fieldValue="track_id" useTopValue="false" />

<c:choose>
<c:when test="${not trackExists}">
    <br /><br />
    There are no results for the selected track.
</c:when>
<c:when test="${not empty resultObject.results}">

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
        <td class="title" colspan="11">
            ${trackInfo.trackDesc} Leaderboard
        </td>
    </tr>
    <tr>
        <td class="header B" colspan="2">&#160;</td>
        <td class="headerC B" colspan="7">Completed Contests</td>
        <td class="headerC" colspan="2" nowrap="nowrap">Current Contests</td>
    </tr>
    <tr>
        <td class="headerC">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rank</a>
        </td>
        <td class="header B" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
        </td>
        <td class="headerR" colspan="4">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a>
        </td>
        <td class="headerR" nowrap="nowrap" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top
                Five<br />Bonus</a>*</td>
        <td class="headerR" nowrap="nowrap" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top<br />
                Performer <br />Bonus</a>*</td>
        <td class="headerR B" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Total<br />
                Bonuses</a>*</td>
        <td class="headerR" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Potential<br />
                Points</a>**
        </td>
        <td class="headerR" width="16%" nowrap="nowrap">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Potential<br />
                Total <br />Points</a>**
        </td>
    </tr>

    <tr>
        <td class="header B" colspan="2">&#160;</td>
        <td class="header B" colspan="3">TOTALS:</td>
        <td class="headerR B"><fmt:formatNumber value="${resultObject.totalPoints}"  minFractionDigits="2" maxFractionDigits="2"/></td>
        <td class="headerR B"><fmt:formatNumber value="${resultObject.totalTopFivePrize}" type="currency" currencySymbol="$"/></td>
        <td class="headerR B"><fmt:formatNumber value="${resultObject.totalTopPerformerPrize}" type="currency" currencySymbol="$"/></td>
        <td class="headerR B"><fmt:formatNumber value="${resultObject.totalPrizes}" type="currency" currencySymbol="$"/></td>
        <td class="headerC" colspan="2">&#160;</td>
    </tr>

    <c:forEach items="${resultObject.results}" var="boardRow" varStatus="status">
    <tr class='${status.index % 2 == 1? "dark" : "light" }'>
        <td class="valueC">${boardRow.rank}</td>
        <td class="value B">
            <tc-webtag:handle coderId='${boardRow.userId}' context='${context}'/></td>
        <td class="valueC">
            <c:if test="${boardRow.winTrip}">
                <div id="pop${status.index }a" class="popUp"><div>Trip to the next TCO Finals for placing in the <strong>Top ${topTripWinners}</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/trip.gif" alt="" border="0" onmouseover="popUp(this,'pop${status.index }a')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueC">
            <c:if test="${boardRow.placementPrize>0}">
                <div id="pop${status.index }b" class="popUp"><div>Cash bonus for placing in the <strong>Top Five</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/prize.gif" alt="" border="0" onmouseover="popUp(this,'pop${status.index }b')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueC">
            <c:if test="${boardRow.topPerformer}">
                <div id="pop${status.index }c" class="popUp"><div>Cash bonus for placing in the <strong>Top Performers</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/prize.gif" alt="" border="0" onmouseover="popUp(this,'pop${status.index }c')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueR">
            <c:if test="${boardRow.points>0}">
                    <a href="/dr?module=PointsDetail&amp;pf=0&amp;cr=${boardRow.userId}&amp;tid=${tid}" class="bcLink">
                                <fmt:formatNumber value="${boardRow.points}"  minFractionDigits="2" maxFractionDigits="2"/>
                    </a>
            </c:if>
        </td>
        <td class="valueR"><c:if test="${boardRow.placementPrize>0}">
            <fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/>
        </c:if></td>
        <td class="valueR"><c:if test="${boardRow.pointsPrize>0}">
            <fmt:formatNumber value="${boardRow.pointsPrize}" type="currency" currencySymbol="$"/>
        </c:if></td>
        <td class="valueR B">
            <c:if test="${boardRow.totalPrize>0}">
                <fmt:formatNumber value="${boardRow.totalPrize}" type="currency" currencySymbol="$"/>
            </c:if>
            <c:if test="${boardRow.totalPrize==0}">
                &#160;
            </c:if>
        </td>
        <td class="valueR">
            <c:if test="${boardRow.potentialPoints>0}">
                <a href="/dr?module=PointsDetail&amp;pf=1&amp;cr=${boardRow.userId}&amp;tid=${tid}" class="bcLink">
                    <fmt:formatNumber value="${boardRow.potentialPoints}"  minFractionDigits="2" maxFractionDigits="2"/>
                    </a>
            </c:if>
        </td>
        <td class="valueR"><fmt:formatNumber value="${boardRow.totalPoints}"  minFractionDigits="2" maxFractionDigits="2"/></td>
    </tr>
    </c:forEach>
</table>

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
<p class="small" align="left">
    * Bonuses are based on current earned points and the dollar per point value for completed projects. Current and
    future projects may affect the final results.<br />
    ** Assuming first place finish with all current contests with all competitors passing review
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
    <br /><br />
    The selected track is underway and results will start coming in soon.
</c:otherwise>
</c:choose>

</form>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>