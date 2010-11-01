<%--
  - Author: pulky
  - Version: 1.1
  - Since: Studio Coding In Online Review
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows project details for RIA Component competitions.
  - 
  - Version 1.1 (BUGR-2979) changes:
  -    * Removed Requirements Specification section if existed.
  -    * Renamed the existing "Documentation" section to "Forum". Changed attached wording.
  -    * Added support for multiple documentation downloads.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer, com.topcoder.web.tc.Constants" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Variables to use JSTL --%>
<c:set var="projectDetailRow" value="${projectDetail[0]}"/>
<c:set var="SOFTWARE_SERVER_NAME" value="<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"/>
<c:set var="ONLINE_REVIEW_URL" value="http://${SOFTWARE_SERVER_NAME}/review"/>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>"/>
<c:set var="FORUMS_SERVER_NAME" value="<%=ApplicationServer.FORUMS_SERVER_NAME%>"/>
<c:set var="FORUMS_URL" value="http://${FORUMS_SERVER_NAME}/?module=Category&categoryID"/>

<html>
    <head>
        <title>
            TopCoder RIA Component Competitions
        </title>
        
        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>

    <body>
        <jsp:include page="../top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <%-- Left Column Begins--%>
                <td width="180">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ria_component_compete"/>
                    </jsp:include>
                </td>
                <%-- Left Column Ends --%>
            
                <%-- Center Column Begins --%>
                <td width="100%" align="left" class="bodyColumn">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_component"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                
                    <%-- Title --%>
                
                    <table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
                        <tr valign="top">
                            <td class="bodyText">
                                <table cellspacing="0" class="formFrame" align="center" width="530">
                                    <tr>
                                        <td class="projectTitles" nowrap="nowrap">
                                            RIA Component Project - ${projectDetailRow.map["component_name"]}
                                        </td>
                                    </tr>
                                </table>
                                <table cellspacing="0" cellpadding="0" width="530" class="bodyText" style="margin-top: 20px; margin-bottom: 20px;">
                                    <c:choose>
                                        <c:when test="${projectDetailRow.map['project_status'] == 'closed'}">
                                            <tr>
                                                <td width="50%" valign="top">
                                                    <h2>
                                                        Registration is closed.
                                                    </h2>
                                                </td>
                                                <td width="25%" valign="top" align="right" style="padding: 0px 5px 0px 0px;">
                                                    <%-- Register --%>
                                                    <div class="bigButton" style="width: 100px;">
                                                        1: Register
                                                    </div>
                                                </td>
                                                <td width="25%" valign="top" align="right" style="padding: 0px 0px 0px 5px;">
                                                    <%-- Submit --%>
                                                    <A class="bigButton" style="width: 100px;" href="${ONLINE_REVIEW_URL}">
                                                        2: Submit
                                                    </A>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td width="35%">
                                                    <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
                                                        <div style="float:right; text-align:right;">
                                                            $<fmt:formatNumber value="${projectDetailRow.map['total_payment']}" pattern="#,###.00"/><br>
                                                            $<fmt:formatNumber value="${projectDetailRow.map['second_place_payment']}" pattern="#,###.00"/><br>
                                                            <c:if test="${maxReliabilityBonus > 0}">
                                                              $<fmt:formatNumber type="number" pattern="#,###.00" value="${maxReliabilityBonus}"/><br/>
                                                            </c:if>
                                                            <fmt:formatDate value="${projectDetailRow.map['initial_submission_date']}" pattern="MM.dd.yyyy"/>
                                                        </div>
                                                        <strong>
                                                            First place:<br>
                                                            Second place:<br>
                                                            <c:if test="${maxReliabilityBonus > 0}">
                                                              Reliability Bonus:<br/>
                                                            </c:if>
                                                            Due Date:
                                                        </strong>
                                                    </div>
                                                </td>
                                                <td width="40%" align="right" style="padding: 0px 5px 10px 0px;">
                                                    <A class="bigButton" style="width: 100px;" href="/tc?module=ViewRegistration&${PROJECT_ID}=${projectId}">
                                                        1: Register
                                                    </A>
                                                </td>
                                                <td width="25%" align="right" style="padding: 0px 0px 10px 5px;">
                                                    <%-- Submit --%>
                                                    <A class="bigButton" style="width: 100px;" href="${ONLINE_REVIEW_URL}">
                                                        2: Submit
                                                    </A>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center" style="padding-top:10px;">
                                                    Register to get info necessary to submit a solution<br />
						    <c:choose>
						        <c:when test="${projectDetailRow.map['rated'] == 'Yes'}">
                                                        <span class="bigRed">Registering will affect your Reliability Rating</span>
                                                        </c:when>
						    </c:choose>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                                <table cellspacing="0" class="formFrame" align="center" width="530">
                                    <tr>
                                        <td class="projectHeaders" align="left">
                                            Overview
                                        </td>
                                    </tr>
                                </table>
                                
                                <c:choose>
									<c:when test="${fn:length(requirements) > 0}">
										<c:forEach items="${requirements}" var="resultRow">
											<p><span class="bodySubtitle">Detailed Requirements</span><br></p>
											${resultRow.map["detailed_requirements"]}
										
											<c:if test="${fn:length(submission_deliverables) > 0}">        	
								        		<p><span class="bodySubtitle">Submission Deliverables</span><br></p>
								        		${resultRow.map["submission_deliverables"]}
											</c:if>        
								
											<c:if test="${fn:length(environment_setup_instruction) > 0}">        	
									        	<p><span class="bodySubtitle">Environment Setup Instructions</span><br></p> 
									        	${resultRow.map["environment_setup_instruction"]}
											</c:if>        

										
											<p><span class="bodySubtitle">Final Submission Guidelines</span><br></p> 
											${resultRow.map["final_submission_guidelines"]}
										
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p><span class="bodySubtitle">Application Overview</span><br></p>
										
										<p>
      											${projectDetailRow.map["description"]}
										</p>
									</c:otherwise>
								</c:choose>
                                
                                <%-- Technologies --%>
                                <p class="bodySubtitle">
                                    <strong>
                                        Technologies
                                    </strong>
                                </p>
                                <ul class="noSpList">
                                    <c:forEach items="${technologies}" var="technologiesRow">
                                        <li>
                                            ${technologiesRow.map["technology_name"]}
                                        </li>
                                    </c:forEach>
                                </ul>
                                
                                <%-- Documentation --%>
                                <jsp:include page="../contest/supportingDocumentation.jsp"/>
                                                    
                                <%-- Forum --%>
                                <p>
                                    <span class="bodySubtitle"><strong>
                                        Forum
                                    </strong></span><br>
                                    Please use the contest
                                
                                    <c:choose>
                                        <c:when test="${empty projectDetailRow.map['jive_category_id']}">
                                            forum
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${FORUMS_URL}=${projectDetailRow.map['jive_category_id']}">forum</a>
                                        </c:otherwise>
                                    </c:choose>
                                    to view additional information and communicate with the contest owners.
                                </p>
                                
                                <p><span class="bodySubtitle"><strong>Scorecards</strong></span><br/>
                                    View the <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=${projectDetailRow.map['screening_scorecard_id']}">screening</a> and <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=${projectDetailRow.map['review_scorecard_id']}">review</a> scorecards for this project.
                                </p>
                                
                                <p>
                                    <div align="right">
                                        <a href="/wiki/display/tc/How+to+Compete+in+Studio+Component+Competitions"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a>
                                    </div>
                                </p>
                                
                                
                                <%-- Timeline --%>
                                <table cellspacing="0" class="formFrame" align="center" width="530">
                                    <tr>
                                        <td class="projectHeaders" align="left">
                                            Timeline
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    All submissions are required to be submitted by the Initial Submission Due Date.
                                </p>
                                
                                <p>
                                    <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="350">
                                        <tr>
                                            <td class="bodyText">
                                                Posting Date:
                                            </td>
                                            <td class="bodyText" align="right">
                                                <fmt:formatDate value="${projectDetailRow.map['posting_date']}"
                                                    pattern="MM.dd.yyyy hh:mm a z"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bodyText">
                                                Initial Submission Due Date:
                                            </td>
                                            <td class="bodyText" align="right">
                                                <fmt:formatDate value="${projectDetailRow.map['initial_submission_date']}"
                                                    pattern="MM.dd.yyyy hh:mm a z"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bodyText">
                                                Winner Announced:
                                            </td>
                                            <td class="bodyText" align="right">
                                                <fmt:formatDate value="${projectDetailRow.map['winner_announced_date']}"
                                                    pattern="MM.dd.yyyy hh:mm a z"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="bodyText">
                                                Final Submission Due Date:
                                            </td>
                                            <td class="bodyText" align="right">
                                                <fmt:formatDate value="${projectDetailRow.map['final_submission_date']}"
                                                    pattern="MM.dd.yyyy hh:mm a z"/>
                                            </td>
                                        </tr>
                                    </table>
                                </p>
                                
                                <%-- Payment --%>
                                <table cellspacing="0" class="formFrame" align="center" width="530">
                                    <tr>
                                        <td class="projectHeaders" align="left">
                                            Payment
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                    TopCoder will compensate competitors with first and second place submissions.
                                    Initial payment for the winning submission will be distributed in two installments.
                                    First Milestone: When the winning solution is submitted and review board suggestions
                                    are integrated. Second Milestone: Marked by the completion of the Deployment phase 
                                    of the project.
                                </p>
                                
                                <p>
                                    <strong>
                                        Winning submission
                                    </strong><br>
                                    Total Payment - $<fmt:formatNumber value="${projectDetailRow.map['total_payment']}" pattern="#,###.00"/><br>
                                </p>
                                
                                <p>
                                    <strong>
                                        Second Place submission
                                    </strong><br>
                                    Total Payment - $<fmt:formatNumber value="${projectDetailRow.map['second_place_payment']}" pattern="#,###.00"/><br>
                                </p>
                                
                                
                                <%-- Eligibility Requirements --%>
                                <table cellspacing="0" class="formFrame" align="center" width="530">
                                    <tr>
                                        <td class="projectHeaders" align="left">
                                            Eligibility
                                        </td>
                                    </tr>
                                </table>
                                <p class="noSpListTitle">
                                    You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition,
                                    you must fit into one of the following categories.
                                    <br><br>
                                    If you reside in the United States, you must be either:
                                    <ul class="noSpList">
                                        <li>
                                            A US Citizen
                                        </li>
                                        <li>
                                            A Lawful Permanent Resident of the US
                                        </li>
                                        <li>
                                            A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
                                            permitting unrestricted employment in the U.S.
                                        </li>
                                    </ul>
                                    If you do not reside in the United States:
                                    <ul class="noSpList">
                                        <li>
                                            You must be authorized to perform services as an independent contractor. 
                                            (Note: In most cases you will not need to do anything to become authorized)
                                        </li>
                                    </ul>
                                </p>
                            </td>
                        </tr>
                    </table>
                
                <p><br></p>
                
                
                </td>
                <%-- Center Column Ends --%>
                
                <%-- Right Column Begins --%>
                <td width="180">
                    <jsp:include page="../public_right.jsp">
                        <jsp:param name="level1" value="default"/>
                    </jsp:include>
                </td>
                <%-- Right Column Ends --%>
            
            </tr>
        </table>
        
        <jsp:include page="../foot.jsp"/>
    </body>
</html>

