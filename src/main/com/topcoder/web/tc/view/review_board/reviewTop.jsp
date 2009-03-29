<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Since: Specification Review Signup Pages 1.0
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
    <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE ||
        projectType == APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="application_testing"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE ||
        projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="architecture"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == ASSEMBLY_PROJECT_TYPE ||
        projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="assembly"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
    <c:when test="${projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
    </c:when>
</c:choose>
