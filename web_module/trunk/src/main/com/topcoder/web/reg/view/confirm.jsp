<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="/"><img src="http://www.topcoder.com/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
<div style="padding: 0px 0px 10px 0px; width: 600px; text-align: left;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="registration_w"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div id="regBcContainer">
    <div class="regBc">
         <div class="title">
             <c:if test="${sessionInfo.loggedIn}">
                 <div style="float:left;"><A href="${sessionInfo.servletPath}?module=Logout" class="small">logout</A></div>
             </c:if>
         Step <strong>4</strong> of
<%--- IF NEW REG -----%>
         <strong>6</strong>
<%--- ELSE -----%>
         <strong>5</strong>
<%---------------------%>
         </div>
        <div class="off">Select Your Registration</div>
        <div class="off">General</div>
        <div class="off">Demographics</div>
        <div class="on">Confirm</div>
        <div class="off">Success</div>
<%--- IF REGISTERING -----%>
         <div class="off">Activation</div>
<%---------------------%>
    </div>
</div>

<div style="width:400px;">
    <strong>Is this information correct?</strong>
    <br><br>
    <span class="bigRed">NOTE: You have not updated your information yet. You MUST click CONFIRM at the bottom of this page to complete registration.</span>
    <br><br>
</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="confirmForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>

<table cellpadding="0" cellspacing="0" border="0" class="regFields">


<tr>
    <td class="name">
        <strong>General:</strong>
    </td>
    <td class="value">
        <strong><a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Main">edit</A></strong>
    </td>
</tr>

<c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
<c:if test="${cf:contains(fields, givenName)}">
    <tr>
        <td class="name">
            Given Name:
        </td>
        <td class="value">
                ${regUser.firstName}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.SURNAME%>" var="surname"/>
<c:if test="${cf:contains(fields, surname)}">
    <tr>
        <td class="name">
            Surname:
        </td>
        <td class="value">
                ${regUser.lastName}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.TITLE%>" var="title"/>
<c:if test="${cf:contains(fields, title)}">
    <tr>
        <td class="name">
            Title:
        </td>
        <td class="value">
                ${regUser.contact.title}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
<c:if test="${cf:contains(fields, companyName)}">
    <tr>
        <td class="name">
            Company:
        </td>
        <td class="value">
                ${regUser.contact.company.name}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
<c:if test="${cf:contains(fields, address1)}">
    <tr>
        <td class="name">
            Address1:
        </td>
        <td class="value">
                ${regUser.homeAddress.address1}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
<c:if test="${cf:contains(fields, address2)}">
    <tr>
        <td class="name">
            Address2:
        </td>
        <td class="value">
                ${regUser.homeAddress.address2}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
<c:if test="${cf:contains(fields, address3)}">
    <tr>
        <td class="name">
            Address3:
        </td>
        <td class="value">
                ${regUser.homeAddress.address3}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.CITY%>" var="city"/>
<c:if test="${cf:contains(fields, city)}">
    <tr>
        <td class="name">
            City:
        </td>
        <td class="value">
                ${regUser.homeAddress.city}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
<c:if test="${cf:contains(fields, stateCode)}">
    <tr>
        <td class="name">
            State:
        </td>
        <td class="value">
                ${regUser.homeAddress.state.name}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
<c:if test="${cf:contains(fields, postalCode)}">
    <tr>
        <td class="name">
            Postal Code:
        </td>
        <td class="value">
                ${regUser.homeAddress.postalCode}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PROVINCE%>" var="province"/>
<c:if test="${cf:contains(fields, province)}">
    <tr>
        <td class="name">
            Province:
        </td>
        <td class="value">
                ${regUser.homeAddress.province}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
<c:if test="${cf:contains(fields, countryCode)}">
    <tr>
        <td class="name">
            Country:
        </td>
        <td class="value">
                ${regUser.homeAddress.country.name}
        </td>
    </tr>
</c:if>


<c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
<c:if test="${cf:contains(fields, compCountryCode)}">
    <tr>
        <td class="name">
            Country to represent:
        </td>
        <td class="value">
                ${regUser.coder.compCountry.name}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
<c:if test="${cf:contains(fields, timeZone)}">
    <tr>
        <td class="name">
            Timezone:
        </td>
        <td class="value">
                ${regUser.timeZone.description}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
<c:if test="${cf:contains(fields, phoneNumber)}">
    <tr>
        <td class="name">
            Phone Number:
        </td>
        <td class="value">
                ${regUser.primaryPhoneNumber.number}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.EMAIL%>" var="email"/>
<c:if test="${cf:contains(fields, email)}">
    <tr>
        <td class="name">
            Email Address:
        </td>
        <td class="value">
                ${regUser.primaryEmailAddress.address}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.HANDLE%>" var="handle"/>
<c:if test="${cf:contains(fields, handle)}">
    <tr>
        <td class="name">
            User Name:
        </td>
        <td class="value">
                ${regUser.handle}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.PASSWORD%>" var="password"/>
<c:if test="${cf:contains(fields, password)}">
    <tr>
        <td class="name">
            Password:
        </td>
        <td class="value">
            ********
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.QUOTE%>" var="quote"/>
<c:if test="${cf:contains(fields, quote)}">
    <tr>
        <td class="name">
            Quote:
        </td>
        <td class="value">
                ${regUser.coder.quote}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
<c:if test="${cf:contains(fields, notification)}">
    <c:forEach items="${regUser.notifications}" var="notif">
        <tr>
            <td class="name">
                Email Notifications:
            </td>
            <td class="value">
                    ${notif.name}
            </td>
        </tr>
    </c:forEach>
</c:if>


<c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
<c:if test="${cf:contains(fields, coderType)}">
    <tr>
        <td class="name">
            Coder Type:
        </td>
        <td class="value">
                ${regUser.coder.coderType.description}
        </td>
    </tr>
</c:if>

<c:set value="<%=Constants.DEMOG_PREFIX%>" var="demogPrefix"/>
<c:set value="<%=Constants.RESUME%>" var="resume"/>
<c:set value="<%=Constants.GPA%>" var="gpa"/>
<c:set value="<%=Constants.GPA_SCALE%>" var="gpaScale"/>
<c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>

<c:if test="${cf:contains(fields, demogPrefix)||cf:contains(fields, resume)||(cf:contains(fields, gpa)&&cf:contains(fields, gpaScale))||cf:contains(fields, schoolName)}">
    <%--Demographics--%>
    <tr>
        <td class="name">
            <strong>Demographics:</strong>
        </td>
        <td class="value">
            <strong><a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=Secondary">edit</A>
            </strong>
        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(fields, demogPrefix)}">


    <rt:responseIterator id="resp" collection="${regUser.transientResponses}">
        <tr>
            <td class="name"><rt:demographicQuestionText response="${resp}"/>:
            </td>
            <td class="value">
                <rt:demographicAnswerText response="${resp}"/>
            </td>
        </tr>
    </rt:responseIterator>
</c:if>


<c:if test="${cf:contains(fields, resume)}">
    <tr>
        <td class="name">
            Resume:
        </td>
        <td class="value">
            <c:forEach items="${regUser.coder.resumes}" var="resume">
                ${resume.fileName}
            </c:forEach>
        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(fields, gpa)&&cf:contains(fields, gpaScale)}">
    <tr>
        <td class="name">
            GPA:
        </td>
        <td class="value">
            <c:if test="${regUser.coder.currentSchool.GPA!=null&&regUser.coder.currentSchool.GPAScale!=null}">
                ${regUser.coder.currentSchool.GPA}/${regUser.coder.currentSchool.GPAScale}
            </c:if>
        </td>
    </tr>
</c:if>

<c:if test="${cf:contains(fields, schoolName)}">
    <tr>
        <td class="name">
            School:
        </td>
        <td class="value">
                ${regUser.coder.currentSchool.school.name}
        </td>
    </tr>
</c:if>

</table>
</form>

<br><br>

<div align="center">
    <a href="Javascript:document.confirmForm.submit();">Confirm</a>
</div>

</div>
</div>
<br><br>

</body>
</html>

