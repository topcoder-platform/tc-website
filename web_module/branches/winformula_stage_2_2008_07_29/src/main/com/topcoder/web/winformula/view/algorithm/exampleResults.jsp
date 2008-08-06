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

            
            <logic:iterate name="results" id="result" scope="request" indexId="i" type="com.topcoder.server.ejb.TestServices.LongTestResult">
                <h2>${i}) Score: ${result.score}
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
                <span class="bodySubtitle">Result: </span><br />
                    <pre><c:out value="${result.resultObject}"/></pre>
                </p>
                <hr />
            </logic:iterate>
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
