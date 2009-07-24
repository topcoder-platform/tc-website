<%--
  - Author: pulky, snow01
  - Version: 1.3
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
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
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}" scope="request"/>
<jsp:include page="reviewCommonVariables.jsp"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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

                    <form action="${sessionInfo.servletPath}" method="POST" name="frmTerms">
                        <input type="hidden" name="${PROJECT_ID}" value="${param[PROJECT_ID]}"/>
                        <input type="hidden" name="${REVIEWER_TYPE_ID}" value="${param[REVIEWER_TYPE_ID]}"/>
                        <input type="hidden" name="${PRIMARY_FLAG}" value="${param[PRIMARY_FLAG]}"/>
                        <input type="hidden" name="${MODULE_KEY}" value="ProjectReviewTermsAgree"/>
                        <input type="hidden" name="${PROJECT_TYPE_ID}" value="${projectType}"/>

                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
                                    <strong>Reviewer Terms and Conditions ("Reviewer Terms")</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <tc-webtag:textArea name="${TERMS}" rows="10" cols="80" readOnly="true"
                                        styleClass="bodyText"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="errorText">
                                    <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}">${err}
                                    </tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    I Agree to the Terms and Conditions stated above&#160;
                                    <tc-webtag:chkBox name="${TERMS_AGREE}"/>
                                </td>
                            </tr>

                            <tr>
                                <td class="errorText">
                                    <img src="/i/captcha/${requestScope[CAPTCHA_FILE_NAME]}" alt="captcha image"/>

                                    <p>
                                        <a href="javascript:window.location.reload()">This image is hard to read.
                                            Show me a different one.</a>
                                    </p>
                                </td>
                            </tr>

                            <tr>
                                <td class="errorText">
                                    <tc-webtag:errorIterator id="err" name="${CAPTCHA_RESPONSE}">${err}
                                        <br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        Please enter the characters you see in the image above:
                                        <tc-webtag:textInput name="${CAPTCHA_RESPONSE}"/>
                                    </p>
                                </td>
                            </tr>


                            <tr>
                                <td align="center">
                                    <input type="submit" onClick="" name="submit" value=" Continue"/>
                                </td>
                            </tr>
                        </table>

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
