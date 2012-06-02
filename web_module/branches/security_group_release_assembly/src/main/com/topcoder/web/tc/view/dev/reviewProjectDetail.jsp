<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.dataAccess.resultSet.TCTimestampResult,
                 com.topcoder.common.web.util.DateTime,
                 com.topcoder.web.tc.model.ReviewBoardApplication,
                 com.topcoder.web.tc.Constants,
                 java.sql.Timestamp,
                 java.util.List"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail"); %>
<% List reviewerList = (List) request.getAttribute("reviewerList"); %>
<% boolean isWaiting = (Boolean) request.getAttribute("waitingToReview"); %>
<% Timestamp waitingUntil = (Timestamp) request.getAttribute("waitingUntil"); %>
<% int applicationDelayHours = (Integer) request.getAttribute("applicationDelayHours"); %>
<% int applicationDelayMinutes = (Integer) request.getAttribute("applicationDelayMinutes"); %>
<% boolean hasSpecificationSubmission = (Boolean) request.getAttribute("hasSpecificationSubmission"); %>
<% boolean hasSpecificationReview = (Boolean) request.getAttribute("hasSpecificationReview"); %>
<% boolean hasSubmission = (Boolean) request.getAttribute("hasSubmission"); %>
<% boolean hasScreening = (Boolean) request.getAttribute("hasScreening"); %>
<% boolean hasReview = (Boolean) request.getAttribute("hasReview"); %>
<% boolean hasAppeals = (Boolean) request.getAttribute("hasAppeals"); %>
<% boolean hasAggregation = (Boolean) request.getAttribute("hasAggregation"); %>
<% boolean hasAggregationReview = (Boolean) request.getAttribute("hasAggregationReview"); %>
<% boolean hasFinalFixes = (Boolean) request.getAttribute("hasFinalFixes"); %>
<% boolean hasFinalReview = (Boolean) request.getAttribute("hasFinalReview"); %>
<head>
<title>Open Component Projects Available for Review</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<% int phase_id = ((Integer)request.getAttribute("phase_id")).intValue(); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%= phase_id == 112 ? "des_review" : "dev_review"%>"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= phase_id == 112 ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Review Opportunities"/>
</jsp:include>
            <table cellspacing="0" cellpadding="0" width="530">
                <tr>
                    <td class="bodyText" align="left">
                    <h2>Component Name: <rsc:item set="<%=projectDetail%>" name="component_name"/></h2>
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
                    <td class="projectCells" align="left"><rsc:item set="<%=projectDetail%>" name="catalog"/></td>
                    <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="phase_desc"/></td>
                    <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="level"/></td>
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
                </tr>
                <c:if test="${hasSpecificationSubmission}">
                    <tr>
                        <td class="projectCells">Specification Submission</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="specification_submission_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="specification_submission_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasSpecificationReview}">
                    <tr>
                        <td class="projectCells">Specification Review</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="specification_review_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="specification_review_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>

                <c:if test="${hasSubmission}">
                    <tr>
                        <td class="projectCells">Submission</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="submission_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="submission_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasScreening}">
                    <tr>
                        <td class="projectCells">Screening</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="screening_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="screening_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasReview}">
                    <tr>
                        <td class="projectCells">Review</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="review_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="review_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasAppeals}">
                    <tr>
                        <td class="projectCells">Appeals</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="appeals_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="appeals_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasAggregation}">
                    <tr>
                        <td class="projectCells">Aggregation</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="aggregation_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="aggregation_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasAggregationReview}">
                    <tr>
                        <td class="projectCells">Aggregation Review</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="agg_review_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="agg_review_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasFinalFixes}">
                    <tr>
                        <td class="projectCells">Final Fixes</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="final_fix_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="final_fix_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
                <c:if test="${hasFinalReview}">
                    <tr>
                        <td class="projectCells">Final Review</td>
                        <td class="projectCells" align="center"><rsc:item set="<%=projectDetail%>" name="final_review_start" format="MM.dd.yyyy"/></td>
                        <td class="projectCells" align="right"><rsc:item set="<%=projectDetail%>" name="final_review_end" format="MM.dd.yyyy"/></td>
                    </tr>
                </c:if>
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
                <tc:listIterator id="reviewer" list="<%=reviewerList%>">
                    <tr>
                        <td class="projectCells">
                            <% if (((ReviewBoardApplication) reviewer).isPrimary()) { %>
                              Primary
                            <% } %>
                            <tc:beanWrite name="reviewer" property="reviewerType"/>
                        </td>
                        <td class="projectCells" align="center" nowrap>
                            <% if (((TCTimestampResult) projectDetail.getItem(0, "opens_on")).compareTo(new TCTimestampResult(new Timestamp(System.currentTimeMillis()))) == 1) { %>
                                <i>Not open yet ***</i>
                            <% } else if (((ReviewBoardApplication) reviewer).isSpotFilled()) { %>
                                <tc-webtag:handle coderId="<%=((ReviewBoardApplication)reviewer).getUserId()%>" context='<%=((ReviewBoardApplication)reviewer).getPhaseId()==112?"design":"development"%>'/>
                            <% } else if (isWaiting) { %>
                                <i>Waiting until <%= DateTime.timeStampToArbitraryString(waitingUntil, "MM.dd.yyyy hh:mm a") %> ****</i>
                            <% } else { %>
                            <%-- TCS Release 2.2.0 (TCS-54) : The request passes project type ID instead of component
                                 phase type ID when referrring to review project type--%>
<%--
                                <a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectReviewApply&<%=Constants.PROJECT_ID%>=<tc:beanWrite name="reviewer" property="projectId"/>&<%=Constants.PHASE_ID%>=<%=phase_id%>&<%=Constants.PRIMARY_FLAG%>=<%=((ReviewBoardApplication)reviewer).isPrimary()%>&<%=Constants.REVIEWER_TYPE_ID%>=<tc:beanWrite name="reviewer" property="reviewerTypeId"/>">Apply Now</a> **
--%>
                                <a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectReviewApply&<%=Constants.PROJECT_ID%>=<tc:beanWrite name="reviewer" property="projectId"/>&<%=Constants.PROJECT_TYPE_ID%>=<%=projectDetail.getIntItem(0, "project_category_id")%>&<%=Constants.PRIMARY_FLAG%>=<%=((ReviewBoardApplication)reviewer).isPrimary()%>&<%=Constants.REVIEWER_TYPE_ID%>=<tc:beanWrite name="reviewer" property="reviewerTypeId"/>">Apply Now</a> **
                            <% } %>
                        </td>
                        <td class="projectCells" align="right">
                            $<tc:beanWrite name="reviewer" property="reviewCost" format="#,###.00"/>*
                        </td>
                    </tr>
                </tc:listIterator>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="530" class="bodyText">
                <tr>
                    <td class="bodyText">
                    <p align="left">* This number assumes that all submissions pass screening, the actual payment may differ.</p>
                    </td>
                </tr>
                <tr>
                    <td class="bodyText">
                    <p align="left">** By applying to review the component you are committing to the presented timeline.  Failure to meet the provided timeline may result in a suspension from the TopCoder Review Board.</p>
                    </td>
                </tr>
                <tr>
                    <td class="bodyText">
                        <p align="left">*** Review positions for new projects become open 12 hours after the project starts.</p>
                    </td>
                </tr>
<% if (applicationDelayHours > 0 || applicationDelayMinutes > 0) { %>
                <tr>
                    <td class="bodyText">
                        <p align="left">
                            **** Due to your existing review commitments, review positions open for you <%= applicationDelayHours %> hours and
                            <%= applicationDelayMinutes %> minutes after a project opens for review registration.
                        </p>
                    </td>
                </tr>
<% } %>
                <tr>
                    <td class="bodyText">
                        <%-- TCS Release 2.2.0 (TCS-54) : The request passes project type ID instead of component phase
                             type ID when referrring to review project type --%>
<%--
                        <p align="left"><a href="/tc?module=ViewReviewProjects&amp;<%=Constants.PHASE_ID%>=<%=phase_id%>">View all projects</a></p>
--%>
                        <p align="left"><a href="/tc?module=ViewReviewProjects&amp;<%=Constants.PROJECT_TYPE_ID%>=<%=phase_id == 112 ? 1 : 2%>">View all projects</a></p>
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
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
