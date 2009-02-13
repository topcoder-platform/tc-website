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


<c:set value="<%=Constants.WISDOM_ALL%>" var="WisdomOfAllId"/>
<c:set value="<%=Constants.WISDOM_BEST%>" var="WisdomOfTheBestId"/>

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
    <c:choose>
        <c:when test="${myProfile}">
            <title>ESPN Winning Formula Challenge :: Powered by TopCoder - My Profile</title>
        </c:when>
        <c:otherwise>
            <title>ESPN Winning Formula Challenge :: Powered by TopCoder - View Profile</title>
        </c:otherwise>
    </c:choose>
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
    
    <c:choose>
        <c:when test="${myProfile}">
            <jsp:include page="nav.jsp">
            <jsp:param name="tabLev1" value="profile" />
            <jsp:param name="tabLev2" value="" />
            <jsp:param name="tabLev3" value="" />
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="nav.jsp">
            <jsp:param name="tabLev1" value="standings" />
            <jsp:param name="tabLev2" value="" />
            <jsp:param name="tabLev3" value="" />
            </jsp:include>
        </c:otherwise>
    </c:choose>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
            <div id="profile-box">
                <c:choose>
                    <c:when test="${myProfile}">
                        <h1>My Profile</h1>
                    </c:when>
                    <c:otherwise>
                        <h1>${member.handle}</h1>
                    </c:otherwise>
                </c:choose>
                <div class="left-content">
                  <table width="90%" border="0" cellpadding="0" cellspacing="0" class="stat">
                    <c:if test="${myProfile}">
                        <tr>
                          <td width="55%"><strong>Member Name:</strong></td>
                          <td width="45%">${member.handle}</td>
                        </tr>
                    </c:if>
                    <tr>
                      <td><strong>Overall Rank:</strong></td>
                      <td>
                        <c:choose>
                            <c:when test="${not empty member.overallRank}">
                                ${member.overallRank} of ${member.totalRankedMembers}
                            </c:when>
                            <c:otherwise>
                                n/a
                            </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td><strong>Points:</strong></td>
                      <td>
                        <c:choose>
                            <c:when test="${not empty member.overallPoints}">
                                ${member.overallPoints} points
                            </c:when>
                            <c:otherwise>
                                n/a
                            </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td><strong>Highest Overall Rank:</strong></td>
                      <td>
                        <c:choose>
                            <c:when test="${not empty member.highestOverallRank}">
                                ${member.highestOverallRank} (${member.highestOverallRankWeek})
                            </c:when>
                            <c:otherwise>
                                n/a
                            </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td><strong>Highest Weekly Rank:</strong></td>
                      <td>
                        <c:choose>
                            <c:when test="${not empty member.highestWeeklyRank}">
                                ${member.highestWeeklyRank} (${member.highestWeeklyRankWeek} - ${member.highestWeeklyRankPoints} points)
                            </c:when>
                            <c:otherwise>
                                n/a
                            </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tr>
                      <td><strong>Win Percentage:</strong></td>
                      <td>
                        <c:choose>
                            <c:when test="${not empty member.winPercent}">
                                <fmt:formatNumber value="${member.winPercent}" pattern="0.00"/>%
                            </c:when>
                            <c:otherwise>
                                n/a
                            </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                      <c:if test="${not empty member.achievements}">
                        <tr>
                          <td valign="top"><strong>Prizes/Awards Won:</strong></td>
                          <td>
                            <c:forEach items="${member.achievements}" var="achievement">
                                ${achievement}<br/>
                            </c:forEach>
                          </td>
                        </tr>
                      </c:if>
                      <c:if test="${not empty member.totalPrizes}">
                        <tr>
                          <td><strong>Total Prizes/Awards Won:</strong></td>
                          <td><fmt:formatNumber value="${member.totalPrizes}" type="currency" currencySymbol="$"/></td>
                        </tr>
                      </c:if>
                  </table>
                </div>
                <div class="right-content">
                    <h2>Performance vs Community</h2>

                    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="stat">
                    <tr>
                      <th>Rank</th>
                      <th>Handle</th>
                      <th>Win %</th>
                      <th>Points</th>
                    </tr>
                      <c:choose>
                        <c:when test="${not empty performance}">
                          <c:forEach items="${performance}" var="standingsItem">
                            <tr>
                              <td>${standingsItem.rank}</td>
                              <td>
                                <c:choose>
                                    <c:when test="${standingsItem.coderId == WisdomOfAllId || standingsItem.coderId == WisdomOfTheBestId}">
                                        <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile&amp;cr=${standingsItem.coderId}&amp;week=${week}">${standingsItem.handle}</a>
                                    </c:when>
                                    <c:otherwise>
                                        ${standingsItem.handle} 
                                    </c:otherwise>
                                </c:choose>
                              </td>
                              <td><fmt:formatNumber value="${standingsItem.winPercent}" pattern="0.00"/> %</td>
                              <td><fmt:formatNumber value="${standingsItem.points}" pattern="0"/></td>
                            </tr>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                              <td colspan="4">There are no results to show.</td>
                            </tr>
                        </c:otherwise>
                      </c:choose>
                  </table>
                </div>
            </div>
            <div class="tab-navigation" id="inner-tab-navigation">
                <ul>
                    <c:forEach begin="${1}" end="${15}" step="${1}" var="i"> 
                        <li class="small ${i+firstWeekId-1==week?'selected':''}">
                            <c:choose>
                                <c:when test="${maxWeek >= i+firstWeekId-1}">
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
            <div class="dataArea" style="width:100%;">
             <c:choose>
                <c:when test="${not empty result}">
                    <!-- Prepares some collection data and formatter -->
                        <% boolean even = true;%>
                    <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewProfile"/>
                    <tc-webtag:hiddenInput name="${sortCol}"/>
                    <tc-webtag:hiddenInput name="${sortDir}"/>
                    <tc-webtag:hiddenInput name="cr" value="${cr}"/>
<%--                    <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
                    <tc-webtag:hiddenInput name="${numPage}" value="${np}"/> --%>
                    <tc-webtag:hiddenInput name="week" value="${week}"/>
                    <br/><br/>
                    <c:if test="${not empty weekStats}">
                        <p class="textLarge">
                            <strong>${weekStats.weekName} Totals: &nbsp;&nbsp;&nbsp;&nbsp;Rank:</strong> 
                            <c:choose>
                                <c:when test="${not empty weekStats.rank}">
                                    ${weekStats.rank} of ${weekStats.maxRank}
                                </c:when>
                                <c:otherwise>
                                    n/a
                                </c:otherwise>
                            </c:choose>
                            
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;Win Percentage:</strong> 
                            <c:choose>
                                <c:when test="${not empty weekStats.winPercent}">
                                    <fmt:formatNumber value="${weekStats.winPercent}" pattern="0.00"/>%
                                </c:when>
                                <c:otherwise>
                                    n/a
                                </c:otherwise>
                            </c:choose>
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;Points:</strong> 
                            <c:choose>
                                <c:when test="${not empty weekStats.points}">
                                    ${weekStats.points}
                                </c:when>
                                <c:otherwise>
                                    n/a
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </c:if>
<%--                     <jsp:include page="pagination.jsp">
                        <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                        <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                        <jsp:param name="totalSize" value="${totalSize}" />
                        <jsp:param name="numRecords" value="${nr}" />
                        <jsp:param name="numPage" value="${np}" />
                        <jsp:param name="formName" value="document.resultsForm"/>
                    </jsp:include> --%>
                    <jsp:include page="predictionTable.jsp"/>
                    </form>
                    <br/>
<%--                    <jsp:include page="pagination.jsp">
                        <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                        <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                        <jsp:param name="totalSize" value="${totalSize}" />
                        <jsp:param name="numRecords" value="${nr}" />
                        <jsp:param name="numPage" value="${np}" />
                        <jsp:param name="formName" value="document.resultsForm"/>
                    </jsp:include>--%>
                    <p>&nbsp;</p>
                </c:when>
                <c:otherwise>
                    There are no results to show.
                </c:otherwise>
             </c:choose>
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
