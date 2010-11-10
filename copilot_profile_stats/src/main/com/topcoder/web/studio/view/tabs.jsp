<%--
  - Author: TCSDEVELOPER
  - Version: 1.0 (Studio Contest Detail Pages assembly)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the tabs for Studio Contest Detail pages.
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
<c:set var="winnersAvailable" value="${not empty contest.results}"/>
<c:set var="isMultiRound" value="${not empty contest.multiRound and contest.multiRound}"/>
<c:set var="canViewMilestone" value="${requestScope.canViewMilestone}"/>
<c:set var="milestoneFeedbackAvailable"
       value="${isMultiRound and canViewMilestone and contest.milestoneFeedbackAvailable}"/>
<c:set var="currentTime" value="<%=new Date()%>"/>
<c:set var="isFinished" value="${currentTime >= contest.endTime}"/>

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
            <c:when test="${milestoneFeedbackAvailable}">
                <li><a ${currentTab eq 'm' ? 'class="current"' : ''}
                        href="${servletPath}?module=ViewMilestoneFeedback&amp;${CONTEST_ID}=${contest.id}">
                    <span class="right"><span class="middle">Milestones</span></span></a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:" class="deactive"><span class="right"><span class="middle">Milestones</span></span></a></li>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${isFinished}">
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
            <c:when test="${winnersAvailable}">
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
