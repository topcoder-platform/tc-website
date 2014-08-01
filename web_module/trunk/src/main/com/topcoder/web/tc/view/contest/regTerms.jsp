<%--
  - Author: pulky, FireIce, lmmortal, TCSASSEMBLER
  - Version: 2.0
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
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
  -
  - Version 1.7 (Add Reporting Contest Type) changes:
  - Added support for new Reporting competitions.
  -
  - Version 1.8 (TopCoder Terms of Use Management Refactoring v1.0) change:
  - Added support for the new terms of use agreement work flow (Terms Of Use Group).
  -
  - Version 1.9 (Release Assembly - TopCoder BugHunt Competition Integration) changes:
  - Added support for new Bug Hunt competitions
  -
  - Version 2.0 (Release Assembly - TC Community Site and Online Review Update for F2F and Code contest types)
  - Added support for new contest types: First2Finish and Code
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
<c:set value="<%=Constants.REPORTING_PROJECT_TYPE%>" var="REPORTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.BUG_HUNT_PROJECT_TYPE%>" var="BUG_HUNT_PROJECT_TYPE"/>
<c:set value="<%=Constants.FIRST2FINISH_PROJECT_TYPE%>" var="FIRST2FINISH_PROJECT_TYPE"/>
<c:set value="<%=Constants.CODE_PROJECT_TYPE%>" var="CODE_PROJECT_TYPE"/>
<c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="TERMS_OF_USE_ID"/>
<c:set value="<%=BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=Constants.PROJECT_ID%>" var="PROJECT_ID"/>
<c:set var="ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>
<c:set var="NON_ELEC_AGREEABLE_TERMS_TYPE_ID" value="<%=Constants.NON_ELEC_AGREEABLE_TERMS_TYPE_ID%>"/>

<c:set value="Register" var="registrationModule"/>
<c:set value="ViewRegistration" var="viewRegistrationModule"/>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<script type="text/javascript">
<!--
function togGroup(link, index) {
    var obj = document.getElementById("groupTitle" + index);
    var co = document.getElementById("group" + index);
    if (obj.className.indexOf("term_group_exp") != -1) {
        co.style.display = "none";
        obj.className = obj.className.replace("term_group_exp", "term_group_col");
    } else {
        co.style.display = "block";
        obj.className = obj.className.replace("term_group_col", "term_group_exp");
    }
    if (link.blur) link.blur();
}
function goBack() {
    var pre = '${prePendingTerms}';
    var pres = pre.split(",");
    if (pre.length > 0 && pres.length > 0) {
        var tid = pres[pres.length - 1];
        pres.splice(pres.length - 1, 1);
        pre = pres.join(",");
        location.href = '/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}&${TERMS_OF_USE_ID}=' + tid + '&<%=Constants.PRE_PENDING_TERMS%>=' + pre;
    } else {
        location.href = '/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}';
    }
}
// -->
</script>

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
                <c:when test="${pt == REPORTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="reporting_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == BUG_HUNT_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="bug_hunt_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == FIRST2FINISH_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="first2finish_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CODE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="code_compete"/>
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
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_suites"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="test_scenarios"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ui_prototype"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_build"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == RIA_COMPONENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="ria_component"/>
                        <jsp:param name="title" value="Active Challenges"/>
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
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == REPORTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="reporting"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == BUG_HUNT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="bug_hunt"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == FIRST2FINISH_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="first2finish"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == CODE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="code"/>
                        <jsp:param name="title" value="Active Challenges"/>
                    </jsp:include>
                </c:when>
            </c:choose>

            <form action="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${registrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}&<%=Constants.PRE_PENDING_TERMS%>=${prePendingTerms}" method="POST" name="regForm">
                <c:choose>
                    <c:when test="${not empty terms}">
                        <c:choose>
                            <c:when test="${empty dependenciesTermsPending}">
                                <tc-webtag:hiddenInput name="${TERMS_OF_USE_ID}" value="${terms.termsOfUseId}"/>
                                ${terms.title}<br/>
                                <iframe width="590" height="300" marginWidth="5"
                                    src="${sessionInfo.servletPath}?module=Terms&amp;${TERMS_OF_USE_ID}=${terms.termsOfUseId}">
                                </iframe>
                            </c:when>
                            <c:otherwise>
                                <table width="600px" class="leftalign">
                                <tr><td style="text-align:center;">${terms.title}</td></tr>
                                <c:if test="${not empty dependenciesTermsAgreed}">
                                <tr><td>
                                    You have the following terms (which you have agreed to) for ${terms.title}:<br/>
                                    <ul style="margin-left:40px;">
                                        <c:forEach items="${dependenciesTermsAgreed}" var="dep_terms_agreed_item">
                                            <li>
                                                ${dep_terms_agreed_item.title}
                                                <c:choose>
                                                    <c:when test="${dep_terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                        <a href="${dep_terms_agreed_item.url}">(View)</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/tc?module=Terms&tuid=${dep_terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </td></tr>
                                </c:if>
                                <c:if test="${not empty dependenciesTermsPending}">
                                <tr><td>
                                    You have the following terms pending for agreement before you can read and agree to ${terms.title}:<br/>
                                    <ul style="margin-left:40px;">
                                        <c:forEach items="${dependenciesTermsPending}" var="dep_terms_pending_item">
                                            <li>
                                                ${dep_terms_pending_item.title}
                                                <a href="/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}&tuid=${dep_terms_pending_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </td></tr>
                                </c:if>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <table class="leftalign">
                            <c:if test="${not empty terms_agreed}">
                                <tr>
                                    <td>
                                        The following terms of use apply to this project:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        You have agreed to:<br/>
                                        <c:forEach items="${terms_agreed}" var="terms_agreed_item_group">
                                        <c:forEach items="${terms_agreed_item_group}" var="terms_agreed_item">
                                            <ul>
                                                <li>
                                                    ${terms_agreed_item.title}
                                                    <c:choose>
                                                        <c:when test="${terms_agreed_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                            <a href="${terms_agreed_item.url}">(View)</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="/tc?module=Terms&tuid=${terms_agreed_item.termsOfUseId}" target="_blank">(View)</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </c:if>
                            <c:choose>
                                <c:when test="${not empty terms_group}">
                                    <tr>
                                        <td>
                                            <div class="term_title">
                                            The following groups of terms of use apply to this project.<br/>
                                            You need to agree to at least one of the groups of terms before you can register:
                                            </div>
                                        </td>
                                    </tr>
                                    <c:forEach items="${terms_group}" var="terms_group_item" varStatus="vars">
                                    <tr>
                                        <td>
                                            <div class="term_group term_group_exp" id="groupTitle${vars.index}"><a href="#" onclick="togGroup(this, ${vars.index});return false;" class="term_group_icon"></a><div class="term_group_box" style="width:430px;"><strong>Group ${vars.count}</strong></div><div style="clear:both;"></div></div>
                                            <div class="term_group_content" id="group${vars.index}">
                                            <c:if test="${terms_group_has_agreed[vars.index]}">
                                                You have agreed to:<br/>
                                                <ul>
                                                <c:forEach items="${terms_group_item}" var="tou_item">
                                                    <c:if test="${terms_status[tou_item.termsOfUseId]}">
                                                    <li>
                                                        ${tou_item.title}
                                                        <c:choose>
                                                            <c:when test="${tou_item.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                                                <a href="${tou_item.url}">(View)</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="/tc?module=Terms&tuid=${tou_item.termsOfUseId}" target="_blank">(View)</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li> 
                                                    </c:if>
                                                </c:forEach>
                                                </ul>
                                            </c:if>
                                            You have the following terms pending for agreement:
                                            <ul>
                                            <c:forEach items="${terms_group_item}" var="tou_item">
                                                <c:if test="${not terms_status[tou_item.termsOfUseId]}">
                                                    <li>
                                                        ${tou_item.title}
                                                        <a href="/tc?module=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}&tuid=${tou_item.termsOfUseId}&prePendingTerms=${prePendingTerms}">(View and agree)</a>
                                                    </li> 
                                                </c:if>
                                            </c:forEach>
                                            </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
<!--
                                    <c:if test="${not empty notRegistered}">
                                        <span class="errorText">
                                         Please be aware that you are NOT REGISTERED for the tournament, and registering for this challenge will not register you for the tournament.  If you don't register for the tournament prior to registering for this challenge, it will not count in the tournament standings even if you sign up at a later date.
                                         </span><br /><br />
                                    </c:if>
-->
                                    <c:set var="captchaFileName" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
                                        <tr>
                                        <td class="errorText">
                                            <img src="/i/captcha/${requestScope[captchaFileName]}" alt="captcha image"/>

                                         <p>
                                             <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=${viewRegistrationModule}&${PROJECT_ID}=${requestScope[defaults][PROJECT_ID]}">This image is hard to read. Show me a different
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
                    <c:if test="${not empty terms and empty dependenciesTermsPending}">
                        <c:choose>
                            <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId == ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                                    <br /></tc-webtag:errorIterator></span>

                                    I Agree to the Terms and Conditions stated above&#160;
                                    <input name="<%=Constants.TERMS_AGREE%>" type="checkbox" id="agreechk" onclick="if (this.checked) document.getElementById('conbtn').disabled = ''; else document.getElementById('conbtn').disabled = 'disabled';"/>
                            </c:when>
                            <c:when test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId == NON_ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                <jsp:include page="/terms/paper_terms.jsp">
                                    <jsp:param name="terms.url" value="terms.url"/>
                                </jsp:include>
                            </c:when>
                        </c:choose>
                    </c:if>
                </p>

                <p style="width: 510px;">
                    <c:choose>
                        <c:when test="${not empty terms and empty dependenciesTermsPending}">
                            <table>
                            <tr>
                            <c:set value="Go back" var="returnMessage"/>
                            <c:if test="${terms.agreeabilityType.termsOfUseAgreeabilityTypeId == ELEC_AGREEABLE_TERMS_TYPE_ID}">
                                <td>
                                <input id="conbtn" type="submit" onClick="" name="submit" value=" Continue" disabled/>
                                </td>
                                <c:set value="Cancel" var="returnMessage"/>
                            </c:if>
                            <td>
                            <input type="button" onClick="goBack()" name="${returnMessage}" value="${returnMessage}"/>
                            </td>
                            </tr>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${empty terms_group and empty terms}">

                                <c:choose>
                                    <c:when test="${not empty isNewStyle && isNewStyle}">

                                        <a class="btn" href="Javascript:document.regForm.submit();">Register</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Register</a>
                                    </c:otherwise>
                                </c:choose> 

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
