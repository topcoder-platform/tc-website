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
            <div class="sub-navigation"> <a href="?module=ManageMyAlgorithms${adminExtraParams}">Manage My Algorithms</a> | <a href="?module=Submit">Submit</a> |
            <c:choose>
                <c:when test="${empty round}">
                    Current Algorithm's Predictions
                </c:when>
                <c:otherwise>
                    <a href="?module=ViewLastPredictions${adminExtraParams}">Current Algorithm's Predictions</a>
                </c:otherwise>
            </c:choose> 
            | <a href="?module=ViewQueue">Queue Status</a></div>
            <c:choose>
                <c:when test="${empty round}">
                    <h1>Current Algorithm's predictions</h1>
                </c:when>
                <c:otherwise>
                    <h1>View Picks</h1>
                </c:otherwise>
            </c:choose> 
            <c:if test="${not empty algoDate}">
            <h2>Predictions based on your algorithm uploaded on <tc-webtag:format object="${algoDate}" format="MM.dd.yyyy HH:mm:ss"/></h2>
            </c:if>
            <div class="dataArea" style="width:100%;">
             <c:choose>
                <c:when test="${not empty result}">

                    <!-- Prepares some collection data and formatter -->
                    <% boolean even = true;%>
                    <form name="resultsForm" action="${sessionInfo.servletPath}" method="get">
                    <c:choose>
                        <c:when test="${not empty round}">
                            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewPicks"/>
                        </c:when>
                        <c:otherwise>
                            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewLastPredictions"/>
                        </c:otherwise>
                    </c:choose>
                    <tc-webtag:hiddenInput name="${sortCol}"/>
                    <tc-webtag:hiddenInput name="${sortDir}"/>
                    <tc-webtag:hiddenInput name="cr" value="${cr}"/>
                    <tc-webtag:hiddenInput name="${numRecords}" value="${nr}"/>
                    <tc-webtag:hiddenInput name="${numPage}" value="${np}"/>
                    <tc-webtag:hiddenInput name="rd" value="${round}"/>
        
                    <tc-webtag:listSelect name="week" styleClass="dropdown" onChange="document.resultsForm.submit()"
                        list="${weeks}" useTopValue="false"/>
                        
                    <jsp:include page="../pagination.jsp">
                        <jsp:param name="croppedDataBefore" value="${croppedDataBefore}" />
                        <jsp:param name="croppedDataAfter" value="${croppedDataAfter}" />
                        <jsp:param name="totalSize" value="${totalSize}" />
                        <jsp:param name="numRecords" value="${nr}" />
                        <jsp:param name="numPage" value="${np}" />
                        <jsp:param name="formName" value="document.resultsForm"/>
                    </jsp:include>

                    <jsp:include page="../predictionTable.jsp"/>
                    </form>
                    <br/>
                    <jsp:include page="../pagination.jsp">
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
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>