<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.Constants,
          com.topcoder.web.common.StringUtils,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="resultMap" type="java.util.Map" scope="request" />
<jsp:useBean id="scoreHash" type="java.util.Map" scope="request" />
<jsp:useBean id="sortLinkBase" class="java.lang.String" scope="request" />
<jsp:useBean id="prevPageLink" class="java.lang.String" scope="request" />
<jsp:useBean id="nextPageLink" class="java.lang.String" scope="request" />
<jsp:useBean id="prevPageColLink" class="java.lang.String" scope="request" />
<jsp:useBean id="nextPageColLink" class="java.lang.String" scope="request" />
<%
    ResultSetContainer coders = (ResultSetContainer)resultMap.get("long_contest_test_results_coders");
    ResultSetContainer cases = (ResultSetContainer)resultMap.get("long_contest_test_results_cases");
    ResultSetContainer rsc = (ResultSetContainer)resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = (ResultSetContainer.ResultSetRow)rsc.get(0);
%>

<html>
<head>
<title>TopCoder</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
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
<jsp:param name="title" value="System Test Results"/>
</jsp:include>

<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
<span class="bodySubtitle">Competitors: <rsc:item name="num_competitors" row="<%=infoRow%>"/></span><br>

<div class="pagingBox">
      <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink"></logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
      &nbsp;[competitors]&nbsp;
      <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink"></logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty><br>
      <logic:notEmpty name="prevPageColLink"><a href="<%=prevPageColLink%>" class="bcLink"></logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageColLink"></a></logic:notEmpty>
      &nbsp;[test&nbsp;cases]&nbsp;
      <logic:notEmpty name="nextPageColLink"><a href="<%=nextPageColLink%>" class="bcLink"></logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageColLink"></a></logic:notEmpty>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="<%=cases.getRowCount()+2%>">System Test Results</td>
</tr>
<tr>
   <td class="tableHeader"><A href="<%=sortLinkBase%>&<%=Constants.PRIMARY_COLUMN%>=1&<%=Constants.SORT_ORDER%>=<%=("1".equals(request.getParameter(Constants.PRIMARY_COLUMN))&&!"desc".equals(request.getParameter(Constants.SORT_ORDER)))?"desc":"asc"%>">Handle</A></td>
   <td class="tableHeader" align="right"><A href="<%=sortLinkBase%>&<%=Constants.PRIMARY_COLUMN%>=2&<%=Constants.SORT_ORDER%>=<%=("2".equals(request.getParameter(Constants.PRIMARY_COLUMN))&&!"asc".equals(request.getParameter(Constants.SORT_ORDER)))?"asc":"desc"%>">Score</A></td>
<rsc:iterator list="<%=cases%>" id="resultRow">
   <% String sortDir = "desc"; %>
   <logic:equal parameter="<%=Constants.TEST_CASE_ID%>" value="<%=resultRow.getStringItem("test_case_id")%>">
      <logic:equal parameter="<%=Constants.PRIMARY_COLUMN%>" value="3">
         <logic:notEqual parameter="<%=Constants.SORT_ORDER%>" value="asc">
            <% sortDir="asc"; %>
         </logic:notEqual>
      </logic:equal>
   </logic:equal>
   <td class="tableHeader" align="right" nowrap="nowrap"><A href="<%=sortLinkBase%>&<%=Constants.PRIMARY_COLUMN%>=3&<%=Constants.SORT_ORDER%>=<%=sortDir%>&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>">Test<br>Case <rsc:item name="rank" row="<%=resultRow%>"/></A><br>
   <span style="font-weight: normal;">(<A href="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>?module=ViewSystemTest&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>">details</A>)</span></td>
</rsc:iterator>
</tr>
<%boolean even = true;%>
<rsc:iterator list="<%=coders%>" id="coderRow">
<% String style=even?"statLt":"statDk"; even=!even; %>
<logic:equal parameter="<%=Constants.CODER_ID%>" value="<%=coderRow.getStringItem("coder_id")%>">
   <% style="highlightStylePlaceholder"; %>
</logic:equal>
<tr align="right">
   <td class="<%=style%>" align="left" nowrap="nowrap"><tc-webtag:handle coderId='<%=coderRow.getLongItem("coder_id")%>'/></td>
   <td class="<%=style%>"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=coderRow%>"/>" class="statLink"><rsc:item name="final_points" row="<%=coderRow%>" format="0.00"/></a></td>
<rsc:iterator list="<%=cases%>" id="caseRow">
   <td class="<%=style%>"><tc-webtag:format object="<%=scoreHash.get(coderRow.getItem("coder_id") + "_" + caseRow.getItem("test_case_id"))%>" ifNull="--"/></td>
</rsc:iterator>
</tr>
</rsc:iterator>
      </TABLE>
      </TD>
   </tr>
</TABLE>

<div class="pagingBox">
      <logic:notEmpty name="prevPageLink"><a href="<%=prevPageLink%>" class="bcLink"></logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageLink"></a></logic:notEmpty>
      &nbsp;[competitors]&nbsp;
      <logic:notEmpty name="nextPageLink"><a href="<%=nextPageLink%>" class="bcLink"></logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageLink"></a></logic:notEmpty><br>
      <logic:notEmpty name="prevPageColLink"><a href="<%=prevPageColLink%>" class="bcLink"></logic:notEmpty>&lt;&lt; previous<logic:notEmpty name="prevPageColLink"></a></logic:notEmpty>
      &nbsp;[test&nbsp;cases]&nbsp;
      <logic:notEmpty name="nextPageColLink"><a href="<%=nextPageColLink%>" class="bcLink"></logic:notEmpty>next &gt;&gt;<logic:notEmpty name="nextPageColLink"></a></logic:notEmpty>
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