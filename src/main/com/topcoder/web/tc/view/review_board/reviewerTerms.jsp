<%--
  - Author: pulky
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
  - Version 1.3 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the reviewer already agreed to.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Variables to use JSTL --%>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="TERMS" value="<%=Constants.TERMS%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="TERMS_OF_USE_ID" value="<%=Constants.TERMS_OF_USE_ID%>"/>
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>"/>
<c:set var="TEST_SUITES_PROJECT_TYPE" value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>"/>
<c:set var="TEST_SCENARIOS_PROJECT_TYPE" value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>"/>
<c:set var="UI_PROTOTYPE_PROJECT_TYPE" value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" />
<c:set var="RIA_BUILD_PROJECT_TYPE" value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" />
<c:set var="RIA_COMPONENT_PROJECT_TYPE" value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" />
<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}"/>

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
        <c:choose>
            <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="conceptualization"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="specification"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="test_suites"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="test_scenarios"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ui_prototype"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ria_build"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ria_component"/>
                </jsp:include>
            </c:when>
        </c:choose>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <%-- Left Column Begins--%>
                <td width="180">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="conceptualization_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="specification_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="test_suites_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="test_scenarios_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ui_prototype_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ria_build_review"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ria_component_review"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>
                </td>
                <%-- Left Column Ends --%>

                <%-- Gutter Begins --%>
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <%-- Gutter Ends --%>

                <%-- Center Column Begins --%>
                <td width="100%" align="center">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="conceptualization"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="specification"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="test_suites"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="test_scenarios"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ui_prototype"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ria_build"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ria_component"/>
                                <jsp:param name="title" value="Review Opportunities"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>

                    <form action="${sessionInfo.servletPath}" method="POST" name="frmTerms">
                        <input type="hidden" name="${PROJECT_ID}" value="${param[PROJECT_ID]}"/>
                        <input type="hidden" name="${REVIEWER_TYPE_ID}" value="${param[REVIEWER_TYPE_ID]}"/>
                        <input type="hidden" name="${PRIMARY_FLAG}" value="${param[PRIMARY_FLAG]}"/>
                        <input type="hidden" name="${MODULE_KEY}" value="ProjectReviewTermsAgree"/>
                        <input type="hidden" name="${PROJECT_TYPE_ID}" value="${projectType}"/>

                        <c:if test="${not empty terms}">
                            <input type="hidden" name="${TERMS_OF_USE_ID}" value="${terms.termsOfUseId}"/>
                        </c:if>

                        <table border="0" cellspacing="0" cellpadding="5">
                            <c:choose>
                                <c:when test="${not empty terms}">
                                    <tr>
                                        <td>
                                            <strong>${terms.title}</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <tc-webtag:textArea name="${TERMS}" text="${terms.termsText}" rows="10"
                                                cols="80" readOnly="true" styleClass="bodyText"/>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td>
                                            The following terms (that you already agreed to) apply to this review:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:forEach items="${terms_agreed}" var="terms_agreed_item">
                                                <ul>
                                                    <li>
                                                        ${terms_agreed_item.title}
                                                        <c:choose>
                                                            <c:when test="${terms_agreed_item.electronicallySignable != 1}">
                                                                <a href="${terms_agreed_item.url}">(View)</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="/tc?module=Terms&tuid=${terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </ul>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${not empty terms}">
                                <c:choose>
                                    <c:when test="${terms.electronicallySignable == 1}">
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
                                    </c:when>
                                    <c:otherwise>
                                        You cannot agree to this terms electronically. You must print the terms and
                                        send a signed hard copy to TopCoder. You can get a printer friendly version
                                        <a href="${terms.url}">here</a>.
                                    </c:otherwise>
                                </c:choose>
                            </c:if>

                            <c:if test="${empty terms}">
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
                            </c:if>

                            <c:choose>
                                <c:when test="${not empty terms}">
                                    <c:if test="${terms.electronicallySignable == 1}">
                                        <tr>
                                            <td align="center">
                                                <input type="submit" onClick="" name="submit" value=" Continue"/>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td align="center">
                                            <input type="submit" onClick="" name="submit" value=" Register"/>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>

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
