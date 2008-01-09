<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
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
        <jsp:param name="node" value="dev_compete"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="comp_development"/>
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
        <td class="projectTitles" nowrap="nowrap">Development Component Project -
            <rsc:item set="<%=projectDetail%>" name="component_name"/></td>
    </tr>
</table>
<%-- Register at TCS --%>
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
         <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>
         </div>
      <strong>1st Place:<br>
      2nd Place:<br>
      Due date:</strong> 
      </div>
      </td>
      <td width="40%" align="right" style="padding: 0px 5px 10px 0px;">
         <A class="bigButton" style="width: 100px;" href="/tc?module=ViewProjectRegistration&<%=Constants.PROJECT_ID%>=<%= request.getAttribute("projectId") %>">1: Register</A>
      </td>
      <td width="25%" align="right" style="padding: 0px 0px 10px 5px;">
      <A class="bigButton" style="width: 100px;" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">2: Submit</A>
      </td>
   </tr>
   <tr>
      <td colspan="3" align="center" style="padding-top:10px;">
         Register to get info necessary to submit a solution<br>
         <span class="bigRed">Registering will affect your <A class="bigRed" href="/tc?module=Static&d1=dev&d2=support&d3=devReliability">Reliability Rating</A></span>
      </td>
   </tr>
<% } %>


<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Overview</td>
    </tr>
</table>

<%-- Overview --%>

<p>
    <rsc:item set="<%=projectDetail%>" name="description"/>
</p>

<%-- Technologies --%>
<p class="noSpListTitle"><strong>Technologies</strong></p>
<ul class="noSpList">
    <rsc:iterator list="<%=technologies%>" id="item">
        <li><rsc:item row="<%=item%>" name="technology_name"/></li>
    </rsc:iterator>
</ul>

<%-- Documentation --%>
<p><strong>Documentation</strong><br/>
    Documentation / Specification available in the
    <% if (projectDetail.getItem(0, "jive_category_id").getResultData() == null) { %>
    component forums.
    <% } else { %>
    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<rsc:item set="<%=projectDetail%>" name="jive_category_id"/>">component
        forums</a>.
    <% } %>

</p>
<% if (projectDetail.getIntItem(0, "viewable") == 1) { %>
<p>
    View
    <a target="_new" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>">this
        component</a> on the TopCoder Software web site.
</p>
<% } %>

<p><strong>Requirement Specification</strong><br/>
    View the
    <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/document?id=<rsc:item set="<%=projectDetail%>" name="document_id"/>">Requirement
        Specification</a> for this component project
</p>

<%-- Time Line --%>
<p>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Timeline</td>
    </tr>
</table>
<p>
    All submissions are required to be submitted by the Initial Submission Due Date. All questions submitted with more
    than 24 hours before the due date will be answered. Following review from the board the winning member is given
    until the Final Submission Due Date to modify their submission.</p>

<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="250">
    <tr>
        <td class="bodyText">Posting Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="posting_date" format="MM.dd.yyyy"/></td>
    </tr>
    <tr>
        <td class="bodyText">Initial Submission Due Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/></td>
    </tr>
    <tr>
        <td class="bodyText">Winner Announced:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="winner_announced_date" format="MM.dd.yyyy"/></td>
    </tr>
    <tr>
        <td class="bodyText">Final Submission Due Date:</td><td class="bodyText" align="right">
        <rsc:item set="<%=projectDetail%>" name="final_submission_date" format="MM.dd.yyyy"/></td>
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
<% if (projectDetail.getIntItem(0, "root_category_id") == Constants.JAVA_CATALOG_ID || 
projectDetail.getIntItem(0, "root_category_id") == Constants.DOT_NET_CATALOG_ID ||
projectDetail.getIntItem(0, "root_category_id") == Constants.CPP_CATALOG_ID) {%>
<p>
    TopCoder will compensate members with first and second place submissions that have scored at least
    75. First place compensation will consist of both initial payments and royalties on
    the sale of the component. The initial payment will be distributed in two installments.
    First Milestone: When the winning solution is submitted and review board suggestions are integrated.
    Second Milestone: Is marked by the completion of the development project*.</p>

<p>Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per
    component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25%
    to the developer(s), 25% to the Architecture Board member(s) and 25% to the Development Board member(s). Royalties
    may be diluted if additional work is done to the component, as the total work effort for the component will
    increase.</p>

<p class="noSpListTitle"><strong>Winning Developer</strong></p>
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
</table>
<% } else { %>
<p>
    TopCoder will compensate members with first and second place submissions that have scored at least
    75. The initial payment will be distributed in two installments.
    First Milestone: When the winning solution is submitted and review board suggestions are integrated.
    Second Milestone: Is marked by the completion of the development project*.</p>

<p class="noSpListTitle"><strong>Winning Developer</strong></p>
<table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
    <tr>
        <td class="bodyText" nowrap="nowrap">Total Payment -</td><td class="bodyText" align="right">$
        <rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/></td>
    </tr>
</table>
<% } %>

<p><strong>Second Place Developer</strong><br/>
    Total Payment - <rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br/>
</p>
<%-- Definition of Completion --%>
<p class="noSpListTitle"><strong>Project Completion</strong><br/>
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

<p><br/><br/></p>

</td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
<td width="180">
    <jsp:include page="right.jsp"/>
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

