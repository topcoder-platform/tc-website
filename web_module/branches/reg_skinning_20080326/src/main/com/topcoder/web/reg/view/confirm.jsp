<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.RegistrationType" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="script.jsp"/>
    <reg_tags:style/>
</head>

<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">

    <div id="pageTitle"><div>&nbsp;</div></div>

<div id="regBcContainer">
    <div class="regBc">
        <div class="title">
            Step <strong>4</strong> of
            <c:choose>
                <c:when test="${isNewReg}">
                    <strong>6</strong>
                </c:when>
                <c:otherwise>
                    <strong>5</strong>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="off">Select Your Registration</div>

        <div class="off">General</div>

        <div class="off">Demographics</div>

        <div class="on">Confirm</div>

        <div class="off">Success</div>
        <c:if test="${isNewReg}">
            <div class="off">Activation</div>
        </c:if>
    </div>
</div>

<p align="center">
    <strong>Is this information correct?</strong>
</p>
        <c:choose>
        <c:when test="${!sessionInfo.loggedIn}">
            <div id="confirmWarning" class="error">
                WARNING: You are not registered yet.<br />You MUST click CONFIRM at the bottom of the page.
            </div>
        </c:when>
        <c:otherwise>
            <div id="confirmWarning" class="error">
                WARNING: Your profile has NOT been updated.<br />You must click CONFIRM at the bottom of the page.
            </div>
        </c:otherwise>
        </c:choose>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="post" name="confirmForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
<tbody>
<%int i = 0;%>
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field" style="width: 50%;">
            <strong>General:</strong>
        </td>
        <td class="value" style="width: 50%;">
            <strong><a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Main">edit</a></strong>
        </td>
    </tr>
    <%i++;%>

<c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
<c:if test="${cf:contains(fields, givenName)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            <span class="global">Given Name:</span><span class="justUS">First Name:</span>
        </td>
        <td class="value">
                ${regUser.firstName}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.SURNAME%>" var="surname"/>
<c:if test="${cf:contains(fields, surname)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            <span class="global">Surname:</span><span class="justUS">Last Name:</span>
        </td>
        <td class="value">
                ${regUser.lastName}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=RegistrationType.COMPETITION_ID%>" var="competition"/>
<c:set value="<%=Constants.REG_TYPES%>" var="regTypes"/>
<c:if test="${!cf:contains(requestScope[regTypes], competition)}">
    <c:set value="<%=Constants.TITLE%>" var="title"/>
    <c:if test="${cf:contains(fields, title)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                Job Title:
            </td>
            <td class="value">
                    ${regUser.contact.title}
            </td>
        </tr>
        <%i++;%>
    </c:if>

    <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
    <c:if test="${cf:contains(fields, companyName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                Company:
            </td>
            <td class="value">
                    ${regUser.contact.company.name}
            </td>
        </tr>
    </c:if>
</c:if>

<c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
<c:if test="${cf:contains(fields, address1)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Address1:
        </td>
        <td class="value">
                ${regUser.homeAddress.address1}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
<c:if test="${cf:contains(fields, address2)}">
    <%i++;%>
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Address2:
        </td>
        <td class="value">
                ${regUser.homeAddress.address2}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
<c:if test="${cf:contains(fields, address3)}">
    <%i++;%>
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Address3:
        </td>
        <td class="value">
                ${regUser.homeAddress.address3}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.CITY%>" var="city"/>
<c:if test="${cf:contains(fields, city)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            City:
        </td>
        <td class="value">
                ${regUser.homeAddress.city}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
<c:if test="${cf:contains(fields, stateCode)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            State:
        </td>
        <td class="value">
                ${regUser.homeAddress.state.name}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
<c:if test="${cf:contains(fields, postalCode)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Postal Code:
        </td>
        <td class="value">
                ${regUser.homeAddress.postalCode}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.PROVINCE%>" var="province"/>
<c:if test="${cf:contains(fields, province)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Province:
        </td>
        <td class="value">
                ${regUser.homeAddress.province}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
<c:if test="${cf:contains(fields, countryCode)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Country:
        </td>
        <td class="value">
                ${regUser.homeAddress.country.name}
        </td>
    </tr>
    <%i++;%>
</c:if>


<c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
<c:if test="${cf:contains(fields, compCountryCode)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Country to represent:
        </td>
        <td class="value">
                ${regUser.coder.compCountry.name}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
<c:if test="${cf:contains(fields, timeZone)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Timezone:
        </td>
        <td class="value">
                ${regUser.timeZone.description}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
<c:if test="${cf:contains(fields, phoneNumber)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Phone Number:
        </td>
        <td class="value">
                ${regUser.primaryPhoneNumber.number}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.EMAIL%>" var="email"/>
<c:if test="${cf:contains(fields, email)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Email Address:
        </td>
        <td class="value">
                ${regUser.primaryEmailAddress.address}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.HANDLE%>" var="handle"/>
<c:if test="${cf:contains(fields, handle)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            User Name:
        </td>
        <td class="value">
                ${regUser.handle}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.PASSWORD%>" var="password"/>
<c:if test="${cf:contains(fields, password)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Password:
        </td>
        <td class="value">
            ********
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.SECRET_QUESTION%>" var="secretQuestion"/>
<c:if test="${cf:contains(fields, secretQuestion)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Secret Question:
        </td>
        <td class="value">
                ${regUser.secretQuestion.question}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.SECRET_QUESTION_RESPONSE%>" var="secretQuestionResponse"/>
<c:if test="${cf:contains(fields, secretQuestionResponse)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Secret Question Response:
        </td>
        <td class="value">
            ********
        </td>
    </tr>
    <%i++;%>
</c:if>


<c:set value="<%=Constants.QUOTE%>" var="quote"/>
<c:if test="${cf:contains(fields, quote)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Quote:
        </td>
        <td class="value">
                ${regUser.coder.quote}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
<c:if test="${cf:contains(fields, notification)}">
    <c:forEach items="${regUser.notifications}" var="notif">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                Email Notifications:
            </td>
            <td class="value">
                    ${notif.name}
            </td>
        </tr>
    </c:forEach>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.MEMBER_CONTACT%>" var="memberContact"/>
<c:if test="${cf:contains(fields, memberContact)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Member Contact Enabled:
        </td>
        <td class="value">
            <c:if test="${regUser.memberContactEnabled}">yes</c:if>
            <c:if test="${!regUser.memberContactEnabled}">no</c:if>
        </td>
    </tr>
    <%i++;%>
</c:if>


<c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
<c:if test="${cf:contains(fields, coderType)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Coder Type:
        </td>
        <td class="value">
                ${regUser.coder.coderType.description}
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
<c:set value="<%=Constants.RESUME%>" var="resume"/>
<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
<c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
<c:set value="<%=Constants.REFERRAL%>" var="referral"/>

<c:if test="${cf:contains(fields, demogPrefix)||cf:contains(fields, resume)||(cf:contains(fields, gpa)&&cf:contains(fields, gpaScale))||cf:contains(fields, schoolName)||cf:contains(fields, referral)}">
    <%--Demographics--%>
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            <strong>Demographics:</strong>
        </td>
        <td class="value">
            <strong><a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Secondary">edit</a></strong>
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:if test="${cf:contains(fields, demogPrefix)}">


    <rt:responseIterator id="resp" collection="${regUser.transientResponses}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <rt:demographicQuestionText response="${resp}"/>
                :
            </td>
            <td class="value">
                <rt:demographicAnswerText response="${resp}"/>
            </td>
        </tr>
        <%i++;%>
    </rt:responseIterator>
</c:if>


<c:if test="${cf:contains(fields, resume)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            Resume:
        </td>
        <td class="value">
            <c:forEach items="${regUser.coder.resumes}" var="resume">
                ${resume.fileName}
            </c:forEach>
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:if test="${cf:contains(fields, gpa)&&cf:contains(fields, gpaScale)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            GPA:
        </td>
        <td class="value">
            <c:if test="${regUser.coder.currentSchool.GPA!=null&&regUser.coder.currentSchool.GPAScale!=null}">
                ${regUser.coder.currentSchool.GPA}/${regUser.coder.currentSchool.GPAScale}
            </c:if>
        </td>
    </tr>
    <%i++;%>
</c:if>

<c:if test="${cf:contains(fields, schoolName)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            School:
        </td>
        <td class="value">
            <c:choose>
                <c:when test="${regUser.coder.currentSchool!=null}">
                    ${regUser.coder.currentSchool.school.name}
                </c:when>
                <c:otherwise>
                    ${regUser.primaryTeachingSchool.school.name}
                </c:otherwise>
            </c:choose>

        </td>
    </tr>
    <%i++;%>
</c:if>

<c:if test="${cf:contains(requestScope[regTypes], competition)}">
    <c:set value="<%=Constants.TITLE%>" var="title"/>
    <c:if test="${cf:contains(fields, title)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                Title:
            </td>
            <td class="value">
                    ${regUser.contact.title}
            </td>
        </tr>
        <%i++;%>
    </c:if>

    <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
    <c:if test="${cf:contains(fields, companyName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                Company:
            </td>
            <td class="value">
                    ${regUser.contact.company.name}
            </td>
        </tr>
        <%i++;%>
    </c:if>
</c:if>


<c:if test="${cf:contains(fields, referral)}">
    <tr class="<%=(i%2==0 ? "odd" : "even")%>">
        <td class="field">
            How did you hear<br />about TopCoder?:
        </td>
        <td class="value">
                ${regUser.coder.coderReferral.referral.description} ${regUser.coder.coderReferral.referenceCoder.user.handle} ${regUser.coder.coderReferral.other}
        </td>
    </tr>
    <%i++;%>
</c:if>
</tbody>
</table>
</form>

<div align="center" id="submitContainer">
    <button onclick="document.confirmForm.submit();return false;">Confirm</button>
</div>

</div>
</div>

</body>
</html>