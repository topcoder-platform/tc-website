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
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Overview"/>
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

<div style="float:right;" align="center">
<select name="rd" onchange="goTo(this)">
<option value="" selected="selected">Please select a contest</option>
<option value="0000">HS Single Round Match 1</option>
</select>
<br>
or
<br>
<select name="season" onchange="goTo(this)">
<option value="" selected="selected">Please select a season</option>
<option value="0000">2006-2007</option>
</select>
</div>

<span class="bigTitle">Competition: HS SRM 1</span><br>
<span class="bodySubtitle">Season: 2006-2007</span><br>
<span class="bodySubtitle">Competitors: 499</span><br>
<span class="bodySubtitle">Teams: 150</span><br>
<A href="" class="bcLink">Discuss this contest</a>

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8">HS SRM 1 Leaders</td></tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" nowrap="nowrap" width="50%">Top Teams</td>
      <td class="headerR">Score</td>
      <td class="header" style="border-right:1px solid #999999;">Results</td>
      <td class="header">&#160;</td>
      <td class="header" nowrap="nowrap" width="50%">Top Individuals</td>
      <td class="headerR">Score</td>
      <td class="header">Results</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">
      1
      </td>
      <td class="value">
      <A href="#">Team 1</A>
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="valueC" style="border-right:1px solid #999999;">
      Room 20
      </td>
      <td class="valueC">
      1
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="value">
      Room 20
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">
      2
      </td>
      <td class="value">
      <A href="#">Team 2</A>
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="valueC" style="border-right:1px solid #999999;">
      Room 20
      </td>
      <td class="valueC">
      2
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="value">
      Room 20
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">
      3
      </td>
      <td class="value">
      <A href="#">Team 3</A>
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="valueC" style="border-right:1px solid #999999;">
      Room 20
      </td> 
      <td class="valueC">
      3
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="value">
      Room 20
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">
      4
      </td>
      <td class="value">
      Team 4
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="valueC" style="border-right:1px solid #999999;">
      Room 20
      </td> 
      <td class="valueC">
      4
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="value">
      Room 20
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="valueC">
      5
      </td>
      <td class="value">
      Team 5
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="valueC" style="border-right:1px solid #999999;">
      Room 20
      </td> 
      <td class="valueC">
      5
      </td>
      <td class="value">
      <tc-webtag:handle coderId="144400" />
      </td>
      <td class="valueR">
      1200
      </td>
      <td class="value">
      Room 20
      </td>
   </tr>
   <% even = !even;%>
</table>

<br><br>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8">Problem Sets</td></tr>
   <tr>
      <td class="header">&#160;</td>
      <td class="header" nowrap="nowrap" width="40%">Problem</td>
      <td class="headerR" width="20%">Submissions</td>
      <td class="headerR" width="20%" nowrap="nowrap">Correct %</td>
      <td class="headerR" width="20%" nowrap="nowrap">Average Points</td>
      <td class="header" colspan="2">&#160;</td>
   </tr>
   <% even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value" nowrap="nowrap">
      Level 1
      </td>
      <td class="value">
      <A href="">Integer Generator</A>
      </td>
      <td class="valueR">
      123
      </td>
      <td class="valueR">
      49.85%
      </td>
      <td class="valueR">
      183.72
      </td>
      <td class="valueC" nowrap="nowrap">
      <a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=0000&pm=0000&dn=1','600','400','distribution')">Distribution Graph</a>
      </td>
      <td class="valueC">
      <a href="Javascript:void openProblemRating(0000)"><img src="/i/rate_it.gif" alt="Rate It" /></a>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Level 2
      </td>
      <td class="value">
      <A href="">Integer Generator</A>
      </td>
      <td class="valueR">
      123
      </td>
      <td class="valueR">
      49.85%
      </td>
      <td class="valueR">
      183.72
      </td>
      <td class="valueC" nowrap="nowrap">
      <a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=0000&pm=0000&dn=1','600','400','distribution')">Distribution Graph</a>
      </td>
      <td class="valueC">
      <a href="Javascript:void openProblemRating(0000)"><img src="/i/rate_it.gif" alt="Rate It" /></a>
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Level 3
      </td>
      <td class="value">
      <A href="">Integer Generator</A>
      </td>
      <td class="valueR">
      123
      </td>
      <td class="valueR">
      49.85%
      </td>
      <td class="valueR">
      183.72
      </td>
      <td class="valueC" nowrap="nowrap">
      <a href="JavaScript:getGraph('/graph?c=problem_distribution_graph&rd=0000&pm=0000&dn=1','600','400','distribution')">Distribution Graph</a>
      </td>
      <td class="valueC">
      <a href="Javascript:void openProblemRating(0000)"><img src="/i/rate_it.gif" alt="Rate It" /></a>
      </td>
   </tr>
   <% even = !even;%>
</table>
<div class="pagingBox">
Viewing top 
<input name="er" maxlength="4" size="4" value="5" type="text"> 
<a href="javaScript:submitForm();" class="bcLink">[ submit ]</a>
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
