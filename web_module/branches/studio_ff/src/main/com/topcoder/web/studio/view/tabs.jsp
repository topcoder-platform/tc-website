<%--
  - Author: isv, pvmagacho
  - Version: 1.1 
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the tabs for Studio Contest Detail pages.
  - Version 1.0 (Studio Contest Detail Pages assembly)
  - Version 1.1 (Re-platforming Studio Release 3 Assembly) changes:
  -     - Updated the logic to use contests hosted in tcs_catalog database
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="currentTab" value="${param.currentTab}"/>
<c:set var="isMultiRound" value="${not empty contest.checkpointDate}"/>
<c:set var="canViewCheckpoint" value="${requestScope.canViewCheckpoint}"/>
<c:set var="checkpointFeedbackAvailable"
       value="${isMultiRound and canViewCheckpoint and contest.checkpointFeedbackAvailable}"/>
<c:set var="isCheckpointReviewFinished" value="${contest.checkpointReviewClosed}"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>

<div id="thirdNavi">
    <studio:forumLink forumID="${contest.forumId}" styleClass="contestForum"
                      message="<span class=\"right\"><span class=\"middle\">Contest Forum &raquo;</span></span>"/>
    <ul>
        <li>
            <a ${currentTab eq 'd' ? 'class="current"' : ''}
                    href="${servletPath}?module=ViewContestDetails&amp;${CONTEST_ID}=${contest.id}">
                <span class="right"><span class="middle">Contest Details</span></span></a>
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
        <li><a href="javascript:" class="deactive"><span class="right"><span class="middle">Final Fixes</span></span></a></li>
        <li><a href="javascript:" class="deactive"><span class="right"><span class="middle">Final Fixes R2</span></span></a></li>
    </ul>
    <div class="clear"></div>
</div>
<!--End thirdNavi-->
