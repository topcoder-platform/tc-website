<%--
  - Author: pulky
  - Version: 1.3
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows the registration terms for a specific project.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  - Version 1.3 (Configurable Contest Terms Release Assembly v1.0) changes: Added new functionality that asks for
  - several terms of use and show those the user already agreed to.
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
            </c:choose>

            <form action="${sessionInfo.servletPath}" method="POST" name="regForm">
                <c:choose>
                    <c:when test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectRegister"/>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Register"/>
                    </c:otherwise>
                </c:choose>

                <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID%>"/>
                <c:choose>
                    <c:when test="${not empty terms}">
                        <tc-webtag:hiddenInput name="<%=Constants.TERMS_OF_USE_ID%>" value="${terms.termsOfUseId}"/>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
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
                        </c:if>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${not empty terms}">
                        ${terms.title}<br/>
                        <tc-webtag:textArea name="<%=Constants.TERMS%>" text="${terms.termsText}" rows="10" cols="60"/>
                    </c:when>
                    <c:otherwise>
                        <table>
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
                                                    <c:when test="${not empty terms_agreed_item.url}">
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
                        </table>
                    </c:otherwise>
                </c:choose>

                <p style="width: 510px;">
                    <c:if test="${(pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE) and not empty notRegistered}">
                        <span class="errorText">
                         Please be aware that you are NOT REGISTERED for the tournament, and registering for this contest will not register you for the tournament.  If you don't register for the tournament prior to registering for this contest, it will not count in the tournament standings even if you sign up at a later date.
                         </span><br /><br />
                    </c:if>

                    <c:if test="${not empty terms}">
                        <c:choose>
                            <c:when test="${terms.electronicallySignable == 1}">
                                <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                                    <br /></tc-webtag:errorIterator></span>

                                    I Agree to the Terms and Conditions stated above&#160;
                                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                            </c:when>
                            <c:otherwise>
                                You cannot agree to this terms electronically. You must print the terms and send a signed
                                hard copy to TopCoder. You can get a printer friendly version
                                <a href="${terms.url}">here</a>.
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </p>

                <p style="width: 510px;">
                    <c:choose>
                        <c:when test="${not empty terms}">
                            <c:if test="${terms.electronicallySignable == 1}">
                                <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Continue</a>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Register</a>
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