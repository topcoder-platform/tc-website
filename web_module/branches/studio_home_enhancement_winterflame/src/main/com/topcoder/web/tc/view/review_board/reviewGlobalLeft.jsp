<%--
  - Author: pulky, snow01
  - Version: 1.0
  - Since: Specification Review Integration 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that that helps avoiding duplicated code in review board pages.
  - It will resolve included global left navigation bar according to the project type.
--%>

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
	        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE ||
	    projectType == TEST_SUITES_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="test_suites_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE ||
	    projectType == TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="test_scenarios_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE ||
	    projectType == UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ui_prototype_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE ||
	    projectType == RIA_BUILD_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ria_build_review"/>
	            </jsp:include>
	        </c:when>
	        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE ||
	    projectType == RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE}">
	            <jsp:include page="/includes/global_left.jsp">
	                <jsp:param name="node" value="ria_component_review"/>
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
        <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
        	projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="des_review"/>
            </jsp:include>
        </c:when>
        <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
        	projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="dev_review"/>
            </jsp:include>
        </c:when>
	</c:choose>
</td>
