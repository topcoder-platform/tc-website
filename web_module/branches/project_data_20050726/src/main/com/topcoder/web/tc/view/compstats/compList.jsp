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

<%=
    ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("comp_list");

%>


<span class="bodySubtitle">Development Statistics > Contest Details > <rsc:item set="<%=projectInfo%>" name="phase_desc"/> > <img src='<%=imgName%>' alt='<rsc:item set="<%=projectInfo%>" name="category_desc"/>' border="0" />
<A href='https://software.topcoder.com/catalog/c_component.jsp?comp=<rsc:item set="<%=projectInfo%>" name="component_id"/>&ver=<rsc:item set="<%=projectInfo%>" name="version_id"/>' class="statLink"><rsc:item set="<%=projectInfo%>" name="component_name"/> <rsc:item set="<%=projectInfo%>" name="version_text"/></A></span><br>

<div class="pagingBox">&#160;</div>

<table>

<rsc:iterator list="<%=list%>" id="resultRow">
         <TR>
            <TD class="statDk" align="center">
                <rsc:item name="component_name" row="<%=resultRow%>" /> <rsc:item name="version_text" row="<%=resultRow%>" />
             </TD>
            <TD class="statDk"><tc-webtag:handle coderId='<%= resultRow.getLongItem("user_id") %>' context="development"/></TD>
          </TR>
</rsc:iterator>

</table>
<jsp:include page="../../foot.jsp" />

</body>

</html>
