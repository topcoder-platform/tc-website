<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ tag body-content="empty" %>

<%@ attribute name="row" required="true" type="java.lang.Object" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

<c:set var="submissionId" value="${row.map['submission_id']}"/>
<c:set var="contestId" value="${row.map['contest_id']}"/>
<c:set var="galleryImageCount" value="${row.map['gallery_image_count']}"/>

<%-- Since TopCoder Modifications Assembly Req# 5.9, 5.10 --%>

<c:set var="adminV1" value="<%=ContestChannel.STUDIO_ADMINISTRATOR_V1%>"/>
<c:choose>
    <c:when test="${row.map['contest_channel_id'] eq adminV1}">
        <%-- Old Studio Admin contests --%>
        <c:choose>
            <c:when test="${row.map['is_image']}">
                <div align="center">
                    <strong>ID:</strong> ${submissionId}
                    <div style="overflow: hidden; width: 300px;">
                        <studio_tags:submissionDisplay submissionId="${submissionId}" width="${row.map['width']}" height="${row.map['height']}"/>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div align="center">
                    <strong>ID:</strong> ${submissionId}
                    <br />
                    <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;${subId}=${submissionId}">
                        <img src="/i/v2/interface/magnify.png" alt="" />
                        <span>Download submission</span>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <%-- TC Direct and Studion Admin V2 contests --%>
        <div align="center">
            <strong>ID:</strong>
            ${submissionId}
            <br/>
           <studio_tags:viewSubmissionLink submissionId="${submissionId}"
                                           galleryImageCount="${galleryImageCount}" targetPresentationType="medium"
                                           previewPresentationType="small" showFullVersionLink="true" showDownloadPreviewLink="${row.map['require_preview_file']}"
                                           contestId="${contestId}"/>
        </div>
    </c:otherwise>
</c:choose>
