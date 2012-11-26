<%--
  - Author: isv, pulky, TCSASSEMBER
  - Date: 07 Jan 2009
  - Version: 1.3
  - Copyright (C) 2009 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: Displays the Terms Of User for Assembly Project Review and provides a form for the user to accept the
  - terms and submit the response to server to continue signing up for review.
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
  -
  - Version 1.2 (Configurable Contest Terms Release Assembly v2.0) changes: Replaced textarea with iframe to show
  - terms of use and also added pending terms of use list so that each terms of use can be accepted separatedly.
  -
  - Version 1.3 (TopCoder Terms of Use Management Refactoring v1.0) change:
  - Refactoring the page to displaying terms groups.
--%>
<%@ page language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%@ page import="com.topcoder.web.tc.Constants" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<%-- Variables to use JSTL --%>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>" scope="request"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>


<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="assembly"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="software_assembly"/>
        <jsp:param name="title" value="Review Opportunities"/>
    </jsp:include>

    <form action="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=ProjectReviewTermsAgree&<%=Constants.PRIMARY_FLAG%>=<%=request.getParameter(Constants.PRIMARY_FLAG)%>&<%=Constants.REVIEWER_TYPE_ID%>=<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>&<%=Constants.PROJECT_TYPE_ID%>=<%=request.getParameter(Constants.PROJECT_TYPE_ID)%>&<%=Constants.PROJECT_ID%>=<%=request.getParameter(Constants.PROJECT_ID)%>&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}" method="POST" name="frmTerms">
<%--
        <input type="hidden" name="<%=Constants.PHASE_ID%>" value="<%=request.getParameter(Constants.PHASE_ID)%>"/>
--%>

        <%@ include file="/review_board/reviewerTermsFormTable.jsp" %>

    </form>
</td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
<td width="180">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

</td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
<%-- Gutter Ends --%>

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

