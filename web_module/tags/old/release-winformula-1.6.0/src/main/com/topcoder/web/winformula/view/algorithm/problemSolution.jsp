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
                java.util.Date,
                com.topcoder.web.common.StringUtils,
                java.util.StringTokenizer"
        %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Problem Solution</title>
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

<%!
    private String addSpace(String text) {
        int i = -1;
        text = StringUtils.htmlEncode(text);
        while ((i = text.indexOf("\n\n")) >= 0) {
            text = text.substring(0, i + 1) + "&#160;" + text.substring(i + 1);

        }

        StringTokenizer strtok = new StringTokenizer(text, "\n");
        StringBuffer stBuffer = new StringBuffer(text.length());
        String sTemp = "";
        while (strtok.hasMoreTokens()) {
            sTemp = strtok.nextToken();
            boolean inTag = false;
            for (i = 0; i < sTemp.length(); i++) {
                if (!inTag && sTemp.charAt(i) == '<') {
                    inTag = true;
                }
                if (inTag && sTemp.charAt(i) == '>') {
                    inTag = false;
                }
                if (!inTag && sTemp.charAt(i) == ' ') {
                    stBuffer.append("&#160;");
                } else {
                    stBuffer.append(sTemp.charAt(i));
                }
            }
            stBuffer.append("<br />");
        }
        return stBuffer.toString();
    }
%>

        <jsp:useBean id="submission" class="com.topcoder.server.ejb.TestServices.LongSubmissionData" scope="request"/>

        <div class="sub-navigation"><a href="?module=ManageMyAlgorithms${adminExtraParams}">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a>  | <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a> | <a href="?module=ViewQueue">Queue Status</a></div>
        <h1>Problem Solution</h1>
          
        <span class="bodySubtitle">Coder: <tc-webtag:handle context='marathon_match' coderId="${cr}"/></span>
        <br />
        <span class="bodySubtitle">Submission: ${submission.number}</span>
        <br />
        <hr>
        <div class="problemText" style="color:black">
             <%=addSpace(submission.getText())%>
        </div>
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
