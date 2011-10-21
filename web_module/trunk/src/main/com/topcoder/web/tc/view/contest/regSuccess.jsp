<%--
  - Author: pulky, FireIce, lmmortal
  - Version: 1.5
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows a successful registration message after registration.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Copilot Selection Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Copilot Postings.
  -
  - Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Content Creation.
  -
  - Version 1.5 (Add Reporting Contest Type) changes:
  - Added support for new Reporting competitions.
--%>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% int projectTypeId = ((Integer) request.getAttribute(Constants.PROJECT_TYPE_ID)).intValue(); %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Registration</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_PROJECT_TYPE"/>
<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" var="RIA_COMPONENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.COPILOT_POSTING_PROJECT_TYPE%>" var="COPILOT_POSTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.REPORTING_PROJECT_TYPE%>" var="REPORTING_PROJECT_TYPE"/>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="des_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="dev_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="assembly_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="architecture_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="test_suites_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="test_scenarios_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ui_prototype_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ria_build_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ria_component_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COPILOT_POSTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="copilots_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="content_creation_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == REPORTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="reporting_compete"/>
                    </jsp:include>
                </c:when>
            </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_design"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_suites"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_scenarios"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ui_prototype"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_build"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_component"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COPILOT_POSTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="copilot_posting"/>
                        <jsp:param name="title" value="Active Copilot Postings"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="content_creation"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == REPORTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="reporting"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
            </c:choose>


            <p>
                <strong>You have successfully registered for this contest.</strong>
               <br><br>
                View current <a href="/tc?module=ViewRegistrants&amp;pj=<%=request.getAttribute(Constants.PROJECT_ID)%>">contest registrants</a>
            </p>

        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>

    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
