<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.studio.Constants,
                 com.topcoder.web.common.BaseProcessor" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio :: Studio Cup</title>
    
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
    </jsp:include>
   
       <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
       <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
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
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="cup" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<jsp:include page="2008v2/nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="leaderboard"/>
</jsp:include>

<%-- Commented out for Pablo 
<br />
<div class="fixedWidthBody">
    <div align="center" style="font-size:18px; color:#ff0000;"><strong>MONTH Prize Pool: POOL VALUE</strong></div>
</div>
--%>

<form name="leaderBoardForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewLeaderBoard"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<div class="pagingBox">
Please select a <strong>${trackInfo.trackTypeDesc} Track</strong><br />

<tc-webtag:rscSelect name="<%=Constants.TRACK_ID%>" styleClass="dropdown" onChange="changePeriod()" 
          list="${tracks}" fieldText="track_desc" fieldValue="track_id" useTopValue="false" />
</div>

<c:choose>
<c:when test="${not trackExists}">
    <br /><br />
    There are no results for the selected track.
</c:when>
<c:when test="${not empty resultObject.results}">

<div class="pagingBox">
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

<table class="drStat" cellpadding="0" cellspacing="0" width="100%">
<thead>
    <tr>
        <th class="title c" colspan="11">
            ${trackInfo.trackDesc} Leaderboard
        </th>
    </tr>
    <tr>
        <th class="b" colspan="2">&nbsp;</th>
        <th class="c b" colspan="7">Completed Contests</th>
        <th class="c" colspan="2" nowrap="nowrap">Current Contests</th>
    </tr>

    <tr valign="bottom">
        <th class="c">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rank</a>
        </th>
        <th class="b" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Handle</a>
        </th>
        <th class="r" colspan="4">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Points</a>
        </th>
        <th class="r" nowrap="nowrap" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top
                Five<br />Prize</a>*</th>
        <th class="r" nowrap="nowrap" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Top
                <br />Performer<br />Prize</a>*</th>

        <th class="r b" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Total<br />
                Prizes</a>*</th>
        <th class="r" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Potential<br />
                Points</a>**
        </th>

        <th class="r" nowrap="nowrap" width="16%">
            <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Potential<br />
                Total <br />Points</a>**
        </th>
    </tr>
    <tr align="right">
        <th class="b" colspan="2">&nbsp;</th>
        <th class="b" colspan="3">TOTALS:</th>
        <th class="b"><fmt:formatNumber value="${resultObject.totalPoints}"  minFractionDigits="2" maxFractionDigits="2"/></th>
        <th class="b"><fmt:formatNumber value="${resultObject.totalTopFivePrize}" type="currency" currencySymbol="$"/></th>
        <th class="b"><fmt:formatNumber value="${resultObject.totalTopPerformerPrize}" type="currency" currencySymbol="$"/></th>
        <th class="b"><fmt:formatNumber value="${resultObject.totalPrizes}" type="currency" currencySymbol="$"/></th>
        <th class="b" colspan="2">&#160;</th>
    </tr>
</thead>    
<tbody>
    <c:forEach items="${resultObject.results}" var="boardRow" varStatus="status">
        <tr class='${status.index % 2 == 1? "odd" : "even" }'>
            <td class="c">${boardRow.rank}</td>
            <td class="b">
                <span class="coderText"><tc-webtag:handle coderId='${boardRow.userId}' context='${context}'/></span></td>
            <td class="c">
                <c:if test="${boardRow.winTrip}">
                    <div align="center"><a href="#"><img src="/i/digital_run/trip.gif" alt="" /><span>Trip to the next TCO Finals</span></a></div>
                </c:if>
            </td>
            <td class="c">
                <c:if test="${boardRow.placementPrize>0}">
                    <div align="center"><a href="#"><img src="/i/digital_run/prize.gif" alt="" /><span>Cash prize for placing in the <strong>Top Five</strong></span></a></div>
                </c:if>
            </td>
            <td class="c">
                <c:if test="${boardRow.topPerformer}">
                    <div align="center"><a href="#"><img src="/i/digital_run/prize.gif" alt="" /><span>Cash prize for placing in the <strong>Top Performers</strong></span></a></div>
                </c:if>
            </td>
            <td class="r">
                <c:if test="${boardRow.points>0}">
                    <a href="/dr?module=PointsDetail&amp;pf=0&amp;cr=${boardRow.userId}&amp;tid=${tid}" class="bcLink">
                        <fmt:formatNumber value="${boardRow.points}"  minFractionDigits="2" maxFractionDigits="2"/>
                    </a>
                </c:if>
            </td>
            <td class="r">
                <c:if test="${boardRow.placementPrize>0}">
                    <fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/>
                </c:if>
            </td>
            <td class="r">
                <c:if test="${boardRow.pointsPrize>0}">
                    <fmt:formatNumber value="${boardRow.pointsPrize}" type="currency" currencySymbol="$"/>
                </c:if>
            </td>
            <td class="r b">
                <c:if test="${boardRow.totalPrize>0}">
                    <fmt:formatNumber value="${boardRow.totalPrize}" type="currency" currencySymbol="$"/>
                </c:if>
                <c:if test="${boardRow.totalPrize==0}">
                    &#160;
                </c:if>
            </td>
            <td class="r">
                <c:if test="${boardRow.potentialPoints>0}">
                    <a href="/dr?module=PointsDetail&amp;pf=1&amp;cr=${boardRow.userId}&amp;tid=${tid}" class="bcLink">
                        <fmt:formatNumber value="${boardRow.potentialPoints}"  minFractionDigits="2" maxFractionDigits="2"/>
                        </a>
                </c:if>
            </td>
            <td class="r"><fmt:formatNumber value="${boardRow.totalPoints}"  minFractionDigits="2" maxFractionDigits="2"/></td>
        </tr>
    </c:forEach>
</tbody></table>

<div class="pagingBox">
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
    * Prizes are based on current earned points and the dollar per point value for completed projects. Current and
    future projects may affect the final results.<br />
    ** Assuming first place finish with all current contests with all competitors passing review
</p>

<div class="pagingBox">
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


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
