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
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td class="bodyText" width="100%">
            <img src="/i/clear.gif" alt="" width="240" height="20" border="0"/><br/>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="middle">
                    <td class="bodyText">

<%-- Title --%>
                        <h2 class="devSubhead"><strong><rsc:item set="<%=projectDetail%>" name="component_name"/>: Development</strong></h2>
                    </td>
                    <td align="right">
                        <% if (projectDetail.getIntItem(0, "status_id")==303) {%>
                            <img src="/i/development/tccc04_comp_badge.gif" alt="TCO Qualifying Project" width="145" height="46" border="0" />
                        <% } %>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
<%-- Overview --%>
                        <p><strong>Overview</strong><br />
                        <rsc:item set="<%=projectDetail%>" name="description"/>
                        </p>

<%-- Project Type --%>
                        <p><strong>Project Type</strong><br />
                        Component Development Project: Provide a complete development solution for the <strong><rsc:item set="<%=projectDetail%>" name="component_name"/></strong> component.</p>

                        <p>Please review the TopCoder Software <a href="http://www.topcoder.com/?t=development&amp;c=comp_meth" class="bodyText">Component Development Methodology</a> before you submit a solution.
                        If you're not sure what to submit, go to <a href="/?t=development&amp;c=tcs_sample_docs" class="bodyText">Documentation and Sample Submissions</a> for more information.</p>

<%-- Technologies --%>
                        <p><strong>Technologies</strong></p>
                        <ul>
                            <rsc:iterator list="<%=technologies%>" id="item">
                                <li><rsc:item row="<%=item%>" name="technology_name"/></li>
                            </rsc:iterator>
                        </ul>

<%-- Documentation --%>
                        <p><strong>Documentation</strong><br />
                                All <a target="_new" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>">documentation</a> for this project is available on the TopCoder Software web site.</p>

<%-- Payment --%>
                        <p><strong>Payment</strong><br />
                        TopCoder will compensate the member with the winning solution. Compensation will consist of both initial payments and royalties on the sale of the component. The initial payment will be distributed at the completion of the project*.</p>

                        <p>Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board member(s) and 25% to the Development Board member(s).  Royalties may be diluted if additional work is done to the component, as the total work effort for the component will increase.</p>

                        <p><strong>Winning Developer</strong><br />
                        Royalty Percentage - 25%</p>

                        <p>Total Payment - <rsc:item set="<%=projectDetail%>" name="total_payment" format="0.00"/></p>

                        <p><strong>Second Place Developer</strong><br />
                           Total Payment - <rsc:item set="<%=projectDetail%>" name="second_place_payment" format="0.00"/><br/>
                        </p>
<%-- Definition of Completion --%>
                        <p><sup>*</sup>Completion of the project is defined as follows:</p>

                        <ul>
                            <li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
                            <li>The Submission has been selected by the board as the winning submission.</li>
                            <li>Final payment is conditional on acceptance of the fully functional component by the Development Review Board.</li>
                        </ul>

<%-- Eligibility Requirements --%>
                        <p><strong>Eligibility</strong><br />
                        You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:</p>

                        <ol>
                            <li>A US Citizen </li>
                            <li>A Lawful Permanent Resident of the US</li>
                            <li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
                            <li>A Non-US Citizen working in your country of residence.</li>
                        </ol>

<%-- Time Line --%>
                        <p><strong>Time Line</strong><br/>
                        All submissions are required to be submitted by the Initial Submission Due Date.  All questions submitted prior to 6PM EDT on the Initial Submission Due Date will be answered. Following review from the board the winning member is given until the Final Submission Due Date to modify their submission.</p>

                        <p><%--Component Posting: 1.23.2003<br/>--%>
                        Posting Date: <rsc:item set="<%=projectDetail%>" name="posting_date" format="MM.dd.yyyy"/><br/>
                        Initial Submission Due Date: <rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/><br/>
                        Winner Announced: <rsc:item set="<%=projectDetail%>" name="winner_announced_date" format="MM.dd.yyyy"/><br/>
                        Final Submission Due Date: <rsc:item set="<%=projectDetail%>" name="final_submission_date" format="MM.dd.yyyy"/><br/>
                        </p>

                        <p><br /></p>

<%-- Register at TCS --%>

                        <p><strong>View the <A target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/document?id=<rsc:item set="<%=projectDetail%>" name="document_id"/>">Requirement Specification</a> for this component project</strong>
                        </p>

                        <p><strong><A href="/?t=development&amp;version=<rsc:item set="<%=projectDetail%>" name="version_id"/>&phase=<rsc:item set="<%=projectDetail%>" name="phase_id"/>&comp=<rsc:item set="<%=projectDetail%>" name="component_id"/>&c=tcs_inquire&Project=<%=response.encodeURL(projectDetail.getStringItem(0, "component_name")+" Design")%>&date=<rsc:item set="<%=projectDetail%>" name="initial_submission_date" format="MM.dd.yyyy"/>">
                                    Register</A> for this Component Project to get information necessary to submit a solution</strong>
                        </p>

                            <p><br /></p>

                            <p><strong>Upload Your Submission</strong><br/>
                            Managing your projects is now easier than ever with the Project Submit &amp; Review application. After you've inquired about a project,
                            use Project Submit &amp; Review to check timelines, submit solutions and final fixes, and review your scorecards.</p>
                            <%-- Learn more about Project Submit & Review (link to future How-to guide --%>

                           <p align="center"><strong><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Project Submit &amp; Review</A> &gt;</strong></p>
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

