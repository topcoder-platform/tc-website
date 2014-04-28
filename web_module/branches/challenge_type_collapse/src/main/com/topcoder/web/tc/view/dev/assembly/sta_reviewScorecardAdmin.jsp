<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Assembly Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="assembly_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Standings"/>
</jsp:include>

<span class="bodySubtitle">Challenge: Online Review Scorecard Admin Tests</span>
<br><br>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="3">Assembly Challenge Standings</td></tr>
   <tr>
      <td class="header" width="50%" nowrap="nowrap">Team</td>
      <td class="header" width="50%" nowrap="nowrap">Team Members</td>
      <td class="headerC" nowrap="nowrap">Status</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team PearlS
      </td>
      <td class="value">
      <tc-webtag:handle coderId="266149" /> (Team Captain)
      <br><tc-webtag:handle coderId="21491618" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team 719
      </td>
      <td class="value">
      <tc-webtag:handle coderId="10336829" /> (Team Captain)
      <br><tc-webtag:handle coderId="22498968" />
      </td>
      <td class="valueC" nowrap="nowrap">
      Winner
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team 4
      </td>
      <td class="value">
      <tc-webtag:handle coderId="22628271" /> (Team Captain)
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team BounceTheServer
      </td>
      <td class="value">
      <tc-webtag:handle coderId="22033992" /> (Team Captain)
      <br><tc-webtag:handle coderId="7475084" />
      <br><tc-webtag:handle coderId="22628943" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team TAG
      </td>
      <td class="value">
      <tc-webtag:handle coderId="278460" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team 7
      </td>
      <td class="value">
      <tc-webtag:handle coderId="10529347" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team 8
      </td>
      <td class="value">
      <tc-webtag:handle coderId="10425804" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team 9
      </td>
      <td class="value">
      <tc-webtag:handle coderId="10697386" />
      </td>
      <td class="valueC" nowrap="nowrap">
      &#160;
      </td>
   </tr>
   <% even = !even;%>
</table>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

