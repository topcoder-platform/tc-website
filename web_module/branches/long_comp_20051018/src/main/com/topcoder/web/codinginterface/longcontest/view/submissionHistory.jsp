<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value=""/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Submission History"/>
</jsp:include>

<span class="bigHandle">Contest: Round 1</span><br>
<span class="bodySubtitle">Problem: ProblemName</span><br>
<span class="bodySubtitle">Coder: handle</span><br>
<span class="bodySubtitle">Submissions: 1</span><br>

<div class="pagingBox">
      &lt;&lt; previous
      &nbsp;|&nbsp;
      <a href="/stat?c=ratings_history&amp;cr=272072&amp;sr=51&amp;er=100&amp;nr=50" class="bcLink">next &gt;&gt;</a>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Submission History</td>
</tr>
<tr>
   <td class="tableHeader" width="25%"><A href="sort">Submission</A></td>
   <td class="tableHeader" width="25%" align="center"><A href="sort">Time</A></td>
   <td class="tableHeader" width="25%" align="right"><A href="sort">Score</A></td>
   <td class="tableHeader" width="25%" align="right">&#160;</td>
</tr>
<%-- ITERATOR --%>
<%boolean even = true;%>
<tr>
   <td class="<%=even?"statLt":"statDk"%>">1</td>
   <td class="<%=even?"statLt":"statDk"%>" align="center">2005-06-23 21:00:00.0</td>
   <td class="<%=even?"statLt":"statDk"%>" align="right">99.99</td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;"><A href="solution" class="statLink">solution</A></td>
</tr>
<%even=!even;%>
<%-- END ITERATOR --%>
      </TABLE>
      </TD>
   </tr>
</TABLE>

<div class="pagingBox">
      &lt;&lt; previous
      &nbsp;|&nbsp;
      <a href="/stat?c=ratings_history&amp;cr=272072&amp;sr=51&amp;er=100&amp;nr=50" class="bcLink">next &gt;&gt;</a>
</div>

        </td>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp" />
</body>
</html>