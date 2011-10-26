<%--
  - Author: pulky, isv, TCSDEVELOPER, pvmagacho
  - Version: 1.6
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
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
  - Version 1.5 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Applied new L&F
  - Version 1.6 (Re-platforming Studio Release 3 Assembly) changes:
  -     - Updated the logic to use contests hosted in tcs_catalog database  
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
        <link type="text/css" rel="stylesheet" href="./css/screen.css"/>
        <!--[if IE 7]>
        <link rel="stylesheet" type="text/css" href="./css/v4/studio-ie7.css" />
        <link rel="stylesheet" type="text/css" href="./css/newStyle-ie7.css"/>
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
        <script type="text/javascript" src="/js/studioContestDetails.js">
        </script>
    </head>

    <body>
        <div id="page-wrap">
            <div>
                <jsp:include page="top.jsp"/>
                <br />

                <div id="wrapper_submission">
                    <!-- CONTENT BLOCK -->
                    <div id="warpperNew">

                        <jsp:include page="stepBox.jsp"/>

                        <jsp:include page="tabs.jsp">
                            <jsp:param name="currentTab" value="w"/>
                        </jsp:include>

                        <div id="contentSubmissions">
                            <div id="winners">
                                <div id="submissions" align="center">
                                    <c:if test="${not contest.viewableSubmissions}">
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
                                                        viewSubmissions="${contest.viewableSubmissions}"/>
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
