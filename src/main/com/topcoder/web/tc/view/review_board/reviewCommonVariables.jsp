<%--
  - Author: TCSASSEMBLER
  - Version: 1.0
  - Since: Specification Review Integration 1.0 (copied from Specification Review Signup Pages 1.0)
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will define several variables used in those pages.
--%>

<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" scope="request"/>

<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="TEST_SUITES_PROJECT_TYPE" value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>"/>
<c:set var="TEST_SCENARIOS_PROJECT_TYPE" value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>"/>
<c:set var="UI_PROTOTYPE_PROJECT_TYPE" value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" />
<c:set var="RIA_BUILD_PROJECT_TYPE" value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" />
<c:set var="RIA_COMPONENT_PROJECT_TYPE" value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" />
<c:set var="ARCHITECTURE_PROJECT_TYPE" value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" scope="request"/>
<c:set var="ASSEMBLY_PROJECT_TYPE" value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" scope="request"/>
<c:set var="CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="SPECIFICATION_SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_SPECIFICATION_PROJECT_TYPE%>"
    scope="request"/>
<c:set var="TEST_SUITES_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.TEST_SUITES_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>    
<c:set var="ARCHITECTURE_SPECIFICATION_PROJECT_TYPE" value="<%=Constants.ARCHITECTURE_SPECIFICATION_PROJECT_TYPE%>"
    scope="request"/>
<c:set var="ASSEMBLY_SPECIFICATION_PROJECT_TYPE" value="<%=Constants.ASSEMBLY_SPECIFICATION_PROJECT_TYPE%>"
    scope="request"/>
<c:set var="DESIGN_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.DESIGN_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="DEVELOPMENT_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.DEVELOPMENT_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Suites"/>
	<c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Scenarios"/>
	<c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="UI Prototype"/>
	<c:set var="handleContext" value="ui_prototype" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Build"/>
	<c:set var="handleContext" value="ria_build" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Component"/>
	<c:set var="handleContext" value="ria_component" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization Specification" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Specification" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Suites Specification" scope="request"/>
        <c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Scenarios Specification" scope="request"/>
        <c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Architecture Specification" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Assembly Specification" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Design Specification" scope="request"/>
        <c:set var="handleContext" value="design" scope="request"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Development Specification" scope="request"/>
        <c:set var="handleContext" value="development" scope="request"/>
    </c:when>
</c:choose>
