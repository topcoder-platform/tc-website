<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Version 1.1 (TopCoder Studio Member Profiles Assembly) change notes: linked to Studio's member profile.
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TreeMap" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="contestId" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

<c:set var="currentTime" value="<%=new Date()%>"/>
<c:set var="viewSubmitters" value="${contest.reviewClosed}"/>
<c:set var="module" value="${param[modKey]}"/>

<c:set var="rows" value="${submissions}"/>
<c:if test="${module == 'ViewContestResults'}">
    <c:set var="rows" value="${results}"/>
</c:if>


<?xml version="1.0" encoding="utf-8" ?>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="./i/favicon.ico"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>
        Welcome to TopCoder Studio
    </title>

    <link type="text/css" rel="stylesheet" href="/css/v4/home.css"/>
    <link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css"/>
    <link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css"/>
    <link type="text/css" rel="stylesheet" href="/css/submit.css"/>
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="/css/submit-ie8.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/submit-ie7.css"/>
    <![endif]-->


    <script src="/js/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript" language="javascript"></script>
    <script src="/js/RSSProcessor.js" type="text/JavaScript"></script>
    <script src="/js/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/js/jquery.jcarousel.min.js" type="text/javascript"></script>
    <script src="/js/submit.js" type="text/javascript"></script>


    <script type="text/javascript">
        $(document).ready(function() {
            //Run the script to preload images from CSS
            $.preloadCssImages();
        });
    </script>
</head>

<body>



<div id="page-wrap">
<div>
<jsp:include page="top.jsp"/>
<br/>

<div id="wrapper_submission">

<div class="breadcrumb" style="margin-bottom: 10px;">
    <c:choose>
        <c:when test="${empty isOver || isOver}">
            <a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a>
            &gt;
        </c:when>
        <c:otherwise>
            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
            &gt;
        </c:otherwise>
    </c:choose>
    ${contest.projectName}
</div>


<c:set var="i" value="0"/>
<c:set var="indexFound" value="-9"/>
<c:set var="prevSbm" value="-9"/>
<c:set var="nextSbm" value="-9"/>
<c:set var="lastSbm" value="-9"/>
<c:forEach items="${rows}" var="row">
    <c:if test="${row.map['submission_id'] == sbmid}">
        <c:set var="indexFound" value="${i}"/>
        <c:set var="prevSbm" value="${lastSbm}"/>

        <c:set var="subRow" value="${row}"/>
    </c:if>

    <c:if test="${(indexFound + 1) == i}">
        <c:set var="nextSbm" value="${row.map['submission_id']}"/>
    </c:if>
    <c:set var="i" value="${i + 1}"/>
    <c:set var="lastSbm" value="${row.map['submission_id']}"/>
</c:forEach>


<c:choose>
<c:when test="${indexFound >= 0}">

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="downloadSubmissionBaseUrl" value="studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${subRow.map['submission_id']}&amp;${subAltType}=full&amp;it=28"/>
<c:set var="processor" value="DownloadSubmission"/>

<div class="view-wrapper"><!-- right top corner-->
<div class="view-wrapper-inner"><!-- right bottom corner-->

<div class="view-thumbnail-column">
    <div class="view-thumbnail-column-inner">

        <div class="submission-action-wrapper">
            <div class="submission-action-left-top">
                <div class="submission-action-right-top">
                    <div class="submission-action-right-bottom">
                        <div class="submission-action-left-bottom">
                            <h3 class="submission-caption">Submission #${sbmid} from
                                <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}">
                                        ${contest.projectName}
                                </a>
                            </h3>

                            <div class="button-line">
                                <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}"
                                   class="btn-green">
                                    <span class="right-side"><span class="text">Contest Details</span></span>
                                </a>

                                <studio:forumLink forumID="${contest.forumId}" styleClass="btn-orange"
                                                  message="<span class=\"right-side\"><span class=\"text\">Forum</span></span>"/>

                                <c:set var="winnersAvailable" value="${contest.reviewClosed}"/>
                                <c:set var="winnersPath"
                                       value="${sessionInfo.servletPath}?module=ViewContestResults&amp;${contestId}=${contest.id}"/>
                                <a href="${winnersAvailable ? winnersPath : 'javascript:'}"
                                   class="${winnersAvailable ? 'btn-pur' : 'btn-disabled'}">
                                    <span class="right-side"><span class="text">Winners</span></span>
                                </a>
                            </div>
                            <!--End .button-line-->
                        </div>
                        <!--End .submission-action-left-bottom-->
                    </div>
                    <!--End .submission-action-right-bottom-->
                </div>
                <!--End .submission-action-right-top-->
            </div>
            <!--End .submission-action-left-top-->
        </div>
        <!--End .submission-action-wrapper-->

        <ul class="thumbnail-action-wrapper">
            <li class="action-button"><a href="?${modKey}=DownloadSubmission&amp;sbmid=${sbmid}"
                                         class="btn-download-view">Download</a></li>
            <li class="state-info">
                <span class="state">Image <span class="current-order">1</span> of <span
                    class="total-order">${submission.fullGalleryImagesCount}</span></span>
            </li>
            <li class="action-button">
                <a href="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=1" target="_blank" class="btn-full-size-view"
                   data-url-template="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=">Full Size</a>
            </li>
        </ul>
        <!--End .thumbnail-action-wrapper-->

        <div class="clear"></div>

        <div class="submission-action-wrapper" id="submission-big-size-view">
            <div class="submission-action-left-top">
                <div class="submission-action-right-top">
                    <div class="submission-action-right-bottom">
                        <div class="submission-action-left-bottom">
                            <ul id="submission-big-size-jcarousel" class="jcarousel-skin-tango big-size-carouse">

                                <c:forEach begin="1" end="${submission.fullGalleryImagesCount}" step="1" varStatus="index">
                                    <li class="${index.index == 1 ? 'jcarousel-item-horizontal-actived' : ''}">
                                        <div>
                                            <img src="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=${index.index}" alt=""/>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!--End .submission-action-left-bottom-->
                    </div>
                    <!--End .submission-action-right-bottom-->
                </div>
                <!--End .submission-action-right-top-->
            </div>
            <!--End .submission-action-left-top-->
        </div>
        <!--End .submission-action-wrapper-->

        <div class="submission-action-wrapper" id="studio-declarations-jcarousel-view">
            <div class="submission-action-left-top">
                <div class="submission-action-right-top">
                    <div class="submission-action-right-bottom">
                        <div class="submission-action-left-bottom">
                            <ul id="studio-declarations-jcarousel" class="jcarousel-skin-tango thumbnail-carouse">
                                <c:forEach begin="1" end="${submission.fullGalleryImagesCount}" step="1" varStatus="index">
                                    <li class="${index.index == 1 ? 'jcarousel-item-horizontal-actived' : ''}">
                                        <a href="javascript:;">
                                            <%--<div style="display:table-cell;">--%>
                                            <%--<img src="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=${index.index}" alt=""/>--%>
                                            <img src="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submission.id}&amp;${subAltType}=tiny&amp;${subFileIdx}=${index.index}" alt=""/>
                                            <%--</div>--%>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!--End .submission-action-left-bottom-->
                    </div>
                    <!--End .submission-action-right-bottom-->
                </div>
                <!--End .submission-action-right-top-->
            </div>
            <!--End .submission-action-left-top-->
        </div>
        <!--End .submission-action-wrapper-->

    </div>
    <!--End .view-thumbnail-column-inner-->
</div>
<!--End .view-thumbnail-column-->

<div class="info-sidebar-wrapper">

    <div class="button-line">
        <c:if test="${nextSbm > 0}">
            <a href="?${modKey}=${module}&amp;ct=${contest.id}&amp;sbmid=${nextSbm}&amp;pn=${pn}&amp;ps=${ps}" class="btn-blue btn-next">
               <span class="right-side"><span class="text">
                    <span class="icon"></span>Next Submission
               </span></span>
            </a>
        </c:if>

        <c:if test="${prevSbm > 0}">
            <a href="?${modKey}=${module}&amp;ct=${contest.id}&amp;sbmid=${prevSbm}&amp;pn=${pn}&amp;ps=${ps}"
               class="btn-blue btn-prev">
                   <span class="right-side"><span class="text">
                       <span class="icon"></span>Previous Submission
                   </span></span>
            </a>
        </c:if>
    </div>
    <!--End .button-line-->
    <div class="submission-file-info">
        <h4 class="submission-number">Submission #${sbmid}</h4>
        <c:if test="${viewSubmitters}">
            <span class="author">by <tc-webtag:handle coderId="${submission.submitterId}" context="component" /></span>
        </c:if>

        <div class="list-wrapper">
            <div class="list-wrapper-left-top">
                <div class="list-wrapper-right-top">
                    <div class="list-wrapper-right-bottom">
                        <div class="list-wrapper-left-bottom">
                            <ul>
                                <li>
                                    <label>Uploaded</label>
                                    <span>
                                    <tc-webtag:format object="${submission.createDate}"
                                                      format="MMM d, yyyy"
                                                      timeZone="${sessionInfo.timezone}"/>
                                    </span>
                                </li>
                                <li><label>Total Image </label><span>${submission.fullGalleryImagesCount}</span></li>
                                <li><label>File Size</label><span>
                                    <c:choose>
                                        <c:when test="${submission.fileSize < 1024 * 1024}">
                                            <fmt:formatNumber type="number"
                                                              maxFractionDigits="1"
                                                              groupingUsed="false"
                                                              value="${submission.fileSize / 1024.0}"/>KB
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber type="number"
                                                              maxFractionDigits="2"
                                                              groupingUsed="false"
                                                              value="${submission.fileSize / (1024 * 1024.0)}"/>MB
                                        </c:otherwise>
                                    </c:choose>
                                    </span></li>
                                <li><label>Viewed</label><span>${submission.viewCount}</span></li>
                            </ul>
                        </div>
                        <!--End .list-wrapper-left-bottom-->
                    </div>
                    <!--End .list-wrapper-right-bottom-->
                </div>
                <!--End .list-wrapper-right-top-->
            </div>
            <!--End .list-wrapper-left-top-->
        </div>
        <!--End .list-wrapper-->
    </div>
    <!--End .submission-file-info"-->

        <div class="submission-description-info" style="border-bottom:none;">
            <h4 class="submission-caption">Submission Info</h4>

            <c:choose>
                <c:when test="${empty submission.declaration.comment}">
                    No declarations made
                </c:when>
                <c:when test="${fn:length(submission.declaration.comment) > 200}">
                    <p class="full" style="display:none;"><c:out value="${submission.declaration.comment}" escapeXml="true"/></p>
                    <p class="trimmed">
                        <c:out value="${fn:substring(submission.declaration.comment, 0, 190)}" escapeXml="true"/>...
                        <a class="show-full" href="javascript:;">Read full note.</a>
                    </p>
                </c:when>
                <c:otherwise>
                    <p class="full"><c:out value="${submission.declaration.comment}" escapeXml="true"/></p>
                </c:otherwise>
            </c:choose>
        </div>
        <!--End .submission-description-info"-->

    <c:if test="${submission.declaration.hasExternalContent}">
        <div class="submission-licensed-elements" style="border-top:none;">
            <h4 class="caption">This Submission Contains Licensed Elements</h4>

            <div class="list-wrapper">
                <div class="list-wrapper-left-top">
                    <div class="list-wrapper-right-top">
                        <div class="list-wrapper-right-bottom">
                            <div class="list-wrapper-left-bottom">

                                <c:forEach items="${submission.declaration.groupedExternalContents}" var="entry">
                                    <ul class="font-list">
                                        <li class="header">${entry.key.name}</li>
                                        <c:forEach items="${entry.value}" var="content">
                                            <li>
                                                <a href="<c:out value="${content.propertiesData.Url}" escapeXml="true"/>" >
                                                    <c:set var="title" value="${empty content.propertiesData.FileNumber ? content.propertiesData.Name : content.propertiesData.FileNumber}" />
                                                    <c:out value="${fn:substring(title, 0, 17)}" escapeXml="true" />
                                                    <c:if test="${fn:length(title) > 17}">...</c:if>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </c:forEach>
                            </div>
                            <!--End .list-wrapper-left-bottom-->
                        </div>
                        <!--End .list-wrapper-right-bottom-->
                    </div>
                    <!--End .list-wrapper-right-top-->
                </div>
                <!--End .list-wrapper-left-top-->
            </div>
            <!--End .list-wrapper-->
        </div>
        <!--End .submission-licensed-elements-->
    </c:if>


</div>
<!--End .info-sidebar-wrapper-->


<div class="clear"></div>

</div>
<!--End .view-wrapper-inner-->
</div>
<!--End .view-wrapper-->


</c:when>
<c:otherwise>
    <div id="contentImgFullSize">
        Submission not found.
    </div>
</c:otherwise>
</c:choose>


<!-- #content block ends -->
<br class="clear"/>
</div>

<jsp:include page="foot.jsp"/>

<!-- #links block ends -->
</div>
</div>
<!-- #page-wrap ends -->
</body>
</html>
