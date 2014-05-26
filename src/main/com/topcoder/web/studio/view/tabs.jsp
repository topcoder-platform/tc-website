<%--
  - Author: isv, pvmagacho, GreatKevin
  - Version: 1.2.1
  - Copyright (C) 2010 - 2014 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the tabs for Studio Contest Detail pages.
  - Version 1.0 (Studio Contest Detail Pages assembly)
  - Version 1.1 (Re-platforming Studio Release 3 Assembly) changes:
  -     - Updated the logic to use contests hosted in tcs_catalog database
  - Version 1.2 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) change notes:
  -     - Added Final Fix tabs.
  - Version 1.2.1 (Release Assembly - Port Design Challenge Forum to use Dev Forum)
  -     - Contest forum link based on the project_info - forum type
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="FINAL_FIX_ROUND_NO" value="<%=Constants.FINAL_FIX_ROUND_NO%>"/>
<c:set var="currentTab" value="${param.currentTab}"/>
<c:set var="isMultiRound" value="${not empty contest.checkpointDate}"/>
<c:set var="canViewCheckpoint" value="${requestScope.canViewCheckpoint}"/>
<c:set var="checkpointFeedbackAvailable"
       value="${isMultiRound and canViewCheckpoint and contest.checkpointFeedbackAvailable}"/>
<c:set var="isCheckpointReviewFinished" value="${contest.checkpointReviewClosed}"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>

<div id="thirdNavi">
    <c:choose>
        <c:when test="${contest.newForum}">
            <a class="contestForum" href="http://apps.topcoder.com/forums?module=ThreadList&amp;forumID=${contest.forumId}"><span class="right"><span class="middle">Challenge Forum &raquo;</span></span></a>
        </c:when>
        <c:otherwise>
            <studio:forumLink forumID="${contest.forumId}" styleClass="contestForum"
                              message="<span class=\"right\"><span class=\"middle\">Challenge Forum &raquo;</span></span>"/>
        </c:otherwise>
    </c:choose>

    <ul>
        <li>
            <a ${currentTab eq 'd' ? 'class="current"' : ''}
                    href="${servletPath}?module=ViewContestDetails&amp;${CONTEST_ID}=${contest.id}">
                <span class="right"><span class="middle">Challenge Details</span></span></a>
        </li>

        <c:choose>
            <c:when test="${isCheckpointReviewFinished}">
                <li><a ${currentTab eq 'm' ? 'class="current"' : ''}
                        href="${servletPath}?module=ViewCheckpointFeedback&amp;${CONTEST_ID}=${contest.id}">
                    <span class="right"><span class="middle">Checkpoints</span></span></a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:" class="deactive"><span class="right"><span class="middle">Checkpoints</span></span></a></li>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${contest.submissionClosed}">
                <li>
                     <a ${currentTab eq 's' ? 'class="current"' : ''}
                        href="${servletPath}?module=ViewSubmissions&amp;${CONTEST_ID}=${contest.id}">
                     <span class="right"><span class="middle">Submissions</span></span></a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="javascript:" class="deactive"><span class="right"><span class="middle">Submissions</span></span></a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${isFinished}">
                <li><a ${currentTab eq 'w' ? 'class="current"' : ''}
                        href="${servletPath}?module=ViewContestResults&amp;${CONTEST_ID}=${contest.id}">
                    <span class="right"><span class="middle">Winners</span></span></a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:" class="deactive"><span class="right"><span class="middle">Winners</span></span></a></li>
            </c:otherwise>
        </c:choose>
        <c:if test="${showFinalFixTab}">
            <c:choose>
                <c:when test="${contest.noOfFinalFixRounds > 2}">
                    <c:set var="ffTabCount" value="2"/>
                </c:when>
                <c:otherwise>
                    <c:set var="ffTabCount" value="${contest.noOfFinalFixRounds}"/>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="1" end="${ffTabCount}" varStatus="loop">
                <li><a href="${servletPath}?module=ViewFinalFix&amp;${CONTEST_ID}=${contest.id}&amp;${FINAL_FIX_ROUND_NO}=${loop.index}" 
                       class="${loop.index eq FinalFixRoundNo ? 'current' : ''}">
                    <span class="right"><span class="middle">
                        Final Fixes
                        <c:if test="${contest.noOfFinalFixRounds > 1}">
                            R${loop.index}
                        </c:if>
                    </span></span></a>
                </li>
            </c:forEach>
        </c:if>
    </ul>
    <c:if test="${showFinalFixTab}">
        <c:if test="${contest.noOfFinalFixRounds > 2}">
            <div class="moreMask">
                <a href="javascript:;" class="${FinalFixRoundNo > 2 ? 'current moreRoundsActive' : ''} moreLink">
                    <span class="right"><span class="middle"><span>More...</span></span></span></a>
                <div class="flyout" style="display: block;">
                    <div class="box">
                        <dl>
                            <c:forEach begin="3" end="${contest.noOfFinalFixRounds}" varStatus="loop">
                                <c:choose>
                                    <c:when test="${loop.index eq 3}">
                                        <c:set var="ffStyleClass" value="first"/>
                                    </c:when>
                                    <c:when test="${loop.index eq contest.noOfFinalFixRounds}">
                                        <c:set var="ffStyleClass" value="last"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="ffStyleClass" value=""/>
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${loop.index eq FinalFixRoundNo}">
                                    <c:set var="ffStyleClass" value="${ffStyleClass} currentFF"/>
                                </c:if>
                                <dd class="${ffStyleClass}">
                                    <a href="${servletPath}?module=ViewFinalFix&amp;${CONTEST_ID}=${contest.id}&amp;${FINAL_FIX_ROUND_NO}=${loop.index}">Final Fixes R${loop.index}</a>
                                </dd>
                            </c:forEach>
                        </dl>
                    </div>
                    <div class="bot"></div>
                </div>
            </div>
        </c:if>
    </c:if>
    <div class="clear"></div>
</div>
<!--End thirdNavi-->
