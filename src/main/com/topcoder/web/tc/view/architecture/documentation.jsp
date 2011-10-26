<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Architecture Competitions</title>
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
      <jsp:param name="node" value="architecture_documentation"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="architecture"/>
<jsp:param name="title" value="Documentation"/>
</jsp:include>

<span class="bigTitle">Architecture Documentation</span>
<br><br>
<table border="0" cellspacing="0" width="100%" class="formFrame">
    <tr>
        <td class="projectHeaders" align="left" width="60%">Description</td>
        <td class="projectHeaders" align="center">Last Modified</td>
        <td class="projectHeaders" align="right" width="40%">File</td>
    </tr>
    <tr>
        <td class="projectCells" valign="top">
        <strong>Sample Architecture Scorecard</strong><br/>
        </td>
        <td class="projectCells" valign="top" align="center"></td>
        <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/tc?module=Static&d1=architecture&d2=sampleScorecard">Sample Architecture Scorecard</A></td>
    </tr>
    <tr>
        <td class="projectCells" valign="top">
        <strong>Tutorial</strong><br/>
        </td>
        <td class="projectCells" valign="top" align="center"></td>
        <td class="projectCells" valign="top" align="right" nowrap="nowrap"><A href="/tc?module=Static&d1=architecture&d2=tutorial">Tutorial</A></td>
    </tr>
</table>

<br><br>
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

