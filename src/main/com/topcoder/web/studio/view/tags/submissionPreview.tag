<%--
  - Author: pulky
  - Version: 1.0
  - Since: Studio Submission Viewer Upgrade Integration v1.0
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a custom tag to handle submission preview for the view submissions
  - and view contest results pages.
  -
  - Required attributes:
  -     * row: the submission information
  -     * showPlacement: whether to show placements or not.
  -     * viewSubmitters: whether to show submitters or not.
--%>

<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ tag import="com.topcoder.web.studio.model.PrizeType" %>
<%@ tag body-content="empty" %>

<%@ attribute name="row" required="true" type="java.lang.Object" %>
<%@ attribute name="showPlacement" required="true" type="java.lang.Boolean" %>
<%@ attribute name="viewSubmitters" required="true" type="java.lang.Boolean" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="studio" uri="studio.tld" %>

<%-- Prepare some variables for further use --%>
<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

<c:set var="submissionId" value="${row.map['submission_id']}"/>
<c:set var="contestId" value="${row.map['contest_id']}"/>
<c:set var="galleryImageCount" value="${row.map['gallery_image_count']}"/>
<c:set var="userId" value="${row.map['user_id']}"/>
<c:if test="${empty userId}">
    <c:set var="userId" value="${row.map['submitter_id']}"/>
</c:if>
<c:set var="createDate" value="${row.map['create_date']}"/>
<c:if test="${empty createDate}">
    <c:set var="createDate" value="${row.map['submit_date']}"/>
</c:if>

<c:set var="bonusPrize" value="<%=PrizeType.BONUS%>"/>
<c:set var="adminV1" value="<%=ContestChannel.STUDIO_ADMINISTRATOR_V1%>"/>
<c:set var="multi" value="false"/>

<c:set var="downloadSubmissionBaseUrl"
    value="studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${row.map['submission_id']}&amp;${subAltType}=full&amp;it=28"/>

<%-- Decide image to shown according to the contest configuration --%>
<c:choose>
    <c:when test="${row.map['contest_channel_id'] eq adminV1}">
        <%-- Old Studio Admin contests --%>
        <c:choose>
            <c:when test="${row.map['is_image']}">
                <c:set var="previewImageSrc" value="?${modKey}=${processor}&amp;${subId}=${submissionId}"/>
            </c:when>
            <c:otherwise>
                <c:set var="previewImageSrc" value="/i/v2/interface/magnify.png"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <%-- TC Direct and Studio Admin V2 contests --%>
        <c:set var="multi" value="${row.map['gallery_image_count'] > 1}"/>

        <c:if test="${not multi}">
            <c:set var="previewImageSrc"
                value="${downloadSubmissionBaseUrl}"/>
        </c:if>
    </c:otherwise>
</c:choose>

<%-- Render the preview box --%>
<div id="sub${row.map["submission_id"]}" class="submission">
    <div class="previewImg">
        <c:choose>
            <c:when test="${multi}">
                <ul>
                    <c:forEach begin="1" end="${row.map['gallery_image_count']}" step="1" varStatus="index">
                        <li>
                            <a class="viewFullSizeMulti" href="javascript:;">
                                <span class="prevImg${index.index}">
                                    <img src="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=${index.index}" alt="" />
                                </span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <a class="viewFullSize" href="javascript:;">
                    <span class="prevImg">
                        <img src="${previewImageSrc}" alt="" />
                    </span>
                </a>
            </c:otherwise>
        </c:choose>
    </div>
    <c:if test="${multi}">
        <div class="control">
            <a href="javascript:;" class="btnPrevious">
                <span class="hide">
                    Previous
                </span>
            </a>
            <a href="javascript:;" class="btnNext">
                <span class="hide">
                    Next
                </span>
            </a>
            <span>
                Image
                <span class="curItem">1</span>
                of
                <span class="totalCount">${row.map["gallery_image_count"]}</span>
            </span>
        </div>
    </c:if>
    <div class="text">
        <c:if test="${showPlacement}">
            <span class="info">
                <strong>
                    <c:choose>
                        <c:when test="${bonusPrize==row.map['prize_type_id']}">
                            Client Selection
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${row.map['placed'] == 1}">
                                    1st
                                </c:when>
                                <c:when test="${row.map['placed'] == 2}">
                                    2nd
                                </c:when>
                                <c:when test="${row.map['placed'] == 3}">
                                    3rd
                                </c:when>
                                <c:otherwise>
                                    ${row.map['placed']}th
                                </c:otherwise>
                            </c:choose>
                            Place
                        </c:otherwise>
                    </c:choose>
                </strong>
            </span>
            <br/>
        </c:if>
        <span class="submissionId">
            <strong>
                ID:
                <span class="subId">${row.map["submission_id"]}</span>
            </strong>
        </span>
        <br />
        <c:if test="${viewSubmitters}">
            <span>
                <strong>
                    Handle:
                    <studio:handle coderId="${userId}"/>
                </strong>
            </span>
            <br />
        </c:if>
        <span>
            Submitted on
            <fmt:formatDate value="${createDate}" pattern="MM.dd.yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </span>
        <br />
        <c:choose>
            <c:when test="${multi}">
                <c:set var="fullSizeClass" value="viewFullSizeMulti"/>
            </c:when>
            <c:otherwise>
                <c:set var="fullSizeClass" value="viewFullSize"/>
            </c:otherwise>
        </c:choose>
        <span>
            <a class="${fullSizeClass}" href="javascript:;">View Full Size</a>
            &nbsp;|&nbsp;
            <a href="?${modKey}=DownloadSubmission&amp;${subId}=${row.map["submission_id"]}">Download</a>
        </span>
    </div>
</div>
