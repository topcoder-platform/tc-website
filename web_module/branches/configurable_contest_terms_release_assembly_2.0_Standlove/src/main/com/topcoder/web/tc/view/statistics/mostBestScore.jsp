<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"

%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<%--<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>--%>

<% //common code that pulls out the request bean.
    ResultSetContainer rsc = (ResultSetContainer)((Map)request.getAttribute("QUERY_RESPONSE")).get("most_best_score");
%>
<%@page import="java.text.NumberFormat"%>
<html>
<head>
<TITLE>TopCoder Statistics - Most Problem Best Scores</TITLE>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</HEAD>
<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="algo_recordbook"/>
            </jsp:include>
        </td>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Algorithm Competition Record Book"/>
</jsp:include>

<div style="float:right;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
<span class="bodyText">
<br><br>
<strong>Record:</strong> This chart shows the competitors that have gotten the highest score on a problem the most times.
</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="5">Most High Scores</td></tr>
    <tr>
        <td class="headerC"><A href="/stat?c=most_best_score&sq=most_best_score<tc-webtag:sort column="1" includeParams="true" excludeParams="c"/>">Rank</A></td>
        <td class="header" width="40%"><A href="/stat?c=most_best_score&sq=most_best_score<tc-webtag:sort column="4" includeParams="true" excludeParams="c"/>">Coder</A></td>
        <td class="headerC" width="20%"><A href="/stat?c=most_best_score&sq=most_best_score<tc-webtag:sort column="1" includeParams="true" excludeParams="c"/>">High Scores</A></td>
        <td class="headerC" width="20%"><A href="/stat?c=most_best_score&sq=most_best_score<tc-webtag:sort column="2" includeParams="true" excludeParams="c"/>">Competitions</A></td>
        <td class="headerC" width="20%" nowrap="nowrap"><A href="/stat?c=most_best_score&sq=most_best_score<tc-webtag:sort column="3" includeParams="true" excludeParams="c"/>">Avg High Scores<br>Per Competition</A></td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
    <% double avg = resultRow.getDoubleItem("best_scores") /  resultRow.getDoubleItem("events"); 
       String avgStr = new java.text.DecimalFormat("0.000").format(avg); %>
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="rank"/></td>
        <td class="value" nowrap="nowrap"><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC"><b><rsc:item row="<%=resultRow%>" name="best_scores"/></b></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="events"/></td>
        <td class="valueC"><%= avgStr %></td>
    </tr>
    <% even = !even;%>
    </rsc:iterator>
</tbody>
</table>
        
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>