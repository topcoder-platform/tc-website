<%@ page import="java.util.Collection" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.util.format.ObjectFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Game Details</title>
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
         <c:choose>
            <c:when test="${not empty result}">
            <div class="tab-navigation" id="inner-tab-navigation">
                <ul>
                    <c:forEach begin="${1}" end="${15}" step="${1}" var="i"> 
                        <li class="small ${i+firstWeekId-1==week?'selected':''}">
                            <c:choose>
                                <c:when test="${maxWeek >= i+firstWeekId-1}">
                                    <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewGameDetails&amp;week=${i+firstWeekId-1}">
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
            <div class="dataArea" style="width:100%;">
                    <!-- Prepares some collection data and formatter -->
                        <% boolean even = true;%>
                    <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewGameDetails"/>
                    <tc-webtag:hiddenInput name="${sortCol}"/>
                    <tc-webtag:hiddenInput name="${sortDir}"/>
                    <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
                    <tc-webtag:hiddenInput name="${numPage}" value="${np}"/> 
                    <br/><br/>

                    <c:if test="${not empty result}">
                        <p class="textLarge dataArea_Standings">
                            <span style="width:20%; float:left;"><strong>${result.week.desc}</strong></span> 
                            <span style="width:80%; float:left;"><strong>Game:</strong> ${result.home} vs. ${result.away}</span>
                            <span style="width:20%; float:left;"><strong>Result:</strong> 
                            <c:choose>
                                <c:when test="${not empty result.result}">
                                    ${result.result.homeScore} - ${result.result.awayScore}
                                </c:when>
                                <c:otherwise>
                                    n/a
                                </c:otherwise>
                            </c:choose></span>
                            <span style="width:80%; float:left;"><strong>Win Percent: </strong> 
                            <c:choose>
                                <c:when test="${not empty result.winPercent}">
                                    <fmt:formatNumber value="${result.winPercent}" pattern="0.00"/>%
                                </c:when>
                                <c:otherwise>
                                    n/a
                                </c:otherwise>
                            </c:choose></span>
                        </p>
                        <br />
                    </c:if>
                    <tc-webtag:listSelect name="game" styleClass="dropdown" onChange="document.resultsForm.submit()"
                        list="${games}" useTopValue="false"/>
                    <br/><br/>
                    <jsp:include page="pagination.jsp">
                        <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                        <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                        <jsp:param name="totalSize" value="${totalSize}" />
                        <jsp:param name="numRecords" value="${nr}" />
                        <jsp:param name="numPage" value="${np}" />
                        <jsp:param name="formName" value="document.resultsForm"/>
                    </jsp:include> 
                    <jsp:include page="gamePredictionTable.jsp"/>
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
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                There are no game details to show.
            </c:otherwise>
         </c:choose>
     </div>        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>
