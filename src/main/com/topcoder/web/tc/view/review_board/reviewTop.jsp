<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="conceptualization"/>
        </jsp:include>
    </c:when>
	<c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="specification"/>
        </jsp:include>
    </c:when>
	<c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="application_testing"/>
        </jsp:include>
    </c:when>
</c:choose>
