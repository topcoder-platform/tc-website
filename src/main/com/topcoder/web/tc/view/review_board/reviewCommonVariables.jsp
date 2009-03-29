<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Since: Specification Review Signup Pages 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will define several variables used in those pages.
--%>

<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="APPLICATION_TESTING_PROJECT_TYPE" value="<%=Constants.APPLICATION_TESTING_PROJECT_TYPE%>" scope="request"/>
<c:set var="ARCHITECTURE_PROJECT_TYPE" value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" scope="request"/>
<c:set var="ASSEMBLY_PROJECT_TYPE" value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" scope="request"/>
<c:set var="CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
<c:set var="SPECIFICATION_SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_SPECIFICATION_PROJECT_TYPE%>"
    scope="request"/>
<c:set var="APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE"
    value="<%=Constants.APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE%>" scope="request"/>
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
    <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Application Testing" scope="request"/>
        <c:set var="handleContext" value="application_testing" scope="request"/>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Architecture" scope="request"/>
        <c:set var="handleContext" value="architecture" scope="request"/>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Assembly" scope="request"/>
        <c:set var="handleContext" value="assembly" scope="request"/>
    </c:when>
    <c:when test="${projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization Specification" scope="request"/>
        <c:set var="handleContext" value="conceptualization" scope="request"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification Specification" scope="request"/>
        <c:set var="handleContext" value="specification" scope="request"/>
    </c:when>
    <c:when test="${projectType == APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Application Testing Specification" scope="request"/>
        <c:set var="handleContext" value="application_testing" scope="request"/>
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

<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" scope="request"/>
