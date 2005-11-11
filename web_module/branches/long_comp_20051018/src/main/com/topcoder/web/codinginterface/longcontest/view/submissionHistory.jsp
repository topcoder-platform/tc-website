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
    ResultSetContainer submissions = (ResultSetContainer)resultMap.get("long_coder_submissions");
    ResultSetContainer tmp = (ResultSetContainer)resultMap.get("long_contest_over");
    boolean over = tmp.getBooleanItem(0,0);
    tmp = (ResultSetContainer)resultMap.get("long_contest_coder_submissions_info");
    ResultSetContainer.ResultSetRow infoRow = null;
    if(tmp != null)
        infoRow = (ResultSetContainer.ResultSetRow)tmp.get(0);
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");

    int pageSize = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
    if(!"".equals(StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_RECORDS))))
        pageSize = Integer.parseInt(request.getParameter(DataAccessConstants.NUMBER_RECORDS));

    String selfLink = sessionInfo.getServletPath() + "?" + Constants.MODULE + "=ViewSubmissionHistory"
            + "&" + Constants.ROUND_ID + "=" + request.getParameter(Constants.ROUND_ID)
            + "&" + Constants.COMPONENT_ID + "=" + request.getAttribute(Constants.COMPONENT_ID)
            + "&" + Constants.CODER_ID + "=" + request.getParameter(Constants.CODER_ID)
            + "&" + DataAccessConstants.NUMBER_RECORDS + "=" + pageSize;

    String pagingLink = selfLink
            + "&" + DataAccessConstants.SORT_COLUMN + "=" + StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN))
            + "&" + DataAccessConstants.SORT_DIRECTION + "=" + StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_DIRECTION));

    String prevPage, nextPage;
    if(submissions.croppedDataBefore()){
        prevPage = "<a href=\"" + pagingLink
                + "&" + DataAccessConstants.START_RANK + "=" + Math.max(1,submissions.getStartRow() - pageSize)
                + "\" class=\"bcLink\">&lt;&lt; previous</a>";
    }else{
        prevPage = "&lt;&lt; previous";
    }
    if(submissions.croppedDataAfter()){
        nextPage = "<a href=\"" + pagingLink
                + "&" + DataAccessConstants.START_RANK + "=" + (submissions.getStartRow() + pageSize)
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
<jsp:param name="title" value="Submission History"/>
</jsp:include>

<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
<span class="bodySubtitle">Problem: <rsc:item name="problem_name" row="<%=infoRow%>"/></span><br>
<span class="bodySubtitle">Coder: <tc-webtag:handle coderId='<%=request.getParameter(Constants.CODER_ID)%>'/></span><br>
<span class="bodySubtitle">Submissions: <rsc:item name="num_submissions" row="<%=infoRow%>"/></span><br>

<div class="pagingBox">
      <%=prevPage%> &nbsp;|&nbsp; <%=nextPage%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Submission History</td>
</tr>
<tr>
   <td class="tableHeader" width="25%"><A href="<%=selfLink%><tc-webtag:sort column="3"/>">Submission</A></td>
   <td class="tableHeader" width="25%" align="center"><A href="<%=selfLink%><tc-webtag:sort column="4"/>">Time</A></td>
   <td class="tableHeader" width="25%" align="right"><A href="<%=selfLink%><tc-webtag:sort column="5"/>">Score</A></td>
   <% if(over){ %>
   <td class="tableHeader" width="25%" align="right">&#160;</td>
   <% } %>
</tr>
<%boolean even = true;%>
<rsc:iterator list="<%=submissions%>" id="resultRow">
<tr>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="submission_number" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>" align="center"><%=sdf.format(new Date(resultRow.getLongItem("submit_time")))%></td>
   <td class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item name="submission_points" row="<%=resultRow%>"/></td>
   <% if(over){ %>
   <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 40px;"><A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE%>=ViewProblemSolution&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CODER_ID%>=<rsc:item name="coder_id" row="<%=resultRow%>"/>&<%=Constants.SUBMISSION_NUMBER%>=<rsc:item name="submission_number" row="<%=resultRow%>"/>">solution</A></td>
   <% } %>
</tr>
<%even=!even;%>
</rsc:iterator>
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