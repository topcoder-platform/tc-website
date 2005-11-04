<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%
    Map m = null;
    ResultSetContainer.ResultSetRow p;
    m = (Map)request.getAttribute(Constants.LONG_CONTEST_INDEX_KEY);
    ResultSetContainer problems = (ResultSetContainer)m.get("long_problems");
%>

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
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>               
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

<tr>
   <td class="tableTitle" colspan="6">Active Long Competitions</td>
</tr>
<tr>
   <td class="tableHeader">Contest</td>
   <td class="tableHeader" colspan="3" nowrap="nowrap">Problem Name</td>
   <td class="tableHeader" align="center" nowrap="nowrap">Start time</td>
   <td class="tableHeader" align="center" nowrap="nowrap">End time</td>
</tr>

<%boolean even = true;%>
<rsc:iterator list="<%=problems%>" id="resultRow">
<tr>
<td class="<%=even?"statLt":"statDk"%>"><b><rsc:item name="name" row="<%=resultRow%>"/></b>
<div style="float: left;"><img src="/i/longcontest/spon_topcoder.gif" alt="" border="0" /></div>
</td>
<td class="<%=even?"statLt":"statDk"%>"><A href="longcontest?module=ViewProblemStatement&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statLink">
<rsc:item name="class_name" row="<%=resultRow%>"/></A>
</td>
<td class="<%=even?"statLt":"statDk"%>"><%if(!resultRow.getBooleanItem("over") || resultRow.getBooleanItem("practice")){%>
<A href="longcontest?module=Submit&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>&<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" class="statLink">
submit</a>
<%}%>
</td>
<td class="<%=even?"statLt":"statDk"%>"><A href="longcontest?module=ComponentScores&<%=Constants.COMPONENT_ID%>=<rsc:item name="component_id" row="<%=resultRow%>"/>&<%=Constants.ROUND_ID%>=<rsc:item name="round_id" row="<%=resultRow%>"/>" class="statLink">
standings</a>
</td>
<td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><rsc:item name="start_time" row="<%=resultRow%>"/></td>
<td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><%if(!resultRow.getBooleanItem("practice")){%><rsc:item name="end_time" row="<%=resultRow%>"/><%}%></td>
</tr>
<%even=!even;%>
</rsc:iterator>

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