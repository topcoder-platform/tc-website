<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows project details for Test Suites projects.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes:
  -    * Updated Application Testing to Test Suites.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail");%>
<% ResultSetContainer technologies = (ResultSetContainer) request.getAttribute("technologies");%>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Project Details</title>

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
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="test_suites_compete"/>
                </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Active Contests"/>
            </jsp:include>

<%-- Title --%>

<table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
<tr valign="top">
<td class="bodyText">

<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectTitles" nowrap="nowrap">Test Suite Project -
            <rsc:item set="<%=projectDetail%>" name="component_name"/></td>
    </tr>
</table>
<table cellspacing="0" cellpadding="0" width="530" class="bodyText" style="margin-top: 20px; margin-bottom: 20px;">
   <% if (projectDetail.getStringItem(0, "project_status").equals("closed")) { %>
   <tr>
      <td width="50%" valign="top">
      <h2>Registration is closed.</h2>
      </td>
      <td width="25%" valign="top" align="right" style="padding: 0px 5px 0px 0px;">
      <%-- Register --%>
         <div class="bigButton" style="width: 100px;">1: Register</div>
      </td>
      <td width="25%" valign="top" align="right" style="padding: 0px 0px 0px 5px;">
      <%-- Submit --%>
      <A class="bigButton" style="width: 100px;" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">2: Submit</A>
      </td>
   </tr>
   <% } else { %>
   <tr>
      <td width="35%">
      <div class="bigRed" style="border-top: 1px solid #999999; border-bottom: 1px solid #999999;">
         <div style="float:right; text-align:right;">
         $<rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/><br />
         $<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br />
         <c:if test="${maxReliabilityBonus > 0}">
           $<fmt:formatNumber type="number" pattern="#,###.00" value="${maxReliabilityBonus}"/><br/>
         </c:if>
         <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>
         </div>
      <strong>1st Place:<br />
      2nd Place:<br />
      <c:if test="${maxReliabilityBonus > 0}">
        Reliability Bonus:<br/>
      </c:if>
      Due Date:</strong>
      </div>
      </td>
      <td width="40%" align="right" style="padding: 0px 5px 10px 0px;">
         <A class="bigButton" style="width: 100px;" href="/tc?module=ViewRegistration&<%=Constants.PROJECT_ID%>=<%= request.getAttribute("projectId") %>">1: Register</A>
      </td>
      <td width="25%" align="right" style="padding: 0px 0px 10px 5px;">
      <%-- Submit --%>
      <A class="bigButton" style="width: 100px;" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">2: Submit</A>
      </td>
   </tr>
   <tr>
      <td colspan="3" align="center" style="padding-top:10px;">
         Register to get info necessary to submit a solution<br />
         <span class="bigRed">Registering will affect your Reliability Rating</span>
      </td>
   </tr>
   <% } %>
</table>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Overview</td>
    </tr>
</table>

<c:choose>
    <c:when test="${fn:length(requirements) > 0}">
        <c:forEach items="${requirements}" var="resultRow">
        	<p><span class="bodySubtitle">Detailed Requirements</span><br></p>
        	${resultRow.map["detailed_requirements"]}
        
        	<p><span class="bodySubtitle">Submission Deliverables</span><br></p>
        	${resultRow.map["submission_deliverables"]}
        
        	<p><span class="bodySubtitle">Environment Setup Instructions</span><br></p> 
        	${resultRow.map["environment_setup_instruction"]}
        
        	<p><span class="bodySubtitle">Final Submission Guidelines</span><br></p> 
        	${resultRow.map["final_submission_guidelines"]}
        
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p><span class="bodySubtitle">Application Overview</span><br></p>
        
        <p>
            <rsc:item set="<%=projectDetail%>" name="description"/>
        </p>
    </c:otherwise>
</c:choose>

<%-- Technologies --%>
<p class="noSpListTitle"><strong>Technologies</strong></p>
<ul class="noSpList">
    <rsc:iterator list="<%=technologies%>" id="item">
        <li><rsc:item row="<%=item%>" name="technology_name"/></li>
    </rsc:iterator>
</ul>

<%-- Documentation --%>
<p><strong>Documentation</strong><br />
    Documentation / Specification available in the <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<rsc:item set="<%=projectDetail%>" name="jive_category_id"/>">forums</a>.
</p>

<%-- Requirement Spec --%>
<p><strong>Requirement Specification</strong><br />
    View the <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/document?id=<rsc:item set="<%=projectDetail%>" name="document_id"/>">Requirement Specification</a> for this project.
</p>

<p><strong>Scorecards</strong><br/>
    View the <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="screening_scorecard_id"/>">screening</a> and <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="review_scorecard_id"/>">review</a> scorecards for this project.
</p>

<%-- Timeline --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Timeline</td>
    </tr>
</table>
<p>
    All submissions are required to be submitted by the Initial Submission Due Date. All questions submitted with more than 24 hours before the due date will be answered. Following review from the board the winning member is given until the Final Submission Due Date to modify their submission.
</p>

<p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="350">
    <tr>
        <td class="bodyText">Posting Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="posting_date" format="MM.dd.yyyy hh:mm a z"/></td>
    </tr>
    <tr>
        <td class="bodyText">Initial Submission Due Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy hh:mm a z"/></td>
    </tr>
    <tr>
        <td class="bodyText">Winner Announced:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="winner_announced_date" format="MM.dd.yyyy hh:mm a z"/></td>
    </tr>
    <tr>
        <td class="bodyText">Final Submission Due Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="final_submission_date" format="MM.dd.yyyy hh:mm a z"/></td>
    </tr>
</table>
</p>
<ul>
<li>TopCoder may extend registration deadlines for any project that has insufficient participation. This decision may be influenced by whether the members that are already signed up for the project are rated or have high reliability. Registration deadlines become final 12 hours after they have expired.</li>
<li>TopCoder may extend submission deadlines up to 48 hours before the submission deadline if evidence suggests that the extension may be necessary for the project to be completed.</li>
<li>TopCoder may extend submission deadlines at any time if there were problems in the project that cost competitors time and therefore justify the extension.</li>
<li>TopCoder may cancel any project when there is evidence that no competitors are going to submit. Before this, TopCoder will send a verification email to all competitors. If no competitors reply affirmatively within 24 hours, the project will be terminated.</li>
</ul>

<%-- Payment --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Payment</td>
    </tr>
</table>
<p>
 TopCoder will compensate members with first and second place submissions after project completion that have scored at least 75*.</p>

<p><strong>Winner</strong><br />
    Total Payment - $<rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/><br />
</p>

<p><strong>2nd Place</strong><br />
    Total Payment - $<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br />
</p>

<p>
    Completion of the project is defined as follows:
</p>

<ul>
<li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
<li>The Submission has been selected by the board as the winning submission.</li>
<li>Final payment is conditional on acceptance of the fully completed deliverables by the Review Board.</li>
</ul>

<%-- Eligibility Requirements --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Eligibility</td>
    </tr>
</table>
<p class="noSpListTitle">
    You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements. In addition,
    you must fit into one of the following categories.
    <br /><br />
    If you reside in the United States, you must be either:
    <ul class="noSpList">
        <li>A US Citizen</li>
        <li>A Lawful Permanent Resident of the US</li>
        <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
            permitting unrestricted employment in the U.S.</li>
    </ul>
    If you do not reside in the United States:
    <ul class="noSpList">
        <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not
            need to do anything to become authorized)</li>
    </ul>
</p>

</td>
</tr>
</table>


        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>

    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
