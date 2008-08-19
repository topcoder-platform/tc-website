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
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - My Profile</title>
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
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="profile" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
            <div id="profile-box">
                <h1>My Profile</h1>
                <div class="left-content">
                  <div class="form-content">

                    <dl>
                        <dt>Member Name:</dt>
                        <dd>MyMemberName</dd>
                    </dl>
                    <dl>
                        <dt>Overall Rank:</dt>
                        <dd>10 of 239</dd>

                    </dl>
                      <dl>
                        <dt>Points:</dt>
                        <dd>984 points</dd>
                    </dl>
                      <dl>
                        <dt>Highest Overall Rank:</dt>

                        <dd>7 (week 3)</dd>
                      </dl>
                    <dl>
                        <dt>Highest Weekly Rank:</dt>
                        <dd>2 (week 4 - 298 points)</dd>
                    </dl>
                      <dl>

                        <dt>Win Percentage:</dt>
                        <dd>61%</dd>
                      </dl>
                      <dl>
                        <dt>Prizes/Awards Won:</dt>
                        <dd>Closest Score Award Weekly Top 3</dd>
                      </dl>

                      <dl>
                        <dt>Total Prizes Money:</dt>
                        <dd>$36.600</dd>
                      </dl>
                  </div>
                </div>
                <div class="right-content">
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
                </div>
                
            </div>

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
                <jsp:param name="numRecords" value="${nr}" />
                <jsp:param name="numPage" value="${np}" />
                <jsp:param name="formName" value="document.resultsForm"/>
            </jsp:include>

             <c:choose>
                <c:when test="${not empty result}">
                    <jsp:include page="predictionTable.jsp"/>
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
                <jsp:param name="numRecords" value="${nr}" />
                <jsp:param name="numPage" value="${np}" />
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
