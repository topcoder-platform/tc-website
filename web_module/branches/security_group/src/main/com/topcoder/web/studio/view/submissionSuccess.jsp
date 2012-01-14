<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <title>TopCoder Studio</title>
     <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <link rel="stylesheet" type="text/css" href="/css/submit.css"/>
    <!--[if IE 8]>
    <link rel="stylesheet" type="text/css" href="/css/submit-ie8.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/submit-ie7.css"/>
    <![endif]-->

    <script src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <%--<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>--%>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script src="/js/jquery.ui.core.js" type="text/javascript"></script>
    <script src="/js/submit.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

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
    
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />

<%--    <script language="javascript" type="text/javascript">
        <!--
        function changeRank(newRank, submissionId) {
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=UpdateSubmissionRank&<%=Constants.SUBMISSION_RANK%>=' + newRank + '&<%=Constants.SUBMISSION_ID%>=' + submissionId);
            ajaxRequest.setPostRequest(fader);
            ajaxRequest.sendRequest();
        }
        function remove(submissionId) {
            var confirmed = confirm("Are you sure you want to delete this submission?");
            if (confirmed) {
                var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=DeleteSubmission&<%=Constants.SUBMISSION_ID%>=' + submissionId);
                ajaxRequest.sendRequest();
            }
        }
        function fader() {
            Fat.fade_element('fade0');
            Fat.fade_element('fade1');
            Fat.fade_element('fade2');
            Fat.fade_element('fade3');
            Fat.fade_element('fade4');
            Fat.fade_element('fade5');
            Fat.fade_element('fade6');
            Fat.fade_element('fade7');
            Fat.fade_element('fade8');
            Fat.fade_element('fade9');
        }
        function batchUpdate() {
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=BatchUpdateRank&<%=Constants.CONTEST_ID%>=${contest.id}');
        <c:forEach items="${submissions}" var="submission">
            ajaxRequest.addNamedFormElements("<%=Constants.SUBMISSION_ID%>${submission.id}");
        </c:forEach>
            ajaxRequest.sendRequest();
        }

        // -->
    </script>--%>
</head>

<body data-web-root="${sessionInfo.servletPath}">
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
                <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<!--
        <div class="linkBox">
            <studio:forumLink forumID="${contest.forumId}"/>
        </div>
-->

        <div class="breadcrumb">
            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
            &gt; ${contest.projectName}
        </div>

        <h1>Submission Successfully Uploaded</h1>
        <div align="center">
            <div align="left" style="width:500px; margin-top: 20px;">
                Your Submission Has Been Uploaded
                <br /><br />
                Your submission will be screened after the Submission Phase has ended. You will receive an email with a link to your scorecard results. 
                Be sure to view your scorecard even if you've passed screening because it may contain very important comments or instructions.

                Learn more about screening here: <a href="http://community.topcoder.com/studio/the-process/screening/">http://community.topcoder.com/studio/the-process/screening/</a>
                <br /><br />
                Thank you.
                <br /><br />

                <div align="center">
                    <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onFocus="this.blur();"><img src="/i/v2/interface/btnSubmitAnother.png" alt="submit another" /></a>
                </div>
            </div>
        </div>

        <div style="margin: 40px 0px 20px 0px;">
            <form name="submissionForm" action="#">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
                         <div align="center">
                             <strong>In the table below</strong> you can rank your submissions. <br />

                             <c:choose>
                                 <c:when test="${not empty contest.maxSubmissions}">
                                     Up to ${contest.maxSubmissions} submission<c:if test="${contest.maxSubmissions>1}">s</c:if>
                                     will count for this contest.  They will be indicated by
                                     <nobr>this icon <img src="/i/v2/selection.png" alt="Selection" /></nobr>.  Those submissions that do not have the icon will <b>NOT</b> count and
                                     they will neither be screened nor reviewed.
                                     If you make more than ${contest.maxSubmissions} submission<c:if test="${contest.maxSubmissions>1}">s</c:if>
                                     for this contest, you can rearrange the order of your submissions until the end of the Submission Phase. 
                                     Note that milestone submissions can't be rearranged after milestone deadline. All submissions that are not eligible (anything over the submission limit)
									 remaining after the submission phase has ended will be deleted by the system.
                                 </c:when>
                             <c:otherwise>
                                 <nobr>This icon <img src="/i/v2/selection.png" alt="Selection" /></nobr> indicates preferred submissions that will count for
                             this contest.
                             </c:otherwise>
                             </c:choose>

                             </div>
                <br /><br />

                <div id="wrapper_submission">
                <div class="rank-submission-wrapper">
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
                </div>
                </div>


            </form>
            <br /><br />
            <strong>NOTE:</strong> <nobr>this icon <img src="/i/v2/selection.png" alt="Selection" /></nobr> indicates submissions that you have selected to be considered for this contest
        </div>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
