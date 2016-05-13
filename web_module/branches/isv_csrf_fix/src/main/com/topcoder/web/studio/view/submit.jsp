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

<%-- Adding a legacy filter.  If &legacy is in the query string then we'll show the legacy submission form. --%>

<c:if test="${param.legacy ne null}">

    <div class="upload_wrapper_submission">
    <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" id="submitForm">

    <c:choose>
        <c:when test="${isFinalFixUpload}">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="UploadFinalFix"/>
        </c:when>
        <c:otherwise>
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
        </c:otherwise>
    </c:choose>

    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

    <ul class="upload_submission_tab">
        <li class="tab-1 active">
            <a class="upload-tab" href="javascript:;"><span class="rightSide">
                    <span class="text" style="text-shadow: 1px 1px 1px rgb(240, 240, 240);">
                        <span class="icon"></span>Browse Your File
                    </span>
                </span></a>
        </li>
        <li class="tab-2">
            <a class="submission_tab" href="javascript:;"><span class="rightSide">
                    <span class="text" style="text-shadow: 1px 1px 1px rgb(240, 240, 240);">
                        <span class="icon"></span>Declare Submission
                    </span>
                </span></a>
        </li>
    </ul>
    <!--End .pload_submission_tab-->
    <div class="upload_submission_content">
    <div class="upload_frame_top">
        <div class="upload_frame_top_right">
            <div class="upload_frame_top_middle"></div>
        </div>
        <!--End .upload_frame_top_right-->
    </div>
    <!--End .upload_frame_top-->
    <div class="upload_frame_main">
    <div class="upload_frame_main_right">
    <div class="upload_frame_main_middle">

    <div class="upload-content upload-pane-1">
        <div class="top-info">
            <a class="btn-help" target="_blank" href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/"></a>
        </div>
        <c:choose>
            <c:when test="${not isFinalFixUpload}">
        <div class="upload-content-description">
            <p>Please follow the instructions on the Challenge Details page regarding what your
                submission, source and preview files should contain. <br>
                Do not name any of your files "declaration.txt" as this is added by our system. <br/>
                Please be sure to double-check that you have submitted the correct files and that your
                JPG files (if applicable) are in RGB color mode. </p>
                
            <p><a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/" target="_blank">
                Learn more about formatting your submission file
            </a></p>
        </div>
            </c:when>
            <c:otherwise>
                <div class="upload-content-description">
                    Upload your final fixes.
                </div>
            </c:otherwise>
        </c:choose>
        <!--End .upload-content-description-->
        <div class="browser-content-upload">
            <div class="fill-item">
                <label>Submission Zip</label>

                <div class="fill-part upload-file-item">
                    <input type="file" class="upload-file fileField" name="<%=Constants.SUBMISSION%>">
                    <span class="fill-note">All submission files (visible to challenge holder)</span>
                </div>
                <!--End .fill-part-->

                <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>">
                    <div class="fill-error">
                        <span class="rightSide"><span class="text">
                            <span class="icon"></span>
                            ${err}
                        </span></span>
                    </div>
                </tc-webtag:errorIterator>

                <!--End .fill-error-->
                <div class="clear"></div>
            </div>
            <!--End .fill-item-->
            <div class="fill-item">
                <label>Source Zip</label>

                <div class="fill-part upload-file-item">
                    <input type="file" class="upload-file fileField" name="<%=Constants.SUBMISSION_SOURCE%>">
                    <span class="fill-note">All source files (not visible to challenge holder)</span>
                </div>
                <!--End .fill-part-->

                <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_SOURCE%>">
                    <div class="fill-error">
                        <span class="rightSide"><span class="text">
                            <span class="icon"></span>
                            ${err}
                        </span></span>
                    </div>
                </tc-webtag:errorIterator>

                <div class="clear"></div>
            </div>
            <!--End .fill-item-->
            <div class="fill-item">
                <label>Preview JPG/PNG</label>

                <div class="fill-part upload-file-item">
                    <input type="file" class="upload-file fileField" name="<%=Constants.SUBMISSION_PREVIEW%>">
                    <span class="fill-note">Single preview image (representing your submission)</span>
                </div>
                <!--End .fill-part-->
                <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_PREVIEW%>">
                    <div class="fill-error">
                        <span class="rightSide"><span class="text">
                            <span class="icon"></span>
                            ${err} <br/>
                        </span></span>
                    </div>
                </tc-webtag:errorIterator>
                <!--End .fill-error-->
                <div class="clear"></div>
            </div>

            <!--End .fill-item-->
            <div class="clear"></div>

            <c:if test="${not isFinalFixUpload}">
            <div class="fill-item fill-item-rank">
                <label>Rank</label>

                <div class="fill-part">
                    <div class="text-input2">
                        <div class="right-side">
                            <input type="text" name="<%=Constants.SUBMISSION_RANK%>" value="<c:out value="${submission_rank}" escapeXml="true"/>">
                        </div>
                    </div>
                    <span class="fill-note">Rank of this submission</span>
                </div>

                <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_RANK%>">
                    <div class="fill-error">
                        <span class="rightSide"><span class="text">
                            <span class="icon"></span>
                            ${err}<br/>
                        </span></span>
                    </div>
                </tc-webtag:errorIterator>

                <!--End .fill-part-->
                <div class="clear"></div>
            </div>
            <!--End .fill-item-->
            </c:if>


            <div class="button-line">
                <a class="btn-blue btn-next" href="javascript:">
                    <span class="right-side">
                        <span class="text">
                            Next<span class="icon"></span>
                        </span>
                    </span>
                </a>
            </div>

            <!--End .button-line-->
        </div>
        <!--End .browser-content-upload-->
    </div>


    <%-- second pane --%>
    <div class="upload-content upload-pane-2" style="display:none;">

        <div class="top-info">
            <a class="btn-help" target="_blank" href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/"></a>
        </div>

        <div class="upload-content-description">
            <div class="comments-column">
                <h6>Comment / Notes</h6>

                <div class="textarea-container">
                    <div class="textarea-top">
                        <div class="textarea-right">
                            <div class="textarea-middle"></div>
                        </div>
                    </div>
                    <div class="textarea-main">
                        <div class="textarea-right">
                            <textarea cols="" rows="" class="textarea" name="<%=Constants.SUBMISSION_COMMENT%>"
                                      title="Comments"><c:out value="${submission_comment}" escapeXml="true"/></textarea>
                        </div>
                    </div>
                    <div class="textarea-bottom">
                        <div class="textarea-right">
                            <div class="textarea-middle"></div>
                        </div>
                    </div>
                </div>
                <!--End .textarea-container-->
            </div>
            <!--End .comments-column-->
            <div class="comments-note-column">
                <p>Type a short note about your design here.<br>Explain revisions or other design
                    elements <br>that may not be clear.</p>

                <p><a class="link" target="_blank" id="seeExample" href="javascript:;">
                    See example
                </a></p>
            </div>
            <!--End .comments-note-column-->
            <div class="clear"></div>
        </div>
        <!--End .browser-content-description-->

        <div id="contain-design-elements-question" class="declare-selection-wrapper">

            <div class="license-elements">
                <h6>Elements with a license:</h6>
                <div class="clear"></div>
            </div>
            <!--End .question-item-->

            <div class="select-list-wrapper select-font-wrapper">
                <div class="select-list-left-top">
                    <div class="select-list-right-top">
                        <div class="select-list-right-bottom">
                            <%--id="lala" --%>
                            <div class="select-list-left-bottom">
                                <div class="select-list-catpion">
                                    <span class="select-list-title">Font</span>
                                </div>
                                <div class="clear"></div>
                                <p class="normaltext">Check to see if your font is on the <a href="http://help.topcoder.com/design/design-copyright-and-font-policies/design-challenges-standard-font-list/" target="_blank">Studio Standard Fonts list</a>. If it is, leave the URL field blank.</p>
                                <p>If you only used fonts that came with the client files, choose "I did not introduce any new fonts" from the dropdown box.</p>
                                <p>If your font is not on the list, you must provide the URL to the font page (not file) from one of the approved font websites in the dropdown box.</p>
                                <h5>Please list ALL fonts you have used in your design below.</h5>
                                <!--End .caption-->

                                <div class="policy">
                                    <a href="http://help.topcoder.com/design/design-copyright-and-font-policies/font-policy-for-design-challenges/" target="_blank">
                                        Read Studio's Font Policy.
                                    </a>
                                </div>
                                
                                <c:forEach items="${fonts_data}" var="font" varStatus="i">
                                    <div class="add-font-item external-content-item">
                                        <select name="font">
                                            <option value="">Choose from this menu</option>
                                            <option value="Studio Standard Fonts list" <c:if test="${font[1] eq 'Studio Standard Fonts list'}">selected="selected"</c:if>>Studio Standard Fonts list</option>
                                            <option value="Fonts.com" <c:if test="${font[1] eq 'Fonts.com'}">selected="selected"</c:if>>Fonts.com</option>
                                            <option value="MyFonts" <c:if test="${font[1] eq 'MyFonts'}">selected="selected"</c:if>>MyFonts</option>
                                            <option value="Adobe Fonts" <c:if test="${font[1] eq 'Adobe Fonts'}">selected="selected"</c:if>>Adobe Fonts</option>
                                            <option value="Font Shop" <c:if test="${font[1] eq 'Font Shop'}">selected="selected"</c:if>>Font Shop</option>
                                            <option value="T.26 Digital Type Foundry" <c:if test="${font[1] eq 'T.26 Digital Type Foundry'}">selected="selected"</c:if>>T.26 Digital Type Foundry</option>
                                            <option value="Font Squirrel" <c:if test="${font[1] eq 'Font Squirrel'}">selected="selected"</c:if>>Font Squirrel</option>
                                            <option value="Linotype" <c:if test="${font[1] eq 'Linotype'}">selected="selected"</c:if>>Linotype</option>
                                            <option value="Typography.com" <c:if test="${font[1] eq 'Typography.com'}">selected="selected"</c:if>>Typography.com</option>
                                            <option value="No New Fonts"  <c:if test="${font[1] eq 'No New Fonts'}">selected="selected"</c:if>>I did not introduce any new fonts</option>
                                        </select>

                                        <div class="text-input">
                                            <div class="right-side">
                                                <input type="text" name="<%= Constants.FONT_NAME %>" title="Font's Name"
                                                       value="<c:out value="${font[0]}" escapeXml="true"/>">
                                            </div>
                                        </div>

                                        <div class="text-input">
                                            <div class="right-side">
                                                <input type="text" name="<%= Constants.FONT_URL %>"
                                                       title="Font's URL Source"
                                                       value="<c:out value="${font[2]}" escapeXml="true"/>">
                                            </div>
                                        </div>
                                        <c:if test="${i.index == fn:length(fonts_data) - 1}">
                                            <a class="btn-add" href="javascript:;"></a>
                                        </c:if>

                                        <c:if test="${not empty font[3]}">
                                            <div class="tip-error">
                                                <span class="rightSide"><span class="text">
                                                    <span class="icon"></span>
                                                    ${font[3]}
                                                </span></span>
                                            </div>
                                        </c:if>

                                        <div class="clear"></div>
                                    </div>
                                </c:forEach>

                                <!--End .add-font-item-->
                            </div>
                            <!--End .select-list-left-bottom-->
                        </div>
                        <!--End .select-list-right-bottom-->
                    </div>
                    <!--End .select-list-right-top-->
                </div>
                <!--End .select-list-left-top-->
            </div>
            <!--End .select-list-wrapper-->


            <div
                class="select-list-wrapper select-stock-art-wrapper ${!contest.allowStockArt ? 'disable-perm disabled' : ''}">
                <div class="select-list-left-top">
                    <div class="select-list-right-top">
                        <div class="select-list-right-bottom">
                            <div class="select-list-left-bottom">
                                <div class="select-list-catpion">
                                    <span class="select-list-title">Stock Art</span>

                                    <c:if test="${!contest.allowStockArt}">
                                        <div class="satip-error" style="width:300px;">
                                            <span class="rightSide"><span class="text"><span class="icon"></span>Stock art is not allowed in this challenge.</span></span>
                                        </div>
                                        <%--<span style="float:right;">
                                            Stock art is not allowed in this contest.
                                        </span>--%>
                                    </c:if>

                                </div>
                                <br/>
                                <!--End .caption-->
                                <c:forEach items="${stock_art_data}" var="sa" varStatus="i">
                                    <div class="stock-art-item external-content-item">
                                        <div class="text-input">
                                            <div class="right-side">
                                                <input type="text" name="<%= Constants.STOCK_ART_NAME %>"
                                                       value="<c:out value="${sa[0]}" escapeXml="true"/>"
                                                       title="Description of photo">
                                            </div>
                                        </div>
                                        <div class="text-input">
                                            <div class="right-side">
                                                <input type="text" name="<%= Constants.STOCK_ART_URL %>"
                                                       value="<c:out value="${sa[1]}" escapeXml="true"/>"
                                                       title="Stock's Art URL Source">
                                            </div>
                                        </div>
                                        <div class="text-input file-number-input">
                                            <div class="right-side">
                                                <input type="text" style="cursor: default;"
                                                       name="<%= Constants.STOCK_ART_FILE_NUMBER %>"
                                                       value="<c:out value="${sa[2]}" escapeXml="true"/>"
                                                       title="File Number">
                                            </div>
                                        </div>
                                        <c:if test="${i.index == fn:length(stock_art_data) - 1}">
                                            <a class="btn-add" href="javascript:;"></a>
                                        </c:if>

                                        <c:if test="${not empty sa[3]}">
                                            <div class="tip-error">
                                                <span class="rightSide"><span class="text">
                                                    <span class="icon"></span>
                                                    ${sa[3]}
                                                </span></span>
                                            </div>
                                        </c:if>


                                        <div class="clear"></div>
                                    </div>
                                </c:forEach>

                                <!--End .stock-art-item-->
                            </div>
                            <!--End .select-list-left-bottom-->
                        </div>
                        <!--End .select-list-right-bottom-->
                    </div>
                    <!--End .select-list-right-top-->
                </div>
                <!--End .select-list-left-top-->
            </div>
            <!--End .select-list-wrapper-->

            <div class="button-line">
                <a class="btn-blue btn-next" id="upload-browser-submit" href="javascript:;">
                    <span class="right-side"><span class="text">Submit</span></span>
                </a>
            </div>
            <!--End .button-line-->

        </div>
        <!--End .declare-selection-wrapper-->

    </div>

    <!--End .upload-content-->
    </div>
    <!--End .upload_frame_main_middle-->
    </div>
    <!--End .upload_frame_main_right-->
    </div>
    <!--End .upload_frame_main-->
    <div class="upload_frame_bottom">
        <div class="upload_frame_bottom_right">
            <div class="upload_frame_bottom_middle"></div>
        </div>
        <!--End .upload_frame_bottom_right-->
    </div>
    <!--End .upload_frame_bottom-->
    </div>
    <!--End .upload_submission_content-->
    </form>
    </div>

    <div class="progress-bar-wrapper hide">
        <div class="progress-bar-completed-bg-wrapper hide"></div>
        <div class="progress-bar-wrapper-left-top">
            <div class="progress-bar-wrapper-right-top">
                <div class="progress-bar-wrapper-right-bottom">
                    <div class="progress-bar-wrapper-left-bottom">
                        <div class="upload-sign">
                            <img alt="loading" src="i/loading-icon.gif" class="upload-image-sign">
                            <img alt="loading" src="i/loading-icon-ima.gif" class="upload-image-sign uploading-now hide">
                            <img alt="loading" src="i/loading-complete-icon.gif"
                                 class="upload-image-sign upload-completed hide">
                            <span class="state">Uploading....</span>
                            <span class="note">Please don�t close the browser until the file is uploaded</span>
                        </div><!--
                         <div class="progress-bar">
                            <span class="left-corner"></span>
                            <span class="right-corner"></span>

                            <div class="progress-bar-inner"><span></span></div>
                        </div> -->
                        <!--End .progress-bar-->
                        <div class="button-line">
                            <a class="btn-write" id="abort-upload" href="javascript:;"><span class="right-side"><span
                                    class="text">Abort uploading</span></span></a>
                            <span class="upload-info"></span>

                            <div class="clear"></div>
                        </div>
                        <!--End .button-line-->
                    </div>
                    <!--End .progress-bar-wrapper-left-bottom-->
                </div>
                <!--End .progress-bar-wrapper-right-bottom-->
            </div>
            <!--End .progress-bar-wrapper-right-top-->
        </div>
        <!--End .progress-bar-wrapper-left-top-->
    </div>

</c:if>


<c:if test="${not isFinalFixUpload}">
<div class="rank-submission-wrapper">
    <div class="rank-submission-note">

        <c:if test="${demandWorkId != null}">
            <h4>Submission Collaboration</h4>

            <p>View feedback on your submissions and collaborate with the client.</p>
            <p>Click <a href="https://connect.${topLevelServerDomain}/projects/${demandWorkId}/current-step">here</a> to view feedback on your submissions and collaborate with the client.</p>
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
