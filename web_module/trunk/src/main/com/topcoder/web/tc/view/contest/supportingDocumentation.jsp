<%--
  - Author: pulky
  - Version: 1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that renders available documentation and helps avoiding duplicated 
  - code in project details pages.
  - 
  - Since BUGR-2979
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<c:set var="SOFTWARE_SERVER_NAME" value="<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" scope="request"/>

<c:if test="${fn:length(supportingDocs) > 0}">
    <p><span class="bodySubtitle"><strong>Supporting Documentation</strong></span><br/>
        <c:forEach items="${supportingDocs}" var="resultRow">
            <p>
                <c:choose>
                    <c:when test="${resultRow.map['document_type_id'] == 0}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">Requirements Specification</a>
                    </c:when>
                    <c:otherwise>
                        &nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="http://${SOFTWARE_SERVER_NAME}/catalog/document?id=${resultRow.map['document_id']}">${resultRow.map['document_name']}</a>
                    </c:otherwise>
                </c:choose>
        	<br></p>
        </c:forEach>
    </p>
</c:if>
