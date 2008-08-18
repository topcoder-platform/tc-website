<%@ page import="java.util.Collection" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.util.format.ObjectFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>


<c:set value="<%=DataAccessConstants.NUMBER_PAGE%>" var="numPage"/>
<c:set value="<%=DataAccessConstants.SORT_COLUMN%>" var="sortCol"/>
<c:set value="<%=DataAccessConstants.SORT_DIRECTION%>" var="sortDir"/>
<c:set value="<%=DataAccessConstants.NUMBER_RECORDS%>" var="numRecords"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Manage My Algorithms</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="../nav.jsp">
        <jsp:param name="tabLev1" value="manage" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
            <div class="sub-navigation"> <a href="?module=ManageMyAlgorithms${adminExtraParams}">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> | Current Algorithm's Predictions | <a href="?module=ViewQueue">Queue Status</a></div>
            <h1>Current Algorithm's predictions</h1>
            <p>Your current algorithm's predictions will not be viewable to other contestants or the public until all contestants algorithms have been locked for the week.</p>
            <p class="hightlight"><strong>Your algorithm submitted on 2008-07-14 at 12:38:45 ET is 7 of 21 in the <a href="manage-algorithms_queue.htm">queue</a>.</strong></p>
            <h2>Predictions based on your algorithm uploaded on 2008-07-09 at 13:45:32 ET</h2>
            <div class="dataArea" style="width:100%;">

<!-- Prepares some collection data and formatter -->
                <% boolean even = true;%>
            <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewLastPredictions"/>
            <tc-webtag:hiddenInput name="${sortCol}"/>
            <tc-webtag:hiddenInput name="${sortDir}"/>
            <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
            <tc-webtag:hiddenInput name="${numPage}" value="${np}"/>

            <tc-webtag:listSelect name="week" styleClass="dropdown" onChange="document.resultsForm.submit()"
                list="${weeks}" useTopValue="false"/>
                
            <jsp:include page="../pagination.jsp">
                <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                <jsp:param name="totalSize" value="${totalSize}" />
                <jsp:param name="numRecords" value="${numRecords}" />
                <jsp:param name="numPage" value="${numPage}" />
                <jsp:param name="formName" value="document.resultsForm"/>
            </jsp:include>

             <c:choose>
                <c:when test="${not empty result}">
                    <jsp:include page="predictionTable.jsp">
                        <jsp:param name="predictions" value="${result.resultObject.predictions}" />
                    </jsp:include>
                </c:when>
                <c:otherwise>
                    There are no results to show.
                </c:otherwise>
             </c:choose>
    
            </form>
            <br/>
            <jsp:include page="../pagination.jsp">
                <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                <jsp:param name="totalSize" value="${totalSize}" />
                <jsp:param name="numRecords" value="${numRecords}" />
                <jsp:param name="numPage" value="${numPage}" />
                <jsp:param name="formName" value="document.resultsForm"/>
            </jsp:include>
            <p>&nbsp;</p>
        </div>
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>