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
<jsp:param name="title" value="Standings"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Standings: ProblemName</td>
</tr>
<tr>
   <td class="tableHeader" width="25%">Handle</td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap">Score</td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap">Rank</td>
   <td class="tableHeader" width="25%" align="right" nowrap="nowrap">Submissions</td>
</tr>
<%-- ITERATOR --%>
<%boolean even = true;%>
<tr>
   <td class="<%=even?"statLt":"statDk"%>">handle</td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 7px;">99.99</td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 15px;">1</td>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;"><A href="submission history page" class="statLink">3</A></td>
</tr>
<%even=!even;%>
<%-- END ITERATOR --%>
      </TABLE>
      </TD>
   </tr>
</TABLE>

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