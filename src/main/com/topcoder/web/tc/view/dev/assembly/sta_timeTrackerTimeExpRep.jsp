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
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="assembly"/>
<jsp:param name="title" value="Standings"/>
</jsp:include>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="3">Assembly Contest Standings</td></tr>
   <tr>
      <td class="tableHeader" width="50%" nowrap="nowrap">Team</td>
      <td class="tableHeader" width="50%" nowrap="nowrap">Team Members</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Status</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Apeiron Team
      </td>
      <td class="value">
      <tc-webtag:handle coderId="15891862" /> (Team Captain)
      <br><tc-webtag:handle coderId="20003257" />
      </td>
      <td class="valueC" nowrap="nowrap">
      Submitted
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team Chinese Box
      </td>
      <td class="value">
      <tc-webtag:handle coderId="16096823" /> (Team Captain)
      <br><tc-webtag:handle coderId="20543575" />
      </td>
      <td class="valueC" nowrap="nowrap">
      Submitted
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team ACCTiVe
      </td>
      <td class="value">
      <tc-webtag:handle coderId="11845638" /> (Team Captain)
      <br><tc-webtag:handle coderId="21464942" />
      <br><tc-webtag:handle coderId="11928943" />
      <br><tc-webtag:handle coderId="13251393" />
      <br><tc-webtag:handle coderId="21465175" />
      </td>
      <td class="valueC" nowrap="nowrap">
      No submission
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      Team V
      </td>
      <td class="value">
      <tc-webtag:handle coderId="15729786" /> (Team Captain)
      </td>
      <td class="valueC" nowrap="nowrap">
      No submission
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

