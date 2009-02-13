<%@ tag import="com.topcoder.web.truveo.Constants" %>
<%@ tag body-content="empty" %>
<%@ attribute name="width" required="true" %>
<%@ attribute name="height" required="true" %>
<%@ attribute name="submissionId" required="true" %>
<%@ attribute name="includeLink" required="false" %>
<%@ attribute name="isAdminSite" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="DownloadSubmission" var="processor"/>
<c:if test="${isAdminSite}">
    <c:set value="DownloadSubmission" var="processor"/>
</c:if>

<c:set value="true" var="actuallyIncludeLink"/>
<c:if test="${includeLink != null && !includeLink}">
    <c:set value="false" var="actuallyIncludeLink"/>
</c:if>

<c:choose>
    <c:when test="${width<=300}">
        <c:if test="${actuallyIncludeLink}">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${processor}&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}">
        </c:if>
        <img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${processor}&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" alt="${submissionId}" style="display: block;" width="${width}" height="<fmt:formatNumber value="${height}" maxFractionDigits="0"/>"/>
        <c:if test="${actuallyIncludeLink}">
            </a>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:if test="${actuallyIncludeLink}">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${processor}&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}">
        </c:if>
        <img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${processor}&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" alt="${submissionId}" style="display: block;" width="${300}" height="<fmt:formatNumber value="${height*300/width}" maxFractionDigits="0"/>"/>
        <c:if test="${actuallyIncludeLink}">
            </a>
        </c:if>
    </c:otherwise>

</c:choose>

