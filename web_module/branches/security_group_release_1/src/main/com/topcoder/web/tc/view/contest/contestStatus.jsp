<%--
  - Author: pulky, FireIce, TCSASSEMBLER
  - Version: 1.5
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all active contests for a specific project type to show their status.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) changes:
  - Added support for new Content Creation competitions.
  -
  - Version 1.4 (Add Reporting Contest Type) changes:
  - Added support for new Reporting competitions
  -
  - Version 1.5 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added support for new Bug Hunt competitions.
  -
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer contests = (ResultSetContainer)request.getAttribute("contests");%>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>Contest Status</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_TYPE_ID"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_TYPE_ID"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_TYPE_ID"/>
<c:set value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" var="CONCEPTUALIZATION_TYPE_ID"/>
<c:set value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" var="SPECIFICATION_TYPE_ID"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_TYPE_ID"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_TYPE_ID"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_TYPE_ID"/>
<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_TYPE_ID"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_TYPE_ID"/>
<c:set value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" var="RIA_COMPONENT_TYPE_ID"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_TYPE_ID"/>
<c:set value="<%=Constants.REPORTING_PROJECT_TYPE%>" var="REPORTING_TYPE_ID"/>
<c:set value="<%=Constants.BUG_HUNT_PROJECT_TYPE%>" var="BUG_HUNT_TYPE_ID"/>


<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
      <c:choose>
            <c:when test="${pt == DESIGN_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="des_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="dev_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == ARCHITECTURE_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="architecture_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == CONCEPTUALIZATION_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="conceptualization_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == SPECIFICATION_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="specification_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == ASSEMBLY_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="assembly_contest_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == TEST_SUITES_TYPE_ID}">
               <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="test_suites_status"/>
               </jsp:include>
            </c:when>
            <c:when test="${pt == TEST_SCENARIOS_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="test_scenarios_status"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == UI_PROTOTYPE_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ui_prototype_status"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == RIA_BUILD_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ria_build_status"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == RIA_COMPONENT_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="ria_component_status"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == CONTENT_CREATION_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="content_creation_status"/>
                </jsp:include>
            </c:when>
            <c:when test="${pt == REPORTING_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="reporting_status"/>
                </jsp:include>
            </c:when>
          <c:when test="${pt == BUG_HUNT_TYPE_ID}">
              <jsp:include page="/includes/global_left.jsp">
                  <jsp:param name="node" value="bug_hunt_contest_status"/>
              </jsp:include>
          </c:when>
      </c:choose>
</td>

<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

      <c:choose>
        <c:when test="${pt == DESIGN_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="comp_design"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="architecture"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
         <c:when test="${pt == CONCEPTUALIZATION_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="conceptualization"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == SPECIFICATION_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="specification"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SUITES_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="test_scenarios"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="ui_prototype"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_BUILD_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="ria_build"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_COMPONENT_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="ria_component"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONTENT_CREATION_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="content_creation"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == REPORTING_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="reporting"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == BUG_HUNT_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                 <jsp:param name="image" value="bug_hunt"/>
                 <jsp:param name="title" value="Contest Status"/>
            </jsp:include>
        </c:when>
      </c:choose>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <c:choose>
        <c:when test="${pt == ARCHITECTURE_TYPE_ID || pt == ASSEMBLY_TYPE_ID || pt == TEST_SUITES_TYPE_ID ||
            pt == TEST_SCENARIOS_TYPE_ID || pt == UI_PROTOTYPE_TYPE_ID || pt == RIA_BUILD_TYPE_ID ||
            pt == RIA_COMPONENT_TYPE_ID || pt == CONTENT_CREATION_TYPE_ID || pt == REPORTING_TYPE_ID || pt == BUG_HUNT_TYPE_ID}">
            <td class="title" colspan="8">Contest Status</td>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_TYPE_ID}">
            <td class="title" colspan="10">Contest Status</td>
        </c:when>
        <c:otherwise>
            <td class="title" colspan="9">Contest Status</td>
        </c:otherwise>
        </c:choose>
    </tr>
    <tr>
        <c:if test="${pt == DEVELOPMENT_TYPE_ID}">
            <td class="headerC">
                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("type")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Type</a>
            </td>
        </c:if>
        <c:if test="${pt != ARCHITECTURE_TYPE_ID && pt != ASSEMBLY_TYPE_ID && pt != TEST_SUITES_TYPE_ID &&
            pt != TEST_SCENARIOS_TYPE_ID && pt != UI_PROTOTYPE_TYPE_ID && pt != RIA_BUILD_TYPE_ID &&
            pt != RIA_COMPONENT_TYPE_ID && pt != CONTENT_CREATION_TYPE_ID && pt != REPORTING_TYPE_ID && pt != BUG_HUNT_TYPE_ID}">
            <td class="headerC">
                <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("catalog_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Catalog</a>
            </td>
        </c:if>
        <td class="header" colspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("component_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Contest</a>
        </td>
        <td class="headerC" nowrap="nowrap">
            Registrants<br>Rated/Unrated
            </td>
        <td class="headerC" nowrap="nowrap">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("reg_end_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submission<br>Due Date</a>
            </td>
    <c:if test="${pt != BUG_HUNT_TYPE_ID}">
        <td class="headerC" nowrap="nowrap">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("final_review_end_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Final Review<br>Due Date</a>
            </td>
    </c:if>
        <td class="headerC">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("current_phase")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Current Phase</a>
        </td>
        <td class="header">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("winner_sort")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Winner</a>

            </td>
        <td class="header">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("second_sort")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Second Place</a>
        </td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <c:if test="${pt == DEVELOPMENT_TYPE_ID}">
                <td class="valueC">
                    <strong><rsc:item name="type" row="<%=resultRow%>"/></strong>
                </td>
            </c:if>
            <c:if test="${pt != ARCHITECTURE_TYPE_ID && pt != ASSEMBLY_TYPE_ID && pt != TEST_SUITES_TYPE_ID &&
                pt != TEST_SCENARIOS_TYPE_ID && pt != UI_PROTOTYPE_TYPE_ID && pt != RIA_BUILD_TYPE_ID &&
                pt != RIA_COMPONENT_TYPE_ID && pt != CONTENT_CREATION_TYPE_ID && pt != REPORTING_TYPE_ID && pt != BUG_HUNT_TYPE_ID}">
            <td class="valueC">
                <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>"
                                      paypalBrand="<%=(resultRow.getItem("paypal_brand") != null && resultRow.getItem("paypal_brand").getResultData() != null)%>"/>
            </td>
            </c:if>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/> <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("viewable")==1) { %>
               <span class="smallText"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item row="<%=resultRow%>" name="component_id"/>&ver=<rsc:item row="<%=resultRow%>" name="version"/>">component details</A></span>
                <% } else { %>
                &#160;
                 <% } %>
            </td>
            <td class="valueC">
             <% if (resultRow.getIntItem("unrated_count") > 0 || resultRow.getIntItem("rated_count") > 0) { %>
             <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
             <% } %>
             <rsc:item name="rated_count" row="<%=resultRow%>"/> / <rsc:item name="unrated_count" row="<%=resultRow%>"/>
             <% if (resultRow.getIntItem("unrated_count") > 0 || resultRow.getIntItem("rated_count") > 0) { %>
             </a>
             <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
            </td>
            <c:if test="${pt != BUG_HUNT_TYPE_ID}">
                <td class="valueC" nowrap="nowrap">
                    <rsc:item name="final_review_end_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                </td>
            </c:if>
            <td class="valueC">
                <rsc:item name="current_phase" row="<%=resultRow%>"/>
            </td>
            <td class="value">
                <% if (resultRow.getItem("winner").getResultData()!=null) { %>
                    <tc-webtag:handle coderId='<%=resultRow.getStringItem("winner") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>

            </td>
            <td class="value">
                <% if (resultRow.getItem("second").getResultData()!=null) { %>
                <tc-webtag:handle coderId='<%=resultRow.getStringItem("second") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>
            </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>

    <p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>

</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

