<%--
  - Author: pulky, snow01, TCSASSEMBER
  - Version: 1.6
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the review terms of use corresponding to the specified project.
  - It displays the text and provides a for for the user to accept and continue registration.
  - This is an exhaustive refactor and generalization from existing reviewTerms.jsp files.
  - In this release, it will be used for Conceptualization, Specification and Application Testing project types.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Specification Review Integration 1.0) changes:
  -      * support for specification reviews was added.
  -      * code was refactored to avoid duplication.
  -
  - Version 1.4 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
  -
  - Version 1.5 (Configurable Contest Terms Release Assembly v2.0) changes: Replaced textarea with iframe to show
  - terms of use and also added pending terms of use list so that each terms of use can be accepted separatedly.
  -
  - Version 1.6 (TopCoder Terms of Use Management Refactoring v1.0) change:
  - Refactoring the page to displaying terms groups.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Variables to use JSTL --%>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="TERMS" value="<%=Constants.TERMS%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>
<jsp:include page="reviewCommonVariables.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>

    <body>
        <jsp:include page="reviewTop.jsp"/>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <%-- Left Column Begins--%>
                <jsp:include page="reviewGlobalLeft.jsp"/>
                <%-- Left Column Ends --%>

                <%-- Gutter Begins --%>
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <%-- Gutter Ends --%>

                <%-- Center Column Begins --%>
                <td width="100%" align="center">
                    <jsp:include page="reviewPageTitle.jsp"/>

                    <form action="${sessionInfo.servletPath}?${MODULE_KEY}=ProjectReviewTermsAgree&${PROJECT_TYPE_ID}=${projectType}&${PRIMARY_FLAG}=${param[PRIMARY_FLAG]}&${REVIEWER_TYPE_ID}=${param[REVIEWER_TYPE_ID]}&${PROJECT_ID}=${param[PROJECT_ID]}&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}" method="POST" name="frmTerms">
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
