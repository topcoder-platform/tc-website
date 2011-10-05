<%--
  - Author: pulky, FireIce
  - Version: 1.6
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows the registration terms for a specific project.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the user already agreed to.
  -
  - Version 1.4 (Configurable Contest Terms Release Assembly v2.0) changes: Replaced textarea with iframe to show
  - terms of use and also added pending terms of use list so that each terms of use can be accepted separatedly.
  -
  - Version 1.5 (Copilot Selection Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Copilot Postings.
  -
  - Version 1.6 (Content Creation Contest Online Review and TC Site Integration Assembly  1.0) changes:
  - Added support for new Content Creations.
--%>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% List questionInfo = (List) request.getAttribute("questionInfo");%>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.common.tag.AnswerInput" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Registration</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_PROJECT_TYPE"/>
<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" var="RIA_COMPONENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.COPILOT_POSTING_PROJECT_TYPE%>" var="COPILOT_POSTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=Constants.PROJECT_ID%>" var="PROJECT_ID"/>

<c:choose>
    <c:when test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
        <c:set value="ProjectRegister" var="registrationModule"/>
        <c:set value="ViewProjectRegistration" var="viewRegistrationModule"/>
    </c:when>
    <c:otherwise>
        <c:set value="Register" var="registrationModule"/>
        <c:set value="ViewRegistration" var="viewRegistrationModule"/>
    </c:otherwise>
</c:choose>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="des_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="dev_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="assembly_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="architecture_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="test_suites_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="test_scenarios_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ui_prototype_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ria_build_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="ria_component_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COPILOT_POSTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="copilots_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="content_creation_compete"/>
                    </jsp:include>
                </c:when>
            </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">

            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_design"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_suites"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_scenarios"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ui_prototype"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_build"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_component"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COPILOT_POSTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="copilot_posting"/>
                        <jsp:param name="title" value="Active Copilot Postings"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="content_creation"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
            </c:choose>

            <form action="${sessionInfo.servletPath}" method="POST" name="regForm">
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="${registrationModule}"/>

                <tc-webtag:hiddenInput name="${PROJECT_ID}"/>

                <c:choose>
                    <c:when test="${not empty terms}">
                        <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${terms.termsOfUseId}"/>
                        ${terms.title}<br/>
                        <iframe width="590" height="300" marginWidth="5"
                            src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                        </iframe>
                    </c:when>
                    <c:otherwise>
                        <table>
                            <c:if test="${not empty terms_agreed}">
                                <tr>
                                    <td>
                                        The following terms (that you already agreed to) apply to this project:
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
                            </c:if>
                            <c:choose>
                                <c:when test="${not empty terms_pending}">
                                    <tr>
                                        <td>
                                            You have the following terms pending for agreement:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <c:forEach items="${terms_pending}" var="terms_pending_item">
                                                <ul>
                                                    <li>
                                                        ${terms_pending_item.title}
                                                        <a href="/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}&tuid=${terms_pending_item.termsOfUseId}">(View and agree)</a>
                                                    </li>
                                                </ul>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            In order to register you must agree to all pending terms of use.
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
                                    <tr>
                                        <td>
                                        <tc:questionIterator list="<%=questionInfo%>" id="question">
                                            <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                                                <tr>
                                                    <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                                                        <jsp:getProperty name="question" property="text"/>
                                                        <br /><br />
                                                        <hr width="100%" size="1" noshade/>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="errorText">
                                                        <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                                            <br /></tc-webtag:errorIterator>
                                                    </td>
                                                </tr>
                                             <% boolean even = false; %>
                                                <tc:answerInput id="answerInput" question="<%=question%>">
                                                    <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                                                        <td width="100%">
                                                            <%=answerText%>
                                                        </td>
                                                        <td align="center">
                                                            <%=answerInput%>
                                                        </td>
                                                    </tr>
                                                    <% even = !even; %>
                                                </tc:answerInput>
                                            </table>
                                            <p><br /></p>
                                        </tc:questionIterator>
                                        </td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${not empty notRegistered}">
                                        <span class="errorText">
                                         Please be aware that you are NOT REGISTERED for the tournament, and registering for this contest will not register you for the tournament.  If you don't register for the tournament prior to registering for this contest, it will not count in the tournament standings even if you sign up at a later date.
                                         </span><br /><br />
                                    </c:if>
                                    <c:set var="captchaFileName" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
                                        <tr>
                                        <td class="errorText">
                                            <img src="/i/captcha/${requestScope[captchaFileName]}" alt="captcha image"/>

                                         <p>
                                             <a href="javascript:window.location.reload()">This image is hard to read. Show me a different
                                                    one.</a>
                                            </p>
                                        </td>
                                      </tr>

                                      <tr>
                                        <td class="errorText">
                                          <tc-webtag:errorIterator id="err" name="<%=Constants.CAPTCHA_RESPONSE%>">${err}
                                             <br/></tc-webtag:errorIterator>
                                        </td>
                                         </tr>
                                             <tr>
                                              <td>
                                            <p>
                                              Please enter the characters you see in the image above:
                                              <tc-webtag:textInput name="<%=Constants.CAPTCHA_RESPONSE%>"/>
                                           </p>
                                          </td>
                                        </tr>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </c:otherwise>
                </c:choose>

                <p style="width: 510px;">
                    <c:if test="${not empty terms}">
                        <c:choose>
                            <c:when test="${terms.electronicallySignable == 1}">
                                <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                                    <br /></tc-webtag:errorIterator></span>

                                    I Agree to the Terms and Conditions stated above&#160;
                                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                            </c:when>
                            <c:otherwise>
                                <jsp:include page="/terms/paper_terms.jsp">
                                    <jsp:param name="terms.url" value="terms.url"/>
                                </jsp:include>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </p>

                <p style="width: 510px;">
                    <c:choose>
                        <c:when test="${not empty terms}">
                            <table>
                            <tr>
                            <c:set value="Go back" var="returnMessage"/>
                            <c:if test="${terms.electronicallySignable == 1}">
                                <td>
                                <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Continue</a>
                                </td>
                                <c:set value="Cancel" var="returnMessage"/>
                            </c:if>
                            <td>
                            <a class="button" href="/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}" style="width:60px;">${returnMessage}</a>
                            </td>
                            </tr>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${empty terms_pending}">
                                <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Register</a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </p>

            </form>

        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>

    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
