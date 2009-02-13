<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->
 
<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Component Development Details"/>
</jsp:include>

<span class="bigHandle">Component: <A href="" class="bcLink">IP Server</A></span>
<br>
<span class="bodySubtitle">Contest Details&#160;>&#160;</span><br>
<span class="bc">
<A HREF="/" class="bcLink">Design Contest</A>
&#160;|&#160;Development Contest
</span>

<div class="pagingBox">&#160;</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" >
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="2">
         Development Contest Details
         </td></tr>
         <tr>
            <td class="cat" nowrap="nowrap">Inquiries</TD>
            <TD class="stat" align="right">5</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submissions</TD>
            <TD class="stat" align="right">5</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submission Percentage</TD>
            <TD class="stat" align="right">100.00%</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed</TD>
            <TD class="stat" align="right">3</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed Percentage</TD>
            <TD class="stat" align="right">60.00%</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Initial Score</TD>
            <TD class="stat" align="right">80.00</TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Final Score</TD>
            <TD class="stat" align="right">90.00</TD>
         </tr>
      </TABLE>
      </TD>
      </td>
      <td width="75%" valign="top">
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="7">
         Competitors
         </td></tr>
         <tr>
            <TD CLASS="tableHeader">Handle</TD>
            <TD CLASS="tableHeader" align="center">Date inquired</TD>
            <TD CLASS="tableHeader" align="center">Date submitted</TD>
            <TD CLASS="tableHeader" align="center">Passed</TD>
            <TD CLASS="tableHeader" align="right">Initial Score</TD>
            <TD CLASS="tableHeader" align="right">Final Score</TD>
            <TD CLASS="tableHeader" align="center">&#160;</TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="center">Y</TD>
            <TD class="statLt" align="right">80.00</TD>
            <TD class="statLt" align="right">90.00</TD>
            <TD class="statLt" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="center">Y</TD>
            <TD class="statDk" align="right">80.00</TD>
            <TD class="statDk" align="right">90.00</TD>
            <TD class="statDk" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="center">Y</TD>
            <TD class="statLt" align="right">80.00</TD>
            <TD class="statLt" align="right">90.00</TD>
            <TD class="statLt" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="center">Y</TD>
            <TD class="statDk" align="right">80.00</TD>
            <TD class="statDk" align="right">90.00</TD>
            <TD class="statDk" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="center">Y</TD>
            <TD class="statLt" align="right">80.00</TD>
            <TD class="statLt" align="right">90.00</TD>
            <TD class="statLt" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="center">Y</TD>
            <TD class="statDk" align="right">80.00</TD>
            <TD class="statDk" align="right">90.00</TD>
            <TD class="statDk" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="center">Y</TD>
            <TD class="statLt" align="right">80.00</TD>
            <TD class="statLt" align="right">90.00</TD>
            <TD class="statLt" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="center">Y</TD>
            <TD class="statDk" align="right">80.00</TD>
            <TD class="statDk" align="right">90.00</TD>
            <TD class="statDk" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="center">Y</TD>
            <TD class="statLt" align="right">80.00</TD>
            <TD class="statLt" align="right">90.00</TD>
            <TD class="statLt" align="center"><A href="">scorecard</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="center">Y</TD>
            <TD class="statDk" align="right">80.00</TD>
            <TD class="statDk" align="right">90.00</TD>
            <TD class="statDk" align="center"><A href="">scorecard</A></TD>
         </tr>
      </table>
      </td>
   </TR>
</TABLE>


        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
