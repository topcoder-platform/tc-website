<%--
  - Author: pulky
  - Version: 1.0
  - Since: BUGR-1755/1756
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows a particular submission in full preview mode.
--%>

<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="contestId" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="viewSubmitters" value="<%=ContestProperty.VIEWABLE_SUBMITTERS%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

<c:set var="viewSubmitters" value="${contest.configMap[viewSubmitters]}"/>
<c:set var="module" value="${param[modKey]}"/>


<c:set var="rows" value="${submissions}"/>
<c:if test="${module == 'ViewContestResults'}">
    <c:set var="rows" value="${results}"/>
</c:if>


<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="./i/favicon.ico" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>
            Welcome to TopCoder Studio
        </title>

        <link type="text/css" rel="stylesheet" href="./css/v4/home.css" />
        <link type="text/css" rel="stylesheet" href="./css/v4/studio-navigation.css" />
        <link type="text/css" rel="stylesheet" href="./css/v4/newstyles.css" />
        <!--[if IE 7]>
        <link rel="stylesheet" type="text/css" href="./css/v4/studio-ie7.css" />
        <![endif]-->
        <!--[if IE 6]>
        <link rel="stylesheet" type="text/css" href="./css/v4/studio-ie6.css" />
        <![endif]-->


        <script src="./js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script src="./js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js"  type="text/javascript"></script>
        <script type="text/javascript">
                $(document).ready(function(){
                    //Run the script to preload images from CSS
                    $.preloadCssImages();
                });
        </script>
        <script src="./js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
        <script src="./js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#nav ul li").hoverIntent(function(){
                    $(this).children("ul").slideDown("fast");
                }, function() {
                    $(this).children("ul").slideUp("fast");
                });

                $("#nav ul ul li").hover(function() {
                    $(this).parents("#nav ul li").children('a').addClass("active-item");
                }, function() {
                    $(this).parents("#nav ul li").children('a').removeClass("active-item");
                });
            });
        </script>

        <script src="./js/RSSProcessor.js" type="text/JavaScript"> </script>
        <script src="./js/AJAXProcessor.js" type="text/JavaScript"> </script>

        <!-- External JavaScripts For CAROUSEL -->
        <script type="text/javascript" src="./js/lib/jquery.jcarousel.pack.js"></script>
    </head>

    <body>
        <div id="page-wrap">
            <div>
                <jsp:include page="top.jsp"/>
                <br />

                <div id="wrapper_submission">
                    <!-- CONTENT BLOCK -->
                    <div id="content_submission">
                        <div class="linkBox">
                            <studio:forumLink forumID="${contest.forumId}"/>
                        </div>
                        <div class="breadcrumb">
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
                            ${contest.name}
                        </div>
                        <br />
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
                                <c:set var="downloadSubmissionBaseUrl"
                                    value="studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${subRow.map['submission_id']}&amp;${subAltType}=full&amp;it=28"/>
                                <c:set var="adminV1" value="<%=ContestChannel.STUDIO_ADMINISTRATOR_V1%>"/>
                                <c:set var="processor" value="DownloadSubmission" />
                                <c:set var="multi" value="false"/>
                                
                                <%-- Decide image to shown according to the contest configuration --%>
                                <c:choose>
                                    <c:when test="${subRow.map['contest_channel_id'] eq adminV1}">
                                        <%-- Old Studio Admin contests --%>
                                        <c:choose>
                                            <c:when test="${subRow.map['is_image']}">
                                                <c:set var="previewImageSrc" value="?${modKey}=${processor}&amp;${subId}=${submissionId}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="previewImageSrc" value="/i/v2/interface/magnify.png"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <%-- TC Direct and Studio Admin V2 contests --%>
                                        <c:set var="multi" value="${subRow.map['gallery_image_count'] > 1}"/>
                                
                                        <c:if test="${not multi}">
                                            <c:set var="previewImageSrc" value="${downloadSubmissionBaseUrl}"/>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                
                                <!-- View Preview Image In Full Size <div id="contentImgFullSize">-->
                                <div id="contentImgFullSize">
                                        <div class="rightAlign">
                                            <span>
                                                  <c:choose>
                                                        <c:when test="${prevSbm > 0}">
                                                            <a href="?${modKey}=${module}&amp;ct=${contest.id}&amp;sbmid=${prevSbm}&amp;pn=${pn}&amp;ps=${ps}">
                                                                &lt;&lt; previous submission
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                                &lt;&lt; previous submission
                                                        </c:otherwise>
                                                  </c:choose>
                                                  &nbsp;&nbsp;&nbsp;
                                                  <c:choose>
                                                        <c:when test="${nextSbm > 0}">
                                                            <a href="?${modKey}=${module}&amp;ct=${contest.id}&amp;sbmid=${nextSbm}&amp;pn=${pn}&amp;ps=${ps}">
                                                                next submission &gt;&gt;
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                                next submission &gt;&gt;
                                                        </c:otherwise>
                                                  </c:choose>
                                            </span>
                                        </div>
                                        <h1>
                                            Submission #
                                            <span class="subId">${sbmid}</span>
                                        </h1>
                                        <div class="leftAlign">
                                            <span>
                                                <a id="backToSubmissions" href="?${modKey}=${module}&amp;ct=${contest.id}&amp;pn=${pn}&amp;ps=${ps}">
                                                    &lt;&lt; Back to submissions
                                                </a>
                                            </span>
                                        </div>
                                        <div class="rightAlign">
                                            <span>
                                                <a id="downloadLink" href="?${modKey}=DownloadSubmission&amp;sbmid=${sbmid}">
                                                    Download
                                                </a>
                                            </span>
                                        </div>
                                        <div class="noControl">
                                            &nbsp;
                                        </div>
                                        <c:if test="${multi}">
                                            <div class="control">
                                                <a href="javascript:;" class="btnPrevious">
                                                    <span class="hide">
                                                        Previous
                                                    </span>
                                                </a>
                                                <a href="javascript:;" class="btnNext">
                                                    <span class="hide">
                                                        Next
                                                    </span>
                                                </a>
                                                <span>
                                                    Image
                                                    <span class="curItem">1</span>
                                                    of
                                                    <span class="totalCount">${subRow.map["gallery_image_count"]}</span>
                                                </span>
                                            </div>
                                        </c:if>
                                        <div class="previewImg">
                                            <c:choose>
                                                <c:when test="${multi}">
                                                        <c:forEach begin="1" end="${subRow.map['gallery_image_count']}" step="1" varStatus="index">
                                                                <div class="${index.index==1?'show':'hide'}" id="prevImg${index.index}">
                                                                    <img src="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=${index.index}" alt="" />
                                                                </div>
                                                        </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="prevImg">
                                                        <img src="${previewImageSrc}" alt="" />
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                </div>
                                <!-- #contentImgFullSize block ends -->
                            </c:when>
                            <c:otherwise>
                                <div id="contentImgFullSize">
                                    Submission not found.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- #content block ends -->
                    <br class="clear" />
                </div>

                <jsp:include page="foot.jsp"/>

            <!-- #links block ends -->
            </div>
        </div>
        <!-- #page-wrap ends -->
    </body>
</html>
