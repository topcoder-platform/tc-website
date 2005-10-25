<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
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
   ResultSetContainer projectInfo = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_info");
   ResultSetContainer submissions =  (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("submissions");
   //ResultSetContainer hasUnknownRSC = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("has_unknwon");
   //boolean hasUnknown = hasUnknownRSC.getIntItem(0, "has_unknown") > 0;

   long projectId = ((Long) request.getAttribute("pid")).longValue();
   boolean first = true;

    String imgName="";
    if (projectInfo.getStringItem(0,"category_desc").equals("Java")) {
        imgName = "http://www.topcoder.com/i/development/smJava.gif";
    }
    if (projectInfo.getStringItem(0,"category_desc").equals(".NET")) {
        imgName = "http://www.topcoder.com/i/development/netSm.gif";
    }
    if (projectInfo.getStringItem(0,"category_desc").equals("Java Custom")) {
        imgName = "http://www.topcoder.com/i/development/NAME_HERE.gif";
    }
    if (projectInfo.getStringItem(0,"category_desc").equals(".NET Custom")) {
        imgName = "http://www.topcoder.com/i/development/NAME_HERE.gif";
    }
    if (projectInfo.getStringItem(0,"category_desc").equals("JSF")) {
        imgName = "http://www.topcoder.com/i/development/NAME_HERE.gif";
    }


%>


<span class="bodySubtitle">Component Statistics >
<a href='/tc?module=CompList&pi=<rsc:item set="<%=projectInfo%>" name="phase_id"/>' class="statLink">
<rsc:item set="<%=projectInfo%>" name="phase_desc"/> Contests</a>
 > Contest Details
</span><br>
<span class="bc">
<% if (dates.size() > 1) { %>
                 <rsc:iterator list="<%=dates%>" id="resultRow">

                    <% if(!first) { %>
                       &#160;|&#160;
                    <% } else {
                        first=false;
                        }
                    %>

                    <% if (resultRow.getLongItem("project_id") == projectId) { %>
                        <rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                    <% } else { %>
                        <A HREF='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>' class="bcLink"><rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yyyy"/></A>
                    <% } %>
                 </rsc:iterator>
<% } %>

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
            <td class="cat" nowrap="nowrap">Contest:</TD>
            <TD class="stat" align="right" nowrap="nowrap"><rsc:item set="<%=projectInfo%>" name="component_name"/> <rsc:item set="<%=projectInfo%>" name="version_text"/></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Component:</TD>
            <TD class="stat" align="right" nowrap="nowrap"><A href='https://software.topcoder.com/catalog/c_component.jsp?comp=<rsc:item set="<%=projectInfo%>" name="component_id"/>&ver=<rsc:item set="<%=projectInfo%>" name="version_id"/>' class="statLink"><rsc:item set="<%=projectInfo%>" name="component_name"/></A></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap" valign="top" style="padding-top: 3px">Catalog:</TD>
            <TD class="stat" align="right" valign="top" style="padding-top: 3px"><img src='<%=imgName%>' alt='<rsc:item set="<%=projectInfo%>" name="category_desc"/>' border="0" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Registrants:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="num_inquiries" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submissions:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="num_submissions" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Submission Percentage:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="submission_percent" format="0.00'%'" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed Screening:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="passed" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Passed Percentage:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="passed_percent" format="0.00'%'" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Initial Score:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="avg_raw_score" format="0.00" ifNull="unknown *" /></TD>
         </tr>
         <tr>
            <td class="cat" nowrap="nowrap">Avg Final Score:</TD>
            <TD class="stat" align="right"><rsc:item set="<%=projectInfo%>" name="avg_final_score" format="0.00" ifNull="unknown *" /></TD>
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
         <%
            if (reviewers.size() == 3) {
         %>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getLongItem(0, "reviewer_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></TD>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getLongItem(1, "reviewer_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></TD>
            <TD CLASS="tableHeader" align="center"><tc-webtag:handle coderId='<%= reviewers.getLongItem(2, "reviewer_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></TD>
         <% } else if (reviewers.size() == 0) { // probably the project hasnt arrived to review phase
         %>
             <TD CLASS="tableHeader" align="center">-</TD>
             <TD CLASS="tableHeader" align="center">-</TD>
             <TD CLASS="tableHeader" align="center">-</TD>
         <% } else {
              throw new Exception("0 or 3 reviewers expected.");
              }
         %>

         </tr>

<rsc:iterator list="<%=submissions%>" id="resultRow">
         <tr>
            <TD class="statDk"><tc-webtag:handle coderId='<%= resultRow.getLongItem("user_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></TD>

            <TD class="statDk" align="center"><rsc:item name="inquire_timestamp" row="<%=resultRow%>" format="MM.dd.yyyy" ifNull="unknown *" /></TD>
            <TD class="statDk" align="center"><rsc:item name="submit_timestamp" row="<%=resultRow%>" format="MM.dd.yyyy" ifNull="unknown *" /></TD>

            <TD class="statDk" align="right">
                <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>' class="bcLink">
                    <rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="N/A" />
                </A>
                </TD>
            <TD class="statDk" align="left">
                <% if (resultRow.getIntItem("passed_screening") == 1) { %>
                    <img src="/i/stats/pass.gif" alt="pass" border="0" />
                <% } else { %>
                    <img src="/i/stats/fail.gif" alt="fail" border="0" />
                <% } %>

            </TD>


<% if (resultRow.getIntItem("passed_screening") == 1) { %>
            <TD class="statDk" align="center"><rsc:item row="<%=resultRow%>" name="initial_score" format="0.00" ifNull="unknown *" /></TD>
            <TD class="statDk" align="center"><b><rsc:item row="<%=resultRow%>" name="final_score" format="0.00" ifNull="unknown *" /></b></TD>
            <TD class="statDk" align="center">
                    <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>&rid=<%=reviewers.getLongItem(0, "reviewer_id")%>' class="bcLink">
                                                   <rsc:item row="<%=resultRow%>" name="score1" format="0.00"  />
                        </A>
                                              </TD>
            <TD class="statDk" align="center">
                    <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>&rid=<%=reviewers.getLongItem(1, "reviewer_id")%>' class="bcLink">
                                                   <rsc:item row="<%=resultRow%>" name="score2" format="0.00" />
                    </A>
                                              </TD>
            <TD class="statDk" align="center">
                    <A HREF='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>&rid=<%=reviewers.getLongItem(2, "reviewer_id")%>' class="bcLink">
                        <rsc:item row="<%=resultRow%>" name="score3" format="0.00" />
                                              </TD>
                    </A>
                <% } else { %>
                    <TD class="statDk" align="center">&nbsp;</TD>
                    <TD class="statDk" align="center">&nbsp;</TD>
                    <TD class="statDk" align="center">&nbsp;</TD>
                    <TD class="statDk" align="center">&nbsp;</TD>
                    <TD class="statDk" align="center">&nbsp;</TD>
                <% } %>


         </tr>
</rsc:iterator>
      </table>
      </td>
   </TR>
</TABLE>

  * Some information may be unknown due to missing data from old projects

   </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
