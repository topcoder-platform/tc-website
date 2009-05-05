<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows a message after registration.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new Studio prototype, Studio Build and 
  - Studio Component competitions.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Message</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.APPLICATION_TESTING_PROJECT_TYPE%>" var="APPLICATION_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.STUDIO_PROTOTYPE_PROJECT_TYPE%>" var="STUDIO_PROTOTYPE_PROJECT_TYPE"/>
<c:set value="<%=Constants.STUDIO_BUILD_PROJECT_TYPE%>" var="STUDIO_BUILD_PROJECT_TYPE"/>
<c:set value="<%=Constants.STUDIO_COMPONENT_PROJECT_TYPE%>" var="STUDIO_COMPONENT_PROJECT_TYPE"/>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="des_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="dev_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="assembly_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="architecture_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="app_testing_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="studio_prototype_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="studio_build_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="studio_component_compete"/>
                    </jsp:include>
                </c:when>
            </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_design"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="app_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="studio_prototype"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="studio_build"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == STUDIO_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="studio_component"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
            </c:choose>
            <p>
                <strong><%=(String)request.getAttribute(Constants.MESSAGE)%></strong>
            </p>

        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>

    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>