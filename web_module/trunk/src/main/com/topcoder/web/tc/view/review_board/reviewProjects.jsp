<%--
  - Author: pulky, snow01, FireIce, isv
  - Version: 1.5
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists the active review projects corresponding to the specified project type.
  - It displays the list of review projects along with other project details and links for registering.
  - This is an exhaustive refactor and generalization from existing reviewProject.jsp files.
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

  - Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) changes:
  - Fix Review Opportunities table header colspan problem.
  -
  - Version 1.5 (Review Application Integration assembly) change notes:
  -  Updated the logic to use review auctions.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Variables to use JSTL --%>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="DEV_PHASE" value="<%=SoftwareComponent.DEV_PHASE%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>
<jsp:include page="reviewCommonVariables.jsp"/>

<fmt:setLocale value="en_US"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Project Review</title>
        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
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
                <td width="100%" class="bodyText">
                    <jsp:include page="reviewPageTitle.jsp"/>

                <span class="bigTitle">Review opportunities</span>

                <p>In the table below you will be able to see which contests are available for review, the type of contest,
                   the current number of submissions on each, the review timeline for each, and the number of review positions
                   available for each contest. If you click on a contest name you will be able to see all of the details
                   associated with that contest review.</p>
                <p>If you are not currently on the ${eligibleReviewBoardName} you may send an email to
                   <a href="mailto:support@topcoder.com">support@topcoder.com</a> requesting permission to perform reviews.
                   Please keep in mind that only members who meet the <a href="http://apps.topcoder.com/wiki/display/tc/Reviewer+Qualification+Requirements">Reviewer Qualification Requirements</a>
                   are eligible to join the TopCoder Review Board.</p>
                <p>In order to sign up for a review position, click on the "details" link for any contest with positions
                   available, select the review roles you would like to apply for and click "Apply Now".</p>

                <br/>
                    <%-- CONTEST REVIEW AUCTIONS --%>
                    <c:if test="${not empty reviewAuctions}">
                        <div align="right" style="padding-top: 10px">
                            <b>Review opportunities via RSS -</b>
                            <a href="/tc?module=BasicRSS&c=rss_Open_Review_Positions&dsid=28"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
                            <br />
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                            <tr>
                            <c:choose>
                                <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                            projectType == DESIGN_PROJECT_TYPE}">
                                    <td class="tableTitle" colspan="7">
                                </c:when>
                                <c:otherwise>
                                    <td class="tableTitle" colspan="6">
                                </c:otherwise>
                            </c:choose>
                                    ${projectTypeTitle} Review Opportunities
                                </td>
                            </tr>
                            <tr>
                                <c:if test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                            projectType == DESIGN_PROJECT_TYPE}">
                                    <td class="tableHeader" align="center">Catalog</td>
                                </c:if>
                                <td class="tableHeader" width="100%">Contest</td>
                                <td class="tableHeader" align="right">Reviewer<br><nobr>Payment *</nobr></td>
                                <td class="tableHeader" align="center">Submissions</td>
                                <td class="tableHeader" align="center">Review Start</td>
                                <td class="tableHeader" align="center">Open<br/>Positions</td>
                                <td class="tableHeader">Details</td>
                            </tr>

                            <c:set var="i" value="0"/>
                            <c:forEach items="${reviewAuctions}" var="auction">
                                <c:set var="resultRow" value="${reviewAuctionProjectsMap[auction.projectId]}" 
                                       scope="page"/>
                                <tr>
                                    <c:if test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                            projectType == DESIGN_PROJECT_TYPE}">
                                    <td class="statDk" align="center">
                                            <tc_tags:languageIcon catalogName="${resultRow.map['catalog']}"
                                                                  aolBrand="false" paypalBrand="false"/>
                                    </td>
                                    </c:if>

                                    <td class="statDk">
                                        <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectDetail&${PROJECT_ID}=${resultRow.map['project_id']}">
                                                ${resultRow.map["component_name"]}
                                                ${resultRow.map["version"]}
                                        </a>
                                    </td>
                                    <td class="statDk" align="right">
                                        $ <fmt:formatNumber value="${prices[i]}" pattern="#,###.00"/>
                                    </td>
                                    <td class="statDk" align="center">
                                        ${resultRow.map["submission_count"]}
                                    </td>
                                    <td class="statDk" align="center" nowrap="nowrap">
                                        <fmt:formatDate value="${resultRow.map['review_start']}"
                                                        pattern="MM.dd.yyyy HH:mm z"/>
                                    </td>
                                    <td class="statDk" align="center">
                                        <c:set var="openPositionsCount" value="0"/>
                                        <c:forEach items="${auction.openPositions}" var="o">
                                            <c:set var="openPositionsCount" value="${openPositionsCount + o}"/>
                                        </c:forEach>
                                        ${openPositionsCount}
                                    </td>
                                    <td class="statDk" align="left" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ReviewAuctionDetails&amp;${REVIEW_AUCTION_ID}=${auction.id}">
                                            details
                                        </a>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i + 1}"/>
                            </c:forEach>
                        </table>
                        <p align="left">* The reviewer payment depends on the reviewer role and the number of
                            submissions. The actual payment may differ.
                        </p>
                        <br/>
                    </c:if>

                    <%-- SPECIFICATION REVIEW AUCTIONS --%>
                    <c:if test="${not empty specReviewAuctions}">
                        <div align="right" style="padding-top: 10px">
                            <b>Spec Review opportunities via RSS -</b>
                            <a href="/tc?module=BasicRSS&c=rss_spec_review_opportunities&dsid=28"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
                            <br />
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                            <tr>
                                <td class="tableTitle" colspan="9">
                                    ${projectTypeDesc} Specification Review Opportunities
                                </td>
                            </tr>
                            <tr>
                                <c:if test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                            projectType == DESIGN_PROJECT_TYPE}">
                                    <td class="tableHeader" align="center">Catalog</td>
                                </c:if>
                                <td class="tableHeader" width="100%">Contest</td>
                                <td class="tableHeader" align="right">Reviewer<br>Payment</td>
                                <td class="tableHeader" align="center">Review Start</td>
                                <td class="tableHeader" align="left">Details</td>
                            </tr>

                            <c:set var="i" value="0"/>
                            <c:forEach items="${specReviewAuctions}" var="specReviewAuction">
                                <c:set var="resultRow" value="${specReviewAuctionProjectsMap[specReviewAuction.projectId]}"/>
                                <tr>
                                    <c:if test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                            projectType == DESIGN_PROJECT_TYPE}">
                                        <td class="statDk" align="center">
                                            <tc_tags:languageIcon catalogName="${resultRow.map['catalog']}"
                                                                  aolBrand="false" paypalBrand="false"/>
                                        </td>
                                    </c:if>
                                    <td class="statDk">
                                        <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectDetail&${PROJECT_ID}=${resultRow.map['project_id']}">
                                                    ${resultRow.map["component_name"]}
                                                    ${resultRow.map["version"]}
                                         </a>
                                    </td>
                                    <td class="statDk" align="right">
                                        $ <fmt:formatNumber value="${specReviewPrices[i]}" pattern="#,###.00"/>
                                    </td>
                                    <td class="statDk" align="center" nowrap="nowrap">
                                        <fmt:formatDate value="${resultRow.map['review_start']}"
                                                    pattern="MM.dd.yyyy HH:mm z"/>
                                    </td>
                                    <td class="statDk" align="left" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ReviewAuctionDetails&amp;${REVIEW_AUCTION_ID}=${specReviewAuction.id}">
                                            details
                                        </a>
                                    </td>
                                </tr>
                                <c:set var="i" value="${i + 1}"/>
                            </c:forEach>
                        </table>
                        <br/>            
                    </c:if>

                    <c:choose>
                        <c:when test="${fn:length(reviewAuctions) + fn:length(specReviewAuctions) == 0}">
                            <br/>
                            <p align="center">Sorry, there are currently no review positions available.</p>
                            <br/>
                        </c:when>
                    </c:choose>

                </td>
                <!-- Center Column Ends -->

                <!-- Gutter -->
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
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

        <jsp:include page="/foot.jsp"/>
    </body>
</html>
