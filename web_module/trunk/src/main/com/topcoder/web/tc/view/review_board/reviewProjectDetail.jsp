<%--
  - Author: pulky, snow01, isv
  - Version: 1.5
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the review details corresponding to the specified project.
  - It displays the list of projects phases along with the list of taken and available review positions.
  - This is an exhaustive refactor and generalization from existing reviewProjectDetail.jsp files.
  - In this release, it will be used for Conceptualization, Specification and Application Testing project types.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Specification Review Integration 1.0) changes:
  -      * support for specification reviews was added.
  -      * code was refactored to avoid duplication.  
  -
  - Version 1.4 (Online Review Update Review Management Topcoder web site assembly) changes:
  -      * support for New Review System Phases added.
   -
  - Version 1.5 (Review Application Integration assembly) change notes:
  -  Updated the logic to use review auctions.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.TCTimestampResult,
                 com.topcoder.web.tc.Constants, java.sql.Timestamp"%>
<%@ page import="java.util.Date" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Variables to use JSTL --%>
<c:set var="projectDetailRow" value="${projectDetail[0]}"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>" scope="request"/>
<c:set var="REVIEW_APPLICATION_ROLE_ID" value="<%=Constants.REVIEW_APPLICATION_ROLE_ID%>" scope="request"/>
<c:set var="REVIEW_AUCTION_ID" value="<%=Constants.REVIEW_AUCTION_ID%>" scope="request"/>
<c:set var="now" value="<%=new TCTimestampResult(new Timestamp(System.currentTimeMillis()))%>" scope="request"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>" scope="request"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>" scope="request"/>
<c:set var="DATE_FORMAT" value="MM.dd.yyyy HH:mm z"/>
<c:set var="CONTEST_REVIEW_AUCTION_CATEGORY_ID" value="1"/>
<c:set var="SPEC_REVIEW_AUCTION_CATEGORY_ID" value="2"/>

<jsp:include page="reviewCommonVariables.jsp"/>
<% boolean hasSpecificationSubmission = (Boolean) request.getAttribute("hasSpecificationSubmission"); %>
<% boolean hasSpecificationReview = (Boolean) request.getAttribute("hasSpecificationReview"); %>
<% boolean hasSubmission = (Boolean) request.getAttribute("hasSubmission"); %>
<% boolean hasScreening = (Boolean) request.getAttribute("hasScreening"); %>
<% boolean hasReview = (Boolean) request.getAttribute("hasReview"); %>
<% boolean hasAppeals = (Boolean) request.getAttribute("hasAppeals"); %>
<% boolean hasAggregation = (Boolean) request.getAttribute("hasAggregation"); %>
<% boolean hasFinalFixes = (Boolean) request.getAttribute("hasFinalFixes"); %>
<% boolean hasFinalReview = (Boolean) request.getAttribute("hasFinalReview"); %>
<% boolean hasIterativeReview = (Boolean) request.getAttribute("hasIterativeReview"); %>

<% boolean specReviewExtensionNeeded = (Boolean) request.getAttribute("specReviewExtensionNeeded"); %>
<% boolean screeningExtensionNeeded = (Boolean) request.getAttribute("screeningExtensionNeeded"); %>
<% boolean reviewExtensionNeeded = (Boolean) request.getAttribute("reviewExtensionNeeded"); %>

<fmt:setLocale value="en_US"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Open ${projectTypeDesc} Projects Available for Review</title>

        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
        <script type="text/javascript">
            $(document).ready(function() {
                var selection = calcSelection();
                
                $('.reviewApplicationRoleBox').click(function() {
                    var s1 = calcSelection();
                    if (s1 != selection) {
                        $('.saveReviewApplicationRoles').attr('disabled', '');
                    } else {
                        $('.saveReviewApplicationRoles').attr('disabled', 'disabled');
                    }
                });
            });
            
            function calcSelection() {
                var s = '';
                $('.reviewApplicationRoleBox:checked').each(function() {
                    var val = $(this).val();
                    if (s != '') {
                        s += ',';
                    }
                    s += val;
                });
                return s;
            }
        </script>
    </head>

    <body>
        <jsp:include page="reviewTop.jsp"/>
        
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr valign="top">
                <!-- Left Column Begins-->
                <jsp:include page="reviewGlobalLeft.jsp"/>
                <!-- Left Column Ends -->

                <!-- Gutter Begins -->
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <!-- Gutter Ends -->

                <!-- Center Column Begins -->
                <td width="100%" align="center" class="bodyText">
                    <jsp:include page="reviewPageTitle.jsp"/>
                    <table cellspacing="0" cellpadding="0" width="540">
                        <tr>
                            <td class="bodyText" align="center">
                            <h2>${projectDetailRow.map["component_name"]}</h2>
                            </td>
                        </tr>
                    </table>
                    <br/>

                    <table cellspacing="0" width="540" class="formFrame">
                        <tr>
                            <td class="tableTitle" colspan="4">Timeline</td>
                        </tr>
                        <tr>
                            <td class="tableHeader">Phase</td>
                            <td class="tableHeader" align="center">Start</td>
                            <td class="tableHeader" align="center">End</td>
                            <td class="tableHeader" align="center">Duration<br/>(hours)</td>
                        </tr>
                        <c:if test="${hasSpecificationSubmission}">
                            <tr>
                                <td class="projectCells">Specification Submission</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['specification_submission_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['specification_submission_end']}" 
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['specification_submission_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasSpecificationReview}">
                            <tr>
                                <td class="projectCells">Specification Review <c:if test="${specReviewExtensionNeeded}">*</c:if>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['specification_review_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['specification_review_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['specification_review_duration']}</td>
                            </tr>
                        </c:if>

                        <c:if test="${hasSubmission}">
                            <tr>
                                <td class="projectCells">Submission</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['submission_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['submission_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['submission_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasScreening}">
                            <tr>
                                <td class="projectCells">Screening <c:if test="${screeningExtensionNeeded}">*</c:if>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['screening_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['screening_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['screening_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasReview}">
                            <tr>
                                <td class="projectCells">Review <c:if test="${reviewExtensionNeeded}">*</c:if></td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['review_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['review_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['review_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasAppeals}">
                            <tr>
                                <td class="projectCells">Appeals</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['appeals_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['appeals_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['appeals_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasAggregation}">
                            <tr>
                                <td class="projectCells">Aggregation</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['aggregation_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['aggregation_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['aggregation_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasFinalFixes}">
                            <tr>
                                <td class="projectCells">Final Fixes</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['final_fix_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['final_fix_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['final_fix_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasFinalReview}">
                            <tr>
                                <td class="projectCells">Final Review</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['final_review_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['final_review_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['final_review_duration']}</td>
                            </tr>
                        </c:if>
                        <c:if test="${hasIterativeReview}">
                            <tr>
                                <td class="projectCells">Iterative Review</td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['iterative_review_start']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    <fmt:formatDate value="${projectDetailRow.map['iterative_review_end']}"
                                        pattern="${DATE_FORMAT}"/>
                                </td>
                                <td class="projectCells" align="center">${projectDetailRow.map['iterative_review_duration']}</td>
                            </tr>
                        </c:if>
                    </table>

                    <br/>

                    <c:if test="${specReviewExtensionNeeded || screeningExtensionNeeded || reviewExtensionNeeded}">
                        <table cellspacing="0" cellpadding="0" width="540" class="bodyText">
                            <c:if test="${specReviewExtensionNeeded}">
                                <tr><td class="bodyText">
                                    <p align="left">* The Specification Review phase has already started.
                                    If you register it will be automatically extended to give you at least 2 hours for the review.</p>
                                </td></tr>
                            </c:if>

                            <c:if test="${screeningExtensionNeeded}">
                                <tr><td class="bodyText">
                                    <p align="left">* The Screening phase has already started.
                                    If you register the primary position it will be automatically extended to give you at least 6 hours for the screening.</p>
                                </td></tr>
                            </c:if>

                            <c:if test="${reviewExtensionNeeded}">
                                <tr><td class="bodyText">
                                    <p align="left">* The Review phase has already started.
                                    If you register it will be automatically extended to give you at least 48 hours for the review.</p>
                                </td></tr>
                            </c:if>
                        </table>

                        <br/>
                    </c:if>

                    <c:if test="${reviewAuction.open}">
                    <table class="bodyText" cellpadding="0" cellspacing="0" width="540">
                        <tbody>
                        <tr>
                            <td class="bodyText">
                                <p align="left">
                                    Select the review roles you would like to apply for and click the button.
                                    The system will assign members that best meet the review requirements for this contest.
                                    <c:if test="${auctionCategoryId == CONTEST_REVIEW_AUCTION_CATEGORY_ID}">
                                        Although you will be assigned to at most one review position, applying for multiple
                                        roles increases your chances of being selected.
                                    </c:if>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                    
                    <form name="" action="${sessionInfo.servletPath}" method="get">
                        <input type="hidden" name="${MODULE_KEY}" value="ReviewAuctionApply"/>
                        <input type="hidden" name="${REVIEW_AUCTION_ID}" value="${reviewAuction.id}"/>
                    <table cellspacing="0" width="540" class="formFrame">
                        <tr>
                            <td class="tableTitle" colspan="4">Open Positions</td>
                        </tr>
                        <tr>
                            <td class="tableHeader" width="50%">Role</td>
                            <td class="tableHeader" align="center">Positions</td>
                            <td class="tableHeader" width="50%" align="center">Payment</td>
                            <td class="tableHeader"></td>
                        <tr>

                        <c:forEach items="${reviewAuction.auctionType.applicationRoles}" var="reviewerRole" varStatus="loop">
                          <c:if test="${reviewAuction.openPositions[loop.index] > 0}">
                            <tr>
                                <td class="projectCells">
                                    <c:out value="${reviewerRole.name}"/>
                                </td>
                                <td class="projectCells" align="center" nowrap>
                                    <c:out value="${reviewAuction.openPositions[loop.index]}"/>
                                </td>
                                <td class="projectCells" align="center">
                                    $<fmt:formatNumber value="${reviewApplicationRolePayments[reviewerRole.id]}" pattern="#,###.00"/>
                                    <c:if test="${auctionCategoryId != SPEC_REVIEW_AUCTION_CATEGORY_ID}">*</c:if>
                                </td>
                                <td class="projectCells" align="right">
                                    <c:set var="isSelected" value="false"/>
                                    <c:forEach items="${currentPendingReviewApplications}" var="reviewApplication">
                                        <c:if test="${reviewApplication.applicationRoleId eq reviewerRole.id}">
                                            <c:set var="isSelected" value="true"/>
                                        </c:if>
                                    </c:forEach>
                                    <input type="checkbox" name="${REVIEW_APPLICATION_ROLE_ID}" autocomplete="off" 
                                           value="${reviewerRole.id}" class="reviewApplicationRoleBox" 
                                           <c:if test="${isSelected}">checked="checked"</c:if>>
                                </td>
                            </tr>
                        </c:if>
                        </c:forEach>
                    </table>
                    <br/>
                    <table class="bodyText" cellpadding="0" cellspacing="0" width="540">
                        <tbody>
                        <tr>
                            <td class="bodyText">
                                <c:set var="now" value="<%=new Date()%>"/>
                                <c:choose>
                                    <c:when test="${reviewAuction.assignmentDate > now}">
                                        Reviewers will be assigned on <fmt:formatDate value="${reviewAuction.assignmentDate}" pattern="${DATE_FORMAT}"/>
                                    </c:when>
                                    <c:otherwise>
                                        Reviewers will be assigned immediately on signup.
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td align="right">
                                <c:choose>
                                    <c:when test="${empty currentPendingReviewApplications}">
                                        <input type="submit" value="Apply Now" name="b"
                                               class="saveReviewApplicationRoles" disabled="disabled"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" value="Update Application" name="b" disabled="disabled"
                                               class="saveReviewApplicationRoles"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                        <c:if test="${auctionCategoryId != SPEC_REVIEW_AUCTION_CATEGORY_ID}">
                            <table cellspacing="0" cellpadding="0" width="540" class="bodyText">
                                <tr>
                                    <td class="bodyText">
                                        <p align="left">* Depends on the number of submissions, the actual payment may differ.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </c:if>
                    <br/>
                    </c:if>

                    <table class="formFrame" cellspacing="0" width="540">
                        <tbody>
                        <tr>
                            <td class="tableTitle" colspan="5">Review Applications</td>
                        </tr>
                        <tr>
                            <td class="tableHeader">Handle</td>
                            <td class="tableHeader" align="center">Role</td>
                            <td class="tableHeader" align="center">Reviewer Rating</td>
                            <td class="tableHeader" align="center">Status</td>
                            <td class="tableHeader" align="center">Application Date</td>
                        </tr>
                        <c:forEach items="${reviewApplications}" var="reviewApplicant">
                            <c:if test="${reviewApplicant.status.id ne 2}"> <%-- Do not show Cancelled applications --%>
                                <tr>
                                    <td class="projectCells">
                                        <tc-webtag:handle coderId="${reviewApplicant.userId}"/>
                                    </td>
                                    <td class="projectCells" align="center">
                                        <c:out value="${reviewApplicationRoles[reviewApplicant.applicationRoleId].name}"/>
                                    </td>
                                    <td class="projectCells" align="center">
                                        <c:if test="${empty reviewerRatings[reviewApplicant.userId]}">
                                            not rated
                                        </c:if>
                                        <c:if test="${not empty reviewerRatings[reviewApplicant.userId]}">
                                            <c:out value="${reviewerRatings[reviewApplicant.userId]}"/>
                                        </c:if>
                                    </td>
                                    <td class="projectCells" align="center">
                                        <c:out value="${reviewApplicant.status.name}"/>
                                    </td>
                                    <td class="projectCells" align="center">
                                        <fmt:formatDate value="${reviewApplicant.createDate}" pattern="${DATE_FORMAT}"/>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    <br/>
                </td>
                <!-- Center Column Ends -->

                <!-- Gutter -->
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
                <!-- Gutter Ends -->

                <!-- Right Column Begins -->
                 <td width="180">
                    <jsp:include page="/public_right.jsp">
                        <jsp:param name="level1" value="default"/>
                    </jsp:include>
                 </td>
                <!-- Right Column Ends -->

                <!-- Gutter -->
                <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
                <!-- Gutter Ends -->
            </tr>
        </table>

        <jsp:include page="/foot.jsp" />
    </body>
</html>
