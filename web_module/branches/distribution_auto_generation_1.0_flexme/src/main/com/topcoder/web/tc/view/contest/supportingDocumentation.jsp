<%--
  - Author: pulky, TCSDEVELOPER
  - Version: 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that renders available documentation and helps avoiding duplicated 
  - code in project details pages.
  - 
  - Version 1.1 (Distribution Auto Generation Assembly 1.0) Change notes:
  - Add supporting documentations types: design and development distribution, and display wiki links.
  -
  - Since BUGR-2979
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.tc.Constants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<c:set var="SOFTWARE_SERVER_NAME" value="<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" scope="request"/>
<% ResultSetContainer distInstructions = (ResultSetContainer) request.getAttribute("distInstructions");%>
<c:if test="${show_distribution}">
    <c:choose>
        <c:when test="${fn:length(distInstructions) > 0}">
		<c:set var="instructions_url" value="<%=distInstructions.getStringItem(0, "instructions_url")%>"/>
        </c:when>
        <c:otherwise>
            <c:if test="${project_type == 'development'}">
               <c:set var="instructions_url" value="<%=Constants.DEFAULT_DEVELOPMENT_DISTRIBUTION_SPEC%>"/>
            </c:if>
            <c:if test="${project_type == 'design'}">
               <c:set var="instructions_url" value="<%=Constants.DEFAULT_DESIGN_DISTRIBUTION_SPEC%>"/>
            </c:if>
       </c:otherwise>
    </c:choose>
</c:if>
<c:if test="${fn:length(supportingDocs) > 0}">
    <p><span class="bodySubtitle"><strong>Supporting Documentation</strong></span><br/>
        <c:forEach items="${supportingDocs}" var="resultRow">
            <p>
                <c:choose>
                    <c:when test="${resultRow.map['document_type_id'] == 0}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">Requirements Specification</a>
                    </c:when>
                    <c:when test="${resultRow.map['document_type_id'] == 25}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">Design Distribution</a>(<a target="_blank" href="${instructions_url}">instructions</a>)
                   </c:when>
                   <c:when test="${resultRow.map['document_type_id'] == 26}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">Development Distribution</a>(<a target="_blank" href="${instructions_url}">instructions</a>)
                   </c:when>
                   <c:otherwise>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">${resultRow.map['document_name']}</a>
                   </c:otherwise>
                </c:choose>
        	<br></p>
        </c:forEach>
    </p>
</c:if>
