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
<jsp:param name="title" value="Component List"/>
</jsp:include>

<%
    ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("comp_list");

%>

<table border="1">
<tr>
    <TD class="statDk" align="center">Component</td>
    <TD class="statDk" align="center">Phase</td>
    <TD class="statDk" align="center">Registrations</td>
    <TD class="statDk" align="center">Submissions</td>
    <TD class="statDk" align="center">Submissions passed screening</td>
    <TD class="statDk" align="center">Winner</td>
    <tdTD class="statDk" align="center"details</td>
</tr>
<rsc:iterator list="<%=list%>" id="resultRow">
         <TR>
            <TD class="statDk" align="left">
               <rsc:item name="category_desc" row="<%=resultRow%>" />  <rsc:item name="component_name" row="<%=resultRow%>" /> <rsc:item name="version_text" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk" align="center">
                <rsc:item name="phase_desc" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk" align="center">
                <rsc:item name="num_registrations" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk" align="center">
                <rsc:item name="num_submissions" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk" align="center">
                <rsc:item name="num_valid_submissions" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk">
             </TD>
            <% if (resultRow.getItem("winner_id") != null)try { %>
                <tc-webtag:handle coderId='<%= resultRow.getLongItem("winner_id") %>' context="development"/>
             <% } catch(Exception e) { System.out.println("QQ " +resultRow.getItem("winner_id") ); } %>

             <TD class="statDk" align="center">
                <A HREF='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>' class="bcLink">Details</a>
             </TD>
          </TR>
</rsc:iterator>

</table>
<jsp:include page="../../foot.jsp" />

</body>

</html>
