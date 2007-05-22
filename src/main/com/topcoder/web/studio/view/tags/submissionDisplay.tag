<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag body-content="empty" %>
<%@ attribute name="width" required="true" %>
<%@ attribute name="height" required="true"%>
<%@ attribute name="submissionId" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${width<300}">
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}"><img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" alt="${submissionId}" style="display: block;" width="${width}" height="${height*300/width}" /></A>
    </c:when>
    <c:otherwise>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}"><img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" alt="${submissionId}" style="display: block;" width="${300}" height="${height*300/width}" /></A>
    </c:otherwise>

</c:choose>

