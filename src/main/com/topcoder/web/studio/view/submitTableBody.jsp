<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>


<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

<c:set value="<%=Constants.SUBMISSION_ID%>" var="submissionId"/>

<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>
<c:set var="isStarted" value="${contest.submissionOpen}"/>
<c:set var="isRunning" value="${isStarted and not isFinished}"/>
<c:set var="isMultiRound" value="${not empty contest.milestoneDate}"/>
<c:set var="isMilestoneRoundPassed" value="${isRunning and isMultiRound and contest.milestoneSubmissionClosed}"/>

<c:set var="milestoneSubmissionType" value="3" />

<c:forEach items="${submissions}" var="submission">
    <div class="submission-list-item" data-id="${submission.id}" data-rank="${submission.rank}"
         data-max-rank="${maxRank}">
        <div class="submission-list-item-top-left">
            <div class="submission-list-item-top-right">
                <div class="submission-list-item-bottom-right">
                    <div class="submission-list-item-bottom-left">
                        <ul>
                            <li class="rank">
                                <span>${submission.rank}</span>
                            </li>
                            <li colspan="2" class="thumbnails">
                                <div class="thumbnails-wrapper">
                                    <img src="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submission.id}&amp;${subAltType}=tiny" alt=""/>
                                    <div class="img-frame"></div>
                                </div>
                            </li>
                            <li class="submission-id">
                                <span>
                                    <c:if
                                        test="${submission.rank != null && submission.rank <= contest.maxSubmissions}">
                                        <img src="/i/v6/start-icon.png" alt="icon"/>
                                    </c:if>
                                    #${submission.id}
                                </span>
                            </li>
                            <li class="submission-id">
                                <span>
                                <c:choose>
                                    <c:when
                                        test="${submission.typeId eq milestoneSubmissionType}">
                                        Milestone
                                    </c:when>
                                    <c:otherwise>
                                        Final
                                    </c:otherwise>
                                </c:choose>
                                </span>
                            </li>
                            <li class="date">
                                <span>
                                    <tc-webtag:format object="${submission.createDate}" format="MMMM d, yyyy"
                                                      timeZone="${sessionInfo.timezone}"/>
                                </span>
                            </li>
                            <li class="move">
                            <c:if test="${not (isMilestoneRoundPassed and submission.typeId eq milestoneSubmissionType)}">
                                <a href="javascript:;" class="btn-move-down"></a>
                                <a href="javascript:;" class="btn-move-up"></a>
                            </c:if>
                            </li>
                            <li class="remove">
                            <c:if test="${not (isMilestoneRoundPassed and submission.typeId eq milestoneSubmissionType)}">
                                <a href="javascript:;" class="btn-remove"></a>
                            </c:if>
                            </li>
                            <li class="download">
                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}&amp;<%=Constants.SUBMISSION_ALT_TYPE%>=original" class="btn-download"></a>
                            </li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                    <!--End .submission-list-item-bottom-left-->
                </div>
                <!--End .submission-list-item-bottom-right-->
            </div>
            <!--End .submission-list-item-top-right-->
        </div>
        <!--End .submission-list-item-top-left-->
    </div>
    <!--End .submission-list-item-->
</c:forEach>
