<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag body-content="empty" %>

<%@ attribute name="submissionId" required="true" type="java.lang.Long" %>
<%@ attribute name="galleryImageCount" required="true" type="java.lang.Integer" %>
<%@ attribute name="targetPresentationType" required="true" type="java.lang.String" %>
<%@ attribute name="previewPresentationType" required="true" type="java.lang.String" %>
<%@ attribute name="showFullVersionLink" required="false" type="java.lang.Boolean" %>
<%@ attribute name="showDownloadPreviewLink" required="false" type="java.lang.Boolean" %>
<%@ attribute name="contestId" required="true" type="java.lang.Long" %>

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


<c:choose>
    <c:when test="${galleryImageCount > 0}">
            <%-- There is a gallery of the images --%>
            <a href="${sessionInfo.servletPath}studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}&amp;${subAltType}=${targetPresentationType}&amp;${subFileIdx}=1"
               title="" class="thickbox" rel="gal${submissionId}">
                <img src="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}&amp;${subAltType}=${previewPresentationType}" alt="" />
            </a>
            <div style="visibility:hidden;display:inline;">
                <c:forEach begin="2" end="${galleryImageCount}" step="1" varStatus="index">
                    <a href="${sessionInfo.servletPath}studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}&amp;${subAltType}=${targetPresentationType}&amp;${subFileIdx}=${index.index}"
                       title="" class="thickbox" rel="gal${submissionId}" style="visibility:hidden;display:inline;">
                    </a>
                </c:forEach>
            </div>
            <div align="center">
            <c:if test="${showFullVersionLink}">
                <c:set var="galImgCount" value="<%=Constants.GALLERY_IMAGES_COUNT%>"/>
                <c:set var="cid" value="<%=Constants.CONTEST_ID%>"/>
                <c:set var="contestId" value="${contestId}"/>
                <a href="${sessionInfo.servletPath}?${modKey}=Static&amp;d1=slideshow&amp;${cid}=${contestId}&amp;${subId}=${submissionId}&amp;${subFileIdx}=1&amp;${galImgCount}=${galleryImageCount}">
                    View Full Size</a>
            </c:if>
            <c:if test="${showFullVersionLink and showDownloadPreviewLink}">
                |
            </c:if>
            <c:if test="${showDownloadPreviewLink}">
                <a href="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}">Download Preview File</a>
            </c:if>
            </div>
    </c:when>
    <c:otherwise>
        <%-- There is no preview image which means that there is no gallery also so there is nothing to view - download
             the preview file --%>
        <a href="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}">
            <img src="/i/v2/interface/magnify.png" alt="" />
            <span>Download submission</span>
        </a>
    </c:otherwise>
</c:choose>
