<%--
  - Author: duxiaoyang
  - Version: 1.0
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows project details information.
--%>

<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.common.SessionInfo,
                 com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>TopCoder ${projectCategory} Competitions</title>

<jsp:include page="/script.jsp"/>
<script language="JavaScript" type="text/javascript" src="/js/new-project-detail.js"></script>
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>
<%
   ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail");
   ResultSetContainer technologies = (ResultSetContainer) request.getAttribute("technologies");
   ResultSetContainer reviewers = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("reviewers_for_project");
   ResultSetContainer projectInfo = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("project_info");
   ResultSetContainer submissions = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("submissions");
   ResultSetContainer reviewResults = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("review_results");
   ResultSetContainer milestoneInfo = (ResultSetContainer) request.getAttribute("milestones");
   SessionInfo sessionInfo = (SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY);

   long projectId = Long.parseLong((String) request.getAttribute("projectId"));
   boolean isComplete = ((Boolean) request.getAttribute("isComplete")).booleanValue() || sessionInfo.isAdmin();
   long userId = sessionInfo.isAnonymous() ? -1 : sessionInfo.getUserId();
   boolean isReviewer = false;
   if (reviewers != null) {
       for (int k = 0; k < reviewers.size(); k++) {
           if (reviewers.getLongItem(k, "reviewer_id") == userId) {
               isReviewer = true;
           }
       }
   }
   String[] places = {"1st", "2nd", "3rd", "4th", "5th"};
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
        <tr valign="top">
            <%-- Left Column Begins--%>
            <td width="180">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="${leftNav}"/>
                </jsp:include>
            </td>
            <%-- Left Column Ends --%>

            <td class="bodyColumn" align="left" width="100%">
                <!-- new HTML -->
                <div class="mainColumn">
                    <!-- header -->
                    <div class="columnHeader">
                        <h2><span>${projectCategory}</span></h2>
                    </div>
                    <!-- End .columnHeader -->

                    <!-- title -->
                    <div class="columnTitle">
                        <h3><rsc:item set="<%=projectDetail%>" name="component_name"/></h3>
                        <div class="buttonArea">
                            <% if (!projectDetail.getStringItem(0, "project_status").equals("closed")) { %>
                            <a href="/tc?module=ViewRegistration&<%=Constants.PROJECT_ID%>=<%= request.getAttribute("projectId") %>" class="register"><span><span>REGISTER</span></span></a>
                            <% } else { %>
                            <a href="javascript:;" class="register disable"><span><span>REGISTER</span></span></a>
                            <% } %>
                            <% if (projectDetail.getStringItem(0, "project_status").equals("open")) { %>
                            <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review" class="submit"><span><span>SUBMIT</span></span></a>
                            <% } else { %>
                            <a href="javascript:;" class="submit disable"><span><span>SUBMIT</span></span></a>
                            <% } %>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- End .columnTitle -->

                    <!-- mainContainer -->
                    <div class="columnMainContainer">
                        <!-- content -->
                        <div class="columnContent">
                            <!-- prizeSection -->
                            <div class="prizeSection">
                                <div class="inner">
                                    <div class="prizeInfor">
                                        <ul>
                                            <li class="firstPlace">
                                                <span>1st Place</span>
                                                <strong>$<rsc:item set="<%=projectDetail%>" name="total_payment" format="#,##0"/></strong>
                                            </li>
                                            <li class="secondPlace">
                                                <span>2nd Place</span>
                                                <strong>$<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="#,##0"/></strong>
                                            </li>
                                            <li>
                                                <span>Reliability Bonus</span>
                                                <c:choose>
                                                    <c:when test="${maxReliabilityBonus > 0}">
                                                        <strong>$<fmt:formatNumber type="number" pattern="#,##0" value="${maxReliabilityBonus}"/></strong>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <strong>N/A</strong>
                                                    </c:otherwise>
                                                </c:choose>
                                            </li>
                                            <li class="drPoints">
                                                <span>DR Points</span>
                                                <c:choose>
                                                    <c:when test="${hasDR}">
                                                        <strong class="point"><rsc:item set="<%=projectDetail%>" name="dr_points" format="#,##0"/></strong>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <strong class="point">N/A</strong>
                                                    </c:otherwise>
                                                </c:choose>
                                            </li>
                                        </ul>
                                    </div>
                                    <c:if test="${hasMilestone}">
                                    <div class="milestonesInfor">
                                        <h3>Milestones</h3>
                                        <ul>
                                        <% for (int i = 0; i < projectDetail.getIntItem(0, "milestone_number"); ++i) { %>
                                            <li <%=(i == projectDetail.getIntItem(0, "milestone_number") - 1 ? "class=\"last\"" : "")%>>
                                                <span><%=places[i]%> Prize</span>
                                                <strong>$<rsc:item set="<%=projectDetail%>" name="milestone_prize" format="#,###"/></strong>
                                            </li>
                                        <% } %>
                                        </ul>
                                    </div>
                                    </c:if>
                                    <div class="corner tl"></div>
                                    <div class="corner tr"></div>
                                    <div class="corner bl"></div>
                                    <div class="corner br"></div>
                                </div>
                                <div class="shadow"></div>
                            </div>
                            <!-- End .prizeSection -->

                            <!-- tab Section -->
                            <div class="tabSection">
                                <div class="tab">
                                    <ul>
                                        <li><a href="javascript:;" class="current" rel="overview">
                                            <span><span><span>Contest Overview</span></span></span>
                                        </a></li>
                                        <c:if test="${milestoneReviewFinished}">
                                        <li><a href="javascript:;" rel="milestones">
                                            <span><span><span>Milestones</span></span></span>
                                        </a></li>
                                        </c:if>
                                        <c:if test="${resultAvailable}">
                                        <li><a href="javascript:;" rel="winners">
                                            <span><span><span>Results</span></span></span>
                                        </a></li>
                                        </c:if>
                                    </ul>
                                </div>

                                <!-- container for tab -->
                                <div class="tabContainer">
                                    <!-- overview -->
                                    <div id="overview" class="tabContainerInner">
                                        <!-- contest overview -->
                                        <div class="contestOverview">
                                            <div class="containerInner">
                                                <h3>Contest Overview</h3>
                                <c:if test="${isCopilotPosting}">
                                    <c:choose>
                                        <c:when test="${fn:length(requirements) > 0}">
                                            <c:forEach items="${requirements}" var="resultRow">
                                                <p><span class="bodySubtitle">Overview</span></p>
                                                <p>${resultRow.map["detailed_requirements"]}</p>
                                                <%-- need permission to view private description --%>
                                                <c:if test="${privateDescriptionPermission}">
                                                <p><span class="bodySubtitle">Details</span></p>
                                                <p>${resultRow.map["private_description"]}</p>
                                                </c:if>
                                                <p><span class="bodySubtitle">Submission Deliverables</span></p>
                                                <p>
                                                Please refer to the <a href="http://apps.topcoder.com/wiki/x/FIXTAg">How-To</a> guidelines prior to submitting.<br/><br/>
                                                To be considered for review, you must submit 2 documents in a single zip file.<br/><br/>
                                                1.  Game Plan - This is a roadmap of the contests that you plan to run to complete the project.  This should be your best estimate based on the information provided to you.  Communicate in the forums to make sure expectations are clear.  (<a href=http://www.topcoder.com/wiki/download/attachments/47416596/GamePlan_Template.xls>Download the Template</a>)<br/><br/>
                                                2.  Strategy Document - This is a 1 page text document that describes your general approach and strategy to executing and completing the project.  You should include explanations of release points, dependencies, assumptions and risks.  (<a href=http://apps.topcoder.com/wiki/download/attachments/47416596/Strategy_Document_Sample.doc>Download a Sample</a>)<br/>
                                                </p>
                                                <p><span class="bodySubtitle">Final Submission Guidelines</span></p>
                                                <p>If you win, you may be asked to make minor adjustments to your submission.  If so, update your submitted documents based on the scorecard review and any conversations in the forum.  Resubmit a new zip file with both documents.  This will be reviewed as your final submission.</p>
                                            </c:forEach>
                                                <%-- Budget --%>
                                                <p><span class="bodySubtitle">Budget</span><br/></p>
                                                <p>${budgetText}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p><span class="bodySubtitle">Application Overview</span><br/></p>
                                            <p><rsc:item set="<%=projectDetail%>" name="description"/></p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${not isCopilotPosting}">
                                    <c:choose>
                                        <c:when test="${fn:length(requirements) > 0}">
                                            <c:forEach items="${requirements}" var="resultRow">
                                                <p><span class="bodySubtitle">Detailed Requirements</span></p>
                                                <p>${resultRow.map["detailed_requirements"]}</p>
                                                <c:if test="${fn:length(submission_deliverables) > 0}">
                                                <p><span class="bodySubtitle">Submission Deliverables</span></p>
                                                <p>${resultRow.map["submission_deliverables"]}</p>
                                                </c:if>
                                                <c:if test="${fn:length(environment_setup_instruction) > 0}">
                                                <p><span class="bodySubtitle">Environment Setup Instructions</span></p>
                                                <p>${resultRow.map["environment_setup_instruction"]}</p>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                                <p><span class="bodySubtitle">Application Overview</span></p>
                                                <p><rsc:item set="<%=projectDetail%>" name="description"/></p>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                            </div>
                                        </div>
                                        <!-- End .contestOverview -->

                                    <c:if test="${isCopilotPosting}">
                                        <!-- Experience -->
                                        <div class="technologies">
                                            <div class="containerInner">
                                                <h3>Experience</h3>
                                                <ul>
                                                <c:if test="${empty experiences}">
                                                    Not set.
                                                </c:if>
                                                <c:forEach items="${experiences}" var="exp" varStatus="state">
                                                    <li class="${state.index % 2 == 0 ? (state.last ? "first-last" : "first") : "last"}">${exp}</li>
                                                </c:forEach>
                                                </ul>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <!-- End .technologies -->
                                    </c:if>
                                    <c:if test="${not isCopilotPosting}">
                                        <!-- Technologies -->
                                        <div class="technologies">
                                            <div class="containerInner">
                                                <h3>Technologies</h3>
                                                <ul>
                                                <c:set var="index" value="0"/>
                                                <c:set var="count" value="<%=technologies.size()%>"/>
                                                <rsc:iterator list="<%=technologies%>" id="item">
                                                    <li class="${index % 2 == 0 ? (index == count - 1 ? "first-last" : "first") : "last"}"><rsc:item row="<%=item%>" name="technology_name"/></li>
                                                    <c:set var="index" value="${index + 1}"/>
                                                </rsc:iterator>
                                                </ul>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <!-- End .technologies -->
                                    </c:if>

                                        <!-- Eligibility -->
                                        <div class="eligibility">
                                            <div class="containerInner">
                                                <h3>Eligibility</h3>
                                                <p>You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories.</p>
                                                <dl>
                                                    <dt>If you reside in the United States, you must be either:</dt>
                                                    <dd>
                                                        <ul>
                                                            <li>A US Citizen</li>
                                                            <li>A Lawful Permanent Resident of the US</li>
                                                            <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
                                                        </ul>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>If you do not reside in the United States:</dt>
                                                    <dd>
                                                        <ul>
                                                            <li>You must be authorized to perform services as an independent contractor.<br>(Note: In most cases you will not need to do anything to become authorized)</li>
                                                        </ul>
                                                    </dd>
                                                </dl>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                        <!-- End .eligibility -->
                                    </div>
                                    <!-- End #overview -->

                                    <c:if test="${milestoneReviewFinished}">
                                    <!-- Milestones -->
                                    <div id="milestones" class="tabContainerInner">
                                        <!-- Milestone Winners -->
                                        <div class="milestoneWinners">
                                            <h3>Milestone Winners</h3>
                                            <div class="milestoneWinnersList">
                                                <div class="milestoneWinnersListInner">
                                                    <ul>
                                                    <% int place = 0;
                                                       for (int i = 0; i < milestoneInfo.size(); ++i) {
                                                           int milestoneStatus = milestoneInfo.getIntItem(i, "submission_status_id");
                                                           double finalScore = milestoneInfo.getDoubleItem(i, "final_score");
                                                           if (milestoneStatus == 6 || milestoneStatus == 7 || finalScore <= 10.1) {
                                                               continue;
                                                           }
                                                       place++;
                                                    %>
                                                        <li class="prize<%=places[place - 1]%>"><div><span class="contest"><span>#<%=milestoneInfo.getLongItem(i, "submission_id")%></span></span></div></li>
                                                    <% }
                                                       for (int i = place; i < projectDetail.getIntItem(0, "milestone_number"); ++i) {
                                                    %>
                                                        <li class="prize<%=places[i]%> greyBg"><div><span class="contest"><span></span></span></div></li>
                                                    <% } %>
                                                    </ul>
                                                </div>
                                                <div class="corner tl"></div>
                                                <div class="corner tr"></div>
                                                <div class="corner bl"></div>
                                                <div class="corner br"></div>
                                            </div>
                                            <div class="shadow"></div>
                                        </div>
                                        <!-- End .milestoneWinners -->

                                        <!-- Milestone General Feedback -->
                                        <div class="feedback">
                                            <div class="title">
                                                <h3>Milestone General Feedback</h3>
                                            </div>
                                            <div class="container">
                                                <p><rsc:item set="<%=projectDetail%>" name="milestone_general_feedback"/></p>
                                            </div>
                                        </div>
                                        <!-- End .feedback -->
                                    <% for (int i = 0; i < milestoneInfo.size(); ++i) {
                                           if (milestoneInfo.getStringItem(i, "feedback") == null) {
                                               continue;
                                           }
                                    %>
                                        <!-- Feedback -->
                                        <div class="feedback">
                                            <div class="title">
                                                <h3>Feedback #<%=milestoneInfo.getLongItem(i, "submission_id")%></h3>
                                                <a href="javascript:;" class="toggle">Show</a>
                                            </div>
                                            <div class="container hidden">
                                                <p><%=milestoneInfo.getStringItem(i, "feedback")%></p>
                                            </div>
                                        </div>
                                        <!-- End .feedback -->
                                    <% } %>
                                    </div>
                                    <!-- End #milestones -->
                                    </c:if>

                                    <c:if test="${resultAvailable}">
                                    <!-- Winners -->
                                    <div id="winners" class="tabContainerInner">
                                        <!-- winners section -->
                                        <div class="winnerSection">
                                            <div class="inner">
                                                <!-- resultTop -->
                                                <div class="reslutTop">
                                                    <ul>
                                                        <% if (submissions.getItem(0, "final_score").getResultData() != null && submissions.getDoubleItem(0, "final_score") >= 75.0) { %>
                                                        <li class="first"><div class="firstPrize">
                                                            <a href="javascript:;" class="blue"><tc-webtag:handle coderId='<%= submissions.getLongItem(0, "user_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></a>
                                                        </div></li>
                                                        <% } %>
                                                        <% if (submissions.getItem(1, "final_score").getResultData() != null && submissions.getDoubleItem(1, "final_score") >= 75.0) { %>
                                                        <li><div class="seccondPrize">
                                                            <a href="javascript:;" class="yellow"><tc-webtag:handle coderId='<%= submissions.getLongItem(1, "user_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/></a>
                                                        </div></li>
                                                        <% } %>
                                                    </ul>
                                                </div>
                                                <!-- End .reslutTop -->

                                                <!-- result infor -->
                                                <div class="resultInfor">
                                                    <ul>
                                                        <li><div><strong>Registrants:</strong><span><rsc:item set="<%=projectInfo%>" name="num_inquiries" ifNull="unknown*"/></span></div></li>
                                                        <li><div><strong>&nbsp;</strong><span>&nbsp;</span></div></li>
                                                        <li><div><strong>Submissions:</strong><span><rsc:item set="<%=projectInfo%>" name="num_submissions" ifNull="unknown*"/></span></div></li>
                                                        <li><div><strong>Submission %:</strong><span><rsc:item set="<%=projectInfo%>" name="submission_percent" format="0.00'%'" ifNull="unknown*"/></span></div></li>
                                                        <li><div><strong>Passed Screening:</strong><span><rsc:item set="<%=projectInfo%>" name="passed" ifNull="unknown*"/></span></div></li>
                                                        <li><div><strong>Passed %:</strong><span><rsc:item set="<%=projectInfo%>" name="passed_percent" format="0.00'%'" ifNull="unknown*"/></span></div></li>
                                                        <li class="last"><div><strong>Average Initial Score:</strong><span><rsc:item set="<%=projectInfo%>" name="avg_raw_score" format="0.00" ifNull="unknown*"/></span></div></li>
                                                        <li class="last"><div><strong>Average Final Score:</strong><span><rsc:item set="<%=projectInfo%>" name="avg_final_score" format="0.00" ifNull="unknown*"/></span></div></li>
                                                    </ul>
                                                </div>
                                                <!-- End .resultInfor -->
                                                <div class="clear"></div>

                                                <!-- result list -->
                                                <div class="resultList">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <thead>
                                                            <tr>
                                                                <th class="first">Handle</th>
                                                                <th>Date<br />Registered</th>
                                                                <th>Date<br />Submitted</th>
                                                                <th>Screening<br />Score</th>
                                                                <th>Initial/Final<br />Score</th>
                                                                <th>
                                                                    <div id="popDR" class="popUp">
                                                                        <div>Digital Run</div>
                                                                    </div>
                                                                    <a href='/dr'><img class="emblem" src="/i/interface/emblem/digitalrun.png" alt="" border="0" onmouseover="popUp(this,'popDR')" onmouseout="popHide()"/></a>
                                                                    <br />Points
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <rsc:iterator list="<%=submissions%>" id="resultRow">
                                                            <tr>
                                                                <td class="handle">
                                                                    <% if ((isComplete || userId == resultRow.getLongItem("user_id") || isReviewer) 
                                                                           && (sessionInfo.isAdmin() || projectInfo.getIntItem(0, "viewable_category_ind") == 1)) { %>
                                                                    <a href='/tc?module=DownloadSubmission&cr=<%= resultRow.getLongItem("user_id") %>&pj=<%= projectId %>&st=1&ph=<%= projectInfo.getStringItem(0, "phase_id") %>'>
                                                                        <img src="/i/iconHandle.png" alt="Download submission" border="0"/>
                                                                    </a>
                                                                    <% } %>
                                                                    <tc-webtag:handle coderId='<%= resultRow.getLongItem("user_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
                                                                </td>
                                                                <td>
                                                                    <rsc:item name="inquire_timestamp" row="<%=resultRow%>" format="MM.dd.yyyy" ifNull="unknown*"/>
                                                                </td>
                                                                <td>
                                                                    <rsc:item name="submit_timestamp" row="<%=resultRow%>" format="MM.dd.yyyy" ifNull="unknown*"/>
                                                                </td>
                                                                <td class="score">
                                                                    <% if (resultRow.getItem("screening_score").getResultData() == null) { %>
                                                                        <span class="fail"><rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="unknown*"/></span>
                                                                    <% } else { %>
                                                                        <% if (isComplete || userId == resultRow.getLongItem("user_id") || isReviewer) { %>
                                                                        <a href='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>'>               
                                                                            <span class="<%=resultRow.getIntItem("passed_screening") == 1 ? "success" : "fail"%>"><rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="unknown*"/></span>
                                                                        </a>
                                                                        <% } else { %>
                                                                        <span class="<%=resultRow.getIntItem("passed_screening") == 1 ? "success" : "fail"%>"><rsc:item row="<%=resultRow%>" name="screening_score" format="0.00" ifNull="unknown*"/></span> 
                                                                        <% } %>
                                                                    <% } %>
                                                                </td>
                                                                <% if (resultRow.getIntItem("passed_screening") == 1) { %>
                                                                <td>
                                                                    <rsc:item row="<%=resultRow%>" name="initial_score" format="0.00" ifNull="unknown*"/>
                                                                    /
                                                                    <a href="javascript:;" class="tooltip" onmouseover="showTooltip(this, '<%=resultRow.getLongItem("user_id")%>');" onmouseout="hideTooltip('<%=resultRow.getLongItem("user_id")%>');">
                                                                        <rsc:item row="<%=resultRow%>" name="final_score" format="0.00" ifNull="unknown*"/>
                                                                    </a>
                                                                </td>
                                                                <td class="drPoints">
                                                                    <strong><rsc:item row="<%=resultRow%>" name="final_points" format="0.00" ifNull="N/A"/></strong>
                                                                    <% if (resultRow.getItem("final_points").getResultData() != null && resultRow.getIntItem("final_points") != resultRow.getIntItem("initial_points")) { %>
                                                                    **
                                                                    <% } %>
                                                                </td>
                                                                <% } else { %>
                                                                <td>&nbsp;</td>
                                                                <td class="drPoints">&nbsp;</td>
                                                                <% } %>
                                                            </tr>
                                                            </rsc:iterator>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!-- End .resultList -->
                                                <div class="corner tl"></div>
                                                <div class="corner tr"></div>
                                                <div class="corner bl"></div>
                                                <div class="corner br"></div>
                                            </div>
                                            <div class="shadow"></div>
                                        </div>
                                        <!-- End .winnerSection -->
                                    </div>
                                    <!-- End #winners -->
                                    </c:if>
                                </div>
                                <!-- End .tabContainer -->
                            </div>
                            <!-- End .tabSection -->
                        </div>
                        <!-- End .columnContent -->

                        <!-- sidebar -->
                        <div class="columnSideBar">
                            <!-- time line -->
                            <div class="timeline">
                                <div class="inner">
                                    <h3><span>Contest Timelines</span></h3>
                                    <ul>
                                        <li>
                                            <strong>Posted On:</strong>
                                            <span><rsc:item set="<%=projectDetail%>" name="posting_date" format="MM/dd/yyyy hh:mm a z"/></span>
                                        </li>
                                        <li>
                                            <strong>Register By:</strong>
                                            <span><rsc:item set="<%=projectDetail%>" name="register_end_date" format="MM/dd/yyyy hh:mm a z"/></span>
                                        </li>
                                        <c:if test="${milestoneReviewFinished}">
                                        <li class="twoLine">
                                            <strong>Milestone Submission:</strong>
                                            <span><rsc:item set="<%=projectDetail%>" name="milestone_submission_date" format="MM/dd/yyyy hh:mm a z"/></span>
                                        </li>
                                        </c:if>
                                        <li class="twoLine last">
                                            <strong>Final Submission:</strong>
                                            <span><rsc:item set="<%=projectDetail%>" name="final_submission_date" format="MM/dd/yyyy hh:mm a z"/></span>
                                        </li>
                                    </ul>
                                    <div class="corner tl"></div>
                                    <div class="corner tr"></div>
                                    <div class="corner bl"></div>
                                    <div class="corner br"></div>
                                </div>
                                <div class="shadow"></div>
                            </div>
                            <!-- End .timeline -->

                            <!-- Contest Links -->
                            <div class="contestLinks">
                                <h3>Contest Links</h3>
                                <div class="inner">
                                    <ul>
                                        <% if (projectDetail.getItem(0, "jive_category_id").getResultData() != null) { %>
										<li>
                                            <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<rsc:item set="<%=projectDetail%>" name="jive_category_id"/>">Contest Forum</a>
									    </li>
                                        <% } %>
                                        <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="screening_scorecard_id"/>">Screening Scorecard</a></li>
                                        <li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="review_scorecard_id"/>">Review Scorecard</a></li>
                                    </ul>
                                    <div class="corner tl"></div>
                                    <div class="corner tr"></div>
                                    <div class="corner bl"></div>
                                    <div class="corner br"></div>
                                </div>
                                <div class="shadow"></div>
                            </div>
                            <!-- End .contestLinks -->

                            <c:if test="${fn:length(supportingDocs) > 0}">
                            <!-- donwloads -->
                            <div class="donwloads">
                                <h3>Downloads</h3>
                                <c:if test="${!canDownloadDocuments}">
                                    <i>(register the contest to see the documentation)</i>
                                </c:if>
                                <div class="inner">
                                    <ul>
                                <c:forEach items="${supportingDocs}" var="resultRow" varStatus="status">
                                        <li>
                                    <c:choose>
                                        <c:when test="${canDownloadDocuments}">
                                            <a href="/tc?module=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${resultRow.map['document_id']}">${resultRow.map['document_name']}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <i href="javascript:;">${resultRow.map['document_name']}</i>
                                        </c:otherwise>
                                    </c:choose>
                                    <%-- Wiki instructions link --%>
                                    <c:if test="${instructionsLinks[status.index] != null}">
                                            (<a href='${instructionsLinks[status.index]}'>instructions</a>)
                                    </c:if>
                                        </li>
                                </c:forEach>
                                    </ul>
                                    <div class="corner tl"></div>
                                    <div class="corner tr"></div>
                                    <div class="corner bl"></div>
                                    <div class="corner br"></div>
                                </div>
                                <div class="shadow"></div>
                            </div>
                            <!-- End .donwloads -->
                            </c:if>

                            <c:if test="${not isCopilotPosting and fn:length(requirements) > 0}">
                                <c:forEach items="${requirements}" var="resultRow">
                            <!-- Guidelines -->
                            <div class="guidelines">
                                <h3>Final Submission Guidelines</h3>
                                <div class="inner">
                                    <div class="container">
                                        ${resultRow.map["final_submission_guidelines"]}
                                    </div>
                                    <div class="corner tl"></div>
                                    <div class="corner tr"></div>
                                    <div class="corner bl"></div>
                                    <div class="corner br"></div>
                                </div>
                                <div class="shadow"></div>
                            </div>
                            <!-- End .guidelines -->
                                </c:forEach>
                            </c:if>
                        </div>
                        <!-- End .columnSideBar -->
                        <div class="clear"></div>
                    </div>
                    <!-- End .columnMainContainer -->
                </div>
                <!-- End .mainColumn -->
            </td>
        </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp"/>

<!-- tooltip -->
<rsc:iterator list="<%=submissions%>" id="resultRow">
<div class="tip tip<%=resultRow.getLongItem("user_id")%>" onmouseover="enterTooltip(<%=resultRow.getLongItem("user_id")%>)" onmouseout="hideTooltip(<%=resultRow.getLongItem("user_id")%>)">
    <div class="inner">
        <div class="tipHeader">
            <h2>Reviewer Score</h2>
        </div>
        <div class="tipBody">
            <ul>
        <% for (int k = 0; k < reviewers.size(); k++) { %>
            <rsc:iterator list="<%=reviewResults%>" id="reviewResultRow">
                <% if (reviewResultRow.getLongItem("reviewer_id") == reviewers.getLongItem(k, "reviewer_id") &&
                       reviewResultRow.getLongItem("submitter_id") == resultRow.getLongItem("user_id")) { %>
                <li>
                <% if ("Stress".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
                    <img src="/i/interface/emblem/stress.png" alt="" border="0"/>
                <% } else if ("Accuracy".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
                    <img src="/i/interface/emblem/accuracy.png" alt="" border="0"/>
                <% } else if ("Failure".equalsIgnoreCase(reviewers.getStringItem(k, "review_resp_desc"))) { %>
                    <img src="/i/interface/emblem/failure.png" alt="" border="0"/>
                <% } %>
                    <tc-webtag:handle coderId='<%= reviewers.getLongItem(k, "reviewer_id") %>' context='<%= projectInfo.getStringItem(0, "phase_desc") %>'/>
                    <% if (isComplete || userId == reviewers.getLongItem(k, "reviewer_id") || userId == resultRow.getLongItem("user_id")) { %>
                    <a href='/tc?module=ScorecardDetails&pj=<%=projectId%>&uid=<%=resultRow.getLongItem("user_id")%>&rid=<%=reviewers.getLongItem(k, "reviewer_id")%>' class="reviewScore">
                        <rsc:item row="<%=reviewResultRow%>" name="<%="final_score"%>" format="0.00"/>
                    </a>
                    <% } else { %>
                    <a href="javascript:;" class="reivewScore"><rsc:item row="<%=reviewResultRow%>" name="<%="final_score"%>" format="0.00"/></a>
                    <% } %>
                </li>
                <% } %>
            </rsc:iterator>
        <% } %>
            </ul>
        </div>
        <div class="corner tl"></div>
        <div class="corner tr"></div>
        <div class="corner bl"></div>
        <div class="corner br"></div>
    </div>
    <div class="shadow"></div>
</div>
</rsc:iterator>
<!-- End #tip -->

</body></html>