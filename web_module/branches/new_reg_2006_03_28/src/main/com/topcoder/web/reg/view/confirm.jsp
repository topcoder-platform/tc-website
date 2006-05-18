<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
<%@ taglib uri="reg-tags" prefix="rt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="confirmForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>


<c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
<c:if test="${cf:contains(fields, givenName)}">
    <p>
        Given Name: ${regUser.firstName}
    </p>
</c:if>

<c:set value="<%=Constants.SURNAME%>" var="surname"/>
<c:if test="${cf:contains(fields, surname)}">
    <p>
        Surname: ${regUser.lastName}
    </p>
</c:if>

<c:set value="<%=Constants.TITLE%>" var="title"/>
<c:if test="${cf:contains(fields, title)}">
    <p>
        Title: ${regUser.contact.title}
    </p>
</c:if>

<c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
<c:if test="${cf:contains(fields, companyName)}">
    <p>
        Company:${regUser.contact.company.name}
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
<c:if test="${cf:contains(fields, address1)}">
    <p>
        Address1: ${regUser.homeAddress.address1}
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
<c:if test="${cf:contains(fields, address2)}">
    <p>
        Address2: ${regUser.homeAddress.address2}
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
<c:if test="${cf:contains(fields, address3)}">
    <p>
        Address3: ${regUser.homeAddress.address3}
    </p>
</c:if>

<c:set value="<%=Constants.CITY%>" var="city"/>
<c:if test="${cf:contains(fields, city)}">
    <p>
        City: ${regUser.homeAddress.city}
    </p>
</c:if>

<c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
<c:if test="${cf:contains(fields, stateCode)}">
    <p>
        State: ${regUser.homeAddress.state.name}
    </p>
</c:if>

<c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
<c:if test="${cf:contains(fields, postalCode)}">
    <p>
        Postal Code: ${regUser.homeAddress.postalCode}
    </p>
</c:if>

<c:set value="<%=Constants.PROVINCE%>" var="province"/>
<c:if test="${cf:contains(fields, province)}">
    <p>
        Province: ${regUser.homeAddress.province}
    </p>
</c:if>

<c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
<c:if test="${cf:contains(fields, countryCode)}">
    <p>
        Country: ${regUser.homeAddress.country.name}
    </p>
</c:if>


<c:set value="<%=Constants.HANDLE%>" var="handle"/>
<c:if test="${cf:contains(fields, handle)}">
    <p>
        Handle: ${regUser.handle}
    </p>
</c:if>

<c:set value="<%=Constants.PASSWORD%>" var="password"/>
<c:if test="${cf:contains(fields, password)}">
    <p>
        Password: ********
    </p>
</c:if>

<c:set value="<%=Constants.EMAIL%>" var="email"/>
<c:if test="${cf:contains(fields, email)}">
    <p>
        Email Address: ${regUser.primaryEmailAddress.address}
    </p>
</c:if>

<c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
<c:if test="${cf:contains(fields, phoneNumber)}">
    <p>
        Phone Number: ${regUser.primaryPhoneNumber.number}
    </p>
</c:if>

<c:set value="<%=Constants.QUOTE%>" var="quote"/>
<c:if test="${cf:contains(fields, quote)}">
    <p>
        Quote: ${regUser.coder.quote}
    </p>

</c:if>

<c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
<c:if test="${cf:contains(fields, notification)}">
    <c:forEach items="${notifications}" var="notif">
        <p>${notif.name}</p>
    </c:forEach>

</c:if>


<c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
<c:if test="${cf:contains(fields, compCountryCode)}">
    <p>
        Country to represent: ${regUser.coder.compCountry.name}
    </p>
</c:if>

<c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
<c:if test="${cf:contains(fields, timeZone)}">
    <p>
        Timezone: ${regUser.timeZone.description}
    </p>
</c:if>

<c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
<c:if test="${cf:contains(fields, coderType)}">
    <p>
        Coder Type: ${regUser.coder.coderType.description}
    </p>
</c:if>

<%--Demographics--%>
<c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
<c:if test="${cf:contains(fields, demogPrefix)}">
    <rt:responseIterator id="resp" collection="${regUser.demographicResponses}">
        <p><rt:demographicQuestionText response="${resp}"/> :
            <rt:demographicAnswerText response="${resp}"/>
        </p>
    </rt:responseIterator>

</c:if>


<c:set value="<%=Constants.RESUME%>" var="resume"/>
<c:if test="${cf:contains(fields, resume)}">
    <p>
        Resume:
        <c:forEach items="${regUser.coder.resumes}" var="resume">
            ${resume.fileName}
        </c:forEach>
    </p>
</c:if>

<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
<c:if test="${cf:contains(fields, gpa)&&cf:contains(fields, gpaScale)}">
    <p>
        GPA: ${regUser.coder.currentSchool.GPA}/${regUser.coder.currentSchool.GPAScale}
    </p>
</c:if>

<c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
<c:if test="${cf:contains(fields, schoolName)}">
    <p>
        School: ${regUser.coder.currentSchool.school.name}
    </p>
</c:if>


<a href="Javascript:document.confirmForm.submit();">Submit</a>

</form>

</body>
</html>

