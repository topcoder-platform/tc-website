<%--
  - Author: pulky, FireIce
  - Version: 1.4
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all past projects for a specific project type.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Copilot Selection Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Copilot Posting.
  -
  - Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Content Creation.
--%>
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

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_TYPE_ID"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_TYPE_ID"/>
<c:set value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" var="CONCEPTUALIZATION_TYPE_ID"/>
<c:set value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" var="SPECIFICATION_TYPE_ID"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_TYPE_ID"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_TYPE_ID"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_TYPE_ID"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_TYPE_ID"/>

<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_TYPE_ID"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_TYPE_ID"/>
<c:set value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" var="RIA_COMPONENT_TYPE_ID"/>
<c:set value="<%=Constants.COPILOT_POSTING_PROJECT_TYPE%>" var="COPILOT_POSTING_TYPE_ID"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_TYPE_ID"/>

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
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
        <c:choose>
            <c:when test="${pt == DESIGN_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="des_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="dev_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == CONCEPTUALIZATION_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="conceptualization_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == SPECIFICATION_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="specification_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == ARCHITECTURE_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="architecture_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == ASSEMBLY_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="assembly_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == TEST_SUITES_TYPE_ID}">
                 <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="test_suites_stats"/>
                 </jsp:include>
            </c:when>
            <c:when test="${pt == TEST_SCENARIOS_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="test_scenarios_stats"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == UI_PROTOTYPE_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ui_prototype_stats"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == RIA_BUILD_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ria_build_stats"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == RIA_COMPONENT_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ria_component_stats"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="copilot_posting_stats"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == CONTENT_CREATION_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="content_creation_past"/>
                </jsp:include>
            </c:when>
        </c:choose>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<c:choose>
    <c:when test="${pt == DESIGN_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Component Statistics &gt; Design Contests</span><br>
    </c:when>
    <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Component Statistics &gt; Development Contests</span><br>
    </c:when>
    <c:when test="${pt == CONCEPTUALIZATION_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Conceptualization Contests</span><br>
    </c:when>
    <c:when test="${pt == SPECIFICATION_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Specification Contests</span><br>
    </c:when>
    <c:when test="${pt == ARCHITECTURE_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Architecture Contests</span><br>
    </c:when>
    <c:when test="${pt == ASSEMBLY_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Assembly Contests</span><br>
    </c:when>
    <c:when test="${pt == TEST_SUITES_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Test Suites Contests</span><br>
    </c:when>
    <c:when test="${pt == TEST_SCENARIOS_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Component Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Test Scenarios Contests</span><br>
    </c:when>
    <c:when test="${pt == UI_PROTOTYPE_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Studio Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Studio Statistics &gt; UI Prototype Contests</span><br>
    </c:when>
    <c:when test="${pt == RIA_BUILD_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Studio Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Studio Statistics &gt; RIA Build Contests</span><br>
    </c:when>
    <c:when test="${pt == RIA_COMPONENT_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Studio Contest List"/>
        </jsp:include>
        <span class="bodySubtitle">Studio Statistics &gt; RIA Component Contests</span><br>
    </c:when>
    <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Copilot Postings List"/>
        </jsp:include>
        <span class="bodySubtitle">Copilot Postings</span><br>
    </c:when>
    <c:when test="${pt == CONTENT_CREATION_TYPE_ID}">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="statistics_w"/>
            <jsp:param name="title" value="Content Creation List"/>
        </jsp:include>
        <span class="bodySubtitle">Application Statistics &gt; Content Creation Contests</span><br>
    </c:when>
</c:choose>

<form name="compListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CompList"/>
<tc-webtag:hiddenInput name="<%=Constants.PROJECT_TYPE_ID%>" value="${pt}"/>
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
            <tr>
            <c:choose>
                <c:when test="${pt == DESIGN_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Design
                </c:when>
                <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
                    <td class="tableTitle" colspan="10">
                    Development
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Conceptualization
                </c:when>
                <c:when test="${pt == SPECIFICATION_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Specification
                </c:when>
                <c:when test="${pt == ARCHITECTURE_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Architecture
                </c:when>
                <c:when test="${pt == ASSEMBLY_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Assembly
                </c:when>
                <c:when test="${pt == TEST_SUITES_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Test Suites
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Test Scenarios
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    UI Prototype
                </c:when>
                <c:when test="${pt == RIA_BUILD_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    RIA Build
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    RIA Component
                </c:when>
                <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Copilot Posting
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_TYPE_ID}">
                    <td class="tableTitle" colspan="9">
                    Content Creation
                </c:when>
            </c:choose>

            Contest Details

            </td></tr>
            <tr>
                <c:if test="${pt == DEVELOPMENT_TYPE_ID}">
                    <TD CLASS="tableHeader" align="center"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="12" includeParams="true" excludeParams="sr" />" class="statLink">Type</a></td>
                </c:if>
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
            <c:if test="${pt == DEVELOPMENT_TYPE_ID}">
                <td class="<%=even?"statLt":"statDk"%>" align="center"><strong><rsc:item name="type" row="<%=resultRow%>" /></strong></TD>
            </c:if>
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
