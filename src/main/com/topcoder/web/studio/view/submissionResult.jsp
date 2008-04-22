<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer reviews = (ResultSetContainer) ((Map) request.getAttribute("submission_results")).get("reviews");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
</head>

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="linkBox"><studio:forumLink forumID="${submission.contest.forumId}"/></div>
                
                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?${modKey}=ViewPastContests">Past Contests</a> &gt;
                    ${submission.contest.name}
                </div>

                <h1>Scores</h1>

<div align="center" style="font-size: 32px; font-weight: bold;">
    <studio:handle coderId="${submission.submitter.id}"/>
</div>

<div align="center" style="margin-bottom: 10px; font-weight: bold;">
    Submission ID: ${submission.id}
</div>

<c:set var="contestType" value="${submission.contest.type}"/>

<c:set var="showSubmissions" value="${submission.contest.viewableSubmissions.value}"/>
<c:set var="hasPreviewImage" value="${submission.hasPreviewImage}"/>
<c:set var="submissionId" value="${submission.id}"/>
<c:set var="contestId" value="${submission.contest.id}"/>
<c:set var="galleryImageCount" value="${submission.mediumWatermarkedGalleryImagesCount}"/>

<div align="center" style="margin-bottom: 20px;">
    <div style="overflow: hidden; width: 300px;">
        <c:choose>
            <c:when test="${showSubmissions}">
                <c:choose>
                    <c:when test="${submission.contest.channel.id eq 3}">
                        <%-- Old Studio V1 contests --%>
                        <c:choose>
                            <c:when test="${submission.mimeType.fileType.imageFile}">
                                <studio_tags:submissionDisplay submissionId="${submissionId}" width="${submission.width}" height="${submission.height}"/>
                            </c:when>
                            <c:otherwise>
                                <div id="popIt" class="popUp"><div>View submission</div></div>
                                    <a href="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}">
                                        <img src="/i/v2/interface/magnify.png" alt="" onmouseover="popUp(this,'popIt')" onmouseout="popHide()"/>
                                    </a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <%-- Since TopCoder Modifications Assembly Req# 5.9, 5.10 --%>
                        <%-- All newer contests --%>
                        <c:choose>
                            <c:when test="${showSubmissions}">
                                <studio_tags:viewSubmissionLink hasPreviewImage="${hasPreviewImage}"
                                                                submissionId="${submissionId}"
                                                                galleryImageCount="${galleryImageCount}"
                                                                targetPresentationType="medium"
                                                                previewPresentationType="small"
                                                                contestId="${contestId}"/>
                            </c:when>
                            <c:otherwise>
                                <img src="/i/v2/interface/magnifyFade.png" alt="" />
                            </c:otherwise>
                        </c:choose>
<%--

                        <c:if test="${contestType.previewImageRequired or contestType.previewFileRequired}">
                            <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;${subId}=${submission.id}">
                        </c:if>
                        <c:choose>
                            <c:when test="${contestType.previewImageRequired}">
                                <img src="${sessionInfo.servletPath}?module=DownloadSubmission&amp;${subAltType}=small&amp;${subId}=<rsc:item name="submission_id" row="<%=resultRow%>"/>" alt="" onmouseover="popUp(this,'popView')" onmouseout="popHide()"/>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${contestType.previewFileRequired}">
                                        <img src="/i/v2/interface/magnify.png" alt="" onmouseover="popUp(this,'popView')" onmouseout="popHide()"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/i/v2/interface/magnifyFade.png" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${contestType.previewImageRequired or contestType.previewFileRequired}">
                            </a>
                        </c:if>
--%>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <img src="/i/v2/interface/magnifyFade.png" alt="" />
            </c:otherwise>
        </c:choose>

    </div>
</div>
   
<div align="center" style="margin-bottom: 100px;">
<table style="width: 700px;" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td colspan="4" align="center" style="border-bottom: 1px solid #999999; font-weight: bold;">
            Reviewers & Scores
        </td>
    </tr>
    <tr>
        <rsc:iterator list="<%=reviews%>" id="resultRow">
            <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
                <studio:handle coderId="${resultRow.map['reviewer_id']}"/>
            </td>
        </rsc:iterator>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            Final score
        </td>
    </tr>
    <tr>
        <rsc:iterator list="<%=reviews%>" id="resultRow">
            <td align="center" style="font-size: 36px; font-weight: bold;">
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewReview.do?method=viewReview&amp;rid=${resultRow.map['review_id']}">
                <fmt:formatNumber value="${resultRow.map['score']}" pattern="0.00"/>
                </a>
            </td>
        </rsc:iterator>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            <fmt:formatNumber value="${submission.result.finalScore}" pattern="0.00"/>
        </td>
    </tr>
</tbody>
</table>
</div>

<div align="center">
    Click scores to view the corresponding scorecards via
    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review"><img src="/i/tcorLogo.png" alt="TopCoder Online Review" style="display: block; margin: 3px;" /></a>
</div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>