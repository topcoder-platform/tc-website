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
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - View Queue</title>
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
        <div class="sub-navigation"><a href="?module=ManageMyAlgorithms">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> | <a href="?module=ViewLastPredicitions">Current Algorithm's Predictions</a> | Queue Status</div>
        <h1>Queue Status</h1>
            <% java.util.Map roundTypes = (java.util.Map) request.getAttribute("roundTypes"); %>
            <jsp:useBean id="result" type="java.util.List" scope="request"/>
            <jsp:useBean id="systemTestCount" type="java.lang.Number" scope="request"/>

        
            <logic:notEqual name="systemTestCount" value="0">
                <p align="center">System Tests Remaining: <strong>${systemTestCount}</strong></p>
            </logic:notEqual>    

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="stat">
            <tbody>
                <tr>
                    <td class="title" colspan="6">Queue Status</td>
                </tr>
                <tr>
                    <td class="header">
                        Handle
                    </td>
                    <td class="header">
                        Contest
                    </td>
                    <td class="header">
                        Language
                    </td>
                    <td class="headerC">
                        Entered Queue
                    </td>
                    <td class="headerR">
                        Type
                    </td>
                    <td class="headerR">
                        Tests Remaining
                    </td>
                </tr>
                <% if (result.isEmpty()) { %>
                <tr class="light">
                    <td colspan="6" class="valueC">
                        <div align="center" style="margin: 40px 0px 40px 0px;">
                            There are currently no submissions in the queue.
                        </div>
                    </td>
                </tr>
                <% } %>
                <%boolean even = true;%>
                <logic:iterate collection="<%=result%>" id="resultRow" type="com.topcoder.server.ejb.TestServices.LongTestQueueStatusItem">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value" nowrap="nowrap">
                            <tc-webtag:handle context='marathon_match' coderId='<%=resultRow.getUserId()%>'/>
                        </td>
                        <td class="value" nowrap="nowrap">
                            ${resultRow.roundName}
                         </td>
                        <td class="value" nowrap="nowrap">
                            <%=resultRow.getLanguageName()%>
                        </td>
                        <td class="valueC">
                            <tc-webtag:format object="<%=resultRow.getQueueDate()%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                        </td>
                        <td class="valueR">
                            <%=resultRow.getSubmissionType()%>
                        </td>
                        <td class="valueR">
                            <%=resultRow.getCount()%>
                        </td>
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
