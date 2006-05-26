<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map, java.text.DecimalFormat, com.topcoder.web.tc.controller.request.hs.RoundInfo, com.topcoder.web.tc.controller.request.hs.ListInfo,
                    com.topcoder.web.tc.controller.request.hs.Base,
          com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>
<%
Map resultMap = (Map) request.getAttribute("resultMap");
ResultSetContainer history = (ResultSetContainer) resultMap.get("hs_rating_history");
String cr = (String) request.getAttribute("cr");
boolean isHighSchool = Integer.ParseInt((String) request.getAttribute("ratid")) == 2;
String context = isHighSchool? "hs_algorithm" : "algorithm";

%>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="High School Rating History"/>
</jsp:include>

<span class="bigHandle">Coder: <tc-webtag:handle coderId="<%= cr %>" context='<%= context %>' /></span>
<br>
<span class="bodySubtitle">High School Statistics > </span><br>
<span class="bc">
<a href='/tc?module=MemberProfile&cr=<%=cr%>' class="bcLink">Member Profile</a>
 | Rating History
</span>

<% if (history.croppedDataBefore() || history.croppedDataAfter()) { %>
	<div class="pagingBox">
	<%=(history.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
	| <%=(history.croppedDataAfter()?"<a href=\"Javascript:next()\" >next &gt;&gt;</a>":"next &gt;&gt;")%>
	</div>
<% } %>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="7">High School Rating History</td></tr>
   <tr>
      <td class="headerC" width="1%"><A href="">Date</A></td>
      <td class="header"><A href="">Season</A></td>
      <td class="header"><A href="">Contest</A></td>
      <td class="header"><A href="">Round</A></td>
      <td class="headerR"><A href="">Rating</A></td>
      <td class="headerR"><A href="">Volatility</A></td>
      <td class="headerR"><A href="">Rank</A></td>
   </tr>
   <% boolean even = false; %>
   <rsc:iterator list="<%= history %>" id="resultRow">
       <tr class="<%=even?"dark":"light"%>">
          <td class="valueC"><rsc:item name="date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
          <td class="value"><A href=""><rsc:item name="season_name" row="<%=resultRow%>"/></A></td>
          <td class="value"><A href=""><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
          <td class="value"><A href=""><rsc:item name="round_name" row="<%=resultRow%>"/></A></td>
          <td class="valueR"><rsc:item name="new_rating" row="<%=resultRow%>"/></td>
          <td class="valueR"><rsc:item name="vol" row="<%=resultRow%>"/></td>
          <td class="valueR"><rsc:item name="rank" row="<%=resultRow%>"/></td>
       </tr>
    </rsc:iterator>
</table>

<% if (history.croppedDataBefore() || history.croppedDataAfter()) { %>
	<div class="pagingBox">
	<%=(history.croppedDataBefore()?"<a href=\"Javascript:previous()\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
	| <%=(history.croppedDataAfter()?"<a href=\"Javascript:next()\" >next &gt;&gt;</a>":"next &gt;&gt;")%>
	</div>
<% } %>

<br><br>

</td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
