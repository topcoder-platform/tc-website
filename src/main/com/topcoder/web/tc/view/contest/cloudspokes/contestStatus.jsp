<%--
  - Author: TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists in review status CloudSpokes challenges.
  -
--%>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>Contest Status</title>
    <jsp:include page="/script.jsp"/>
    <script language="JavaScript" type="text/javascript" src="/js/jquery.tablesorter.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/cloudspokes.js"></script>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>


<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="cs_contest_status"/>
            </jsp:include>
        </td>

        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="cloudspokes"/>
                <jsp:param name="title" value="Contest Status"/>
            </jsp:include>

            <table class="stat" cellpadding="0" cellspacing="0" width="100%" id="cloudSpokesContestStatus">
                <thead>
                <tr>
                    <th class="title" colspan="6">
                        CloudSpokes Contest Status
                    </th>
                </tr>
                <tr>
                    <th class="header" width="40%" align="left"><a href="javascript:;">Contest</a></th>
                    <th class="headerC" width="12%" style="text-align: center"><a href="javascript:;">Registrants</a>
                    </th>
                    <th class="headerC" width="12%" style="text-align: center"><a href="javascript:;">Submission Due
                        Date</a></th>
                    <th class="headerC" width="12%" style="text-align: center"><a href="javascript:;">Current Status</a>
                    </th>
                    <th class="headerC" width="12%" style="text-align: center"><a href="javascript:;">Winner</a></th>
                    <th class="headerC" width="12%" style="text-align: center"><a href="javascript:;">Second Place</a>
                    </th>
                </tr>
                </thead>

                <% boolean even = false; %>
                <c:forEach var="challenge" items="${challenges}">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="value" align="left"><a
                                href="http://www.cloudspokes.com/challenges/${challenge.challengeId}" target="_blank"><c:out
                                value="${challenge.name}"/></a></td>
                        <td class="valueC">
                            <a href="http://www.cloudspokes.com/challenges/${challenge.challengeId}/participants" target="_blank"><c:out
                                    value="${challenge.registrantsNumber}"/></a>
                        </td>
                        <fmt:setTimeZone value="America/New_York"/>
                        <td class="valueC" nowrap="nowrap">
                            <fmt:formatDate value="${challenge.endDate}" pattern="MM.dd.yyyy"/></td>
                        <td class="valueC">Review</td>
                        <td class="valueC" nowrap="nowrap">
                           <c:if test="${challenge.reviewPhaseWinnerName != null && fn:length(challenge.reviewPhaseWinnerName) > 0}">
                               <a target="_blank" class="coderTextBlack" href="http://www.cloudspokes.com/members/${challenge.reviewPhaseWinnerName}"><b><c:out value="${challenge.reviewPhaseWinnerName}"/></b></a>
                           </c:if>
                        </td>
                        <td class="valueC">
                            <c:if test="${challenge.reviewPhaseSecondName != null && fn:length(challenge.reviewPhaseSecondName) > 0}">
                                <a target="_blank" class="coderTextBlack" href="http://www.cloudspokes.com/members/${challenge.reviewPhaseSecondName}"><b><c:out value="${challenge.reviewPhaseSecondName}"/></b></a>
                            </c:if>
                        </td>

                    </tr>
                    <% even = !even;%>
                </c:forEach>
            </table>

            <p><br/></p>


        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="branded"/>
            </jsp:include>

        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>

