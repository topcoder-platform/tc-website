<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer projectDetail= (ResultSetContainer)request.getAttribute("projectDetail");%>
<% ResultSetContainer technologies= (ResultSetContainer)request.getAttribute("technologies");%>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center">

            <img src="/i/clear.gif" alt="" width="1" height="20" border="0"/><br/>

<%-- Title --%>
                        <% if (projectDetail.getIntItem(0, "status_id")==303) {%>
            <table cellspacing="0" class="bodyText" align="center" width="530">
                <tr>
                    <td class="bodyText" align="right"><img src="/i/development/tccc04_comp_badge.gif" alt="TCCC Qualifying Project" width="145" height="46" border="0"/></td>
                </tr>
            </table>
                        <% } %>

            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectTitles" nowrap="nowrap">Development Component Project - <rsc:item set="<%=projectDetail%>" name="component_name"/></td>
                </tr>
                <tr>
                    <td class="projectHeaders" align="left">Overview</td>
                </tr>
            </table>


            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <table border="0" cellspacing="0" cellpadding="0" align="center" width="530">
                <tr valign="top">
                    <td class="bodyText">

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
                        <p><strong>Documentation</strong><br />
                        All <a target="_new" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>">documentation</a>
                        for this project is available on the TopCoder Software web site.</p>

                        <p><strong>Requirement Specification</strong><br />
                           View the <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/document?id=<rsc:item set="<%=projectDetail%>" name="document_id"/>">Requirement Specification</a> for this component project
                            </p>

<%-- Payment --%>
            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Payment</td>
                </tr>
            </table>
                        <p>
                        TopCoder will compensate members with first and second place submissions that have scored at least
                        70. First place compensation will consist of both initial payments and royalties on
                        the sale of the component. The initial payment will be distributed in two installments.
                        First Milestone: When the winning solution is submitted and review board suggestions are integrated.
                        Second Milestone: Is marked by the completion of the development project*.</p>

                        <p>Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board member(s) and 25% to the Development Board member(s).  Royalties may be diluted if additional work is done to the component, as the total work effort for the component will increase.</p>

                        <p class="noSpListTitle"><strong>Winning Developer</strong></p>
                        <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="175">
                            <tr>
                                <td class="bodyText" nowrap="nowrap">Royalty Percentage -</td><td class="bodyText" align="right">25%</td>
                            </tr>
                            <tr>
                                <td class="bodyText" nowrap="nowrap" colspan="2">&#160;</td>
                            </tr>
                            <tr>
                                <td class="bodyText" nowrap="nowrap">Total Payment -</td><td class="bodyText" align="right">$<rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/></td>
                            </tr>
                        </table>

                        <p><strong>Second Place Developer</strong><br />
                           Total Payment - <rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br/>
                        </p>
<%-- Definition of Completion --%>
                        <p class="noSpListTitle"><strong>Project Completion</strong><br />
                        *Completion of the project is defined as follows:</p>

                        <ul class="noSpList">
                            <li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
                            <li>The Submission has been selected by the board as the winning submission.</li>
                            <li>Final payment is conditional on acceptance of the fully functional component by the Development Review Board.</li>
                        </ul>

<%-- Eligibility Requirements --%>
            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Eligibility</td>
                </tr>
            </table>
                        <p class="noSpListTitle">
                        You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:</p>

                        <ul class="noSpList">
                            <li>A US Citizen </li>
                            <li>A Lawful Permanent Resident of the US</li>
                            <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
                            <li>A Non-US resident authorized to perform services as an independent contractor.</li>
                        </ul>

<%-- Time Line --%>
            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Timeline</td>
                </tr>
            </table>
                        <p>
                        All submissions are required to be submitted by the Initial Submission Due Date.  Following review from the board the winning member is given until the Final Submission Due Date to modify their submission.</p>

                        <table class="bodyText" cellspacing="0" cellpadding="0" border="0" width="250">
                            <tr>
                                <td class="bodyText">Posting Date:</td><td class="bodyText" align="right"><rsc:item set="<%=projectDetail%>" name="posting_date" format="MM.dd.yyyy"/></td>
                            </tr>
                            <tr>
                                <td class="bodyText">Initial Submission Due Date:</td><td class="bodyText" align="right"><rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/></td>
                            </tr>
                            <tr>
                                <td class="bodyText">Winner Announced:</td><td class="bodyText" align="right"><rsc:item set="<%=projectDetail%>" name="winner_announced_date" format="MM.dd.yyyy"/></td>
                            </tr>
                            <tr>
                                <td class="bodyText">Final Submission Due Date:</td><td class="bodyText" align="right"><rsc:item set="<%=projectDetail%>" name="final_submission_date" format="MM.dd.yyyy"/></td>
                            </tr>
                        </table>
                        <br/>

<%-- Register at TCS --%>
            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Registration</td>
                </tr>
            </table>

                            <p>
                           <% if (projectDetail.getStringItem(0, "project_status").equals("closed")) { %>
                               Registration is closed.
                           <% } else { %>
                               <% if (sessionInfo.isAnonymous()) { %>
                                 Login required to register for this project.   <br/><br/>
                               <% } %>
                               <strong><A href="/?t=development&amp;version=<rsc:item set="<%=projectDetail%>" name="version_id"/>&phase=<rsc:item set="<%=projectDetail%>" name="phase_id"/>&comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>&c=tcs_inquire&Project=<%=response.encodeURL(projectDetail.getStringItem(0, "component_name")+" Development")%>&date=<rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>">
                                        Register</A> for this Component Project to get information necessary to submit a solution</strong>
                           <% } %>
                           </p>

            <table cellspacing="0" class="formFrame" align="center" width="530">
                <tr>
                    <td class="projectHeaders" align="left">Upload Your Submission</td>
                </tr>
            </table>
                            <p>
                            Managing your projects is now easier than ever with the Project Submit &amp; Review application. After you've inquired about a project,
                            use Project Submit &amp; Review to check timelines, submit solutions and final fixes, and review your scorecards.</p>
                            <%-- Learn more about Project Submit & Review (link to future How-to guide --%>

                           <p align="left"><strong><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Project Submit &amp; Review</A> &gt;</strong></p>
                    </td>
                </tr>
            </table>

            <p><br /><br /></p>

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

<jsp:include page="../foot.jsp" />

</body>

</html>

