<%@ tag import="com.topcoder.web.studio.Constants" %>
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

        <%-- TC Direct and Studion Admin V2 contests --%>
        <div align="center">
            <strong>ID:</strong>
            ${submissionId}
            <br />
           <studio_tags:viewSubmissionLink submissionId="${submissionId}"
                                           galleryImageCount="${galleryImageCount}" targetPresentationType="medium"
                                           previewPresentationType="small" showFullVersionLink="true" showDownloadPreviewLink="${row.map['require_preview_file']}"
                                           contestId="${contestId}"/>
        </div>
