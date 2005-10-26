<%@  page language="java"
    import="com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.*"%>

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
vertical-align: top;
background-color: #DDDDEE;
color: #333333;
font-size: 11px;
font-weight: normal;
text-decoration: none;
padding-top: 5px;
padding-bottom: 5px;
padding-left: 5px;
padding-right: 5px;
}
.appealCells
{
vertical-align: top;
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
.showText, .hideText
{
width: 100%;
}
.showText{ display: block }
.hideText{ display: none }
</style>

<script language="javascript" type="text/javascript">
<!--
function toggleDisplay(objectID){
   var object = document.getElementById(objectID);
   if(object.className == 'showText') object.className = 'hideText';
   else object.className = 'showText';
   return;
}
function showAll(){
   var x = document.getElementsByTagName('div');
   for (var i=0;i<x.length;i++){
      if (x[i].id.substring (0,5) == 'longQ'){
         x[i].className = 'showText';
      }else if(x[i].id.substring (0,6) == 'shortQ'){
         x[i].className = 'hideText';
      }
   }
}
function hideAll(){
   var x = document.getElementsByTagName('div');
   for (var i=0;i<x.length;i++){
      if (x[i].id.substring (0,5) == 'longQ'){
         x[i].className = 'hideText';
      }else if(x[i].id.substring (0,6) == 'shortQ'){
         x[i].className = 'showText';
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

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value='<%="112".equals(projectInfo.getStringItem(0,"phase_id"))?"des_contests":"dev_contests"%>'/>

            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Scorecard"/>
</jsp:include>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="<%="112".equals(projectInfo.getStringItem("phase_id"))?"des_contests":"dev_contests"%>"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Scorecard"/>
</jsp:include>


<span class="bodySubtitle">Component Statistics >
<a href='/tc?module=CompList&pi=<rsc:item set="<%=projectInfo%>" name="phase_id"/>' class="statLink">
<rsc:item set="<%=projectInfo%>" name="phase_desc"/> Contests</a>
 > <a href='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" set="<%=projectInfo%>"/>' class="bcLink">Contest Details</a>
 > Scorecard Details</span>
<br><br>
<b>Contest:</b> <a href='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" set="<%=projectInfo%>"/>' class="statLink"><rsc:item set="<%=projectInfo%>" name="component_name"/> <rsc:item set="<%=projectInfo%>" name="version_text"/></a>
<br>
<b>Component:</b> <A href='https://software.topcoder.com/catalog/c_component.jsp?comp=<rsc:item set="<%=projectInfo%>" name="component_id"/>&ver=<rsc:item set="<%=projectInfo%>" name="version_id"/>' class="statLink"><rsc:item set="<%=projectInfo%>" name="component_name"/></A>
<br>
<b>Coder:</b> <tc-webtag:handle coderId='<%= uid %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
<br>
<b>Reviewer:</b> <tc-webtag:handle coderId='<%= rid %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
<br><br>
<A href="javascript:showAll();">Expand all questions</A>&#160;|&#160;<A href="javascript:hideAll();">Contract all questions</A>
<br><br>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

            <rsc:iterator list="<%=scorecard%>" id="resultRow">

            <% if (!lastSection.equals(resultRow.getStringItem("section_desc"))) {
            lastSection = resultRow.getStringItem("section_desc");
            %>
            <tr>
               <td class="tableHeader" style="border-top: 1px solid #999999;">(<rsc:item name="section_weight" row="<%=resultRow%>"/>)</td>
               <td class="tableHeader" colspan="2" style="border-top: 1px solid #999999;"><rsc:item name="section_desc" row="<%=resultRow%>"/></td>
            </tr>
            <% } %>


            <% if (!lastQuestion.equals(resultRow.getStringItem("question_desc"))) {
            lastQuestion = resultRow.getStringItem("question_desc");
            %>
            <tr>
               <td class="statDk" style="border-top: 1px solid #999999;">
               <b>(<rsc:item name="question_weight" row="<%=resultRow%>" ifNull="" />)</b>
               </td>
               <td class="statDk" width="100%" style="border-top: 1px solid #999999;">

               <div class="showText" id="shortQ_<%=questionNumber%>">
               <b><a href="javascript:toggleDisplay('shortQ_<%=questionNumber%>');toggleDisplay('longQ_<%=questionNumber%>');" class="statLink">[+]</a> <rsc:item name="question_desc" row="<%=resultRow%>" ifNull="" /></b>
               <rsc:item name="question_header" row="<%=resultRow%>" escapeHtml="true" ifNull="" />
               </div>

               <div class="hideText" id="longQ_<%=questionNumber%>">
               <b><a href="javascript:toggleDisplay('shortQ_<%=questionNumber%>');toggleDisplay('longQ_<%=questionNumber%>');" class="statLink">[-]</a> <rsc:item name="question_desc" row="<%=resultRow%>" ifNull="" /></b>
               <rsc:item name="question_text" row="<%=resultRow%>" escapeHtml="true" ifNull="" />
               </div>

               </td>
               <td class="statDk" nowrap="nowrap" valign="top" style="border-top: 1px solid #999999;">
               <b>
               <% if (resultRow.getStringItem("num_tests") == null) { %>
               <rsc:item name="evaluation" row="<%=resultRow%>"/>
               <% } else { %>
               Passed: <rsc:item name="num_passed" row="<%=resultRow%>"/><br>
               Total: <rsc:item name="num_tests" row="<%=resultRow%>"/>
               <% } %>
               </b>
               </td>
            </tr>
            <%
            questionNumber++;
            } %>
            <tr>
               <td class="statLt" style="border-top: 1px solid #999999;">&#160;</td>
               <td class="statLt" style="border-top: 1px solid #999999;">
               <rsc:item name="response_text" row="<%=resultRow%>" escapeHtml="true" />
               &#160;</td>
               <td class="statLt" style="border-top: 1px solid #999999;">
               <rsc:item name="response_type_desc" row="<%=resultRow%>"/>
               &#160;</td>
            </tr>
            <%     if (Boolean.TRUE.equals((Boolean) lastIt.next()) &&
            ((resultRow.getStringItem("appeal_text") != null) || (resultRow.getStringItem("testcase_appeal_text") != null) )) { %>
            <tr>

               <td class="appealCells">&#160;</td>
               <td class="appealCells">
               <b>Previous Score:</b>
               <% if ((resultRow.getStringItem("raw_num_passed") != null) && (resultRow.getStringItem("raw_num_tests") != null)) { %>
               <rsc:item name="raw_num_passed" row="<%=resultRow%>" />/<rsc:item name="raw_num_tests" row="<%=resultRow%>" />
               <% } else { %>
               <rsc:item name="raw_evaluation" row="<%=resultRow%>"  ifNull="unknown *"/>
               <% } %>
               </td>
               <td rowspan="3" class="appealTitle">Appeal</td>
            </tr>
            <tr>
               <td class="appealCells">&#160;</td>
               <td class="appealCells"><b>Appeal Text:</b> <rsc:item name="appeal_text" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
                                 <rsc:item name="testcase_appeal_text" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
               </td>
            </tr>
            <tr>
               <td class="appealCells">&#160;</td>
               <td class="appealCells"><b>Appeal Response:</b> <rsc:item name="appeal_response" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
                                 <rsc:item name="testcase_appeal_response" row="<%=resultRow%>" escapeHtml="true" ifNull=""/>
               </td>
            </tr>
            <%  } %>

            </rsc:iterator>

         </table>
      </td>
   </tr>
</table>
<p>* Some information may be unknown due to missing data from old projects</p>


      </td>

<!-- Right Column -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
