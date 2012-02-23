<%--
  - Author: isv
  - Version: 1.0 (TopCoder Studio Member Profile Assembly)
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders a single recent submission on Member Profile page
--%>
<%@ tag body-content="empty" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ tag import="com.topcoder.web.studio.Constants" %>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>

<%@ attribute name="submission" required="true" rtexprvalue="true" type="com.topcoder.web.studio.dto.MemberProfileSubmission" %>

<li>
    <div class="regTitle">
        <a href="javascript:;" class="typeIcon tooltip type${submission.contestTypeId}">
                                        <span class="tipT">Contest Type</span>
                                        <span class="tipC">${submission.contestTypeName}</span>
                                    </a>
        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;${CONTEST_ID}=${submission.contestId}" class="contestTitleLink">
        <c:out value="${submission.contestName}"/></a></div>
    <div class="thumbWrapper">
        <c:choose>
            <c:when test="${submission.locked}">
                <img alt="locked" src="/i/lockedThumb.png"/>
            </c:when>
            <c:otherwise>
                <img alt="smallThumbPlaceholder" src="http://studio.topcoder.com?module=DownloadSubmission&sbmid=${submission.submissionId}&amp;sbt=tiny"/>
            </c:otherwise>
        </c:choose>

        <div class="statusIconsWrapper">
            <c:choose>
                <c:when test="${submission.passedReview}">
                    <span class="statusIcon passedIcon" title="Submission passed at:<br /><fmt:formatDate value="${submission.reviewTime}" pattern="MM.dd.yyyy HH:mm"/> EST"></span>
                </c:when>
                <c:when test="${submission.pendingReview}">
                    <span class="statusIcon pendingIcon" title=""></span>
                </c:when>
                <c:when test="${submission.failed}">
                    <span class="statusIcon failedIcon"
                          title="Submission failed at:<br /><fmt:formatDate value="${submission.reviewTime}" pattern="MM.dd.yyyy HH:mm"/> EST"></span>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${submission.prizePlace ne -1}">
                    <c:if test="${submission.prizeTypeId eq 14}">
			<span class="smallRankIcon rankM"></span>
                    </c:if>
                    <c:if test="${submission.prizeTypeId eq 15}">
			<span class="smallRankIcon rank${submission.prizePlace}"></span>
                    </c:if>
                </c:when>
                <c:when test="${not submission.pendingReview and submission.placement eq null}">
                    <span class="statusIcon pendingIcon" title=""></span>
                </c:when>
            </c:choose>
        </div>
    </div>
    <span class="timeStamp">Submitted on<br/> 
        <fmt:formatDate value="${submission.submissionTime}" pattern="MM.dd.yyyy"/> 
        at <fmt:formatDate value="${submission.submissionTime}" pattern="HH:mm"/> EST</span>
</li>
