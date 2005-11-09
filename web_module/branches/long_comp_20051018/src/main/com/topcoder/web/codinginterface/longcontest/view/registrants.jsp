<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@  page
  language="java"
  import="java.util.*,
          java.text.SimpleDateFormat,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%
    Map m = (Map)request.getAttribute("results");
    ResultSetContainer registrants = (ResultSetContainer)m.get("long_contest_round_registrants");
    ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_round_registrants_info");
    ResultSetContainer.ResultSetRow infoRow = null;
    if(rsc != null)
        infoRow = (ResultSetContainer.ResultSetRow)rsc.get(0);
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
<jsp:param name="title" value="Registrants"/>
</jsp:include>

<span class="bigHandle">Contest: <rsc:item name="contest_name" row="<%=infoRow%>"/></span><br>
<span class="bodySubtitle">Registrants: <rsc:item name="num_competitors" row="<%=infoRow%>"/></span><br>

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
   <td class="tableTitle" colspan="6">Registrants</td>
</tr>
<tr>
   <td class="tableHeader" width="20%"><A href="longcontest?<tc-webtag:sort column="1" includeParams="true"/>">Handle</A></td>
   <td class="tableHeader" width="20%"><A href="longcontest?<tc-webtag:sort column="2" includeParams="true"/>">Country</A></td>
   <td class="tableHeader" width="10%"><A href="longcontest?<tc-webtag:sort column="3" includeParams="true"/>">State</A></td>
   <td class="tableHeader" width="30%"><A href="longcontest?<tc-webtag:sort column="4" includeParams="true"/>">School</A></td>
   <td class="tableHeader" width="20%"><A href="longcontest?<tc-webtag:sort column="5" includeParams="true"/>">Default Language</A></td>
</tr>
<%-- ITERATOR --%>
<%boolean even = true;%>
<rsc:iterator list="<%=registrants%>" id="resultRow">
<tr>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="handle" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="country_name" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="state_code" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="school_name" row="<%=resultRow%>"/></td>
   <td class="<%=even?"statLt":"statDk"%>"><rsc:item name="language_name" row="<%=resultRow%>"/></td>
</tr>
<%even=!even;%>
</rsc:iterator>
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