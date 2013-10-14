<%--
  - Author: TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists finished CloudSpokes challenges.
  -
--%>
<%@  page language="java"
          import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*, com.topcoder.web.tc.Constants,
          java.util.Map"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>
    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        function next() {
            var myForm = document.compListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>+parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.submit();
        }
        function previous() {
            var myForm = document.compListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value=<c:out value="${requestScope[defaults][startRank]}"/>-parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.submit();
        }
    </script>


</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="cs_past_contests"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="../../page_title.jsp" >
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="CloudSpokes Challenge List"/>
</jsp:include>
<span class="bodySubtitle">Application Statistics &gt; CloudSpokes Contests</span><br>

<form name="compListForm" action='<jsp:getProperty name="sessionInfo" property="servletPath"/>' method="get">

    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CloudSpokes"/>
    <tc-webtag:hiddenInput name="page" value="pastContests"/>

    <div class="pagingBox">
            <c:choose>
                <c:when test="${challenges != null && fn:length(challenges) > 0 && requestScope[defaults][startRank] != 0}">
                    <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                </c:when>
                <c:otherwise>
                    &lt;&lt; prev
                </c:otherwise>
            </c:choose>
        |   <c:choose>
                <c:when test="${challenges != null && fn:length(challenges) > 0}">
                    <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                </c:when>
                <c:otherwise>
                    next &gt;&gt;
                </c:otherwise>
            </c:choose>
    </div>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable" style="min-width:706px">
                    <thead>
                        <tr>
                            <th class="tableTitle" colspan="8">
                                CloudSpokes Contest Details
                            </th>
                        </tr>
                        <tr>
                            <th class="tableHeader" align="left" width="30%">Contest</th>
                            <th class="tableHeader" align="center" width="9%" >Category</th>
                            <th class="tableHeader" align="center" width="9%">Complete Date</th>
                            <th class="tableHeader" align="right" width="9%">Registrants</th>
                            <th class="tableHeader" align="right" width="9%" >Submissions</th>
                            <th class="tableHeader" align="left" width="9%">Winner</th>
                            <th class="tableHeader" align="right" width="9%">Score</th>
                            <th class="tableHeader" width="15%"></th>
                        </tr>
                    </thead>
                    <% boolean even = false; %>
                    <c:forEach var="challenge" items="${challenges}">
                        <tr>
                            <td class="<%=even?"statLt":"statDk"%>" align="left"><c:out value="${challenge.name}"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="left" style="padding-left: 20px;"><c:out value="${challenge.challengeType}"/></td>
                            <fmt:setTimeZone value="America/New_York" />
                            <td class="<%=even?"statLt":"statDk"%>" align="center">
                                <fmt:formatDate value="${challenge.endDate}" pattern="MM.dd.yyyy"/>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 30px;"><c:out value="${challenge.registrantsNumber}"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 30px;"><c:out value="${fn:length(challenge.participants)}"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="left">
                                <c:if test="${challenge.finalWinnerName != null && fn:length(challenge.finalWinnerName) > 0}">
                                    <a target="_blank" class="coderTextBlack" href="http://www.cloudspokes.com/members/${challenge.finalWinnerName}"><c:out value="${challenge.finalWinnerName}"/></a>
                                </c:if>
                            </td>
                            <td class="<%=even?"statLt":"statDk"%>" align="right"><fmt:formatNumber value="${challenge.winnerScore}" pattern="0.00"/></td>
                            <td class="<%=even?"statLt":"statDk"%>" align="center">
                                <a target="_blank" class="bcLink" href="http://www.cloudspokes.com/challenges/${challenge.challengeId}">Contest Details</a>
                            </td>
                        </tr>
                        <% even = !even;%>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>

    <div class="pagingBox">
        <c:choose>
            <c:when test="${challenges != null && fn:length(challenges) > 0 && requestScope[defaults][startRank] != 0}">
                <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
            </c:when>
            <c:otherwise>
                &lt;&lt; prev
            </c:otherwise>
        </c:choose>
        |   <c:choose>
        <c:when test="${challenges != null && fn:length(challenges) > 0}">
            <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
        </c:when>
        <c:otherwise>
            next &gt;&gt;
        </c:otherwise>
    </c:choose>
        <br>

        View &#160;
        <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
        &#160;at a time starting with &#160;
        <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
        <button name="nameSubmit" value="submit" type="submit">Go</button>
    </div>

</form>
</td>

<!-- Right Column -->
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
