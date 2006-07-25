<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
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
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Standings"/>
</jsp:include>

<span class="bodySubtitle">Contest: Online Review Scorecard Admin Tests</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="3">Testing Contest Standings</td></tr>
   <tr>
      <td class="header" width="100%" nowrap="nowrap">Handle</td>
      <td class="header" nowrap="nowrap">Status</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="22628476" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="11787671" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="15421107" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="10336829" />
      </td>
      <td class="valueC" nowrap="nowrap">
      submitted
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="8427398" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="21934276" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="21795406" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="15247202" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="22459674" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <tc-webtag:handle coderId="22628550" />
      </td>
      <td class="valueC" nowrap="nowrap">
      did not submit
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

