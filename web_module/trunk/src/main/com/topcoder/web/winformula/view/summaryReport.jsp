<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
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
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Submission Summary Report</title>
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

<jsp:useBean id="lastActiveRound" type="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow" scope="request"/>
<jsp:useBean id="lastActiveRound" type="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow" scope="request"/>

            <div class="sub-navigation"><a href="?module=ManageMyAlgorithms${adminExtraParams}">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> <%-- | <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a> --%>| <a href="?module=ViewQueue">Queue Status</a></div>
            <h1>Submission Summary Report</h1>
          
            <span class="bodySubtitle">Season: <tc-webtag:handle context='marathon_match' coderId="${cr}"/></span>
            <br />

            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
              <tr class="resultTH">
                <th scope="col">Handle</th>
                <th scope="col">Submission Number</th>
                <th scope="col" class="right">Score</th>
                <th scope="col" class="center">Submission Date</th>
              </tr>
              <% boolean even = true;%>
              <rsc:iterator list="${report}" id="resultRow">
                  <c:set var="roundCoderParams" value="&rd=${lastActiveRound.map['round_id']}&cr=${resultRow.map['user_id']}" />
                  <tr class="<%=even?"row_Alt":""%>">
                        <td><tc-webtag:handle context='marathon_match' coderId="${resultRow.map['user_id']}"/></td>
                        <td><a href="algorithm/module=ViewProblemSolution${roundCoderParams}&subnum=${resultRow.map['submission_number']}">${resultRow.map['submission_number']}</a></td>
                        <td class="right"><a href="algorithm/module=ViewExampleResults&rd=${roundCoderParams]}">${resultRow.map['points']}</td>
                        <td class="alignCenter">
                             <tc-webtag:format object="<%=new Date(resultRow.getLongItem("submit_time"))%>" format="MM.dd.yyyy HH:mm:ss"/>
                        </td>
                  </tr>
                <%even = !even;%>
              </rsc:iterator>
            </table>
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
