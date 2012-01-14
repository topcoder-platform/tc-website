<%--
  - Author: isv, pvmagacho
  - Version: 1.1 (Studio Contest Detail Pages assembly)
  - Copyright (C) 2010-2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the list of submissions received milestone prizes along with their and overall
  - milestone feedbacks.
  - Version 1.1 (Re-platforming Studio Release 4 assembly) change notes: re-factored the logic for milestone feedbacks
  - displaying.
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<fmt:setLocale value="en_US"/>
<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="milestoneDate" value="${contest.milestoneDate}"/>
<c:set var="isMultiRound" value="${not empty milestoneDate}"/>
<c:set var="currentTime" value="${requestScope.currentTime}"/>
<c:set var="registered" value="${requestScope.registered}"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>
<c:set var="prizesCount" value="${fn:length(contest.prizes)}"/>
<c:set var="drPointsAvailable" value="${contest.digitalRunPoints > 0}"/>
<c:set var="hasMilestoneRoundPrize"
       value="${isMultiRound and not empty contest.milestonePrize and not empty contest.milestonePrize.numberOfSubmissions and not empty contest.milestonePrize.amount}"/>
<c:set var="placeSuffixes"
       value="<%=new String[] {"st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th"}%>"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>
<c:set var="isStarted" value="${contest.submissionOpen}"/>
<c:set var="isRunning" value="${isStarted and not isFinished}"/>
<c:set var="isMilestoneRoundPassed" value="${isRunning and isMultiRound and contest.milestoneSubmissionClosed}"/>
<c:set var="hasCockpitPermissions" value="${requestScope.has_cockpit_permissions}"/>
<c:set var="milestonePrizedSubmissions" value="${requestScope.milestonePrizedSubmissions}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Contest Details</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_contest_details"/>
    </jsp:include>
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript">
    </script>
    <script type="text/javascript" src="/js/navigation.js"></script>
    <script src="/js/RSSProcessor.js" type="text/JavaScript">
    </script>
    <script src="/js/AJAXProcessor.js " type="text/JavaScript">
    </script>
    <script type="text/javascript" src="/js/studioContestDetails.js">
    </script>
</head>

<body>
<div id="page-wrap">
    <div>
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="contest"/>
        </jsp:include>
        <br/>

        <div id="wrapper_submission">

            <div id="warpperNew">
                <jsp:include page="stepBox.jsp"/>

                <jsp:include page="tabs.jsp">
                    <jsp:param name="currentTab" value="m"/>
                </jsp:include>

                <!--End thirdNavi-->
                <div class="content">
                    <div class="subColumn leftSide">
                        <h5 class="contentTitleNoB">Milestone Winners</h5>

                        <div class="deepGrayBox mileStoneWinners">
                            <span class="grayRCLT"></span>
                            <span class="grayRCRT"></span>
                            <span class="grayRCLB"></span>
                            <span class="grayRCRB"></span>

                            <p>The following submissions have received a milestone prize.</p>
                            <ul>
                                <c:forEach items="${milestonePrizedSubmissions}" var="submission">
                                    <li>
                                        <a href="#feedBack${submission.key}" rel="${submission.key}"
                                           class="feedBack-Show feedBack-Show-${submission.key}">#${submission.key}</a>
                                        <a href="javascript:" rel="${submission.key}"
                                           class="feedBack-Hide feedBack-Hide-${submission.key} hide">#${submission.key}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!--End deepGrayBox-->
                    </div>
                    <!--End subColumn-->
                    <div class="mainColumn">
                        <h5 class="contentTitle firstContentTitle">Overall Milestone Round Feedback</h5>

                        <p class="paragraph">
                            <studio:formatField text="${contest.studioProjectSpecification.generalFeedback}"/>
                        </p>

                        <p class="addiInfo">
                            If your submission is listed on the left, your design review is posted below.
                        </p>

                        <c:forEach items="${milestonePrizedSubmissions}" var="submission">
                            <!-- #${submission.key} -->
                            <div>
                                <h5 class="contentTitle feedBack${submission.key}" id="feedBack${submission.key}">
                                    Design Review – Submission #${submission.key}
                                    <a href="javascript:" rel="${submission.key}"
                                       class="feedbackShowHide feedBack-Show feedBack-Show-${submission.key}">Show</a>
                                    <a href="javascript:" rel="${submission.key}"
                                       class="feedbackShowHide feedBack-Hide feedBack-Hide-${submission.key} hide">Hide</a>
                                </h5>

                                <div class="hide" id="submission-feeedback-${submission.key}">
                                    <p class="paragraph">
                                        <studio:formatField text="${submission.value}"/>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!--End mainColumn-->

                    <div class="clear"></div>
                </div>
                <!--End content-->
            </div>

            <!--End warpperNew-->
            <br class="clear"/></div>

    </div>
</div>
<%-- #page-wrap ends --%>

<jsp:include page="foot.jsp"/>

</body>
</html>
