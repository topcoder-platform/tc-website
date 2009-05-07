<%--
  - Author: pulky
  - Version: 1.1
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the review details corresponding to the specified project.
  - It displays the list of projects phases along with the list of taken and available review positions.
  - This is an exhaustive refactor and generalization from existing reviewProjectDetail.jsp files.
  - In this release, it will be used for Conceptualization, Specification and Application Testing project types.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new Studio prototype, Studio Build and 
  - Studio Component competitions.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.TCTimestampResult,
                 com.topcoder.web.tc.Constants, java.sql.Timestamp"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Variables to use JSTL --%>
<c:set var="projectDetailRow" value="${projectDetail[0]}"/>
<c:set var="projectType" value="${projectDetailRow.map['project_category_id']}"/>
<c:set var="now" value="<%=new TCTimestampResult(new Timestamp(System.currentTimeMillis()))%>"/>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>"/>
<c:set var="APPLICATION_TESTING_PROJECT_TYPE" value="<%=Constants.APPLICATION_TESTING_PROJECT_TYPE%>"/>
<c:set var="STUDIO_PROTOTYPE_PROJECT_TYPE" value="<%=Constants.STUDIO_PROTOTYPE_PROJECT_TYPE%>" />
<c:set var="STUDIO_BUILD_PROJECT_TYPE" value="<%=Constants.STUDIO_BUILD_PROJECT_TYPE%>" />
<c:set var="STUDIO_COMPONENT_PROJECT_TYPE" value="<%=Constants.STUDIO_COMPONENT_PROJECT_TYPE%>" />
<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification"/>
    </c:when>
    <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Application Testing"/>
    </c:when>
    <c:when test="${projectType == STUDIO_PROTOTYPE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Studio Prototype"/>
    </c:when>
    <c:when test="${projectType == STUDIO_BUILD_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Studio Build"/>
    </c:when>
    <c:when test="${projectType == STUDIO_COMPONENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Studio Component"/>
    </c:when>
</c:choose>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Open ${projectTypeDesc} Projects Available for Review</title>

        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>

    <body>
        <c:choose>
            <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="conceptualization"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="specification"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="application_testing"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == STUDIO_PROTOTYPE_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="studio_prototype"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == STUDIO_BUILD_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="studio_build"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == STUDIO_COMPONENT_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="studio_component"/>
                </jsp:include>
            </c:when>
        </c:choose>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="conceptualization_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="specification_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="application_testing_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="studio_prototype_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="studio_build_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="studio_component_review"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>
                </td>
                <!-- Left Column Ends -->

                <!-- Gutter Begins -->
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <!-- Gutter Ends -->

                <!-- Center Column Begins -->
                <td width="100%" align="center" class="bodyText">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="conceptualization"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="specification"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="app_testing"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="studio_prototype"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="studio_build"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == STUDIO_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="studio_component"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>
                    <table cellspacing="0" cellpadding="0" width="530">
                        <tr>
                            <td class="bodyText" align="left">
                            <h2>Component Name: ${projectDetailRow.map["component_name"]}</h2>
                            </td>
                        </tr>
                    </table>

                    <table cellspacing="0" width="530" class="formFrame">
                        <tr>
                            <td class="projectTitles" colspan="3">Component Details</td>
                        </tr>
                        <tr>
                            <td class="projectHeaders" align="left" width="50%">Catalog</td>
                            <td class="projectHeaders" align="center">Project Type</td>
                            <td class="projectHeaders" align="right" width="50%">Difficulty</td>
                        </tr>
                        <tr>
                            <td class="projectCells" align="left">${projectTypeDesc}</td>
                            <td class="projectCells" align="center">${projectDetailRow.map['phase_desc']}</td>
                            <td class="projectCells" align="right">${projectDetailRow.map['level']}</td>
                        </tr>
                    </table>

                    <br/>

                    <table cellspacing="0" width="530" class="formFrame">
                        <tr>
                            <td class="projectTitles" colspan="3">Timeline</td>
                        </tr>
                        <tr>
                            <td class="projectHeaders" width="50%">Phase</td>
                            <td class="projectHeaders" width="" align="center">Start</td>
                            <td class="projectHeaders" width="50%" align="right">End</td>
                        <tr>
                            <td class="projectCells">Submission</td>


                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['submission_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['submission_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Screening</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['screening_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['screening_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Review</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['review_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['review_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Appeals</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['appeals_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['appeals_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Aggregation</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['aggregation_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['aggregation_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Aggregation Review</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['agg_review_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['agg_review_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Final Fixes</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['final_fix_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['final_fix_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="projectCells">Final Review</td>
                            <td class="projectCells" align="center">
                                <fmt:formatDate value="${projectDetailRow.map['final_review_start']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="projectCells" align="right">
                                <fmt:formatDate value="${projectDetailRow.map['final_review_end']}"
                                    pattern="MM.dd.yyyy"/>
                            </td>
                        </tr>
                    </table>

                    <br/>

                    <table cellspacing="0" width="530" class="formFrame">
                        <tr>
                            <td class="projectTitles" colspan="3">Positions Available</td>
                        </tr>
                        <tr>
                            <td class="projectHeaders" width="50%">Position</td>
                            <td class="projectHeaders" align="center">Reviewer</td>
                            <td class="projectHeaders" width="50%" align="right">Payment</td>
                        <tr>

                        <c:forEach items="${reviewerList}" var="reviewer">
                            <tr>
                                <td class="projectCells">
                                    <c:if test="${reviewer.primary}">
                                        Primary
                                    </c:if>
                                    ${reviewer.reviewerType}
                                </td>
                                <td class="projectCells" align="center" nowrap>
                                    <c:choose>
                                        <c:when test="${now < projectDetailRow.map['opens_on']}">
                                            <i>Not open yet ***</i>
                                        </c:when>
                                        <c:when test="${reviewer.spotFilled}">
                                            <c:choose>
                                                <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                                                    <tc-webtag:handle coderId="${reviewer.userId}"
                                                        context='conceptualization'/>
                                                </c:when>
                                                <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                                                    <tc-webtag:handle coderId="${reviewer.userId}"
                                                        context='specification'/>
                                                </c:when>
                                                <c:when test="${projectType == APPLICATION_TESTING_PROJECT_TYPE}">
                                                    <tc-webtag:handle coderId="${reviewer.userId}"
                                                        context='application_testing'/>
                                                </c:when>
                                                <c:otherwise>
                                                    <tc-webtag:handle coderId="${reviewer.userId}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${waitingToReview}">
                                            <i>Waiting until <fmt:formatDate value="${waitingUntil}"
                                                pattern="MM.dd.yyyy hh:mm a"/> ****</i>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectReviewApply&${PROJECT_ID}=${reviewer.projectId}&${PROJECT_TYPE_ID}=${projectType}&${PRIMARY_FLAG}=${reviewer.primary}&${REVIEWER_TYPE_ID}=${reviewer.reviewerTypeId}">
                                                Apply Now
                                            </a> **
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="projectCells" align="right">
                                    $<fmt:formatNumber value="${reviewer.reviewPrice}" pattern="#,###.00"/>*
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                    <br/>

                    <table cellspacing="0" cellpadding="0" width="530" class="bodyText">
                        <tr>
                            <td class="bodyText">
                            <p align="left">* This number assumes that all submissions pass screening, the actual
                                payment may differ.</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodyText">
                            <p align="left">** By applying to review the component you are committing to the presented
                                timeline.  Failure to meet the provided timeline may result in a suspension from the
                                TopCoder Review Board.</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="bodyText">
                                <p align="left">*** Review positions for new projects become open 12 hours after the
                                    project starts.</p>
                            </td>
                        </tr>
                        <c:if test="${applicationDelayHours > 0 || applicationDelayMinutes > 0}">
                            <tr>
                                <td class="bodyText">
                                    <p align="left">
                                        **** Due to your existing review commitments, review positions open for you
                                        ${applicationDelayHours} hours and ${applicationDelayMinutes} minutes after a
                                        project opens for review registration.
                                    </p>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td class="bodyText">
                                <p align="left">
                                    <a href="/tc?module=ViewReviewProjects&amp;${PROJECT_TYPE_ID}=${projectType}">
                                        View all projects
                                    </a>
                                </p>
                            </td>
                        </tr>
                    </table>
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
