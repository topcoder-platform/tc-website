<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows project details for component design competitions.
  - 
  - Version 1.1 (BUGR-2979) changes:
  -    * Removed Requirements Specification section if existed.
  -    * Renamed the existing "Documentation" section to "Forum". Changed attached wording.
  -    * Added support for multiple documentation downloads.
--%>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail");%>
<% ResultSetContainer technologies = (ResultSetContainer) request.getAttribute("technologies");%>
<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

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
        <jsp:param name="node" value="des_compete"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="comp_design"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<%-- Title --%>
<% if (projectDetail.getIntItem(0, "status_id") == 303) {%>
<table cellspacing="0" class="bodyText" align="center" width="530">
    <tr>
        <td class="bodyText" align="right">
            <img src="/i/development/tccc04_comp_badge.gif" alt="TCCC Qualifying Project" width="145" height="46" border="0"/>
        </td>
    </tr>
</table>
<% } %>

<table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
<tr valign="top">
<td class="bodyText">

<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectTitles" nowrap="nowrap">Design Component Project -
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
         $<rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/><br>
         $<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br>
         <c:if test="${maxReliabilityBonus > 0}">
           $<fmt:formatNumber type="number" pattern="#,###.00" value="${maxReliabilityBonus}"/><br/>
         </c:if>
         <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>
         </div>
      <strong>1st Place:<br>
      2nd Place:<br>
      <c:if test="${maxReliabilityBonus > 0}">
        Reliability Bonus:<br/>
      </c:if>
      Due Date:</strong> 
      </div>
      </td>
      <td width="40%" align="right" style="padding: 0px 5px 10px 0px;">
         <A class="bigButton" style="width: 100px;" href="/tc?module=ViewProjectRegistration&<%=Constants.PROJECT_ID%>=<%= request.getAttribute("projectId") %>">1: Register</A>
      </td>
      <td width="25%" align="right" style="padding: 0px 0px 10px 5px;">
      <%-- Submit --%>
      <A class="bigButton" style="width: 100px;" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">2: Submit</A>
      </td>
   </tr>
   <tr>
      <td colspan="3" align="center" style="padding-top:10px;">
         Register to get info necessary to submit a solution<br/>
         <span class="bigRed">Registering will affect your <A class="bigRed" href="/wiki/display/tc/Component+Design+Reliability+Ratings">Reliability Rating</A></span>
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
<p class="bodySubtitle"><strong>Technologies</strong></p>
<ul class="noSpList">
    <rsc:iterator list="<%=technologies%>" id="item">
        <li><rsc:item row="<%=item%>" name="technology_name"/></li>
    </rsc:iterator>
</ul>

<%-- Documentation --%>
<jsp:include page="../contest/supportingDocumentation.jsp"/>
                    
<%-- Forum s--%>
<p><span class="bodySubtitle"><strong>Forum</strong></span><br>
    Please use the contest
<% if (projectDetail.getItem(0, "jive_category_id").getResultData() == null) { %>
    forum
    <% } else { %>
    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<rsc:item set="<%=projectDetail%>" name="jive_category_id"/>">forum</a>.
    <% } %>
    to view additional information and communicate with the contest owners.
</p>
<% if (projectDetail.getIntItem(0, "viewable") == 1) { %>
<p>
    View
    <a target="_new" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>">this
        component</a> on the TopCoder Software web site.
</p>
<% } %>

<p><span class="bodySubtitle"><strong>Scorecards</strong></span><br/>
    View the <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="screening_scorecard_id"/>">screening</a> and <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewScorecard.do?method=viewScorecard&scid=<rsc:item set="<%=projectDetail%>" name="review_scorecard_id"/>">review</a> scorecards for this project.
</p>

<%-- Timeline --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Timeline</td>
    </tr>
</table>
<p>
    All submissions are required to be submitted by the Initial Submission Due Date. All questions submitted with more
    than 24 hours before the due date will be answered. Following review from the board the winning member is given
    until the Final Submission Due Date to modify their submission.</p>

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
<li>TopCoder may extend registration deadlines for any component that has insufficient participation.  This decision may be influenced by whether the members that are already signed up for the project are rated or have high reliability.  Registration deadlines become final 12 hours after they have expired.</li>
<li>TopCoder may extend submission deadlines up to 48 hours before the submission deadline if evidence suggests that the extension may be necessary for the project to be completed.</li>
<li>TopCoder may extend submission deadlines at any time if there were problems in the project that cost competitors time and therefore justify the extension.</li>
<li>TopCoder may cancel any project when there is evidence that no competitors are going to submit.  Before this, TopCoder will send a verification email to all competitors.  If no competitors reply affirmatively within 24 hours, the project will be terminated.</li>
</ul>

<%-- Payment --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Payment</td>
    </tr>
</table>
<c:choose>
    <c:when test="${paysRoyalties}">
        <p>
            TopCoder will compensate members with first and second place submissions that have scored at least
            75. First place compensation will consist of both initial payments and royalties on
            the sale of the component. The initial payment will be distributed in two installments.
            First Milestone: When the winning solution is submitted and review board suggestions are integrated.
            Second Milestone: Is marked by the completion of the development project*.</p>
        
        <p>Members will also collect royalties on the revenue generated from the sale of the component.
            The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of
            the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board
            member(s) and 25% to the Development Board member(s). Royalties may be diluted if additional work
            is done to the component, as the total work effort for the component will increase.</p>
        
        <p class="noSpListTitle"><strong>Winning Designer</strong></p>
        
        <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
            <tr>
                <td class="bodyText" nowrap="nowrap">Royalty Percentage -</td><td class="bodyText" align="right">25%</td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap" colspan="2">&#160;</td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap">Total Payment -</td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/></td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap">First Deliverable -</td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="first_payment" format="0.00"/></td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap">Project Completion - </td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="second_payment" format="0.00"/></td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        <p>
            TopCoder will compensate members with first and second place submissions that have scored at least
            75. The initial payment will be distributed in two installments.
            First Milestone: When the winning solution is submitted and review board suggestions are integrated.
            Second Milestone: Is marked by the completion of the development project*.</p>
        
        <p class="noSpListTitle"><strong>Winning Designer</strong></p>
        
        <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
            <tr>
                <td class="bodyText" nowrap="nowrap">Total Payment -</td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/></td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap">First Deliverable -</td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="first_payment" format="0.00"/></td>
            </tr>
            <tr>
                <td class="bodyText" nowrap="nowrap">Project Completion - </td><td class="bodyText" align="right">$
                <rsc:item set="<%=projectDetail%>" name="second_payment" format="0.00"/></td>
            </tr>
        </table>
    </c:otherwise>
</c:choose>


<p><strong>Second Place Designer</strong><br>
    Total Payment - $<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br>
</p>
<%-- Definition of Completion --%>
<p class="noSpListTitle"><strong>Project Completion</strong><br>
    *Completion of the project is defined as follows:</p>

<ul class="noSpList">
    <li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
    <li>The Submission has been selected by the board as the winning submission.</li>
    <li>Final payment is conditional on acceptance of the fully functional component by the Development Review
        Board.</li>
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
    <br><br>
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

<p><br></p>


</td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
<td width="180">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

</td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<%-- Gutter Ends --%>

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

