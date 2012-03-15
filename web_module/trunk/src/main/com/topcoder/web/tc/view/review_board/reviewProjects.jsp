<%--
  - Author: pulky, snow01, FireIce
  - Version: 1.4
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
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
<c:set var="APPLICATIONS_CATALOG_ID" value="<%=Constants.APPLICATIONS_CATALOG_ID%>"/>
<c:set var="DEV_PHASE" value="<%=SoftwareComponent.DEV_PHASE%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>
<jsp:include page="reviewCommonVariables.jsp"/>

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

                <p>In the table below you will be able to see which projects are available for review, the type of
                    project, the current number of submissions on each, the review timeline for each, and the number
                    of review positions available for each project. If you click on an
                    ${fn:toLowerCase(projectTypeDesc)} name you will be able to see all of the details associated with
                    that ${fn:toLowerCase(projectTypeDesc)} review.</p>
                <p>If you are not currently on ${eligibleReviewBoardName} you may send an email to
                    <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a> requesting permission
                    to perform reviews. Please keep in mind only members that have completed
                    ${fn:toLowerCase(projectTypeDesc)} projects are eligible to join ${eligibleReviewBoardName}.</p>
                <p>In order to sign up for a review position, click on the "details" link for any
                    ${fn:toLowerCase(projectTypeDesc)} with positions available,and then select "Apply Now" next to the
                    position that you would like to commit to.</p>
                <br/>
                    <c:if test="${fn:length(projectList) > 0}">
                        <div align="right" style="padding-top: 10px">
                            <b>Review opportunities via RSS -</b>
                            <a href="/tc?module=BasicRSS&c=rss_Open_Review_Positions&dsid=28"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
                            <br />
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                                        <tr>
                                        <c:choose>
                                            <c:when test="${projectType == DESIGN_PROJECT_TYPE || projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
                                                <td class="tableTitle" colspan="11">
                                            </c:when>
                                            <c:otherwise>
                                                <td class="tableTitle" colspan="12">
                                            </c:otherwise>
                                        </c:choose>
                                                ${projectTypeTitle} Review Opportunities
                                            </td>
                                        </tr>
                                        <tr>
                                            <c:choose>
                                                <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
                                                    projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="tableHeader" align="center">Type</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td class="tableHeader" align="center">Catalog</td>
                                            <td class="tableHeader" width="100%">${projectTypeDesc}</td>
                                            <td class="tableHeader" align="center"></td>
                                            <td class="tableHeader" align="right" nowrap="nowrap">
                                                Primary Reviewer<br>Payment
                                            </td>
                                            <td class="tableHeader" align="right">Reviewer<br>Payment</td>
                                            <td class="tableHeader" align="center">Submissions</td>
                                            <td class="tableHeader" align="center">Opens<br>On</td>
                                            <td class="tableHeader" align="center">Review<br>Start</td>
                                            <td class="tableHeader" align="center">Review<br>End</td>
                                            <td class="tableHeader" align="center">Positions<br>Available</td>
                                            <td class="tableHeader">Details</td>
                                        </tr>

                                        <c:set var="i" value="0"/>
                                        <c:forEach items="${projectList}" var="resultRow">
                                            <tr>
                                                <c:choose>
                                                    <c:when test="${projectType == DESIGN_PROJECT_TYPE ||
                                                        projectType == DESIGN_SPECIFICATION_PROJECT_TYPE}">
                                                    </c:when>
                                                    <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                                        projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
                                                        <td class="statDk" align="center">
                                                            <c:choose>
                                                                <c:when test="${resultRow.map['phase_id'] == DEV_PHASE}">
                                                                    Development
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Testing
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td class="statDk" align="center">${projectTypeDesc}</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td class="statDk" align="center">
                                                    <c:choose>
                                                        <c:when test="${projectType == DEVELOPMENT_PROJECT_TYPE ||
                                                            projectType == DESIGN_PROJECT_TYPE ||
                                                            projectType == DESIGN_SPECIFICATION_PROJECT_TYPE ||
                                                            projectType == DEVELOPMENT_SPECIFICATION_PROJECT_TYPE}">
                                                            <tc_tags:languageIcon catalogName = "${resultRow.map['catalog']}" aolBrand="${resultRow.map['aol_brand'] != null}"
                                                                                  paypalBrand="${resultRow.map['paypal_brand'] != null}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${projectTypeDesc}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="statDk">
                                                    <c:choose>
                                                        <c:when test="${resultRow.map['category_id'] == APPLICATIONS_CATALOG_ID}">
                                                            ${resultRow.map["component_name"]} ${resultRow.map["version"]}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectDetail&${PROJECT_ID}=${resultRow.map['project_id']}">
                                                                ${resultRow.map["component_name"]}
                                                                ${resultRow.map["version"]}
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <c:choose>
                                                                <c:when test="${projectType != DEVELOPMENT_PROJECT_TYPE &&
                                                                    projectType != DESIGN_PROJECT_TYPE &&
                                                                    projectType != DESIGN_SPECIFICATION_PROJECT_TYPE &&
                                                                    projectType != DEVELOPMENT_SPECIFICATION_PROJECT_TYPE &&
                                                                    resultRow.map['paypal_brand'] != null}">
                                                                      <img src="/i/development/smPayPalX.gif" alt="PayPal X" border="0" />
                                                                 </c:when>
                                                             </c:choose>
                                                </td>
                                                <td class="statDk" align="right">
                                                    $ <fmt:formatNumber value="${prices[i].primaryReviewCost}"
                                                        pattern="#,###.00"/>
                                                </td>
                                                <td class="statDk" align="right">
                                                    $ <fmt:formatNumber value="${prices[i].reviewCost}"
                                                        pattern="#,###.00"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    ${resultRow.map["submission_count"]}
                                                </td>
                                                <c:choose>
                                                    <c:when test="${waitingToReview[i]}">
                                                        <td class="statDk" align="center" nowrap="nowrap">
                                                            <fmt:formatDate value="${waitingUntil[i]}"
                                                                pattern="MM.dd.yyyy'<br />'hh:mm a"/>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                            <td class="statDk" align="center"><i>open</i></td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td class="statDk" align="center">
                                                    <fmt:formatDate value="${resultRow.map['review_start']}"
                                                                pattern="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <fmt:formatDate value="${resultRow.map['review_end']}"
                                                                pattern="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    ${resultRow.map["available_spots"]}
                                                </td>
                                                <td class="statDk" align="left" nowrap="nowrap">
                                                    <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ReviewProjectDetail&${PROJECT_ID}=${resultRow.map['project_id']}&${PROJECT_TYPE_ID}=${projectType}">
                                                        details
                                                    </a>
                                                    <c:if test="${resultRow.map['price_changes'] > 0}">
                                                        <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <c:set var="i" value="${i + 1}"/>
                                        </c:forEach>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableHeader" align="left" nowrap="nowrap" colspan="12">
                                    <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>: the payment for
                                    reviewing this component has increased
                                </td>
                            </tr>
                        </table>
                        <br/>
                    </c:if>


                    <c:if test="${fn:length(specificationReviewList) > 0}">
                        <div align="right" style="padding-top: 10px">
                            <b>Spec Review opportunities via RSS -</b>
                            <a href="/tc?module=BasicRSS&c=rss_spec_review_opportunities&dsid=28"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
                            <br />
                        </div>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                                        <tr>
                                            <td class="tableTitle" colspan="9">
                                                ${projectTypeDesc} Specification Review Opportunities
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tableHeader" align="center">Type</td>
                                            <td class="tableHeader" align="center">Catalog</td>
                                            <td class="tableHeader" align="center" width="100%">${projectTypeDesc}</td>
                                            <td class="tableHeader" align="right">Reviewer<br>Payment</td>
                                            <td class="tableHeader" align="center">Opens<br>On</td>
                                            <td class="tableHeader" align="center">Review<br>Start</td>
                                            <td class="tableHeader" align="center">Review<br>End</td>
                                            <td class="tableHeader" align="center">Positions<br>Available</td>
                                            <td class="tableHeader">Details</td>
                                        </tr>

                                        <c:set var="i" value="0"/>
                                        <c:forEach items="${specificationReviewList}" var="resultRow">
                                            <tr>
                                                <td class="statDk" align="center">Specification Review</td>
                                                <td class="statDk" align="center">${projectTypeDesc}</td>
                                                <td class="statDk" align="center" >
                                                    <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectDetail&${PROJECT_ID}=${resultRow.map['ref_project_id']}">
                                                                ${resultRow.map["component_name"]}
                                                                ${resultRow.map["version"]}
                                                     </a>
                                                </td>
                                                <td class="statDk" align="right">
                                                    $ <fmt:formatNumber
                                                        value="${specificationReviewPrices[i].specReviewCost}"
                                                        pattern="#,###.00"/>
                                                </td>

                                                <c:choose>
                                                    <c:when test="${waitingToReview[i]}">
                                                        <td class="statDk" align="center" nowrap="nowrap">
                                                            <fmt:formatDate value="${waitingUntil[i]}"
                                                                pattern="MM.dd.yyyy'<br />'hh:mm a"/>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                            <td class="statDk" align="center"><i>open</i></td>
                                                    </c:otherwise>
                                                </c:choose>

                                                <td class="statDk" align="center">
                                                    <fmt:formatDate value="${resultRow.map['review_start']}"
                                                                pattern="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <fmt:formatDate value="${resultRow.map['review_end']}"
                                                                pattern="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    ${resultRow.map["available_spots"]}
                                                </td>
                                                <td class="statDk" align="left" nowrap="nowrap">
                                                    <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ReviewProjectDetail&${PROJECT_ID}=${resultRow.map['project_id']}&${PROJECT_TYPE_ID}=${specificationReviewProjectTypeId}">
                                                        details
                                                    </a>
                                                    <c:if test="${resultRow.map['price_changes'] > 0}">
                                                        <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <c:set var="i" value="${i + 1}"/>
                                        </c:forEach>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableHeader" align="left" nowrap="nowrap" colspan="9">
                                    <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>: the payment for
                                    reviewing this specification has increased
                                </td>
                            </tr>
                        </table>
                        <br/>
                    </c:if>

                    <c:choose>
                        <c:when test="${fn:length(projectList) + fn:length(specificationReviewList) == 0}">
                            <br/>
                            <p align="center">Sorry, there are currently no review positions available.</p>
                            <br/>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${applicationDelayHours > 0 || applicationDelayMinutes > 0}">
                                <br/>
                                <p>
                                    Due to your existing review commitments, review positions open for you
                                    ${applicationDelayHours} hours and ${applicationDelayMinutes} minutes after a project
                                    opens for review registration.
                                </p>
                                <br/>
                            </c:if>
                        </c:otherwise>
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
