<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all submissions for a given contest.
  -
  - Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
  - * The layout of this page was updated to include several improvements: (among others)
  -    * Better distribution of submissions.
  -    * Multiple image preview.
  -    * View full page preview in the same page.
  -    * Pagination and thumbnails controls added.
--%>

<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="contestId" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="viewSubmitters" value="<%=ContestProperty.VIEWABLE_SUBMITTERS%>"/>

<c:set var="viewSubmitters" value="${contest.configMap[viewSubmitters]}"/>

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
                                <c:when test="${isOver}">
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
                        <c:choose>
                            <c:when test="${contest.status.id==11}">
                                <div id="content"> 
                                  <div class="contentTop"> 
                                    <div class="contentMiddle"> 
                                      <h1>This contest has been abandoned</h1>
                                
                                      <div align="center"> 
                                        <div style="width:500px; padding: 50px 0px 100px 0px;">
                                          When a contest is abandoned, the client has made no
                                          effort to complete their responsibility toward the
                                          competition. This includes choosing winners,
                                          communication with TopCoder Studio and other
                                          obligations. This inaction reflects very poorly on the
                                          client with any future contests and their standing
                                          within the community and our company.
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>                                                                
                            </c:when>
                            <c:when test="${contest.status.id==10}">
                                <div id="content"> 
                                  <div class="contentTop"> 
                                    <div class="contentMiddle"> 
                                      <h1>No Winners have been chosen</h1>
                                      <div align="center"> 
                                        <div style="width:500px; padding: 50px 0px 100px 0px;">
                                          The client has decided not to choose any winners for
                                          this competition. Please refer to the forums for
                                          further details.
                                          Thank you for participating in this and all Studio
                                          contests.
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>                                                              
                            </c:when>
                            
                            <c:otherwise>

                                <div id="contentSubmissions">
                                    <h1 class="middle">
                                        All Submissions
                                    </h1>
                                    <div id="submissions">
                                        <studio_tags:pagination
                                            baseUrl="/?${modKey}=ViewSubmissions&amp;${contestId}=${contest.id}"
                                            itemsNumber="${totalItems}" pageNumber="${pn}" pageSize="${ps}"/>
                                        <br />

                                        <table>
                                            <tbody>
                                                <tr>
                                                    <c:set var="i" value="1"/>
                                                    <c:forEach items="${submissions}" var="resultRow">
                                                        <td>
                                                            <studio_tags:submissionPreview
                                                                row="${resultRow}" showPlacement="false"
                                                                viewSubmitters="${viewSubmitters}"/>
                                                        </td>
                                                        <c:if test="${i % 4 == 0}">
                                                            </tr><tr>
                                                        </c:if>
                                                        <c:set var="i" value="${i + 1}"/>
                                                    </c:forEach>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />

                                        <h1 class="middleLine">
                                            &nbsp;
                                        </h1>

                                        <studio_tags:pagination
                                            baseUrl="/?${modKey}=ViewSubmissions&amp;${contestId}=${contest.id}"
                                            itemsNumber="${totalItems}" pageNumber="${pn}" pageSize="${ps}"/>

                                    </div><!-- .submissions block ends -->
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!-- #contentSubmissions block ends -->
                        
                        <!-- View Preview Image In Full Size -->
                        <div class="hide" id="contentImgFullSize">
                            <h1>
                                Submission #
                                <span class="subId">123456</span>
                            </h1>
                            <div class="leftAlign">
                                <span>
                                    <a id="backToSubmissions" href="#">
                                        &lt;&lt; Back to submissions
                                    </a>
                                </span>
                            </div>
                            <div class="rightAlign">
                                <span>
                                    <a id="downloadLink" href="?${modKey}=DownloadSubmission&amp;${subId}=">
                                        Download
                                    </a>
                                </span>
                            </div>
                            <div class="noControl">
                                &nbsp;
                            </div>
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
                                    <span class="totalCount">9</span>
                                </span>
                            </div>
                            <div class="previewImg">
                                <img src="i/preview_image_full_1.png" alt="123456" />
                            </div>
                        </div>
                        <!-- #contentImgFullSize block ends -->
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
