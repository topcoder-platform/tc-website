<%--
  - Author: pulky, snow01, FireIce, lmmortal, isv, TCSASSEMBLER
  - Version: 1.6
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
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
  -
  - Version 1.4 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added constants for new Bug Hunt competitions.
  -
  - Version 1.5 (Review Application Integration assembly) change notes:
  -  Updated the logic to use review auctions.
  -
  - Version 1.6 (Release Assembly - TC Community Site and Online Review Update for F2F and Code contest types)
  - Add new contest types: First2Finish and Code
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
<c:set var="BUG_HUNT_PROJECT_TYPE" value="<%=Constants.BUG_HUNT_PROJECT_TYPE%>" scope="request"/>
<c:set var="FIRST2FINISH_PROJECT_TYPE" value="<%=Constants.FIRST2FINISH_PROJECT_TYPE%>" scope="request"/>
<c:set var="CODE_PROJECT_TYPE" value="<%=Constants.CODE_PROJECT_TYPE%>" scope="request"/>
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
<c:set var="BUG_HUNT_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.BUG_HUNT_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization" scope="request"/>
        <c:set var="projectTypeTitle" value="Conceptualization" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Conceptualization Review Board" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Specification Review Board" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Suites" scope="request"/>
        <c:set var="projectTypeTitle" value="Test Suites" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Test Suites Review Board" scope="request"/>
		<c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Scenarios" scope="request"/>
        <c:set var="projectTypeTitle" value="Test Scenarios" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Test Scenarios Review Board" scope="request"/>
		<c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="UI Prototype" scope="request"/>
        <c:set var="projectTypeTitle" value="UI Prototype" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder UI Prototype Review Board" scope="request"/>
		<c:set var="handleContext" value="ui_prototype" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Build" scope="request"/>
        <c:set var="projectTypeTitle" value="RIA Build" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder RIA Build Review Board" scope="request"/>
		<c:set var="handleContext" value="ria_build" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Component" scope="request"/>
        <c:set var="projectTypeTitle" value="RIA Component" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Assembly Review Board" scope="request"/>
		<c:set var="handleContext" value="ria_component" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Conceptualization Review Board" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Specification Review Board" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Test Suites Review Board" scope="request"/>
        <c:set var="handleContext" value="test_suites" scope="request"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Test Scenarios Review Board" scope="request"/>
        <c:set var="handleContext" value="test_scenarios" scope="request"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder UI Prototype Review Board" scope="request"/>
        <c:set var="handleContext" value="ui_prototype" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder RIA Build Review Board" scope="request"/>
        <c:set var="handleContext" value="ria_build" scope="request"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder RIA Component Review Board" scope="request"/>
        <c:set var="handleContext" value="ria_component" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Architecture Review Board" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Assembly Review Board" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Content Creation Review Board" scope="request"/>
        <c:set var="handleContext" value="conent_creation" scope="request"/>
    </c:when>
    <c:when test="${projectType == REPORTING_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Reporting Review Board" scope="request"/>
        <c:set var="handleContext" value="reporting" scope="request"/>
    </c:when>
    <c:when test="${projectType == BUG_HUNT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Bug Hunt Review Board" scope="request"/>
        <c:set var="handleContext" value="bug_hunt" scope="request"/>
    </c:when>
    <c:when test="${projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Specification Review" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Component Design Review Board" scope="request"/>
        <c:set var="handleContext" value="design" scope="request"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Review" scope="request"/>
        <c:set var="projectTypeTitle" value="Architecture" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Component Development Review Board" scope="request"/>
        <c:set var="handleContext" value="development" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Architecture" scope="request"/>
        <c:set var="projectTypeTitle" value="Architecture" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Architecture Review Board" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Assembly" scope="request"/>
        <c:set var="projectTypeTitle" value="Assembly" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Assembly Review Board" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Content Creation" scope="request"/>
        <c:set var="projectTypeTitle" value="Content Creation" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Content Creation Review Board" scope="request"/>
        <c:set var="handleContext" value="content_creation" scope="request"/>
    </c:when>
    <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Reporting" scope="request"/>
        <c:set var="projectTypeTitle" value="Reporting" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Reporting Review Board" scope="request"/>
        <c:set var="handleContext" value="reporting" scope="request"/>
    </c:when>
    <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Bug Hunt" scope="request"/>
        <c:set var="projectTypeTitle" value="Bug Hunt" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Bug Hunt Review Board" scope="request"/>
        <c:set var="handleContext" value="bug_hunt" scope="request"/>
    </c:when>
    <c:when test="${projectType == FIRST2FINISH_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="First2Finish" scope="request"/>
        <c:set var="projectTypeTitle" value="First2Finish" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder First2Finish Review Board" scope="request"/>
        <c:set var="handleContext" value="first2finish" scope="request"/>
    </c:when>
    <c:when test="${projectType == CODE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Code" scope="request"/>
        <c:set var="projectTypeTitle" value="Code" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Code Review Board" scope="request"/>
        <c:set var="handleContext" value="code" scope="request"/>
    </c:when>
    <c:when test="${projectType == DESIGN_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Component" scope="request"/>
        <c:set var="projectTypeTitle" value="Design" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Component Design Review Board" scope="request"/>
        <c:set var="handleContext" value="design" scope="request"/>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Component" scope="request"/>
        <c:set var="projectTypeTitle" value="Development" scope="request"/>
        <c:set var="eligibleReviewBoardName" value="TopCoder Component Development Review Board" scope="request"/>
        <c:set var="handleContext" value="development" scope="request"/>
    </c:when>
</c:choose>

<c:set var="REVIEW_AUCTION_ID" value="<%=Constants.REVIEW_AUCTION_ID%>" scope="request"/>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" scope="request"/>
