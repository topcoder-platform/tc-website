<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - ToDo: fix this paragraph, remove Constants.XXX, improve identation, change rsc to jstl
  - Description: This is the page for listing the active review projects for Specification project type. It displays the
  - list of review projects along with project details and links for registering for reviews for desired projects.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer, com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% ResultSetContainer projectList = (ResultSetContainer) request.getAttribute("projectList");%>

<%-- Constants setup to use JSTL --%>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>

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
        <%-- ToDo: check --%>
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="specification"/>
        </jsp:include>
        
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins-->
                <td width="180">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="specification_review"/>
                    </jsp:include>
                </td>
                <!-- Left Column Ends -->
                
                <!-- Gutter Begins -->
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <!-- Gutter Ends -->
                
                <!-- Center Column Begins -->
                <td width="100%" class="bodyText">
                <jsp:include page="/page_title.jsp">
                    <jsp:param name="image" value="specification"/>
                    <jsp:param name="title" value="Review Opportunities"/>
                </jsp:include>
                
                <span class="bigTitle">Review opportunities</span>
                
                <p>In the table below you will be able to see which projects are available for review, the type of 
                    project, the current number of submissions on each, the review timeline for each, and the number 
                    of review positions available for each project. If you click on an specification name you will be
                    able to see all of the details associated with that specification review.</p>
                <p>If you are not currently on the TopCoder Specification Review Board you may send an email to
                    <a href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a> requesting permission
                    to perform reviews. Please keep in mind only members that have completed specification projects are
                    eligible to join the TopCoder Specification Review board.</p>
                
                <p>In order to sign up for a review position, click on the "details" link for any specification with 
                    positions available,and then select "Apply Now" next to the position that you would like to commit
                    to.</p>
                <br/>
                <c:choose>
                	<c:when test="${fn:length(projectList) > 0}">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                                        <tr>
                                            <td class="tableTitle" colspan="11">Specification Review Opportunities</td>
                                        </tr>
                                        <tr>
                                            <td class="tableHeader" align="center">Type</td>
                                            <td class="tableHeader" align="center">Catalog</td>
                                            <td class="tableHeader" width="100%">Specification</td>
                                            <td class="tableHeader" align="right" nowrap="nowrap">
                                                Primary Reviewer<br>Payment
                                            </td>
                                            <td class="tableHeader" align="right">Reviewer<br>Payment</td>
                                            <td class="tableHeader" align="center">Submissions</td>
                                            <td class="tableHeader" align="center">Opens<br>On</td>
                                            <td class="tableHeader" align="center">Review<br>Start</td>
                                            <td class="tableHeader" align="center">Review<br>End</td>
                                            <td class="tableHeader" align="center">Positions<br>Available</td>
                                            <td class="tableHeader">Details</td>
                                        </tr>
                        
                                        <c:set var="i" value="0"/>
                                        <rsc:iterator list="<%=projectList%>" id="resultRow">
                                            <tr>
                                                <%-- ToDo: check --%>
                                                <td class="statDk" align="center">Specification</td>
                                                <td class="statDk" align="center">Specification</td>
                                                <td class="statDk">
                                                    <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectDetail&
                                                        ${PROJECT_ID}=<rsc:item row="<%=resultRow%>" name="project_id"/>">
                                                    <rsc:item row="<%=resultRow%>" name="component_name"/>
                                                    <rsc:item row="<%=resultRow%>" name="version"/>
                                                </a></td>
                                                <td class="statDk" align="right">
                                                    $ <fmt:formatNumber 
                                                        value="${prices[i].primaryReviewPrice}" pattern="#,###.00"/>
                                                </td>
                                                <td class="statDk" align="right">
                                                    $ <fmt:formatNumber 
                                                        value="${prices[i].reviewPrice}" pattern="#,###.00"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <rsc:item row="<%=resultRow%>" name="submission_count"/>
                                                </td>
                                                <c:choose>
                                                    <c:when test="${waitingToReview[i]}">
                                                        <td class="statDk" align="center" nowrap="nowrap">
                                                            <fmt:formatDate value="${waitingUntil[i]}" 
                                                                pattern="MM.dd.yyyy'<br />'hh:mm a"/>
                                                        </td>
                                                    </c:when>
                                                    <c:otherwise>
                                                            <td class="statDk" align="center"><i>open</i></td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td class="statDk" align="center">
                                                    <rsc:item row="<%=resultRow%>" name="review_start" 
                                                        format="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <rsc:item row="<%=resultRow%>" name="review_end" 
                                                        format="MM.dd.yyyy"/>
                                                </td>
                                                <td class="statDk" align="center">
                                                    <rsc:item row="<%=resultRow%>" name="available_spots"/>
                                                </td>
                                                <td class="statDk" align="left" nowrap="nowrap">
                                                    <a href="${sessionInfo.servletPath}?${MODULE_KEY}=ReviewProjectDetail&
                                                        ${PROJECT_ID}=<rsc:item row="<%=resultRow%>" name="project_id"/>&
                                                            ${PROJECT_TYPE_ID}=${requestScope[PROJECT_TYPE_ID]}">
                                                        details
                                                    </a>
                                                    <% if (resultRow.getIntItem("price_changes") > 0) { %> <img
                                                        src="/i/development/up_arrow_gr.gif" border="0" alt=""/> 
                                                    <% } %>
                                                </td>
                                            </tr>
                                            <c:set var="i" value="${i + 1}"/>
                                        </rsc:iterator>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="tableHeader" align="left" nowrap="nowrap" colspan="10">
                                    <img src="/i/development/up_arrow_gr.gif" border="0" alt=""/>: the payment for 
                                    reviewing this component has increased
                                </td>
                            </tr>
                        </table>
                        <br/>
                        <c:if test="${applicationDelayHours > 0 || applicationDelayMinutes > 0}">
                            <p>
                                Due to your existing review commitments, review positions open for you 
                                ${applicationDelayHours} hours and ${applicationDelayMinutes} minutes after a project 
                                opens for review registration.
                            </p>
                        </c:if>
                        <br/>
                    </c:when>
                    <c:otherwise>
                        <br/>
                        <p align="center">Sorry, there are currently no review positions available.</p>
                        <br/>
                    </c:otherwise>
                </c:choose>
                
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
