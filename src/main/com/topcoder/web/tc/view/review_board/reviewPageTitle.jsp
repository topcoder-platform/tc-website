<%--
  - Author: pulky, snow01, FireIce
  - Version: 1.1
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will resolve included page title to the project type.
  -
  - Version 1.1 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) changes:
  - Added support for new content creation competitions.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE ||
        projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="conceptualization"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE ||
        projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="specification"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE ||
        projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="test_suites"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE ||
        projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="test_scenarios"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE ||
        projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="ui_prototype"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE ||
        projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="ria_build"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE ||
        projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="ria_component"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE ||
        projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="architecture"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE ||
        projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="software_assembly"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE ||
        projectType == CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="content_creation"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
    	projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="comp_design"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
    	projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="comp_development"/>
            <jsp:param name="title" value="Review Opportunities"/>
        </jsp:include>
    </c:when>
</c:choose>
