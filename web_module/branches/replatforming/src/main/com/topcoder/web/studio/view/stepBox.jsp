<%--
  - Author: isv, pvmagacho
  - Version: 1.2 (Studio Contest Detail Pages assembly)
  - Copyright (C) 2010 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the common header for Studio Contest Detail pages.
  -
  - Version 1.1 (Re-platforming Studio Release 4 Assembly) : Clean up old studio model files. Added mark for purchase flag
  - Version 1.2 (Re-platforming Studio Release 5 Assembly) : Use the model class in com.topcoder.web.studio.dto package
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.dto.Prize" %>
<%@ page import="com.topcoder.web.studio.controller.request.ViewContestDetails" %>
<%@ page import="java.util.Date" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="currentTime" value="<%=new Date()%>"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>
<c:set var="registered" value="${requestScope.registered}"/>
<c:set var="prizesCount" value="${fn:length(contest.prizes)}"/>
<%
request.setAttribute("clientPrize", new Long(Prize.MILESTONE_PRIZE_TYPE_ID));
%>
<c:set var="clientPrize" value="${clientPrize}"/>
<c:set var="isMultiRound" value="${not empty contest.milestoneDate}"/>
<c:set var="milestoneDate" value="${contest.milestoneDate}"/>
<c:set var="placeSuffixes"
       value="<%=new String[] {"st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th"}%>"/>
<c:set var="drPointsAvailable" value="${contest.digitalRunPoints ne null and contest.digitalRunPoints > 0}"/>
<c:set var="hasMilestoneRoundPrize" value="${isMultiRound and not empty contest.milestonePrize and not empty contest.milestonePrize.numberOfSubmissions and not empty contest.milestonePrize.amount}"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>
<c:set var="isStarted" value="${contest.submissionOpen}"/>
<c:set var="isRunning" value="${isStarted and not isFinished}"/>
<c:set var="isMilestoneRoundPassed" value="${isRunning and isMultiRound and contest.milestoneSubmissionClosed}"/>
<c:set var="hasCockpitPermissions" value="${requestScope.has_cockpit_permissions}"/>
<fmt:setLocale value="en_US"/>

<h2 id="bigTitle">
    <c:out value="${contest.projectName}"/>
</h2>
<ul class="linkNavi2">
    <li class="first"><label>CONTEST TYPE:</label><a href="javascript:" class="studioContestType${contest.category.id}">
        <c:out value="${contest.category.name}"/></a>
    </li>
</ul>

<div class="clear"></div>

<div class="stepBox">
    <%-- BUTTONS FOR SUBMITTER --%>
    <div class="leftColumn">
        <c:choose>
            <c:when test="${not isStarted}">
                <%-- REGISTRATION FOR CONTEST IS NOT OPEN --%>
                <a href="javascript:" class="stepFirstDeac">REGISTER FOR<br/>THIS CONTEST</a>
                <a href="javascript:" class="stepSecondDeac">SUBMIT YOUR<br/> ENTRIES</a>
                <a href="javascript:" class="stepThreeDeac"><span class="right">VIEW YOUR<br/> SUBMISSIONS</span></a>
            </c:when>
            <c:when test="${registered}">
                <%-- REGISTERED --%>
                <a href="javascript:" class="stepFirstDeac">REGISTER FOR<br/>THIS CONTEST</a>
                <a href="${servletPath}?module=ViewSubmission&amp;${CONTEST_ID}=${contest.id}" class="stepSecond">
                    SUBMIT YOUR<br/> ENTRIES</a>
                <a href="${servletPath}?module=ViewSubmission&amp;${CONTEST_ID}=${contest.id}" class="stepThree">
                    <span class="right">VIEW YOUR<br/> SUBMISSIONS</span></a>
            </c:when>
            <c:otherwise>
                <%-- UNREGISTERED --%>
                <a href="${servletPath}?module=ViewRegistration&amp;${CONTEST_ID}=${contest.id}" class="stepFirst">
                    REGISTER FOR<br/>THIS CONTEST</a>
                <a href="javascript:" class="stepSecondDeac">SUBMIT YOUR<br/> ENTRIES</a>
                <a href="javascript:" class="stepThreeDeac"><span class="right">VIEW YOUR<br/> SUBMISSIONS</span></a>
            </c:otherwise>
        </c:choose>
    </div>
    <!--End leftColumn-->

    <%-- PRIZES --%>
    <div class="middleColumn">
        <c:choose>
            <c:when test="${prizesCount > 5}">
                <a href="javascript:" class="paymentBtn lessPaymentLeft lessPaymentLeftFunction"></a>
                <a href="javascript:" class="paymentBtn morePaymentRight"></a>
            </c:when>
            <c:otherwise>
                <a href="javascript:" class="paymentBtn morePaymentRightDeact"></a>
            </c:otherwise>
        </c:choose>

        <c:if test="${prizesCount > 5}">
            <div class="grayBox lessPaymentGrayBox hide">
                <span class="gray2RCLT"></span>
                <span class="gray2RCRT"></span>
                <span class="gray2RCLB"></span>
                <span class="gray2RCRB"></span>
                <ul>
                    <c:forEach items="${contest.prizes}" varStatus="loop" var="prize" begin="0" end="4">
                        <c:set var="prizeDesc"
                               value="${clientPrize == prize.type.id ? prize.type.description : 'PLACE'}"/>
                        <li ${loop.index eq 4 ? 'class="last"' : ''}>
                            <span class="place">
                                ${prizeDesc eq 'PLACE' ? prize.place : ''}${placeSuffixes[prize.place - 1]} <c:out value="${prizeDesc}"/></span>
                                <span class="prize"><span class="dollorIcon">
                                    $</span><fmt:formatNumber value="${prize.amount}" pattern="######"/></span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
            <!--End grayBox-->
        </c:if>

        <div class="grayBox morePaymentGrayBox">
            <span class="gray2RCLT"></span>
            <span class="gray2RCRT"></span>
            <span class="gray2RCLB"></span>
            <span class="gray2RCRB"></span>
            <ul>
                <c:forEach items="${contest.prizes}" varStatus="loop" var="prize" begin="0" end="4">
                    <c:set var="prizeDesc"
                           value="${clientPrize == prize.type.id ? prize.type.description : 'PLACE'}"/>
                    <li ${loop.index eq 4 ? 'class="last"' : ''}>
                        <span class="place">
                            ${prizeDesc eq 'PLACE' ? prize.place : ''}${placeSuffixes[prize.place - 1]} <c:out value="${prizeDesc}"/></span>
                            <span class="prize"><span class="dollorIcon">
                                $</span><fmt:formatNumber value="${prize.amount}" pattern="######"/></span>
                    </li>
                </c:forEach>
                <c:forEach varStatus="loop" var="prize" begin="${prizesCount}" end="4">
                    <li class="deact ${loop.index eq 4 ? 'last' : ''}">
                        <span class="place">${loop.index + 1}${placeSuffixes[loop.index]} PLACE</span>
                        <span class="prize"><span class="dollorIcon">$</span>0</span>
                    </li>
                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
        <!--End grayBox-->

        <c:if test="${prizesCount > 5}">
            <div class="grayBox lessPaymentGrayBox2 hide">
                <span class="gray2RCLT"></span>
                <span class="gray2RCRT"></span>
                <span class="gray2RCLB"></span>
                <span class="gray2RCRB"></span>
                <ul>
                    <c:forEach items="${contest.prizes}" varStatus="loop" var="prize" begin="5" end="9">
                        <c:set var="prizeDesc"
                               value="${clientPrize == prize.type.id ? prize.type.description : 'PLACE'}"/>
                        <li ${loop.index eq 9 ? 'class="last"' : ''}>
                            <span class="place">
                                ${prizeDesc eq 'PLACE' ? prize.place : ''}${placeSuffixes[prize.place - 1]} <c:out value="${prizeDesc}"/></span>
                                <span class="prize2"><span class="dollorIcon">
                                    $</span><fmt:formatNumber value="${prize.amount}" pattern="######"/></span>
                        </li>
                    </c:forEach>
                    <c:forEach varStatus="loop" var="prize" begin="${prizesCount}" end="9">
                        <li class="deact ${loop.index eq 9 ? 'last' : ''}">
                            <span class="place">${loop.index + 1}${placeSuffixes[loop.index]} PLACE</span>
                            <span class="prize2"><span class="dollorIcon">$</span>0</span>
                        </li>
                    </c:forEach>
                </ul>
                <div class="clear"></div>
            </div>
            <!--End grayBox-->
        </c:if>

        <%-- STUDIO CUP POINTS --%>
        <div class="grayBox ${drPointsAvailable ? 'haveStudioCup' : 'noStudioCups'} CDScreen1HaveStudioCup">
            <span class="gray2RCLT"></span>
            <span class="gray2RCRT"></span>
            <span class="gray2RCLB"></span>
            <span class="gray2RCRB"></span>
            <p>
                <c:choose>
                    <c:when test="${drPointsAvailable}">
                        <span class="points">${contest.digitalRunPoints}</span> STUDIO CUP POINTS
                    </c:when>
                    <c:otherwise>
                        <span class="points"></span>NO STUDIO CUP POINTS
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="grayBox ${drPointsAvailable ? 'haveStudioCup CDScreen2HaveStudioCup' : 'noStudioCups CDScreen2noStudioCups'} hide">
            <span class="gray2RCLT"></span>
            <span class="gray2RCRT"></span>
            <span class="gray2RCLB"></span>
            <span class="gray2RCRB"></span>
            <p>
                <c:choose>
                    <c:when test="${drPointsAvailable}">
                        <span class="points">${contest.digitalRunPoints}</span> STUDIO CUP POINTS
                    </c:when>
                    <c:otherwise>
                        <span class="points"></span>NO STUDIO CUP POINTS
                    </c:otherwise>
                </c:choose>
            </p>
        </div>

        <%-- MILESTONE PRIZES --%>
        <div class="grayBox ${hasMilestoneRoundPrize ? 'haveMilestone' : 'noMilestone'} CDScreen1HaveMilestone">
            <span class="gray2RCLT"></span>
            <span class="gray2RCRT"></span>
            <span class="gray2RCLB"></span>
            <span class="gray2RCRB"></span>

            <p>
                <c:choose>
                    <c:when test="${hasMilestoneRoundPrize}">
                        <span class="prize">${contest.milestonePrize.numberOfSubmissions}</span> MILESTONE AWARDS WORTH
                                <span class="prize">
                                   <span class="dollorIcon">$</span><fmt:formatNumber value="${contest.milestonePrize.amount}"
                                                                                      pattern="###,###"/>
                               </span> EACH
                    </c:when>
                    <c:otherwise><span class="prize"><span class="dollorIcon">&nbsp;</span></span>NO MILESTONE</c:otherwise>
                </c:choose>
            </p>
        </div>
        <!--End grayBox-->
        <div class="grayBox ${hasMilestoneRoundPrize ? 'haveMilestone CDScreen2HaveMilestone' : 'noMilestone CDScreen2noMilestone'}  hide">
            <span class="gray2RCLT"></span>
            <span class="gray2RCRT"></span>
            <span class="gray2RCLB"></span>
            <span class="gray2RCRB"></span>

            <p>
                <c:choose>
                    <c:when test="${hasMilestoneRoundPrize}">
                        <span class="prize">${contest.milestonePrize.numberOfSubmissions}</span> MILESTONE AWARDS WORTH
                                <span class="prize">
                                   <span class="dollorIcon">$</span><fmt:formatNumber value="${contest.milestonePrize.amount}"
                                                                                      pattern="###,###"/>
                               </span> EACH
                    </c:when>
                    <c:otherwise><span class="prize"><span class="dollorIcon">&nbsp;</span></span>NO MILESTONE</c:otherwise>
                </c:choose>
            </p>
        </div>
        <!--End grayBox-->
    </div>
    <!--End middleColumn-->

    <%-- DEADLINES --%>
    <div class="rightColumn">

        <c:choose>
            <c:when test="${isFinished}">
                <c:set var="nextDeadlineText" value="Contest has ended"/>
                <c:set var="nextDeadlineTime" value="${contest.endTime}" scope="request"/>
            </c:when>
            <c:when test="${not isStarted}">
                <c:set var="nextDeadlineText" value="Contest has not started yet"/>
                <c:set var="nextDeadlineTime" value="${contest.startTime}" scope="request"/>
            </c:when>
            <c:when test="${isRunning and isMultiRound and not isMilestoneRoundPassed}">
                <c:set var="nextDeadlineText" value="Milestone Submission"/>
                <c:set var="nextDeadlineTime" value="${milestoneDate}" scope="request"/>
            </c:when>
            <c:otherwise>
                <c:set var="nextDeadlineText" value="Final Submission"/>
                <c:set var="nextDeadlineTime" value="${contest.endTime}" scope="request"/>
            </c:otherwise>
        </c:choose>
        <div class="nextBox ${isFinished ? 'nextBoxGray' : ''}">
            <span class="nextTop"></span>
            <span class="nextBottom"></span>

            <div class="nextBoxContent nextDeadlineNextBoxContent">
                <span class="nextDTitle">Next Deadline</span>
                <span class="CEDate"><c:out value="${nextDeadlineText}"/></span>
                <span class="timeLeft"><%=ViewContestDetails.getTextualDiff((Date) request.getAttribute("nextDeadlineTime"))%></span>
            </div>
            <!--End nextBoxContent-->
            <div class="nextBoxContent allDeadlineNextBoxContent hide">
                <p><label>Start Date:</label><span><fmt:formatDate value="${contest.startTime}" pattern="MMM dd, yyyy"/>
                           at <fmt:formatDate value="${contest.startTime}" pattern="HH:mm zzz"/></span></p>

                <c:if test="${isMultiRound}">
                    <p><label>Milestone:</label>
                       <span><fmt:formatDate value="${milestoneDate}" pattern="MMM dd, yyyy"/>
                           at <fmt:formatDate value="${milestoneDate}" pattern="HH:mm zzz"/>
                       </span>
                    </p>
                </c:if>

                <p><label>End Date:</label><span><fmt:formatDate value="${contest.endTime}" pattern="MMM dd, yyyy"/>
                           at <fmt:formatDate value="${contest.endTime}" pattern="HH:mm zzz"/></span></p>

                <p class="last"><label>Winners Announced:</label><span><fmt:formatDate value="${contest.winnerAnnouncementTime}" pattern="MMM dd, yyyy"/>
                           at <fmt:formatDate value="${contest.winnerAnnouncementTime}" pattern="HH:mm zzz"/></span></p>
            </div>
            <!--End nextBoxContent-->
        </div>

        <!--End nextBox-->
        <div class="deadlineBox">
            <span class="deadlineTop"></span>
            <span class="deadlineBottom"></span>

            <div class="deadlineBoxContent nextDeadlinedeadlineBoxContent">
                <a href="javascript:" class="viewAllDeadLineBtn">View all deadlines +</a>
            </div>
            <!--End deadlineBoxContent-->
            <div class="deadlineBoxContent allDeadlinedeadlineBoxContent hide">
                <a href="javascript:" class="viewNextDeadLineBtn">View next deadline +</a>
            </div>
            <!--End deadlineBoxContent-->
        </div>
        <!--End deadlineBox-->
    </div>
    <!--End rightColumn-->
    <div class="clear"></div>
</div>
