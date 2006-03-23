<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder High School Competitions</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript">
<!--
function goTo(selection){
sel = selection.options[selection.selectedIndex].value;
if (sel && sel != '#'){
window.location='/longcontest/?module=ViewOverview&rd='+sel;
}
}
// -->
</script>
</head>

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

<span class="bigHandle">Coder: <tc-webtag:handle coderId="144400" /></span>
<br>
<span class="bodySubtitle">High School Statistics > </span><br>
<span class="bc">
<a href="" class="bcLink">Member Profile</a>
 | Rating History
</span>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="6">High School Rating History</td></tr>
   <tr>
      <td class="headerC" width="1%"><A href="">Date</A></td>
      <td class="header"><A href="">Contest</A></td>
      <td class="header"><A href="">Round</A></td>
      <td class="headerR"><A href="">Rating</A></td>
      <td class="headerR"><A href="">Volatility</A></td>
      <td class="headerR"><A href="">Rank</A></td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">03.22.06</td>
      <td class="value"><A href="">High School Single Round Match 1</A></td>
      <td class="value"><A href="">Round 1</A></td>
      <td class="valueR">3457</td>
      <td class="valueR">457</td>
      <td class="valueR">1</td>
   </tr>
   <% even = !even;%>
</table>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>

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
