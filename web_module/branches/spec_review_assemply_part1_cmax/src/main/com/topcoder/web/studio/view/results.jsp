<%--
  - Author: pulky, isv
  - Version: 1.4
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all winners for a given contest.
  -
  - Version 1.1 (Studio Submission Viewer Upgrade Integration v1.0) Change notes:
  - * The layout of this page was updated to include several improvements: (among others)
  -    * Better distribution of submissions.
  -    * Multiple image preview.
  -    * View full page preview in the same page.
  - Version 1.2 (BUGR-1915) Change notes:
  - * The page was modified to include all submissions as well as the winners list. (matching the original prototype)
  - Version 1.3 (BUGR-2434) Change notes:
  - * Present a message and winning submissions when submissions are not viewable.
  - Version 1.4 ((Studio Homepage Enhancements Release Assembly) - TCCC-1669) Change notes:
  - * The handles for all submitters (not just the winners) are displayed .
--%>

<%@ page import="com.topcoder.web.studio.Constants" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="contestId" value="<%=Constants.CONTEST_ID%>"/>

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

        <script src="./js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"/></script>
        <script src="./js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript"></script>
        <script type="text/javascript">
                $(document).ready(function(){
                    //Run the script to preload images from CSS
                    $.preloadCssImages();
                });
        </script>
        <script src="./js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
        <script src="./js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript" src="/js/navigation.js"></script>

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
                            <a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a>
                            &gt; ${contest.name}
                        </div>
                        <br />

                        <div id="contentSubmissions">
                            <h1>
                                Winners
                            </h1>
                            <div id="winners">
                                <div id="submissions">
                                    <c:if test="${not viewableSubmissions}">
                                        <br/>
                                        <p align="center">
                                            <strong>Submissions are not viewable for this contest.</strong><br/>
                                            There are many reasons why the submissions may not be viewable, such as
                                            the allowance of stock art, or a client's desire to keep the work private.
                                        </p>
                                        <br/><br/>
                                    </c:if>
                                    <table>
                                        <tbody>
                                            <tr align="center">
                                                <c:set var="i" value="1"/>
                                                <c:forEach items="${results}" var="resultRow">
                                                    <c:choose>
                                                        <c:when test="${i == 1}">
                                                            <td class="winner1" colspan="4">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <studio_tags:submissionPreview row="${resultRow}"
                                                        showPlacement="true" viewSubmitters="true"
                                                        viewSubmissions="${viewableSubmissions}"/>
                                                    </td>
                                                    <c:if test="${(i - 1) % 4 == 0 || i == 1}">
                                                        </tr><tr align="center">
                                                    </c:if>
                                                    <c:set var="i" value="${i + 1}"/>
                                                </c:forEach>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                </div><!-- .submissions block ends -->
                            </div>
                            <c:if test="${viewableSubmissions}">
                                <br/>
                                <h1 class="middle">
                                    All Submissions
                                </h1>
                                <div id="submissions">
                                    <studio_tags:pagination
                                        baseUrl="/?${modKey}=ViewContestResults&amp;${contestId}=${contest.id}"
                                        itemsNumber="${totalItems}" pageNumber="${pn}" pageSize="${ps}"/>
                                    <br />
    
                                    <table>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${contest.status.id==11}">
                                                     <tr>
                                                        <td colspan="4">
                                                            <p>
                                                                This contest has been abandoned
                                                            </p>
                                                            <p>
                                                                When a contest is abandoned, the client has made no
                                                                effort to complete their responsibility toward the
                                                                competition. This includes choosing winners,
                                                                communication with TopCoder Studio and other
                                                                obligations. This inaction reflects very poorly on the
                                                                client with any future contests and their standing
                                                                within the community and our company.
                                                            </p>
                                                        </td>
                                                    </tr>
                                                </c:when>
                                                <c:when test="${contest.status.id==10}">
                                                     <tr>
                                                        <td colspan="4">
                                                            <p>
                                                                No winners have been chosen
                                                            </p>
                                                            <p>
                                                                The client has decided not to choose any winners for
                                                                this competition. Please refer to the forums for
                                                                further details.
                                                                Thank you for participating in this and all Studio
                                                                contests.
                                                            </p>
                                                        </td>
    
                                                    </tr>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <c:set var="i" value="1"/>
                                                        <c:forEach items="${submissions}" var="resultRow">
                                                            <td>
                                                                <studio_tags:submissionPreview
                                                                    row="${resultRow}" showPlacement="false"
                                                                    viewSubmitters="true"
                                                                    viewSubmissions="${viewableSubmissions}"/>
                                                            </td>
                                                            <c:if test="${i % 4 == 0}">
                                                                </tr><tr>
                                                            </c:if>
                                                            <c:set var="i" value="${i + 1}"/>
                                                        </c:forEach>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <br />
    
                                    <h1 class="middleLine">
                                        &nbsp;
                                    </h1>
    
                                    <studio_tags:pagination
                                        baseUrl="/?${modKey}=ViewContestResults&amp;${contestId}=${contest.id}"
                                        itemsNumber="${totalItems}" pageNumber="${pn}" pageSize="${ps}"/>
    
                                </div><!-- .submissions block ends -->
                            </c:if>
                        </div>
                        <!-- #contentSubmissions block ends -->
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
