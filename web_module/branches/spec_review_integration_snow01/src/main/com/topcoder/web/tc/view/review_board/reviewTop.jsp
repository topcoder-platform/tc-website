<%--
  - Author: TCSASSEMBLER
  - Version: 1.0
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will resolve included top according to the project type.
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