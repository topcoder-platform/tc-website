<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
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
<jsp:param name="title" value="Component Contest Details"/>
</jsp:include>

<% ResultSetContainer dates = (ResultSetContainer)request.getAttribute("dates");
   ResultSetContainer reviewers = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("reviewers_for_project");
   ResultSetRow projectInfo = ((ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_info")).getRow(0);

   long projectId = ((Long) request.getAttribute("pid")).longValue();
   boolean first = true;
%>


<span class="bodySubtitle">Development Statistics > Contest Details > <A href="" class="statLink"><%= projectInfo.getStringItem("component_name") %></A> ></span><br>
<span class="bc">

                 <rsc:iterator list="<%=dates%>" id="resultRow">

                    <% if(!first) { %>
                       &#160;|&#160;
                    <% } else {
                        first=false;
                        }
                    %>
<!-- jsp:getProperty name="sessionInfo" property="servletPath"/ -->

                    <% if (resultRow.getLongItem("project_id") == projectId) { %>
                        <rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                    <% } else { %>
                        <A HREF='<rsc:item name="project_id" row="<%=resultRow%>"/>' class="bcLink"><rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></A>
                    <% } %>
                 </rsc:iterator>

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
            <td class="cat" nowrap="nowrap">Inquiries:</TD>
            <TD class="stat" align="right"><%= projectInfo.getIntItem("num_inquiries") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submissions:</TD>
            <TD class="stat" align="right"><%= projectInfo.getIntItem("num_submissions") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submission Percentage:</TD>
            <TD class="stat" align="right"><%= projectInfo.getDoubleItem("submission_percent") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed:</TD>
            <TD class="stat" align="right"><%= projectInfo.getIntItem("passed") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed Percentage:</TD>
            <TD class="stat" align="right"><%= projectInfo.getDoubleItem("passed_percent") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Initial Score:</TD>
            <TD class="stat" align="right"><%= projectInfo.getDoubleItem("avg_raw_score") %></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Final Score:</TD>
            <TD class="stat" align="right"><%= projectInfo.getDoubleItem("avg_final_score") %></TD>
         </tr>
      </TABLE>

      </TD>
      </td>
      <td width="75%" valign="top">
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
         <tr><td class="tableTitle" colspan="10">
         Competitors
         </td></tr>
         <tr>
            <TD CLASS="tableHeader" rowspan="2">Handle</TD>
            <TD CLASS="tableHeader" rowspan="2" align="center">Date inquired</TD>
            <TD CLASS="tableHeader" rowspan="2" align="center">Date submitted</TD>
            <TD CLASS="tableHeader" rowspan="2" align="center" colspan="2">Screening Score</TD>
            <TD CLASS="tableHeader" rowspan="2" align="center">Initial Score</TD>
            <TD CLASS="tableHeader" rowspan="2" align="center">Final Score</TD>
            <TD CLASS="tableHeader" colspan="3" align="center">Reviewers</TD>
         </tr>
         <tr>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getIntItem(0, "reviewer_id") %>' context="development"/></TD>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getIntItem(1, "reviewer_id") %>' context="development"/></TD>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getIntItem(2, "reviewer_id") %>' context="development"/></TD>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statLt" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statLt" align="center">80.00</TD>
            <TD class="statLt" align="center">90.00</TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statDk" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statDk" align="center">80.00</TD>
            <TD class="statDk" align="center">90.00</TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statLt" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statLt" align="center">80.00</TD>
            <TD class="statLt" align="center">90.00</TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statDk" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statDk" align="center">80.00</TD>
            <TD class="statDk" align="center">90.00</TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statLt" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statLt" align="center">80.00</TD>
            <TD class="statLt" align="center">90.00</TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statDk" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statDk" align="center">80.00</TD>
            <TD class="statDk" align="center">90.00</TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statLt" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statLt" align="center">80.00</TD>
            <TD class="statLt" align="center">90.00</TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statLt" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">80.00</A></TD>
            <TD class="statDk" align="left"><img src="/i/stats/pass.gif" alt="pass" border="0" /></TD>
            <TD class="statDk" align="center">80.00</TD>
            <TD class="statDk" align="center">90.00</TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
            <TD class="statDk" align="center"><A href="/tc?module=Static&d1=statistics&d2=reviewScorecard">89.99</A></TD>
         </tr>
         <tr>
            <TD class="statLt"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statLt" align="center">06.01.05</TD>
            <TD class="statLt" align="center">06.21.05</TD>
            <TD class="statLt" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">65.00</A></TD>
            <TD class="statLt" align="left"><img src="/i/stats/fail.gif" alt="fail" border="0" /></TD>
            <TD class="statLt" align="center"></TD>
            <TD class="statLt" align="center"></TD>
            <TD class="statLt" align="center"></TD>
            <TD class="statLt" align="center"></TD>
            <TD class="statLt" align="center"></TD>
         </tr>
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId="278342" context="development"/></TD>
            <TD class="statDk" align="center">06.01.05</TD>
            <TD class="statDk" align="center">06.21.05</TD>
            <TD class="statDk" align="right"><A href="/tc?module=Static&d1=statistics&d2=screeningScorecard">55.00</A></TD>
            <TD class="statDk" align="left"><img src="/i/stats/fail.gif" alt="fail" border="0" /></TD>
            <TD class="statDk" align="center"></TD>
            <TD class="statDk" align="center"></TD>
            <TD class="statDk" align="center"></TD>
            <TD class="statDk" align="center"></TD>
            <TD class="statDk" align="center"></TD>
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
