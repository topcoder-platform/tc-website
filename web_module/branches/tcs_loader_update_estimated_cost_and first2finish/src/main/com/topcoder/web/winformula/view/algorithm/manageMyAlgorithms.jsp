<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow,
                com.topcoder.web.winformula.algorithm.CodingConstants,
                java.util.Date"

        %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="rounds" type="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" scope="request"/>
<jsp:useBean id="submissions" type="java.util.List" scope="request" />
<%
ResultSetRow currentRound = (ResultSetRow) request.getAttribute("currentRound");
ResultSetRow nextRound = (ResultSetRow) request.getAttribute("nextRound"); 
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Manage My Algorithms</title>
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
            <div class="sub-navigation"> Manage My Algorithms | <a href="?module=Submit">Submit</a> | <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a> | <a href="?module=ViewQueue">Queue Status</a></div>
            <h1>Manage My Algorithms</h1>
            <br />
            <h2>
            <c:choose>
                <c:when test="${currentRound != null}">Submission period for ${currentRound.map['name']} ends at <tc-webtag:format object="${currentRound.map['end_time']}" format="MM.dd.yyyy HH:mm:ss"/></c:when>
                <c:when test="${nextRound != null}">Submission period for ${nextRound.map['name']} starts at <tc-webtag:format object="${nextRound.map['start_time']}" format="MM.dd.yyyy HH:mm:ss"/></c:when>
                <c:otherwise>Submission period has finished.</c:otherwise>
            </c:choose>
            </h2>
            <p>&nbsp;</p>
            <hr />
            <p>&nbsp;</p>
                <h2>Your Algorithm History</h2>
                <table class="stat" width="100%">
                    <thead>
                        <tr class="resultTH">
                            <th class="center">Number</th>
                            <th class="center">Submitted Time</th>
                            <th class="center">Season</th>
                            <th class="center">Prediction target</th>
                            <th class="center">Examples</th>
                            <th class="center">&nbsp;</th>
                            <th class="center">Accuracy</th>
                            <th class="center">Picks</th>
                        </tr>
                    </thead>
                    <tbody>
                         <c:set var="prvNum" value="-1" />
                        <%boolean even = true;%> 
                        <logic:iterate name="submissions" id="submission" type="com.topcoder.web.winformula.algorithm.services.SubmissionHistoryItem">
                        <tr class="<%=even?"light":"dark"%>">
                            <c:set var="roundSubmission" value="rd=${submission.roundId}&amp;subnum=${submission.number}"/>
                            <c:choose>
                                <c:when test="${prvNum eq submission.number}">
                                    <td class="alignCenter">&nbsp;</td>
                                    <td class="alignCenter">&nbsp;</td>
                                    <td class="alignCenter">&nbsp;</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="alignCenter"><a href="?module=ViewProblemSolution&amp;${roundSubmission}${adminExtraParams}">${submission.number}</a></td>
                                    <td class="alignCenter"><tc-webtag:format object="${submission.time}" format="MM.dd.yyyy HH:mm:ss"/></td>
                                    <c:set var="prvRoundName" value="previousRoundName${submission.roundId}"/>
                                    <td class="alignCenter">${requestScope[prvRoundName]}</td>
                                </c:otherwise>
                            </c:choose>
                            <c:set var="prvNum" value="${submission.number}"/>
                            <td class="alignCenter">
                                ${submission.roundName}
                            </td>
                            <td class="alignCenter">
                                <c:if test="${submission.example}">
                                    <a href="?module=ViewExampleResults&amp;rd=${submission.roundId}${adminExtraParams}">Example Results</a>
                                </c:if>
                                &nbsp;
                            </td>
                            <td class="alignCenter">
                                <c:if test="${submission.lockedIn}">
                                   <img src="/i/events/winformula/interface/lock.png" alt="Locked submission"/>
                                </c:if>
                                <c:if test="${submission.inQueue}">
                                   <img src="/i/events/winformula/interface/testing.png" alt="In Queue"/>
                                </c:if>
                                &nbsp;
                            </td>
                            <c:choose>
                                <c:when test="${submission.lockedIn}">
                                    <td class="alignCenter"><c:if test="${submission.accuracy != -1}">${submission.accuracy}</c:if>&nbsp;</td>
                                    <td class="alignCenter"><c:if test="${submission.hasPrediction}"><a href="?module=ViewPicks&amp;rd=${submission.roundId}${adminExtraParams}">View Picks</a></c:if>&nbsp;</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="alignCenter">&nbsp;</td>
                                    <td class="alignCenter">&nbsp;</td>
                                </c:otherwise>
                            </c:choose>
                            
                        </tr>
                        <%even = !even;%>
                        </logic:iterate>
                    </tbody>
                </table>
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
