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
<%
    ResultSetContainer coders = (ResultSetContainer)resultMap.get("long_contest_test_results_coders");
    ResultSetContainer cases = (ResultSetContainer)resultMap.get("long_contest_test_results_cases");
    ResultSetContainer rsc = (ResultSetContainer)resultMap.get("long_contest_overview_info");
    ResultSetContainer.ResultSetRow infoRow = null;
    if(rsc != null && !rsc.isEmpty())
        infoRow = (ResultSetContainer.ResultSetRow)rsc.get(0);
    
    /* 
     * Complex paging & sorting links are pre-formed here to avoid messy code below
     */
    int pageRSize = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
    if(!"".equals(StringUtils.checkNull(request.getParameter(Constants.ROW_COUNT))))
        pageRSize = Integer.parseInt(request.getParameter(Constants.ROW_COUNT));

    int pageCSize = Integer.parseInt(Constants.DEFAULT_COL_COUNT);
    if(!"".equals(StringUtils.checkNull(request.getParameter(Constants.COL_COUNT))))
        pageCSize = Integer.parseInt(request.getParameter(Constants.COL_COUNT));

    String selfLink = sessionInfo.getServletPath() + "?" + Constants.MODULE + "=ViewSystemTestResults"
            + "&" + Constants.ROUND_ID + "=" + request.getParameter(Constants.ROUND_ID)
            + "&" + Constants.PROBLEM_ID + "=" + request.getParameter(Constants.PROBLEM_ID)
            + "&" + Constants.CODER_ID + "=" + StringUtils.checkNull(request.getParameter(Constants.CODER_ID))
            + "&" + Constants.ROW_COUNT + "=" + pageRSize
            + "&" + Constants.COL_COUNT + "=" + pageCSize;

    String sortParams = "&" + Constants.PRIMARY_COLUMN + "=" + StringUtils.checkNull(request.getParameter(Constants.PRIMARY_COLUMN))
            + "&" + Constants.SORT_ORDER + "=" + StringUtils.checkNull(request.getParameter(Constants.SORT_ORDER))
            + "&" + Constants.TEST_CASE_ID + "=" + StringUtils.checkNull(request.getParameter(Constants.TEST_CASE_ID));

    String pagingRParam = "&" + Constants.START_ROW + "=" + StringUtils.checkNull(request.getParameter(Constants.START_ROW));
    String pagingCParam = "&" + Constants.START_COL + "=" + StringUtils.checkNull(request.getParameter(Constants.START_COL));

    String prevRPage, nextRPage, prevCPage,nextCPage;
    if(coders.croppedDataBefore()){
        prevRPage = "<a href=\"" + selfLink + sortParams
                + "&" + Constants.START_ROW + "=" + Math.max(1,coders.getStartRow() - pageRSize)
                + pagingCParam
                + "\" class=\"bcLink\">&lt;&lt; previous</a>";
    }else{
        prevRPage = "&lt;&lt; previous";
    }
    if(coders.croppedDataAfter()){
        nextRPage = "<a href=\"" + selfLink + sortParams
                + "&" + Constants.START_ROW + "=" + (coders.getStartRow() + pageRSize)
                + pagingCParam
                + "\" class=\"bcLink\">next &gt;&gt;</a>";
    }else{
        nextRPage = "next &gt;&gt;";
    }
    if(cases.croppedDataBefore()){
        prevCPage = "<a href=\"" + selfLink + sortParams
                + pagingRParam
                + "&" + Constants.START_COL + "=" + Math.max(1,cases.getStartRow() - pageCSize)
                + "\" class=\"bcLink\">&lt;&lt; previous</a>";
    }else{
        prevCPage = "&lt;&lt; previous";
    }
    if(cases.croppedDataAfter()){
        nextCPage = "<a href=\"" + selfLink + sortParams
                + pagingRParam
                + "&" + Constants.START_COL + "=" + (cases.getStartRow() + pageCSize)
                + "\" class=\"bcLink\">next &gt;&gt;</a>";
    }else{
        nextCPage = "next &gt;&gt;";
    }
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
      <%=prevRPage%> &nbsp;[competitors]&nbsp; <%=nextRPage%><br>
      <%=prevCPage%> &nbsp;[test&nbsp;cases]&nbsp; <%=nextCPage%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="<%=cases.getRowCount()+2%>">System Test Results</td>
</tr>
<tr>
   <td class="tableHeader" width="10%" valign="bottom"><A href="<%=selfLink%><%=pagingRParam%><%=pagingCParam%>&<%=Constants.PRIMARY_COLUMN%>=1&<%=Constants.SORT_ORDER%>=<%=("1".equals(request.getParameter(Constants.PRIMARY_COLUMN))&&!"desc".equals(request.getParameter(Constants.SORT_ORDER)))?"desc":"asc"%>">Handle</A></td>
   <td class="tableHeader" width="9%" valign="bottom"><A href="<%=selfLink%><%=pagingRParam%><%=pagingCParam%>&<%=Constants.PRIMARY_COLUMN%>=2&<%=Constants.SORT_ORDER%>=<%=("2".equals(request.getParameter(Constants.PRIMARY_COLUMN))&&!"asc".equals(request.getParameter(Constants.SORT_ORDER)))?"asc":"desc"%>">Score</A></td>
<rsc:iterator list="<%=cases%>" id="resultRow">
   <%
        String sortDir;
        if(StringUtils.checkNull(request.getParameter(Constants.TEST_CASE_ID)).equals(""+resultRow.getItem("test_case_id")) &&
                "3".equals(request.getParameter(Constants.PRIMARY_COLUMN)))
        {
            sortDir = !"asc".equals(request.getParameter(Constants.SORT_ORDER))?"asc":"desc";
        }else{
            sortDir = "desc";
        }
   %>
   <td class="tableHeader" align="right" nowrap="nowrap"><A href="<%=selfLink%><%=pagingRParam%><%=pagingCParam%>&<%=Constants.PRIMARY_COLUMN%>=3&<%=Constants.SORT_ORDER%>=<%=sortDir%>&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>">Test Case <rsc:item name="rank" row="<%=resultRow%>"/></A><br>
   (<A href="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>?module=ViewSystemTest&<%=Constants.TEST_CASE_ID%>=<rsc:item name="test_case_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>">details</A>)</td>
</rsc:iterator>
</tr>
<%boolean even = true;%>
<rsc:iterator list="<%=coders%>" id="coderRow">
<tr align="right">
   <td class="<%=even?"statLt":"statDk"%>" align="left" nowrap="nowrap"><tc-webtag:handle coderId='<%=coderRow.getLongItem("coder_id")%>'/></td>
   <td class="<%=even?"statLt":"statDk"%>"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewSubmissionHistory&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.PROBLEM_ID%>=<%=request.getParameter(Constants.PROBLEM_ID)%>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=coderRow%>"/>"><rsc:item name="final_points" row="<%=coderRow%>"/></a></td>
<rsc:iterator list="<%=cases%>" id="caseRow">
   <td class="<%=even?"statLt":"statDk"%>"><tc-webtag:format object="<%=scoreHash.get(coderRow.getItem("coder_id") + "_" + caseRow.getItem("test_case_id"))%>" ifNull="--"/></td>
</rsc:iterator>
</tr>
<%even=!even;%>
</rsc:iterator>
      </TABLE>
      </TD>
   </tr>
</TABLE>

<div class="pagingBox">
      <%=prevRPage%> &nbsp;[competitors]&nbsp; <%=nextRPage%><br>
      <%=prevCPage%> &nbsp;[test&nbsp;cases]&nbsp; <%=nextCPage%>
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