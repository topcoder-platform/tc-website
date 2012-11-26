<%--
  - Author: pulky, romanoTC
  - Version: 1.0
  - Version: 1.1 (Distribution Auto Generation Assembly v1.0) Change notes: Added support for showing instruction
    links next to document (@see ProjectDetail.properties)
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a simple include page that renders available documentation and helps avoiding duplicated 
  - code in project details pages.
  - 
  - Since BUGR-2979
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.topcoder.web.tc.Constants" %>

<c:if test="${fn:length(supportingDocs) > 0}">
    <p><span class="bodySubtitle"><strong>Supporting Documentation</strong></span>
    <c:if test="${!canDownloadDocuments}">
        <i>(register the contest to see the documentation)</i>
    </c:if>
    <br/>

        <c:forEach items="${supportingDocs}" var="resultRow" varStatus="status">
            <p>
                <c:choose>
                    <c:when test="${canDownloadDocuments}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<a href="/tc?module=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${resultRow.map['document_id']}">${resultRow.map['document_name']}</a>
                    </c:when>
                    <c:otherwise>
                        &nbsp;&nbsp;&nbsp;&nbsp;<i>${resultRow.map['document_name']}</i>
                    </c:otherwise>
                </c:choose>
                <%-- Wiki instructions link --%>
                <c:if test="${instructionsLinks[status.index] != null}">
                &nbsp;(<a href='${instructionsLinks[status.index]}'>instructions</a>)
                </c:if>
        	<br></p>
        </c:forEach>
    </p>
</c:if>
