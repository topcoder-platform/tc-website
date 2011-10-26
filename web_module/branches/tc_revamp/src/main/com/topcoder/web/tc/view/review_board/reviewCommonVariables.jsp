<%--
  - Author: pulky, snow01, FireIce, lmmortal
  - Version: 1.3
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Version 1.1 (BUGR-3065) changes: added constants for UI prototype, RIA build and RIA component specification
  - reviews
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will define several variables used in those pages.
  -
  - Version 1.2 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) changes:
  - Added constants for new content creation competitions.
  -
  - Version 1.3 (Add Reporting Contest Type) changes:
  - Added constants for new reporting competitions.
--%>

<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="TEST_SUITES_PROJECT_TYPE" value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" scope="request"/>
<c:set var="TEST_SCENARIOS_PROJECT_TYPE" value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" scope="request"/>
<c:set var="UI_PROTOTYPE_PROJECT_TYPE" value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" scope="request"/>
<c:set var="RIA_BUILD_PROJECT_TYPE" value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" scope="request"/>
<c:set var="RIA_COMPONENT_PROJECT_TYPE" value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" scope="request"/>
<c:set var="DESIGN_PROJECT_TYPE" value="<%=Constants.DESIGN_PROJECT_TYPE%>" scope="request"/>
<c:set var="DEVELOPMENT_PROJECT_TYPE" value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" scope="request"/>
<c:set var="ARCHITECTURE_PROJECT_TYPE" value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" scope="request"/>
<c:set var="ASSEMBLY_PROJECT_TYPE" value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" scope="request"/>
<c:set var="CONTENT_CREATION_PROJECT_TYPE" value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="REPORTING_PROJECT_TYPE" value="<%=Constants.REPORTING_PROJECT_TYPE%>" scope="request"/>
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
<c:set var="UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="RIA_BUILD_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.RIA_BUILD_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="REPORTING_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.REPORTING_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization" scope="request"/>
        <c:set var="projectTypeTitle" value="Conceptualization" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Conceptualization Review Board" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Specification Review Board" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Suites" scope="request"/>
        <c:set var="projectTypeTitle" value="Test Suites" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Test Suites Review Board" scope="request"/>
		<c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Scenarios" scope="request"/>
        <c:set var="projectTypeTitle" value="Test Scenarios" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Test Scenarios Review Board" scope="request"/>
		<c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="UI Prototype" scope="request"/>
        <c:set var="projectTypeTitle" value="UI Prototype" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder UI Prototype Review Board" scope="request"/>
		<c:set var="handleContext" value="ui_prototype" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Build" scope="request"/>
        <c:set var="projectTypeTitle" value="RIA Build" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder RIA Build Review Board" scope="request"/>
		<c:set var="handleContext" value="ria_build" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Component" scope="request"/>
        <c:set var="projectTypeTitle" value="RIA Component" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Assembly Review Board" scope="request"/>
		<c:set var="handleContext" value="ria_component" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Conceptualization Review Board" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Specification Review Board" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Test Suites Review Board" scope="request"/>
        <c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Test Scenarios Review Board" scope="request"/>
        <c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder UI Prototype Review Board" scope="request"/>
        <c:set var="handleContext" value="ui_prototype" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder RIA Build Review Board" scope="request"/>
        <c:set var="handleContext" value="ria_build" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder RIA Component Review Board" scope="request"/>
        <c:set var="handleContext" value="ria_component" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture Review Board" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Assembly Review Board" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Content Creation Review Board" scope="request"/>
        <c:set var="handleContext" value="conent_creation" scope="request"/>
    </c:when>
    <c:when test="${projectType == REPORTING_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Reporting Review Board" scope="request"/>
        <c:set var="handleContext" value="reporting" scope="request"/>
    </c:when>
    <c:when test="${projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture or Development Review Boards" scope="request"/>
        <c:set var="handleContext" value="design" scope="request"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Architecture" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture or Development Review Boards" scope="request"/>
        <c:set var="handleContext" value="development" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Architecture" scope="request"/>
        <c:set var="projectTypeTitle" value="Architecture" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture or Development Review Boards" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Assembly" scope="request"/>
        <c:set var="projectTypeTitle" value="Assembly" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Assembly Review Board" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Content Creation" scope="request"/>
        <c:set var="projectTypeTitle" value="Content Creation" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Content Creation Review Board" scope="request"/>
        <c:set var="handleContext" value="content_creation" scope="request"/>
    </c:when>
    <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Reporting" scope="request"/>
        <c:set var="projectTypeTitle" value="Reporting" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Reporting Review Board" scope="request"/>
        <c:set var="handleContext" value="reporting" scope="request"/>
    </c:when>
    <c:when test="${projectType == DESIGN_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Component" scope="request"/>
        <c:set var="projectTypeTitle" value="Design" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture or Development Review Boards" scope="request"/>
        <c:set var="handleContext" value="design" scope="request"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Component" scope="request"/>
        <c:set var="projectTypeTitle" value="Development" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="the TopCoder Architecture or Development Review Boards" scope="request"/>
        <c:set var="handleContext" value="development" scope="request"/>
    </c:when>
</c:choose>

<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" scope="request"/>
