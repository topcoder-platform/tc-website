<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.*"%>

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
<jsp:param name="title" value="Scorecard Detail"/>
</jsp:include>

<%
    ResultSetContainer scorecard = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("scorecard_details");
    ResultSetContainer projectInfo = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_info");
    String uid = (String) request.getAttribute("uid");
    String rid = (String) request.getAttribute("rid");
    String lastQuestion = "";
    String lastSection = "";

    List lastSubjective = new ArrayList();
    boolean first = true;

    for(Iterator it = scorecard.iterator(); it.hasNext(); ) {
        ResultSetContainer.ResultSetRow rr = (ResultSetContainer.ResultSetRow) it.next();

        if (!first) {
            lastSubjective.add(lastQuestion.equals(rr.getStringItem("question_desc")? Boolean.FALSE : Boolean.TRUE));
        } else {
            fist = false;
        }
        lastQuestion = rr.getStringItem("question_desc");
    }
    lastSubjective.add(Boolean.TRUE);

    Iterator lastIt = lastSubjective.iterator();
%>

<A href='https://software.topcoder.com/catalog/c_component.jsp?comp=<rsc:item set="<%=projectInfo%>" name="component_id"/>&ver=<rsc:item set="<%=projectInfo%>" name="version_id"/>' class="statLink"><rsc:item set="<%=projectInfo%>" name="component_name"/> <rsc:item set="<%=projectInfo%>" name="version_text"/></A></span><br>

Coder: <tc-webtag:handle coderId='<%= uid %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
<br>
Reviewer: <tc-webtag:handle coderId='<%= rid %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>

<table border="1" cellspacing="0" width="100%" class="formFrame">

<rsc:iterator list="<%=scorecard%>" id="resultRow">

<% if (!lastSection.equals(resultRow.getStringItem("section_desc"))) {
        lastSection = resultRow.getStringItem("section_desc");
%>
    <tr>
        <td class="projectTitles" colspan="3">(<rsc:item name="section_weight" row="<%=resultRow%>"/>) <rsc:item name="section_desc" row="<%=resultRow%>"/> </td>
    </tr>


<% } %>


<% if (!lastQuestion.equals(resultRow.getStringItem("question_desc"))) {
        lastQuestion = resultRow.getStringItem("question_desc");
%>
    <tr>
    <td class="projectCells">
        (<rsc:item name="question_weight" row="<%=resultRow%>"/>)
        <rsc:item name="question_desc" row="<%=resultRow%>"/> <rsc:item name="question_text" row="<%=resultRow%>" escapeHtml="true" />
    </td>
    <td class="projectCells">
        <% if (resultRow.getStringItem("num_tests") == null) { %>
            <rsc:item name="evaluation" row="<%=resultRow%>"/>
        <% } else { %>
            Passed: <rsc:item name="num_passed" row="<%=resultRow%>"/><br>
            Total: <rsc:item name="num_tests" row="<%=resultRow%>"/>
        <% } %>
    </td>
    </tr>


<% } %>

    <tr>
        <td class="projectCells"><rsc:item name="response_text" row="<%=resultRow%>" escapeHtml="true" />
        </td>
        <td class="projectCells"><rsc:item name="response_type_desc" row="<%=resultRow%>"/>
        </td>
    </tr>

<%     if (Boolean.TRUE.equals((Boolean) lastIt.next())) { %>
        <tr>
            <td>

           <table border="1" cellspacing="0" width="100%" class="formFrame">
                <tr>
                <td rowspan="2" width="50" class="projectCells">Appeal
                    <td class="projectCells"><rsc:item name="appeal_text" row="<%=resultRow%>" escapeHtml="true" /></td>
                </tr>
                <tr>
                    <td class="projectCells"><rsc:item name="appeal_response" row="<%=resultRow%>" escapeHtml="true" /></td>
                </tr>
           </table>
           </td>
           <td class="projectCells">&nbsp;</td>
        </tr>
<%  } %>

</rsc:iterator>

</table>



</body>

</html>
