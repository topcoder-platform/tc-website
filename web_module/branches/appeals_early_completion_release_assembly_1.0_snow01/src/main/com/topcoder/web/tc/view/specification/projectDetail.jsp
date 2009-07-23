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
<% ResultSetContainer projectDetail = (ResultSetContainer) request.getAttribute("projectDetail");%>
<% ResultSetContainer technologies = (ResultSetContainer) request.getAttribute("technologies");%>
<head>
<title>TopCoder Specification Competitions</title>

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
      <jsp:param name="node" value="specification_compete"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
<jsp:param name="image" value="specification"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<%-- Title --%>

<table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
<tr valign="top">
<td class="bodyText">

<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectTitles" nowrap="nowrap">Specification Project -
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
         <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>
         </div>
      <strong>First place:<br>
      Second place:<br>
      Due date:</strong> 
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
<p><strong>Documentation</strong><br>
    Documentation available in the

    <% if (projectDetail.getItem(0, "jive_category_id").getResultData() == null) { %>
    discussion forums
    <% } else { %>
    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<rsc:item set="<%=projectDetail%>" name="jive_category_id"/>">forums</a>
    <% } %>
    after you successfully register for this competition.
</p>

<p>
<div align="right"><a href="/wiki/display/tc/Software+Specification+How+To"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a></div>
</p>


<%-- Timeline --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Timeline</td>
    </tr>
</table>
<p>
    All submissions are required to be submitted by the Initial Submission Due Date.</p>

<p>
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

<%-- Payment --%>
<table cellspacing="0" class="formFrame" align="center" width="530">
    <tr>
        <td class="projectHeaders" align="left">Payment</td>
    </tr>
</table>
<p>
TopCoder will compensate competitors with first and second place submissions. 
Initial payment for the winning submission will be distributed in two installments. 
First Milestone: When the winning solution is submitted and review board suggestions are integrated. 
Second Milestone: Marked by the completion of the Deployment phase of the project.</p>

<p><strong>Winning submission</strong><br>
    Total Payment - $<rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/><br>
</p>

<p><strong>Second Place submission</strong><br>
    Total Payment - $<rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br>
</p>


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

