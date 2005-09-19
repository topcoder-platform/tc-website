<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.*"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

  <jsp:include page="../script.jsp" />

<style type="text/css">
.appealTitle
{
    background-color: #DDDDEE;
    color: #333333;
    font-size: 14px;
    font-weight: bold;
    text-decoration: none;
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 5px;
    padding-right: 5px;
}
.appealCells
{
    background-color: #EEEEFF;
    color: #333333;
    font-size: 11px;
    font-weight: normal;
    text-decoration: none;
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 5px;
    padding-right: 5px;
}
.subjectiveResponseCells
{
    background-color: #FFFFFF;
    color: #000000;
    font-size: 11px;
    font-weight: normal;
    text-decoration: none;
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 5px;
    padding-right: 5px;
}

</style>
<script>
function expand(complete)
{
    alert(complete);
}
</script>


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
            lastSubjective.add(lastQuestion.equals(rr.getStringItem("question_desc"))? Boolean.FALSE : Boolean.TRUE);
        } else {
            first = false;
        }
        lastQuestion = rr.getStringItem("question_desc");
    }
    lastSubjective.add(Boolean.TRUE);

    Iterator lastIt = lastSubjective.iterator();

    int questionNumber = 0;
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
        <rsc:item name="question_desc" row="<%=resultRow%>"/>


            <a href='javascript:expand("<rsc:item name="question_text" row="<%=resultRow%>" escapeHtml="true" />")'>[+]</a>
            <rsc:item name="question_header" row="<%=resultRow%>" escapeHtml="true" />

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


<%
        questionNumber++;
    } %>

    <tr>
        <td class="subjectiveResponseCells">
                <rsc:item name="response_text" row="<%=resultRow%>" escapeHtml="true" />

        </td>
        <td class="subjectiveResponseCells">
            <rsc:item name="response_type_desc" row="<%=resultRow%>"/>
        </td>
    </tr>

<%     if (Boolean.TRUE.equals((Boolean) lastIt.next()) &&
        ((resultRow.getStringItem("appeal_text") != null) || (resultRow.getStringItem("testcase_appeal_text") != null) )) { %>

        <tr>
            <td class="appealCells">
            <b>Previous Score:</b>
            <% if ((resultRow.getStringItem("raw_num_passed") != null) && (resultRow.getStringItem("raw_num_passed") != null)) { %>
                <rsc:item name="raw_num_passed" row="<%=resultRow%>" />/<rsc:item name="raw_num_passed" row="<%=raw_num_tests%>" />
            <% } else { %>
                <rsc:item name="raw_evaluation" row="<%=resultRow%>" escapeHtml="true" ifNull="N/A"/>
            <% } %>

            </td>

           <td rowspan="3" class="appealTitle">Appeal</td>
        </tr>

        <tr>
            <td class="appealCells"><b>Appeal Text:</b><rsc:item name="appeal_text" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
                                    <rsc:item name="testcase_appeal_text" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
            </td>

        </tr>
        <tr>
            <td class="appealCells"><b>Appeal Response:</b><rsc:item name="appeal_response" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
                                    <rsc:item name="testcase_appeal_response" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
            </td>
        </tr>


<%  } %>

</rsc:iterator>

</table>



</body>

</html>
