<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@  page
  language="java"
  import="java.util.*,
          java.text.SimpleDateFormat,
          com.topcoder.web.common.StringUtils,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*,
          com.topcoder.shared.dataAccess.DataAccessConstants"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="resultMap" type="java.util.Map" scope="request" />
<%
    ResultSetContainer registrants = (ResultSetContainer)resultMap.get("long_contest_overview_coders");
    ResultSetContainer rounds = (ResultSetContainer)resultMap.get("long_contest_round_list");
    ResultSetContainer categories = (ResultSetContainer)resultMap.get("long_contest_round_categories");
    ResultSetContainer rsc = (ResultSetContainer)resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = null;
    if(rsc != null && !rsc.isEmpty())
        infoRow = (ResultSetContainer.ResultSetRow)rsc.get(0);

    int pageSize = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
    if(!"".equals(StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_RECORDS))))
        pageSize = Integer.parseInt(request.getParameter(DataAccessConstants.NUMBER_RECORDS));

    String selfLink = sessionInfo.getServletPath() + "?" + Constants.MODULE + "=ViewOverview"
            + "&" + Constants.ROUND_ID + "=" + request.getParameter(Constants.ROUND_ID)
            + "&" + DataAccessConstants.NUMBER_RECORDS + "=" + pageSize;

    String pagingLink = selfLink
            + "&" + DataAccessConstants.SORT_COLUMN + "=" + StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN))
            + "&" + DataAccessConstants.SORT_DIRECTION + "=" + StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_DIRECTION));

    String prevPage, nextPage;
    if(registrants.croppedDataBefore()){
        prevPage = "<a href=\"" + pagingLink
                + "&" + DataAccessConstants.START_RANK + "=" + Math.max(1,registrants.getStartRow() - pageSize)
                + "\" class=\"bcLink\">&lt;&lt; previous</a>";
    }else{
        prevPage = "&lt;&lt; previous";
    }
    if(registrants.croppedDataAfter()){
        nextPage = "<a href=\"" + pagingLink
                + "&" + DataAccessConstants.START_RANK + "=" + (registrants.getStartRow() + pageSize)
                + "\" class=\"bcLink\">next &gt;&gt;</a>";
    }else{
        nextPage = "next &gt;&gt;";
    }
%>

<html>
<head>
<title>TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="long"/>
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
<jsp:param name="title" value="Contest Overview"/>
</jsp:include>

<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location='<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewOverview&<%=Constants.ROUND_ID%>='+sel;
  }
}
// -->
</script>
Please select a contest:<br>
<tc-webtag:rscSelect name="<%=Constants.ROUND_ID%>" list="<%=rounds%>" fieldText="name" fieldValue="round_id" selectedValue="<%=request.getParameter(Constants.ROUND_ID)%>" onChange="goTo(this)" />
<br><br>
<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
<span class="bodySubtitle">Categories:
<% if(categories.isEmpty()){ %> None <% } %>
<%boolean first = true;%>
<rsc:iterator list="<%=categories%>" id="resultRow">
    <% if(!first){ %>, <% } %><rsc:item name="problem_category_desc" row="<%=resultRow%>"/>
    <% first = false; %>
</rsc:iterator>
<br>
Competitors: <rsc:item name="num_competitors" row="<%=infoRow%>"/><br>
Avg. Submissions: <tc-webtag:format object="<%=new Double(infoRow.getDoubleItem("avg_submissions"))%>" format="#.##" ifNull="N/A"/></span><br>
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewPractice">Practice</A><br>
<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemStatement&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=infoRow%>"/>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=infoRow%>"/>">Problem Statement</A>

<div class="pagingBox">
      <%=prevPage%> &nbsp;|&nbsp; <%=nextPage%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Contest Overview</td>
</tr>
<tr>
   <td class="tableHeader" width="25%"><A href="<%=selfLink%><tc-webtag:sort column="2"/>">Handle</A></td>
   <td class="tableHeader" width="15%" align="right"><A href="<%=selfLink%><tc-webtag:sort column="3"/>">Score</A></td>
   <td class="tableHeader" width="15%" align="right"><A href="<%=selfLink%><tc-webtag:sort column="4"/>">Rank</A></td>
   <td class="tableHeader" width="15%" align="center"><A href="<%=selfLink%><tc-webtag:sort column="5"/>">Language</A></td>
   <td class="tableHeader" width="15%">&#160;</td>
   <td class="tableHeader" width="15%">&#160;</td>
</tr>
<%-- ITERATOR --%>
<%boolean even = true;%>
<rsc:iterator list="<%=registrants%>" id="resultRow">
<tr>
   <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:handle coderId='<%=resultRow.getLongItem("coder_id")%>'/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item name="point_total" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item name="placed" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="language_name" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="center"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSystemTestResults&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>">results</A></td>
   <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<rsc:item name="problem_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>">submission history</A></td>
</tr>
<%even=!even;%>
</rsc:iterator>
<%-- END ITERATOR --%>
      </TABLE>
      </TD>
   </tr>
</TABLE>

<div class="pagingBox">
      <%=prevPage%> &nbsp;|&nbsp; <%=nextPage%>
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