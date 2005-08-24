<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
<% ResultSetContainer results = (ResultSetContainer)((Map)request.getAttribute("resultMap")).get("com_history"); %>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
		<td width="180">
			<jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="coder_of_month"/>
			</jsp:include>
		</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
      <td width="100%" valign="top" align="center">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Coder of the Month Archive"/>
</jsp:include>

<table class="stat" cellpadding="0" cellspacing="0" width="250" style="float: left; margin-right: 15px; margin-bottom: 15px;">
   <tr>
      <td class="title" colspan="2">Coder of the Month Archive</td>
   </tr>
   <tr>
      <td class="header">Handle</td>
      <td class="headerR">Month</td>
   </tr>
   <% boolean even = false; %>
   <rsc:iterator list="<%=results%>" id="resultRow">
       <tr class="<%=even?"dark":"light"%>">
          <td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>'/></td>
          <td class="valueR"><rsc:item name="achievement_date" row="<%=resultRow%>" format="MM/yyyy"/></td>
       </tr>
       <% even = !even;%>
   </rsc:iterator>
</table>

<span class="bodyText">
<span class="title">Coder of the Month</span>
<br><br>
TopCoder reserves the title of Coder of the Month for any competitor who has had an outstanding month. Some months, this means that we choose the algorithm competitor with an exceptionally high rating increase for the month.  Other times TopCoder may select a Coder of the Month based on exceptional performance in Component Competitions for a given period of time. Perhaps even a member who has earned a large amount of winnings or has had an impressive winning streak.
</span>

</div>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
