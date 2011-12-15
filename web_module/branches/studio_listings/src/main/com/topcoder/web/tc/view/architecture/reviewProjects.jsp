<%--
  - Author: TCSDEVELOPER
  - Date: 21 Jan 2009
  - Version: 1.0
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for listing the active review projects for Architecture project type. It displays the
  - list of review projects along with project details and links for registering for reviews for desired projects.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.common.web.util.DateTime,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 java.sql.Timestamp,
                 java.util.ArrayList,
                 java.util.List" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<% ArrayList<Boolean> waitingToReview = (ArrayList<Boolean>) request.getAttribute("waitingToReview"); %>
<% ArrayList<Timestamp> waitingUntil = (ArrayList<Timestamp>) request.getAttribute("waitingUntil"); %>
<% List prices = (List) request.getAttribute("prices");%>
<% ResultSetContainer projectList = (ResultSetContainer) request.getAttribute("projectList");%>
<% int applicationDelayHours = ((Integer) request.getAttribute("applicationDelayHours")).intValue(); %>
<% int applicationDelayMinutes = ((Integer) request.getAttribute("applicationDelayMinutes")).intValue(); %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Project Review</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="architecture"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <%-- value is either des_review or dev_review --%>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="architecture_review"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" class="bodyText">
<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="architecture"/>
    <jsp:param name="title" value="Review Opportunities"/>
</jsp:include>

<span class="bigTitle">Review opportunities</span>

<p>In the table below you will be able to see which projects are available for review, the type of project, the current
    number of submissions on each, the review timeline for each, and the number of review positions available for each
    project. If you click on an architecture name you will be able to see all of the details associated with that
    architecture review.</p>

<p>If you are not currently on the TopCoder Architecture Review Board you may send an email to
    <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a> requesting permission to perform
    reviews. Please keep in mind only members that have completed architecture projects are eligible to join the
    TopCoder Architecture Review board.</p>

<p>In order to sign up for a review position, click on the "details" link for any architecture with positions available,
    and then select "Apply Now" next to the position that you would like to commit to.</p>
<br/>
<% if (projectList.getRowCount() > 0) { %>
<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                <tr>
                    <td class="tableTitle" colspan="11">Architecture Review Opportunities</td>
                </tr>
                <tr>
                    <td class="tableHeader" align="center">Type</td>
                    <td class="tableHeader" align="center">Catalog</td>
                    <td class="tableHeader" width="100%">Architecture</td>
                    <td class="tableHeader" align="right" nowrap="nowrap">Primary Reviewer<br>Payment</td>
                    <td class="tableHeader" align="right">Reviewer<br>Payment</td>
                    <td class="tableHeader" align="center">Submissions</td>
                    <td class="tableHeader" align="center">Opens<br>On</td>
                    <td class="tableHeader" align="center">Review<br>Start</td>
                    <td class="tableHeader" align="center">Review<br>End</td>
                    <td class="tableHeader" align="center">Positions<br>Available</td>
                    <td class="tableHeader">Details</td>
                </tr>

                <%-- reduce the data that has to be sent over the wire and speed this page up --%>
                <% int j = 0; %>
                <rsc:iterator list="<%=projectList%>" id="resultRow">
                    <% pageContext.setAttribute("price", prices.get(j));%>
                    <tr>
                        <td class="statDk" align="center">Architecture</td>
                        <td class="statDk" align="center">Architecture</td>
                        <td class="statDk"><a
                                href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>">
                            <rsc:item row="<%=resultRow%>" name="component_name"/>
                            <rsc:item row="<%=resultRow%>" name="version"/>
                        </a></td>
                        <td class="statDk" align="right">$
                            <tc:beanWrite name="price" property="primaryReviewCost" format="#,###.00"/>
                        </td>
                        <td class="statDk" align="right">$
                            <tc:beanWrite name="price" property="reviewCost" format="#,###.00"/>
                        </td>
                        <td class="statDk" align="center">
                            <rsc:item row="<%=resultRow%>" name="submission_count"/>
                        </td>
                        <% if (waitingToReview.get(j).booleanValue()) { %>
                        <td class="statDk" align="center" nowrap="nowrap">
                            <%= DateTime.timeStampToArbitraryString(waitingUntil.get(j), "MM.dd.yyyy'<br />'hh:mm a") %>
                        </td>
                        <% } else { %>
                        <td class="statDk" align="center"><i>open</i></td>
                        <% } %>
                        <td class="statDk" align="center">
                            <rsc:item row="<%=resultRow%>" name="review_start" format="MM.dd.yyyy"/>
                        </td>
                        <td class="statDk" align="center">
                            <rsc:item row="<%=resultRow%>" name="review_end" format="MM.dd.yyyy"/>
                        </td>
                        <td class="statDk" align="center">
                            <rsc:item row="<%=resultRow%>" name="available_spots"/>
                        </td>
                        <td class="statDk" align="left" nowrap="nowrap">
                            <a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ReviewProjectDetail&<%=Constants.PROJECT_ID%>=<rsc:item row="<%=resultRow%>" name="project_id"/>&<%=Constants.PROJECT_TYPE_ID%>=7">details</a>
                            <% if (resultRow.getIntItem("price_changes") > 0) { %> <img
                                src="/i/development/up_arrow_gr.gif" border="0" alt=""/> <% } %></td>
                    </tr>
                    <% j++; %>
                </rsc:iterator>
            </table>
        </td>
    </tr>
    <tr>
        <td class="tableHeader" align="left" nowrap="nowrap" colspan="10">
            <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>: the payment for reviewing this component has
            increased
        </td>
    </tr>
</table>
<% } %>

<% if (projectList.getRowCount() == 0) { %>
<br/>

<p align="center">Sorry, there are currently no review positions available.</p>
<br/>
<% } else { %>
<br/>
<% if (applicationDelayHours > 0 || applicationDelayMinutes > 0) { %>
<p>
    Due to your existing review commitments, review positions open for you <%= applicationDelayHours %> hours and
    <%= applicationDelayMinutes %> minutes after a project opens for review registration.
</p>
<% } %>
<br/>
<% } %>

</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
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

<jsp:include page="/foot.jsp"/>

</body>

</html>
