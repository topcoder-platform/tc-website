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
                  <div class="form-content">
                    <c:if test="${myProfile}">
                        <dl>
                            <dt>Member Name:</dt>
                            <dd>${member.handle}</dd>
                        </dl>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty member.overallRank}">
                            <dl>
                                <dt>Overall Rank:</dt>
                                <dd>${member.overallRank} of ${member.totalRankedMembers}</dd>
                            </dl>
                              <dl>
                                <dt>Points:</dt>
                                <dd>${member.overallPoints} points</dd>
                            </dl>
                              <dl>
                                <dt>Highest Overall Rank:</dt>
                                <dd>${member.highestOverallRank} (${member.highestOverallRankWeek})</dd>
                              </dl>
                            <dl>
                                <dt>Highest Weekly Rank:</dt>
                                <dd>${member.highestWeeklyRank} (${member.highestWeeklyRankWeek} - ${member.highestWeeklyRankPoints} points)</dd>
                            </dl>
                              <dl>
                                <dt>Win Percentage:</dt>
                                <dd><fmt:formatNumber value="${member.winPercent}" pattern="0.00"/>%</dd>
                              </dl>
                        </c:when>
                        <c:otherwise>
                              <dl>
                                <dt>There are no statistics to show</dt>
                              </dl>
                        </c:otherwise> 
                    </c:choose>                    
<%--                  <dl>
                        <dt>Prizes/Awards Won:</dt>
                        <dd>Closest Score Award Weekly Top 3</dd>
                      </dl>

                      <dl>
                        <dt>Total Prizes Money:</dt>
                        <dd>$36.600</dd>
                      </dl> --%>
                  </div>
                </div>
                <%--<div class="right-content">
                    <h2>Performance vs Community</h2>

                    <table width="90%" border="0" cellpadding="0" cellspacing="0" class="current-data">
                    <tr class="normalTH">
                      <th>Rank</th>
                      <th>Handle</a></th>
                      <th>Win %</th>
                      <th>Points</th>
                    </tr>

                    <tr>
                      <td>6</td>
                      <td><a href="#">LeadersAverage</a></td>
                      <td >68%</td>
                      <td >1287</td>
                    </tr>
                    <tr>

                      <td>10</td>
                      <td class="alt">chekm8</td>
                      <td >61%</td>
                      <td >984</td>
                    </tr>
                    <tr>
                      <td>38</td>

                      <td><a href="#">ConsensusPicks</a></td>
                      <td >58%</td>
                      <td >932</td>
                    </tr>
                  </table>
                </div>--%>
                
            </div>
            <div class="tab-navigation" id="inner-tab-navigation">
                <ul>
                    <c:forEach begin="${1}" end="${15}" step="${1}" var="i"> 
                        <li class="small ${i+67==week?'selected':''}">
                            <c:choose>
                                <c:when test="${maxWeek >= i+67}">
                                    <a href="javascript:changeWeek(${i+67})">
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
                    <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
                    <tc-webtag:hiddenInput name="${numPage}" value="${np}"/>
                    <tc-webtag:hiddenInput name="week" value="${week}"/>
                    <br/><br/>
                    <c:if test="${not empty weekStats}">
                        <p class="textLarge">
                            <strong>${weekStats.weekName} Totals: &nbsp;&nbsp;&nbsp;&nbsp;Rank:</strong> ${weekStats.rank} of ${weekStats.maxRank}
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;Win Percentage:</strong> <fmt:formatNumber value="${weekStats.winPercent}" pattern="0.00"/>%
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;Points:</strong> ${weekStats.points}
                        </p>
                    </c:if>
                    <jsp:include page="pagination.jsp">
                        <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                        <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                        <jsp:param name="totalSize" value="${totalSize}" />
                        <jsp:param name="numRecords" value="${nr}" />
                        <jsp:param name="numPage" value="${np}" />
                        <jsp:param name="formName" value="document.resultsForm"/>
                    </jsp:include>
                    <jsp:include page="predictionTable.jsp"/>
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
                </c:when>
                <c:otherwise>
                    There are no results to show.
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
