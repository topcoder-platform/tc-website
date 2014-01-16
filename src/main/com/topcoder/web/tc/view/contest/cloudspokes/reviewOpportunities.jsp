<%--
  - Author: TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists open CloudSpokes challenge Review Opportunities.
  -
--%>
<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setLocale value="en_US"/>

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
    <jsp:param name="level1" value="cloudspokes"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td width="180">
            <!-- Left Column Begins-->
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="cs_review"/>
            </jsp:include>
            <!-- Left Column Ends -->
        </td>

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" class="bodyText">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="cloudspokes"/>
                <jsp:param name="title" value="Review Opportunities"/>
            </jsp:include>

            <span class="bigTitle">Review opportunities</span>

            <p>In the table below you will be able to see which challenges are available for review, the type of challenge,
                the current number of submissions on each, the review timeline for each, and the number of review positions
                available for each challenge. If you click on a challenge name you will be able to see all of the details
                associated with that challenge review.</p>
            <br/>
            <%-- CONTEST REVIEW AUCTIONS --%>
            <c:if test="${not empty reviews}">
                <div align="right" style="padding-top: 10px">
                    <b>Review opportunities via RSS -</b>
                    <%-- use dead link for now --%>
                    <a href="javascript:;"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
                    <br />
                </div>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">

                    <thead>
                        <tr>
                            <th class="tableTitle" colspan="8">
                                CloudSpokes Review Opportunities
                            </th>
                        </tr>
                        <tr>
                            <th class="tableHeader" align="left" width="40%">Challenge</th>
                            <th class="tableHeader" align="center" width="18%" >Submissions</th>
                            <th class="tableHeader" align="center" width="24%" >Review Start</th>
                            <th class="tableHeader" align="center" width="18%">Open Positions</th>
                        </tr>
                    </thead>

                <% boolean even = false; %>
                <c:forEach var="review" items="${reviews}">
                    <tr>

                        <td class="<%=even?"statLt":"statDk"%>" align="left">
                            <a target="_blank" href="http://www.cloudspokes.com/challenges/${review.challengeId}"><c:out value="${review.name}"/></a>
                        </td>
                        <td class="<%=even?"statLt":"statDk"%>" align="center">
                            <c:out value="${review.submissionNumber}"/>
                        </td>
                        <fmt:setTimeZone value="America/New_York" />
                        <td class="<%=even?"statLt":"statDk"%>" align="center">
                            <fmt:formatDate value="${review.reviewDate}" pattern="MM.dd.yyyy HH:mm z"/>
                        </td>

                        <td class="<%=even?"statLt":"statDk"%>" align="center"><c:out value="${review.reviewNumber}"/></td>

                    </tr>
                    <% even = !even;%>
                </c:forEach>

                </table>
            </c:if>
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
