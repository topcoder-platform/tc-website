<%@ page import="java.util.Collection" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.util.format.ObjectFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>


<c:set value="<%=DataAccessConstants.NUMBER_PAGE%>" var="numPage"/>
<c:set value="<%=DataAccessConstants.SORT_COLUMN%>" var="sortCol"/>
<c:set value="<%=DataAccessConstants.SORT_DIRECTION%>" var="sortDir"/>
<c:set value="<%=DataAccessConstants.NUMBER_RECORDS%>" var="numRecords"/>

<c:set value="<%=Constants.FIRST_WEEK_ID%>" var="firstWeekId"/>
<c:set value="<%=Constants.FIRST_MINI_SEASON_ID%>" var="firstMiniSeasonId"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Manage My Algorithms</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <script type="text/javascript">
    function changeWeek(week) {
        document.resultsForm.week.value = week;
        document.resultsForm.submit();
    }
    function changeMiniSeason(msi) {
        document.resultsForm.msi.value = msi;
        document.resultsForm.submit();
    }
    </script>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="standings" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
            <div class="sub-navigation">
                <c:choose>
                    <c:when test="${empty periodKey}">
                        Overall Standings | 
                    </c:when>
                    <c:otherwise>
                        <a href="?module=ViewStandings">Overall Standings</a> | 
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${periodKey == 'msi'}">
                        Mini-Season Standings | 
                    </c:when>
                    <c:otherwise>
                        <a href="?module=ViewStandings&amp;msi=${firstMiniSeasonId}">Mini-Season Standings</a> | 
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${periodKey == 'week'}">
                        Weekly Standings 
                    </c:when>
                    <c:otherwise>
                        <a href="?module=ViewStandings&amp;week=${firstWeekId}">Weekly Standings</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <h1>Standings - ${periodDesc}</h1>

                <c:choose>
                    <c:when test="${periodKey == 'msi'}">
                        <div class="tab-navigation" id="inner-tab-navigation">
                            <ul>
                                <c:forEach begin="${1}" end="${4}" step="${1}" var="i">
                                    <li class="small ${i+firstMiniSeasonId-1==periodId?'selected':''}">
                                        <c:choose>
                                            <c:when test="${maxPeriod>= i+firstMiniSeasonId-1}">
                                                <a href="javascript:changeMiniSeason(${i+firstMiniSeasonId-1})">
                                                    <c:choose>
                                                        <c:when test="${i==1}">Mini-Season 1 (Weeks 1-3)</c:when>
                                                        <c:when test="${i==2}">Mini-Season 2 (W4-W7)</c:when>
                                                        <c:when test="${i==3}">Mini-Season 3 (W8-W11)</c:when>
                                                        <c:when test="${i==4}">Mini-Season 4 (W12-W15)</c:when>
                                                    </c:choose>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span>
                                                    <c:choose>
                                                        <c:when test="${i==1}">Mini-Season 1 (Weeks 1-3)</c:when>
                                                        <c:when test="${i==2}">Mini-Season 2 (W4-W7)</c:when>
                                                        <c:when test="${i==3}">Mini-Season 3 (W8-W11)</c:when>
                                                        <c:when test="${i==4}">Mini-Season 4 (W12-W15)</c:when>
                                                    </c:choose>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:when>
                    <c:when test="${periodKey == 'week'}">
                        <div class="tab-navigation" id="inner-tab-navigation">
                            <ul>
                                <c:forEach begin="${1}" end="${15}" step="${1}" var="i"> 
                                    <li class="small ${i+firstWeekId-1==periodId?'selected':''}">
                                        <c:choose>
                                            <c:when test="${maxPeriod>= i+firstWeekId-1}">
                                                <a href="javascript:changeWeek(${i+firstWeekId-1})">
                                                    <c:choose><c:when test="${i==1}">Week 1</c:when><c:otherwise>W${i}</c:otherwise></c:choose>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span>
                                                    <c:choose><c:when test="${i==1}">Week 1</c:when><c:otherwise>W${i}</c:otherwise></c:choose>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:when>
                </c:choose>
            
            <div class="dataArea" style="width:100%;">

<!-- Prepares some collection data and formatter -->
                <% boolean even = true;%>
            <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewStandings"/>
            <tc-webtag:hiddenInput name="${sortCol}"/>
            <tc-webtag:hiddenInput name="${sortDir}"/>
            <tc-webtag:hiddenInput name="cr" value="${cr}"/>
            <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
            <tc-webtag:hiddenInput name="${numPage}" value="${np}"/>
            <tc-webtag:hiddenInput name="${periodKey}" value="${periodId}"/>

<%--             <c:if test="${not empty periods}">
                <tc-webtag:listSelect name="${periodKey}" styleClass="dropdown" onChange="document.resultsForm.submit()"
                    list="${periods}" useTopValue="false"/> 
            </c:if>--%>
            <jsp:include page="pagination.jsp">
                <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                <jsp:param name="totalSize" value="${totalSize}" />
                <jsp:param name="numRecords" value="${nr}" />
                <jsp:param name="numPage" value="${np}" />
                <jsp:param name="formName" value="document.resultsForm"/>
            </jsp:include>

            <c:choose>
                 <c:when test="${not empty result}">
                    <jsp:include page="standingsTable.jsp"/>
                </c:when>
                <c:otherwise>
                    There are no results to show.
                </c:otherwise>
             </c:choose>
    
            </form>
            <br/>
            <jsp:include page="pagination.jsp">
                <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                <jsp:param name="totalSize" value="${totalSize}" />
                <jsp:param name="numRecords" value="${nr}" />
                <jsp:param name="numPage" value="${np}" />
                <jsp:param name="formName" value="document.resultsForm"/>
            </jsp:include>
            <p>&nbsp;</p>
        </div>
        </div>
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>