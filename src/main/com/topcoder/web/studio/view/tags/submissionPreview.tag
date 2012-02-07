<%--
  - Author: pulky, pvmagacho, isv
  - Version: 1.7
  - Since: Studio Submission Viewer Upgrade Integration v1.0
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is a custom tag to handle submission preview for the view submissions
  - and view contest results pages.
  -
  - Version 1.1 (BUGR-1755/1756): removed full preview javascript.
  - Version 1.2 (BUGR-1914): Added prize information.
  - Version 1.3 (BUGR-2434): Added parameter to hide preview and download link.
  - Version 1.4 (Re-platforming Studio Release 3 Assembly) : Updated the logic to use contests hosted in tcs_catalog database
  - Version 1.5 (Re-platforming Studio Release 4 Assembly) : Clean up old studio model files. Added mark for purchase flag
  - Version 1.6 (Re-platforming Studio Release 5 Assembly) : Use the model class in com.topcoder.web.studio.dto package.
  - Version 1.7 (TopCoder Studio Member Profiles Assembly) change notes: linked to Studio's member profile.
  -
  - Required attributes:
  -     * row: the submission information
  -     * showPlacement: whether to show placements or not.
--%>

<%@ tag import="com.topcoder.web.studio.Constants" %>
<%@ tag import="com.topcoder.web.studio.dto.Prize" %>
<%@ tag body-content="empty" %>

<%@ attribute name="row" required="true" type="java.lang.Object" %>
<%@ attribute name="showPlacement" required="true" type="java.lang.Boolean" %>
<%@ attribute name="viewSubmitters" required="true" type="java.lang.Boolean" %>
<%@ attribute name="viewSubmissions" required="false" type="java.lang.Boolean" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%-- Prepare some variables for further use --%>
<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="module" value="${param[modKey]}"/>

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

<c:set var="bonusPrize" value="<%=new Long(Prize.MILESTONE_PRIZE_TYPE_ID)%>"/>
<c:set var="multi" value="false"/>

<c:set var="downloadSubmissionBaseUrl"
    value="studio.jpg?${modKey}=DownloadSubmission&amp;${subId}=${row.map['submission_id']}&amp;${subAltType}=full"/>

<%-- Decide image to shown according to the contest configuration --%>
<c:if test="${not multi}">
    <c:set var="previewImageSrc" value="${downloadSubmissionBaseUrl}"/>
</c:if>
        <%-- BUGR-4567 --%>
<%-- Render the preview box --%>
<div id="sub${row.map["submission_id"]}" class="submission">
    <c:if test="${empty viewSubmissions || viewSubmissions}">
        <div class="previewImg">
            <c:choose>
                <c:when test="${multi}">
                    <ul>
                        <c:forEach begin="1" end="${row.map['gallery_image_count']}" step="1" varStatus="index">
                            <li>
                                <a class="viewFullSizeMulti" href="?${modKey}=${module}&amp;ct=${contestId}&amp;sbmid=${row.map['submission_id']}&amp;pn=${pn}&amp;ps=${ps}">
                                    <span class="prevImg${index.index}">
                                        <img src="${downloadSubmissionBaseUrl}&amp;${subFileIdx}=${index.index}" alt="" />
                                    </span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <a class="viewFullSize" href="?${modKey}=${module}&amp;ct=${contestId}&amp;sbmid=${row.map['submission_id']}&amp;pn=${pn}&amp;ps=${ps}">
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
    </c:if>
    <div class="text">
        <c:if test="${showPlacement}">
            <span class="info">
                <strong>
                    <c:choose>
                        <c:when test="${row.map['mark_for_purchase']}">
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
            <span>
                <fmt:formatNumber value="${row.map['amount']}" pattern="$###,###.00"/>
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
                    <studio:handle coderId="${userId}" />
                </strong>
            </span>
            <br />
        </c:if>
        <span>
            Submitted on
            <fmt:formatDate value="${createDate}" pattern="MM.dd.yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </span>
        <br />
        <c:if test="${not empty viewSubmissions && viewSubmissions}">
            <c:choose>
                <c:when test="${multi}">
                    <c:set var="fullSizeClass" value="viewFullSizeMulti"/>
                </c:when>
                <c:otherwise>
                    <c:set var="fullSizeClass" value="viewFullSize"/>
                </c:otherwise>
            </c:choose>
            <span>
                <a class="${fullSizeClass}" href="?${modKey}=${module}&amp;ct=${contestId}&amp;sbmid=${row.map['submission_id']}&amp;pn=${pn}&amp;ps=${ps}">View Full Size</a>
                &nbsp;|&nbsp;
                <a href="?${modKey}=DownloadSubmission&amp;${subId}=${row.map["submission_id"]}">Download</a>
            </span>
        </c:if>
    </div>
</div>
