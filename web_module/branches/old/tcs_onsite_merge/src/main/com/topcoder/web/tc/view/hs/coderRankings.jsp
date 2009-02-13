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
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="top_ranked"/>
<jsp:param name="title" value="High School Competitions"/>
</jsp:include>

<div style="float:right; padding-left:10px;" align="right">
<div style="padding-bottom:5px;">
   <select name="season" onchange="goTo(this)">
   <option value="" selected="selected">View another season:</option>
   <option value="0000">All time</option>
   <option value="0000">2006-2007</option>
   </select>
</div>
</div>

<span class="bodySubtitle">Top Ranked > High School Competitions</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<span class="bc">
Coders | 
<a href="" class="bcLink">Teams</a> | 
<a href="" class="bcLink">Countries</a>
</span>
<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="4">Top Ranked > High School Coders</td></tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" width="30%">Coder</td>
      <td class="header" width="70%">School</td>
      <td class="headerR">Rating</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">1</td>
      <td class="value"><tc-webtag:handle coderId="144400" /></td>
      <td class="value">Rocky Hill High School</td>
      <td class="valueR">3457</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">2</td>
      <td class="value"><tc-webtag:handle coderId="144400" /></td>
      <td class="value">Rocky Hill High School</td>
      <td class="valueR">3457</td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">3</td>
      <td class="value"><tc-webtag:handle coderId="144400" /></td>
      <td class="value">Rocky Hill High School</td>
      <td class="valueR">3457</td>
   </tr>
</table>

<div class="pagingBox">
&lt;&lt; prev
| <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
</div>

<br><br>
</div>
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
