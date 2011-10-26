<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ct" value="${param.ct}" />
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="../../script.jsp"/>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../../includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <tc-webtag:sponsorImage image="image" alt="College Logo" border="0"/>
</div>


<jsp:include page="topMenu.jsp">
    <jsp:param name="active" value="comp_results"/>
</jsp:include>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="center" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design</span><br>
<c:set var="first" value="true" />
<c:forEach items="${desContests}" var="contest" >
    <c:if test="${not first}">| </c:if>
	<c:set var="first" value="false" />
   	<tc-webtag:ifLink useLink="${ct!=contest[0]}" text="${contest[1]}" link="/tc?module=IntroEventCompResults&amp;eid=${event.id}&amp;ct=${contest[0]}"/>        
</c:forEach>
</td>

<td align="center" style="padding-left:10px;">
<span class="subtitle" class="bcLink">Development</span><br>
<c:set var="first" value="true" />
<c:forEach items="${devContests}" var="contest" >
    <c:if test="${not first}">| </c:if>
	<c:set var="first" value="false" />
   	<tc-webtag:ifLink useLink="${ct!=contest[0]}" text="${contest[1]}" link="/tc?module=IntroEventCompResults&amp;eid=${event.id}&amp;ct=${contest[0]}"/>   
</c:forEach>
</td>
</tr>
</table>
<br>
<br>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");
   if (results != null) {
%>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="60%">Handle</td>
        <td class="headerC" width="40%">Points</td>
        <td class="headerC" nowrap="nowrap">Potential Points</td>
   </tr>
        <% boolean even = false; %>
        <rsc:iterator list="<%=results%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">            
                 <td class="valueC">
                     <rsc:item row="<%=resultRow%>" name="rank"/>
                 </td>
                <td class="value">
                    <tc-webtag:handle coderId='<%= resultRow.getLongItem("user_id")%>' context='${context}'/>
                 </td>
                 <td class="valueC">
                     <rsc:item row="<%=resultRow%>" name="points" ifNull="0"/>
                 </td>
                 <td class="valueC"> 
                     <rsc:item row="<%=resultRow%>" name="potential_points" />
                 </td>                    
            </tr>
            <% even = !even; %>
        </rsc:iterator>
</table>
</div>

</div>    

<% } %>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html

