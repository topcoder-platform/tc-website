<%@ page import="java.util.Collection" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://software.topcoder.com/taglibs/data_paging" prefix="p" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challange :: Powered by TopCoder - My Profile</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
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
            <h1>Current Algorithm's Predictions</h1>
            <p>Your current algorithm's predictions will not be viewable to other contestants or the public until all contestants algorithms have been locked for the week.</p>
            <p class="hightlight"><strong>Your algorithm submitted on 2008-07-14 at 12:38:45 ET is 7 of 21 in the <a href="manage-algorithms_queue.htm">queue</a>.</strong></p>
            <h2>Predictions based on your algorithm uploaded on 2008-07-09 at 13:45:32 ET</h2>
            <div class="dataArea" style="width:60%;">
              <div class="dataArea_Above">

                <p class="pagination"><span class="disabled">&lt;&lt; First</span> | <span class="disabled">&lt; Prev</span> | <strong>1</strong> <a href="javascript:;">2</a> <a href="javascript:;">3</a> <a href="javascript:;">4</a> <a href="javascript:;">5</a> <a href="javascript:;">6</a> <a href="javascript:;">7</a> <a href="javascript:;">8</a> <a href="javascript:;">9</a> <a href="javascript:;">10</a> | <a href="javascript:;">Next</a> &gt; | <a href="javascript:;">Last</a> &gt;&gt;</p>

                <p class="numResults">show results: <strong>10</strong> | <a href="javascript:;">25</a> | <a href="javascript:;">50</a> | <a href="javascript:;">all</a></p>
              </div>

<!-- Prepares some collection data and formatter -->
<%
com.topcoder.util.format.ObjectFormatter formatter = com.topcoder.util.format.ObjectFormatterFactory.getPlainFormatter();
%>
            <p:dataPaging pageSize="10" data="<%= (Collection) request.getAttribute("list") %>" id="pager">
                <p:firstPageLink defaultText="&lt;&lt; First" />
                <p:prevPageLink defaultText="&lt; Previous" />
                <p:jumpLinks prefix="" suffix="&nbsp;" />
                <p:nextPageLink defaultText="Next &gt;" />
                <p:lastPageLink defaultText="Last &gt;&gt;" />
        
                <p:ifEmpty>
                    No search results were found
                </p:ifEmpty>
                <p:page>
                    <p:table sorting="true" groupSpan="1" renderer="GroupSpan" rowCommands="Delete" 
                        commandHandler="handleRowDeletion">
                        <!-- Display the table header, with column names as links -->
                        <p:header>
                            <p:column name="Home Team" index="1" />
                            <p:column name="Away Team" index="2" />
                            <p:column name="Pred. Score" index="3" />
                        </p:header>
            
                        <!-- Display the tabular data -->
                        <p:rowData />
                    </p:table>            
                </p:page>
            
            </p:dataPaging>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
                <tr>
                  <th scope="col"><a href="${sessionInfo.servletPath}?module=CurrentPredictions<tc-webtag:sort column="5" includeParams="true" excludeParams="module"/>">Home Team</a></th>
                  <th scope="col"><a href="${sessionInfo.servletPath}?module=CurrentPredictions<tc-webtag:sort column="7" includeParams="true" excludeParams="module"/>">Away Team</a></th>
                  <th scope="col">Pred. Score</th>
                </tr>
                <% boolean even = true;%>
                <rsc:iterator list="${results}" id="resultRow">
                    <tr class="<%=even?"row_Alt":""%>">
                      <c:choose>
                          <c:when test="${resultRow.map['home_pred'] > resultRow.map['visitor_pred']}">
                              <td><strong>${resultRow.map['home']}</strong></td>
                              <td class="alt">${resultRow.map['visitor']}</td>
                          </c:when>
                          <c:when test="${resultRow.map['home_pred'] < resultRow.map['visitor_pred']}">
                              <td class="alt">${resultRow.map['home']}</td>
                              <td><strong>${resultRow.map['visitor']}</strong></td>
                          </c:when>
                          <c:otherwise>
                              <td><strong>${resultRow.map['home']}</strong></td>
                              <td><strong>${resultRow.map['visitor']}</strong></td>
                          </c:otherwise>
                      </c:choose>
                      <td class="alignCenter">${resultRow.map['home_pred']}-${resultRow.map['visitor_pred']}</td>
                    </tr>
                    <%even = !even;%>
                </rsc:iterator>
              </table>
              <div class="dataArea_Below">
                <p class="pagination"><span class="disabled">&lt;&lt; First</span> | <span class="disabled">&lt; Prev</span> | <strong>1</strong> <a href="javascript:;">2</a> <a href="javascript:;">3</a> <a href="javascript:;">4</a> <a href="javascript:;">5</a> <a href="javascript:;">6</a> <a href="javascript:;">7</a> <a href="javascript:;">8</a> <a href="javascript:;">9</a> <a href="javascript:;">10</a> | <a href="javascript:;">Next</a> &gt; | <a href="javascript:;">Last</a> &gt;&gt;</p>

                <p class="numResults">show results: <strong>10</strong> | <a href="javascript:;">25</a> | <a href="javascript:;">50</a> | <a href="javascript:;">all</a></p>
                </div>
              </div>

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