<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<td width="180">
    <c:choose>
    	<c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE || 
    	    projectType == CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="conceptualization_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == SPECIFICATION_PROJECT_TYPE || 
    	    projectType == SPECIFICATION_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="specification_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE || 
    	    projectType == APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="application_testing_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == ARCHITECTURE_PROJECT_TYPE || 
    	    projectType == ARCHITECTURE_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="architecture_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == ASSEMBLY_PROJECT_TYPE || 
    	    projectType == ASSEMBLY_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="assembly_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="des_review"/>
            </jsp:include>
        </c:when>
    	<c:when test="${projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="dev_review"/>
            </jsp:include>
        </c:when>
    </c:choose>
</td>
