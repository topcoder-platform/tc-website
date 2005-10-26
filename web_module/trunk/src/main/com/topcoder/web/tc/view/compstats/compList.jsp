<%@  page language="java"
    import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>

<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

  <jsp:include page="../script.jsp" />
<script type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.compListForm.submit();
     return false;
    } else return true;
  }
  function next() {
    var myForm = document.compListForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
    myForm.<%=DataAccessConstants.SORT_COLUMN%>.value='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
    myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value='<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    myForm.submit();
  }
  function previous() {
    var myForm = document.compListForm;
    myForm.<%=DataAccessConstants.START_RANK%>.value=parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value)-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value='<%="112".equals(phaseId)?"des_contests":"dev_contests"%>'/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Component Project List"/>
</jsp:include>


<span class="bodySubtitle">Component Statistics >
<% if ("112".equals(phaseId)) { %>
    Design Contests</span><br>
<% } else { %>
    Development Contests</span><br>
<% } %>


<form name="compListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CompList"/>
<tc-webtag:hiddenInput name="pi" value="<%=phaseId%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

<span class="bc">
<% if ("112".equals(phaseId)) { %>
    Design  &#160;|&#160; <a href="/tc?module=CompList&pi=113" class="bcLink">Development</a>
<% } else { %>
    <a href="/tc?module=CompList&pi=112" class="bcLink">Design</a>  &#160;|&#160; Development
<% } %>
</span>

<div class="pagingBox">
<%=(list.croppedDataBefore()?"<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>":"&lt;&lt; prev")%>
| <%=(list.croppedDataAfter()?"<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>":"next &gt;&gt;")%>
</div>

<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
   <tr>
      <td class="divider" >
         <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
            <tr><td class="tableTitle" colspan="7">
            <% if ("112".equals(phaseId)) { %>Design
            <% } else { %>Development
            <% } %>
            Contest Details
            </td></tr>
            <tr>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" excludeParams="sr" />" class="statLink">Component</a></td>
               <TD CLASS="tableHeader" align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr" />" class="statLink">Category</a></td>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" excludeParams="sr" />" class="statLink">Registrants</a></td>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true" excludeParams="sr" />" class="statLink">Submissions</a></td>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" excludeParams="sr" />" class="statLink">Passed<br>Screening</a></td>
               <TD CLASS="tableHeader"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true" excludeParams="sr" />" class="statLink">Winner</a></td>
               <TD CLASS="tableHeader">&#160;</td>
            </tr>
      <%boolean even = true;%>
      <rsc:iterator list="<%=list%>" id="resultRow">
            <TR>
            <td class="<%=even?"statLt":"statDk"%>" align="left"><rsc:item name="component_name" row="<%=resultRow%>" /> <rsc:item name="version_text" row="<%=resultRow%>" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="category_desc" row="<%=resultRow%>" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="num_registrations" row="<%=resultRow%>" ifNull="unknown *" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="num_submissions" row="<%=resultRow%>" ifNull="unknown *"/></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="center"><rsc:item name="num_valid_submissions" row="<%=resultRow%>" ifNull="unknown *" /></TD>
            <td class="<%=even?"statLt":"statDk"%>" align="left">
               <% if (resultRow.getStringItem("winner_id") != null) { %>
               <tc-webtag:handle coderId='<%= resultRow.getLongItem("winner_id") %>' context='<%=resultRow.getStringItem("phase_desc")%>'/>
               <% }  %>
               </TD>
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
   <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
   &#160;at a time starting with &#160;
   <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4" onKeyPress="submitEnter(event)"/>
   <a href="javascript:document.compListForm.submit();" class="bcLink">&#160;[ submit ]</a>
</div>

</form>
* Some information may be unknown due to missing data from old projects
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
