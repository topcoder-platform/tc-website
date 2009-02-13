<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag body-content="empty" %>
<%@ attribute name="width" required="true" %>
<%@ attribute name="height" required="true"%>
<%@ attribute name="submissionId" required="true"%>

<A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}"><img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submissionId}" alt="${submissionId}" style="display: block;" width="${300}" height="${height*300/width}" /></A>

