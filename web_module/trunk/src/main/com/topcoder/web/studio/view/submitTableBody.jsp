<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ReviewStatus" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/xml" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

<c:set value="<%=ReviewStatus.FAILED%>" var="failed"/>
<c:set value="<%=ReviewStatus.PASSED%>" var="passed"/>
<c:set value="<%=Constants.SUBMISSION_ID%>" var="submissionId"/>

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

                            <li class="thumbnails">
                                <div class="thumbnails-wrapper">
                                    <img src="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submission.id}&amp;${subAltType}=tiny" alt=""/>
                                    <div class="img-frame"></div>
                                </div>
                            </li>
                            <li class="submission-id">
                                <span>
                                    <c:if
                                        test="${submission.rank != null && submission.rank <= contest.maxSubmissions.value}">
                                        <img src="/images/v6/start-icon.png" alt="icon"/>
                                    </c:if>
                                    #${submission.id}
                                </span>
                            </li>
                            <li class="date">
                                <span>
                                    <tc-webtag:format object="${submission.createDate}" format="MMMM d, yyyy"
                                                      timeZone="${sessionInfo.timezone}"/>
                                </span>
                            </li>
                            <li class="screening passed">
                                <span>
                                    <c:choose>
                                        <c:when test="${submission.review.status==null}">
                                            Pending
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${submission.review.status.id==failed}">
                                                <span class="bigRed">${submission.review.status.description}</span>
                                            </c:if>
                                            <c:if test="${submission.review.status.id==passed}">
                                                <span class="bigGreen">${submission.review.status.description}</span>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </li>
                            <li class="move">
                                <a href="javascript:;" class="btn-move-down"></a>
                                <a href="javascript:;" class="btn-move-up"></a>
                            </li>
                            <li class="download">
                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}&amp;<%=Constants.SUBMISSION_ALT_TYPE%>=original" class="btn-download"></a>
                            </li>
                            <li class="remove">
                                <a href="javascript:;" class="btn-remove"></a>
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
