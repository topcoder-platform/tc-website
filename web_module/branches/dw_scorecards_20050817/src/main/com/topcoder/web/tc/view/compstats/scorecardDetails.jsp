<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtags" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>

  <jsp:include page="../script.jsp" />


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
    ResultSetContainer scorecard = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("scorecard");
    String lastQuestion = "";

%>

<table border="1">

<rsc:iterator list="<%=scorecard%>" id="resultRow">
    <tr>

<% if(!lastQuestion.equals(resultRow.getStringItem("question_desc")) { %>
    <td>
        <rsc:item name="question_desc" row="<%=resultRow%>"/> <rsc:item name="question_text" row="<%=resultRow%>"/>
    </td>
    <td>
        <% if (resultRow.getStringItem("num_tests") == null) { %>
            <rsc:item name="evaluation" row="<%=resultRow%>"/>
        <% } else { %>
            Passed: <rsc:item name="num_passed" row="<%=resultRow%>"/>
            Total: <rsc:item name="num_tests" row="<%=resultRow%>"/>
        <% } %>
    </td>
<% } %>

    </tr>
    <tr>
        <td><rsc:item name="response_text" row="<%=resultRow%>"/>
        </td>
        <td><rsc:item name="response_type_desc" row="<%=resultRow%>"/>
        </td>

    </tr>
</rsc:iterator>

</table>



</body>

</html>
