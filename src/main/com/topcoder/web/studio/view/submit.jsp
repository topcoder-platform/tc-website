<%--
  - Author: isv
  - Version: 1.2
  - Copyright (C) 2006-2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the page with form for submitting the Studio submission to server.
  -
  - Version 1.1 (Upload Progress Bar assembly) changes: added Upload Progress Bar area.
  - Version 1.2 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) changes: 
  - Updated the form to suit the needs of uploading final fix also.
--%>

<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="contest" type="com.topcoder.web.studio.dto.Project"--%>
<%--@elvariable id="fonts_data" type="List<String[]>"--%>
<%--@elvariable id="stock_art_data" type="List<String[]>"--%>
<%--@elvariable id="has_licensed_content" type="boolean"--%>

<c:if test="${fn:length(fonts_data) == 0}">
    <% request.setAttribute("fonts_data", Arrays.asList(new String[][] {new String[] {"", "", "", null}})); %>
</c:if>
<c:if test="${fn:length(stock_art_data) == 0}">
    <% request.setAttribute("stock_art_data", Arrays.asList(new String[][] {new String[] {"", "", "", null}, new String[] {"", "", "", null}})); %>
</c:if>


<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>


    <link type="text/css" rel="stylesheet" href="/css/v4/home.css"/>
    <link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css"/>
    <link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css"/>
    <link type="text/css" rel="stylesheet" href="/css/submit.css"/>
    <link type="text/css" rel="stylesheet" href="/css/stylish-select.css"/>
    <!--[if IE 8]>
    <link type="text/css" rel="stylesheet" href="/css/submit-ie8.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet"  href="/css/submit-ie7.css"/>
    <![endif]-->
    <link type="text/css" rel="stylesheet" href="/css/studioFinalFix.css"/>


    <link href="/css/popup/modalPopup.css" type="text/css" rel="stylesheet"/>


    <script src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript" language="javascript"></script>
    <script src="/js/RSSProcessor.js" type="text/JavaScript"></script>
    <script src="/js/jquery.jcarousel.min.js" type="text/javascript"></script>

    <script src="/js/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/js/jquery.stylish-select.js" type="text/javascript"></script>
    <script src="/js/submit.js" type="text/javascript"></script>
    <script src="/js/modalPopup.js" type="text/javascript"></script>
</head>

<body id="submit-page" data-web-root="${sessionInfo.servletPath}">
<div id="page-wrap">
<div class="${isFinalFixUpload ? 'studioFF' : ''}">
<jsp:include page="top.jsp"/>
<br/>

<div id="wrapper_submission">

<div class="breadcrumb" style="margin-bottom: 10px;">
            <a href="/?module=ViewActiveContests">Active Challenges</a>
            &gt; ${contest.projectName}
</div>



<c:if test="${not isFinalFixUpload}">
<div class="rank-submission-wrapper">
    <div class="rank-submission-note">

        <c:if test="${demandWorkId != null}">
            <h4>Submission Collaboration</h4>

            <p>View feedback on your submissions and collaborate with the client.</p>
            <p>Click <a href="https://work.${topLevelServerDomain}/projects/${demandWorkId}/submissions">here</a> to view feedback on your submissions and collaborate with the client.</p>
            <br><br>
        </c:if>
        <h4>Rank Your Submissions</h4>

        <p>In the table below you can rank your submissions.</p>

        <c:choose>
            <c:when test="${not empty contest.maxSubmissions}">
                <p>Up to ${contest.maxSubmissions} submission<c:if
                    test="${contest.maxSubmissions>1}">s</c:if>
                    will count for this challenge. They will be indicated by
                    <nobr>this icon <img src="/i/v6/start-icon.png" alt="Selection"/></nobr>
                    .
                    Those submissions that do not have the icon will <strong>NOT</strong> count and
                    they will neither be screened nor reviewed.
                    If you make more than ${contest.maxSubmissions} submission<c:if
                        test="${contest.maxSubmissions>1}">s</c:if>
                    for this challenge, you can rearrange the order of your submissions until the end of the Submission
                    Phase. Note that checkpoint submissions can't be rearranged after checkpoint deadline. All submissions that are not eligible (anything over the submission limit) 
					remaining after the submission phase has ended will be deleted by the system.
                </p>
            </c:when>
            <c:otherwise>
                <nobr>This icon <img src="/i/v6/start-icon.png" alt="Selection"/></nobr>
                indicates preferred submissions
                that will count for this challenge.
            </c:otherwise>
        </c:choose>
    </div>
    <!--End .rank-submission-note-->


    <div class="submission-list-wrapper">
        <div class="submission-list_top">
            <div class="submission-list_top_right">
                <div class="submission-list_top_middle"></div>
            </div>
            <!--End .submission-list_top_right-->
        </div>
        <!--End .submission-list_top-->
        <div class="submission-list_main">
            <ul class="submission-list-header">
                <li class="rank">Rank</li>
                <li class="thumbnails">Thumbnails</li>
                <li class="submission-id">Submission ID</li>
                <li class="submission-id">Submission Type</li>
                <li class="date">Date Submitted</li>
                <li class="move">Move Up/Down</li>
                <li class="remove">Remove</li>
                <li class="download">Download</li>
            </ul>
            <div class="clear"></div>

            <div class="submission-data">
                <jsp:include page="submitTableBody.jsp"/>
            </div>
        </div>
        <!--End .submission-list_main-->
        <div class="submission-list_bottom">
            <div class="submission-list_bottom_right">
                <div class="submission-list_bottom_middle"></div>
            </div>
            <!--End .submission-list_bottom_right-->
        </div>
        <!--End .submission-list_bottom-->
    </div>
    <!--End .submission-list-wrapper-->
    
    <br class="clear"/>
    <div class="button-line">
        <a class="btn-blue btn-next" id="upload-browser-submit" href="https://<%=ApplicationServer.SERVER_NAME%>/challenges/${contest.id}/submit/file">
        <span class="right-side"><span class="text">Add Another Design</span></span>
        </a>
    </div>
    

</div>
<!--End .rank-submission-wrapper-->
</c:if>

<!-- #content block ends -->
<br class="clear"/></div>

</div>
</div>


<jsp:include page="foot.jsp"/>
</div>
</body>
</html>
