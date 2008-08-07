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
        <div class="sub-navigation"><a href="?module=ManageMyAlgorithms">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> | <a href="?module=ViewLastPredicitions">Current Algorithm's Predictions</a> | <a href="?module=ViewQueue">Queue Status</a></div>
        <h1>Example Results</h1>
          
        <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId="${cr}"/></span>
        <br/>
        <span class="bodySubtitle">Submission: <a href="?module=ViewProblemSolution&rd=${rd}&subnum=${subnum}">${subnum}</a></span>
        <br/>
        <hr/>

            
            <h2>Score: ${result.score}
                Run Time: ${result.processingTime} ms
            </h2>
            <p>
                <span class="bodySubtitle">Example Case: </span><br />
                <pre>${result.arg}</pre>
            </p>
            <p>
                <span class="bodySubtitle">Fatal Errors: </span><br />
                <pre><c:out value="${result.fatalErrors}"/></pre>
            </p>
            <p>
                <span class="bodySubtitle">Standard Out: </span><br />
                <pre><c:out value="${result.stdOut}"/></pre>
            </p>
            <p>
                <span class="bodySubtitle">Standard Error: </span><br />
                <pre><c:out value="${result.stdErr}"/></pre>
            </p>
            <p>
            <span class="bodySubtitle">Result: </span><br/><br/>

                <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewExampleResults"/>
                <tc-webtag:hiddenInput name="rd"/>
                <tc-webtag:listSelect name="week" styleClass="dropdown" onChange="document.resultsForm.submit()"
                    list="${weekNames}" useTopValue="true"/>

                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
                  <tr class="resultTH">
                    <th scope="col"><a href="#">Home Team</a></th>
                    <th scope="col"><a href="#">Away Team</a></th>
                    <th scope="col" class="center">Pred. Score</th>
                    <th scope="col" class="center">Actual Score</th>

                    <th scope="col" class="center"><a href="#">Picked Winner</a></th>
                    <th scope="col" class="center"><a href="#">Total Score Variance</a></th>
                    <th scope="col" class="center"><a href="#">Victory Margin Variance</a></th>
                    <th scope="col" class="center"><a href="#">Points</a></th>
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
                          <td class="alignCenter">${predictionItem.predictedResult.homeScore}-${predictionItem.predictedResult.awayScore}</td>
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
                                        (x)
                                  </c:when>
                                  <c:otherwise>
                                        &nbsp;
                                  </c:otherwise>
                              </c:choose>
                          </td>
                          <td class="alignCenter">12</td>
                          <td class="alignCenter">4</td>
                          <td class="alignCenter">${predictionItem.score}</td>
                      </tr>
                    <%even = !even;%>
                  </c:forEach>
                </table>
            </p>
            <hr />
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
