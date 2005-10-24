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
.testShow, .testHide
{
width: 100%;
}
.testShow{ display: block }
.testHide{ display: none }
.linkShow{ display: inline }
.linkHide{ display: none }

</style>
<script>
function expand(complete)
{
    alert(complete);
}
</script>
<script language="javascript" type="text/javascript">
<!--
function toggleDisplay(objectID){
   var object = document.getElementById(objectID);
   if(object.className == 'testShow') object.className = 'testHide';
   else object.className = 'testShow';
   return;
}
function showAll(){
   var x = document.getElementsByTagName('div');
   for (var i=0;i<x.length;i++){
      if (x[i].id.substring (0,5) == 'longQ'){
         x[i].className = 'testShow';
      }else if(x[i].id.substring (0,6) == 'shortQ'){
         x[i].className = 'testHide';
      }
   }
}
function hideAll(){
   var x = document.getElementsByTagName('div');
   for (var i=0;i<x.length;i++){
      if (x[i].id.substring (0,5) == 'longQ'){
         x[i].className = 'testHide';
      }else if(x[i].id.substring (0,6) == 'shortQ'){
         x[i].className = 'testShow';
      }
   }
}
// -->
</script>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
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
<br><br>
<A href="javascript:showAll();">Expand all questions</A>&#160;|&#160;<A href="javascript:hideAll();">Contract all questions</A>
<br><br>
<%-------------------------TEST----------------------------%>
<table class="formFrame" border="1" cellspacing="0" width="100%">
   <tbody>
   <tr>
      <td class="projectTitles" colspan="3">(250) Component Design </td>
   </tr>
<%---- QUESTION ID: 01234 ------%>
   <tr>
      <td class="projectCells">
         <div class="testShow" id="shortQ_01234">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_01234');toggleDisplay('longQ_01234');">[+]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum.
         </div>
         <div class="testHide" id="longQ_01234">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_01234');toggleDisplay('longQ_01234');">[-]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum. The reviewer should be able to take each point in the requirements document and find the associated implementation in the design. The reviewer should ignore the quality aspects of the implementation at this point, and only verify whether a requirement is addressed or not. Other questions of the scorecard give you an opportunity to express your concerns about the quality of the design. The reviewer should read the component forum prior to doing this to ensure that any modifications or additions to the requirements are taken into account.
            <br><br>         
            ‘Core’ requirements will be defined as those requirements that are essential to component’s intent (i.e. the component either cannot fulfill its goal or cannot provide value added service to the customer without those requirements).
            <br><br>         
            Rating 1 – The design is missing any of the ‘core’ requirements. The missing requirement(s) prevent the design from fulfilling the goal of the requirements.
            <br><br>         
            Rating 2 – The design has all of the ‘core’ requirements but does not address any of the ‘non-core’ requirements. The design addresses all requirements to solve the problem for which the component was requested, but is missing major usability features from the requirements document.
            <br><br>         
            Rating 3 – The design addresses all of the ‘core’ requirements and a majority of the ‘non-core’ requirements and, potentially, includes minor additional functionality. The design solves the problem for which the component was requested, provides all the usability features, but either does not provide enhancements on top of the requirements, or the added functionality does not alter the customer’s experience with the component.
            <br><br>         
            Rating 4 – The design addresses all requirements and provides new and substantially useful to the customer functionality. 
         </div>
      </td>
      <td class="projectCells" nowrap="nowrap" valign="top">4 - Strongly Agree</td>
   </tr>
   <tr>
      <td class="subjectiveResponseCells">
      Yes.
      </td>
      <td class="subjectiveResponseCells">
      Comment
      </td>
   </tr>
<%---- QUESTION ID: 43210 ------%>
   <tr>
      <td class="projectCells">
         <div class="testShow" id="shortQ_43210">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_43210');toggleDisplay('longQ_43210');">[+]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum.
         </div>
         <div class="testHide" id="longQ_43210">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_43210');toggleDisplay('longQ_43210');">[-]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum. The reviewer should be able to take each point in the requirements document and find the associated implementation in the design. The reviewer should ignore the quality aspects of the implementation at this point, and only verify whether a requirement is addressed or not. Other questions of the scorecard give you an opportunity to express your concerns about the quality of the design. The reviewer should read the component forum prior to doing this to ensure that any modifications or additions to the requirements are taken into account.
            <br><br>         
            ‘Core’ requirements will be defined as those requirements that are essential to component’s intent (i.e. the component either cannot fulfill its goal or cannot provide value added service to the customer without those requirements).
            <br><br>         
            Rating 1 – The design is missing any of the ‘core’ requirements. The missing requirement(s) prevent the design from fulfilling the goal of the requirements.
            <br><br>         
            Rating 2 – The design has all of the ‘core’ requirements but does not address any of the ‘non-core’ requirements. The design addresses all requirements to solve the problem for which the component was requested, but is missing major usability features from the requirements document.
            <br><br>         
            Rating 3 – The design addresses all of the ‘core’ requirements and a majority of the ‘non-core’ requirements and, potentially, includes minor additional functionality. The design solves the problem for which the component was requested, provides all the usability features, but either does not provide enhancements on top of the requirements, or the added functionality does not alter the customer’s experience with the component.
            <br><br>         
            Rating 4 – The design addresses all requirements and provides new and substantially useful to the customer functionality. 
         </div>
      </td>
      <td class="projectCells" nowrap="nowrap" valign="top">4 - Strongly Agree</td>
   </tr>
   <tr>
      <td class="subjectiveResponseCells">
      Yes.
      </td>
      <td class="subjectiveResponseCells">
      Comment
      </td>
   </tr>
<%---- QUESTION ID: 98765 ------%>
   <tr>
      <td class="projectCells">
         <div class="testShow" id="shortQ_98765">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_98765');toggleDisplay('longQ_98765');">[+]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum.
         </div>
         <div class="testHide" id="longQ_98765">
            (70)1.1.1 <a href="javascript:toggleDisplay('shortQ_98765');toggleDisplay('longQ_98765');">[-]</a>
            The design addresses all the requirements as specified in the requirements documents and the forum. The reviewer should be able to take each point in the requirements document and find the associated implementation in the design. The reviewer should ignore the quality aspects of the implementation at this point, and only verify whether a requirement is addressed or not. Other questions of the scorecard give you an opportunity to express your concerns about the quality of the design. The reviewer should read the component forum prior to doing this to ensure that any modifications or additions to the requirements are taken into account.
            <br><br>         
            ‘Core’ requirements will be defined as those requirements that are essential to component’s intent (i.e. the component either cannot fulfill its goal or cannot provide value added service to the customer without those requirements).
            <br><br>         
            Rating 1 – The design is missing any of the ‘core’ requirements. The missing requirement(s) prevent the design from fulfilling the goal of the requirements.
            <br><br>         
            Rating 2 – The design has all of the ‘core’ requirements but does not address any of the ‘non-core’ requirements. The design addresses all requirements to solve the problem for which the component was requested, but is missing major usability features from the requirements document.
            <br><br>         
            Rating 3 – The design addresses all of the ‘core’ requirements and a majority of the ‘non-core’ requirements and, potentially, includes minor additional functionality. The design solves the problem for which the component was requested, provides all the usability features, but either does not provide enhancements on top of the requirements, or the added functionality does not alter the customer’s experience with the component.
            <br><br>         
            Rating 4 – The design addresses all requirements and provides new and substantially useful to the customer functionality. 
         </div>
      </td>
      <td class="projectCells" nowrap="nowrap" valign="top">4 - Strongly Agree</td>
   </tr>
   <tr>
      <td class="subjectiveResponseCells">
      Yes.
      </td>
      <td class="subjectiveResponseCells">
      Comment
      </td>
   </tr>
</table>
<br><br>
<%-------------------------END TEST----------------------------%>


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
        (<rsc:item name="question_weight" row="<%=resultRow%>" ifNull="" />)
        <rsc:item name="question_desc" row="<%=resultRow%>" ifNull="" />


            <a href='javascript:expand("<rsc:item name="question_text" row="<%=resultRow%>" escapeHtml="true" ifNull="" />")'>[+]</a>
            <rsc:item name="question_header" row="<%=resultRow%>" escapeHtml="true" ifNull="" />

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
            <% if ((resultRow.getStringItem("raw_num_passed") != null) && (resultRow.getStringItem("raw_num_tests") != null)) { %>
                <rsc:item name="raw_num_passed" row="<%=resultRow%>" />/<rsc:item name="raw_num_tests" row="<%=resultRow%>" />
            <% } else { %>
                <rsc:item name="raw_evaluation" row="<%=resultRow%>"  ifNull="N/A"/>
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
