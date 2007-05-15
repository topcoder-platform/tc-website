<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script type="text/javascript">
  function next() {
    var myForm = document.compListForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.compListForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

    myForm.submit();
  }
</script>


</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>


<%
    ResultSetContainer list = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("comp_list");
    String phaseId = (String) request.getAttribute("phaseId");

%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%="112".equals(phaseId)?"des_stats":"dev_stats"%>"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Component Contest List"/>
</jsp:include>



<% if ("112".equals(phaseId)) { %>
    <span class="bodySubtitle">Component Statistics &gt; Design Contests</span><br>
<% } else { %>
    <span class="bodySubtitle">Component Statistics &gt; Development Contests</span><br>
<% } %>


<form name="compListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CompList"/>
<tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>" value="<%=phaseId%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<div class="pagingBox">
<%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td>
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="9">
            <% if ("112".equals(phaseId)) { %>Design
            <% } else { %>Development
            <% } %>
            Contest Details
            </td></tr>
            <tr>
               <td CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" excludeParams="sr" />" class="statLink">Component</a>
                    <br /><tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                </td>
               <TD CLASS="tableHeader" align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr" />" class="statLink">Category</a></td>
               <TD CLASS="tableHeader" align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true" excludeParams="sr" />" class="statLink">Complete Date</a></td>
               <TD CLASS="tableHeader" align="right"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" excludeParams="sr" />" class="statLink">Registrants</a></td>
               <TD CLASS="tableHeader" align="right"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true" excludeParams="sr" />" class="statLink">Submissions</a></td>
               <TD CLASS="tableHeader" align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" excludeParams="sr" />" class="statLink">Passed<br>Screening</a></td>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true" excludeParams="sr" />" class="statLink">Winner</a></td>
               <TD CLASS="tableHeader" align="right"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="11" includeParams="true" excludeParams="sr" />" class="statLink">Score</a></td>
               <TD CLASS="tableHeader">&#160;</td>
            </tr>
      <%boolean even = true;%>
      <rsc:iterator list="<%=list%>" id="resultRow">
            <TR>
            <td class="<%=even?"statLt":"statDk"%>" align="left"><rsc:item name="component_name" row="<%=resultRow%>" /> <rsc:item name="version_text" row="<%=resultRow%>" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="category_desc" row="<%=resultRow%>" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="complete_date" row="<%=resultRow%>" format="MM.dd.yyyy" ifNull="unknown*"/></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 30px;"><rsc:item name="num_registrations" row="<%=resultRow%>" ifNull="*" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 35px;"><rsc:item name="num_submissions" row="<%=resultRow%>" ifNull="*"/></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 30px;"><rsc:item name="num_valid_submissions" row="<%=resultRow%>" ifNull="*" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="left">
               <% if (resultRow.getStringItem("winner_id") != null) { %>
               <tc-webtag:handle coderId='<%= resultRow.getLongItem("winner_id") %>' context='<%=resultRow.getStringItem("phase_desc")%>'/>
               <% }  %>
               </TD>
            <td class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item name="winner_score" row="<%=resultRow%>" ifNull="" format="0.00"/></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center" nowrap="nowrap"><A HREF='/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>' class="bcLink">Contest Details</a></TD>
            </TR>
      <%even=!even;%>
      </rsc:iterator>
         </table>
      </td>
   </tr>
</table>

<div class="pagingBox">
   <%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
   | <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>

   <br>

   View &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
   &#160;at a time starting with &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
    <button name="nameSubmit" value="submit" type="submit">Go</button>
</div>

</form>
* Some information may be unknown due to missing data from old projects
        </td>

<!-- Right Column -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
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