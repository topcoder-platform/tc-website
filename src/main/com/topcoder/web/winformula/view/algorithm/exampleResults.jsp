<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow,
                com.topcoder.web.winformula.algorithm.CodingConstants,
                java.util.Date"
        %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Example Results</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="/nav.jsp">
        <jsp:param name="tabLev1" value="manage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        <div class="sub-navigation"><a href="?module=ManageMyAlgorithms${adminExtraParams}">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> | <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a> | <a href="?module=ViewQueue">Queue Status</a></div>
        <h1>Example Results</h1>
          
        <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId="${cr}"/></span>
        <br />
         <c:choose>
              <c:when test="${not empty result}">
    
            <span class="bodySubtitle">Submission: <a href="?module=ViewProblemSolution&amp;rd=${rd}&amp;subnum=${subnum}${adminExtraParams}">${subnum}</a></span>
            <br />
            <hr/>
    
                
                <h2>Score: ${result.score}
                    Run Time: ${result.processingTime} ms
                </h2>
                <div>
                    <strong>Example Case: </strong><br />
                    <pre>${result.arg}</pre>
                </div>
                <br />
                <div>
                    <strong>Fatal Errors: </strong><br />
                    <pre><c:out value="${result.fatalErrors}"/></pre>
                </div>
                <br />
                <div>
                <strong>Result: </strong><br /><br />
    
                  <c:choose>
                      <c:when test="${not empty result and not empty result.resultObject}">
                            <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
                            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewExampleResults"/>
                            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
                            <tc-webtag:hiddenInput name="cr" value="${cr}"/>
                            <tc-webtag:hiddenInput name="rd"/>
                            <tc-webtag:listSelect name="week" styleClass="dropdown" onChange="document.resultsForm.submit()"
                                list="${weeks}" useTopValue="false"/>
            
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
                              <tr class="resultTH">
                                <th scope="col"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Home Team</a></th>
                                <th scope="col"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Away Team</a></th>
                                <th scope="col" class="center">Pred. Score</th>
                                <th scope="col" class="center">Actual Score</th>
                                <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Picked Winner</a></th>
                                <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="4" includeParams="true"/>">Total Score Variance</a></th>
                                <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="5" includeParams="true"/>">Victory Margin Variance</a></th>
                                <th scope="col" class="center"><a href="${sessionInfo.servletPath}?<tc-webtag:sort column="6" includeParams="true"/>">Points</a></th>
                              </tr>
                              <% boolean even = true;%>
                              <c:forEach items="${result.resultObject.predictions}" var="predictionItem" varStatus="status">
                                  <tr class="<%=even?"row_Alt":""%>">
                                      <c:choose>
                                          <c:when test="${predictionItem.realResult.homeScore > predictionItem.realResult.awayScore}">
                                                <td><strong class="green">${predictionItem.homeTeamName}</strong></td>
                                                <td>${predictionItem.awayTeamName}</td>
                                          </c:when>
                                          <c:when test="${predictionItem.realResult.homeScore < predictionItem.realResult.awayScore}">
                                                <td>${predictionItem.homeTeamName}</td>
                                                <td><strong class="green">${predictionItem.awayTeamName}</strong></td>
                                          </c:when>
                                          <c:when test="${not empty predictionItem.realResult and predictionItem.realResult.homeScore == predictionItem.realResult.awayScore}">
                                                <td><strong class="green">${predictionItem.homeTeamName}</strong></td>
                                                <td><strong class="green">${predictionItem.awayTeamName}</strong></td>
                                          </c:when>
                                          <c:otherwise>
                                                <td>${predictionItem.homeTeamName}</td>
                                                <td>${predictionItem.awayTeamName}</td>
                                          </c:otherwise>
                                      </c:choose>
                                      <td class="alignCenter">
                                            <c:choose>
                                              <c:when test="${not empty predictionItem.predictedResult}">
                                                    ${predictionItem.predictedResult.homeScore}-${predictionItem.predictedResult.awayScore}
                                              </c:when>
                                              <c:otherwise>
                                                    &nbsp;
                                              </c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignCenter">
                                          <c:choose>
                                              <c:when test="${not empty predictionItem.realResult}">
                                                    ${predictionItem.realResult.homeScore}-${predictionItem.realResult.awayScore}
                                              </c:when>
                                              <c:otherwise>
                                                    &nbsp;
                                              </c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignCenter">
                                          <c:choose>
                                              <c:when test="${predictionItem.pickedWinner}">
                                                    <img src="/i/tournament/tco08/iconAdvanced.png" alt="Good Prediction"/>
                                              </c:when>
                                              <c:otherwise>
                                                    <img src="/i/tournament/tco08/iconEliminated.png" alt="Bad Prediction" />
                                              </c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignCenter">
                                          <c:choose>
                                          <c:when test="${not empty predictionItem.realResult}">
                                                ${predictionItem.totalScoreVariance}
                                          </c:when>
                                          <c:otherwise>
                                                &nbsp;
                                          </c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignCenter">
                                          <c:choose>
                                          <c:when test="${not empty predictionItem.realResult}">
                                                ${predictionItem.victoryMarginVariance}
                                          </c:when>
                                          <c:otherwise>
                                                &nbsp;
                                          </c:otherwise>
                                          </c:choose>
                                      </td>
                                      <td class="alignCenter">${predictionItem.score}</td>
                                  </tr>
                                <%even = !even;%>
                              </c:forEach>
                            </table>
                            </form>
                      </c:when>
                      <c:otherwise>
                            There are no results to display.
                      </c:otherwise>
                  </c:choose>
                </div>
                <br />
                <div>
                    <strong>Standard Out: </strong><br />
                    <pre><c:out value="${result.stdOut}"/></pre>
                </div>
                <br />
                <div>
                    <strong>Standard Error: </strong><br />
                    <pre><c:out value="${result.stdErr}"/></pre>
                </div>

                <hr />
              </c:when>
              <c:otherwise>
                    There are no results to display.
              </c:otherwise>
          </c:choose>
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>
        
<%-- End Wrapper --%>        
</div>
</body>
</html>
