<%--
  - Author: pulky, snow01, FireIce, lmmortal, TCSASSEMBLER
  - Version: 1.3
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will resolve included top according to the project type.
  -
  - Version 1.1 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) changes:
  - Added support for new content creation competitions.
  -
  - Version 1.2 (Add Reporting Contest Type) changes:
  - Added support for new reporting competitions
  -
  - Version 1.3 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added support for new Bug Hunt competitions.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE ||
        projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="conceptualization"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE ||
        projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="specification"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE ||
        projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="test_suites"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE ||
        projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="test_scenarios"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE ||
        projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="ui_prototype"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE ||
        projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="ria_build"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE ||
        projectType == CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="content_creation"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == REPORTING_PROJECT_TYPE ||
        projectType == REPORTING_SPECIFICATION_PROJECT_TYPE}">    
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="reporting"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE ||
        projectType == BUG_HUNT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="bug_hunt"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE ||
        projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp" >
            <jsp:param name="level1" value="ria_component"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE ||
        projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE ||
        projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
    	projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
    	projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
</c:choose>