<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.HSRegistrationHelper,
                 com.topcoder.web.common.tag.AnswerInput,
                 com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/script.jsp"/>
    <reg_tags:style/>
</head>

<body>

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="post" name="mainForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Secondary"/>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>
    
        <c:choose>
        <c:when test="${!sessionInfo.loggedIn}">
            <div id="topMessage" class="small" align="center">
                (<a href="/reg/?nrg=false">Click here</a> if you're already a registered member and would like to update
                your profile.)
            </div>
        </c:when>
        <c:otherwise>
            <div id="logoutLink" class="small" align="center">
                <a href="${sessionInfo.servletPath}?module=Logout">Log out</a>
            </div>
        </c:otherwise>
        </c:choose>
    
    <div id="regBcContainer">
        <div class="regBc">
            <div class="title">
                Step <strong>2</strong> of
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
    
            <div class="on">General</div>
    
            <div class="off">Demographics</div>
    
            <div class="off">Confirm</div>
    
            <div class="off">Success</div>
            <c:if test="${isNewReg}">
                <div class="off">Activation</div>
            </c:if>
        </div>
    </div>
    
    <div class="regSection">
        Personal Information
    </div>

    <table cellpadding="0" cellspacing="0" border="0" class="regFields">
    <tbody>
    <%int i = 0;%>
    
    <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
    <c:if test="${cf:contains(fields, givenName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, givenName)}">*</c:if>
                <span class="global">Given Name:</span><span class="justUS">First Name:</span>
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>" size="15" maxlength="<%=Constants.MAX_GIVEN_NAME_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.SURNAME%>" var="surname"/>
    <c:if test="${cf:contains(fields, surname)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, surname)}">*</c:if>
                <span class="global">Surname:</span><span class="justUS">Last Name:</span>
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.SURNAME%>" size="15" maxlength="<%=Constants.MAX_SURNAME_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.EMAIL%>" var="email"/>
    <c:if test="${cf:contains(fields, email)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, email)}">*</c:if>
                Email Address:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.EMAIL_CONFIRM%>" var="emailConfirm"/>
    <c:if test="${cf:contains(fields, emailConfirm)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, emailConfirm)}">*</c:if>
                Confirm Email Address:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
    <c:if test="${cf:contains(fields, companyName)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, companyName)}">*</c:if>
                Company:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.TITLE%>" var="title"/>
    <c:if test="${cf:contains(fields, title)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, title)}">*</c:if>
                Job Title:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.TITLE%>" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
    <c:if test="${cf:contains(fields, address1)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, address1)}">*</c:if>
                Address1:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
    <c:if test="${cf:contains(fields, address2)}">
        <%i++;%>
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, address2)}">*</c:if>
                Address2:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
    <c:if test="${cf:contains(fields, address3)}">
        <%i++;%>
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, address3)}">*</c:if>
                Address3:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.CITY%>" var="city"/>
    <c:if test="${cf:contains(fields, city)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, city)}">*</c:if>
                City:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.STATE_CODE%>" var="stateCode"/>
    <c:if test="${cf:contains(fields, stateCode)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, stateCode)}">*</c:if>
                State (US Only):
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.STATE_CODE%>" size="2" maxlength="2" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
    <c:if test="${cf:contains(fields, postalCode)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, postalCode)}">*</c:if>
                Postal Code:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" size="15" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.PROVINCE%>" var="province"/>
    <c:if test="${cf:contains(fields, province)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, province)}">*</c:if>
                Province:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.COUNTRY_CODE%>" var="countryCode"/>
    <c:if test="${cf:contains(fields, countryCode)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, countryCode)}">*</c:if>
                Country:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name="${countryCode}" list="${countries}" valueField="code" textField="name"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>

    <c:set value="<%=Constants.COMP_COUNTRY_CODE%>" var="compCountryCode"/>
    <c:if test="${cf:contains(fields, compCountryCode)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.COMP_COUNTRY_CODE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, compCountryCode)}">*</c:if>
                Country to represent:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name="${compCountryCode}" list="${countries}" valueField="code" textField="name"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.TIMEZONE%>" var="timeZone"/>
    <c:if test="${cf:contains(fields, timeZone)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.TIMEZONE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, timeZone)}">*</c:if>
                Timezone:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name="${timeZone}" list="${timeZones}" valueField="id" textField="description"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
    <c:if test="${cf:contains(fields, phoneNumber)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, phoneNumber)}">*</c:if>
                Phone Number:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" size="15" maxlength="<%=Constants.MAX_PHONE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    </tbody>
    </table>

    <div class="regSection">
        Create Your TopCoder Account
    </div>

    <table cellpadding="0" cellspacing="0" border="0" class="regFields">
    <tbody>
    <% i = 0;%>

    <c:set value="<%=Constants.HANDLE%>" var="handle"/>
    <c:if test="${cf:contains(fields, handle)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, handle)}">*</c:if>
                User Name:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="${isNewReg}"/>
                <c:if test="${isNewReg}">
                    <br />
                <div id="handleWarning" class="small">
                    Please choose carefully.   Your handle can <b>not</b> be changed, and it is a violation of our
                    terms of use to create more than one account.
                </div>
                </c:if>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.PASSWORD%>" var="password"/>
    <c:if test="${cf:contains(fields, password)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, password)}">*</c:if>
                Password:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.PASSWORD_CONFIRM%>" var="passwordConfirm"/>
    <c:if test="${cf:contains(fields, passwordConfirm)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, passwordConfirm)}">*</c:if>
                Confirm Password:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>

    <c:set value="<%=Constants.SECRET_QUESTION%>" var="secretQuestion"/>
    <c:if test="${cf:contains(fields, secretQuestion)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, secretQuestion)}">*</c:if>
                Secret Question:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.SECRET_QUESTION%>" size="30" editable="true"/>
                <br />
            <div id="secretWarning" class="small">
                If you ever forget your password and you do not have access to the email address in our system,
                you will be asked to answer this question in order to reset your password.
            </div>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.SECRET_QUESTION_RESPONSE%>" var="secretQuestionResponse"/>
    <c:if test="${cf:contains(fields, secretQuestionResponse)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.SECRET_QUESTION_RESPONSE%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, secretQuestionResponse)}">*</c:if>
                Secret Question Response:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.SECRET_QUESTION_RESPONSE%>" size="15" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    
    <c:set value="<%=Constants.NOTIFICATION%>" var="notification"/>
    <c:if test="${cf:contains(fields, notification)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.NOTIFICATION%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, notification)}">*</c:if>
                Email Notifications:
            </td>
            <td class="value">
                <c:forEach items="${notifications}" var="notif">
                    <tc-webtag:chkBox name="${notification}${notif.id}"/>
                    <c:out value="${notif.name}"/>
                    <br />
                </c:forEach>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.MEMBER_CONTACT%>" var="memberContact"/>
    <c:if test="${cf:contains(fields, memberContact)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.MEMBER_CONTACT%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, memberContact)}">*</c:if>
                Enable Member Contact:
            </td>
            <td class="value">
                <tc-webtag:radioButton name="<%=Constants.MEMBER_CONTACT%>" value="yes"/>
                Yes
                <br />
                <tc-webtag:radioButton name="<%=Constants.MEMBER_CONTACT%>" value="no"/>
                No
                <br />
                <c:if test="${not isNewReg}">
                    To block specific TopCoder members from contacting you, go to the
                    <a target="blackListWindow" href='/tc?module=BlackList'>black list</a> page.
                </c:if>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.SHOW_EARNINGS%>" var="showEarnings"/>
    <c:if test="${cf:contains(fields, showEarnings)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.SHOW_EARNINGS%>"><%=err%><br />
            </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, memberContact)}">*</c:if>
                Show / hide earnings:
            </td>
            <td class="value">
                <tc-webtag:radioButton name="<%=Constants.SHOW_EARNINGS%>" value="show"/>
                Show
                <br />
                <tc-webtag:radioButton name="<%=Constants.SHOW_EARNINGS%>" value="hide"/>
                Hide
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    
<c:set value="<%=Constants.HS_REG_QUESTIONS%>" var="hsRegQuestions"/>
<c:if test="${cf:contains(fields, hsRegQuestions)}">
    <c:set var="ansPrefix" value="<%=AnswerInput.PREFIX%>"/>
    <c:set var="kwdDOB" value="<%=HSRegistrationHelper.DOB%>"/>
    <tc:questionIterator list="${questions}" id="question">
        <c:set var="fieldName" value="${ansPrefix}${question.id}"/>
        <tr>
            <td colspan="2"><span class="bigRed">
		       <tc-webtag:errorIterator id="err" name="${fieldName}"><%=err%><br>
               </tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="name">
                * ${question.text }
            </td>
            <td class="value">
                <c:choose>
                    <c:when test="${question.keyword == kwdDOB}">
                        <tc-webtag:textInput size="10" maxlength="10" name="${fieldName}" id="answerInput" editable="true"/> <em>** Your date of birth will only be used for eligibility purposes **</em>
                    </c:when>
                    <c:otherwise>
                        <tc:answerInput id="answerInput" question="${question}">
                            ${answerInput}
                            <%=answerText%>
                            &nbsp;&nbsp;&nbsp;
                        </tc:answerInput>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>


    </tc:questionIterator>

</c:if>
    
    <c:set value="<%=Constants.QUOTE%>" var="quote"/>
    <c:if test="${cf:contains(fields, quote)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"><%=err%><br /></tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, quote)}">*</c:if>
                Quote:
            </td>
            <td class="value">
                <tc-webtag:textInput name="<%=Constants.QUOTE%>" size="50" maxlength="<%=Constants.MAX_QUOTE_LENGTH%>" editable="true"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    <c:set value="<%=Constants.PHOTO%>" var="photo"/>
    <c:if test="${cf:contains(fields, photo)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, photo)}">*</c:if>
                Member Photo:
            </td>
            <td class="value">
                <a href="mailto:memberphotos@topcoder.com?subject=${regUser.activationCode}%20|%20[%20${sessionInfo.handle}%20]%20|%20${sessionInfo.userId}%20<c:if test="${regUser.coder.memberPhoto!=null}">RE</c:if>SUBMIT%20IMAGE:%20PLEASE%20DO%20NOT%20CHANGE%20SUBJECT">
                    Click here to
                    <c:if test="${regUser.coder.memberPhoto!=null}">re</c:if>
                    submit your photo</a>
                <br />
             <span class="small">Let other TopCoder Members know what you look like. Send us a head shot that is at least 200 pixels (3 inches) across.
             <a href="JavaScript:void window.open('/tc?module=Static&d1=member_photos&d2=index','Photo_Info','top=2,left=2,resizable=yes,width=600,height=700,status=0');" class="statTextBig">Click
                 here</a>
             for more info about member photos.</span>
            </td>
        </tr>
        <%i++;%>
    </c:if>
    
    
    <c:set value="<%=Constants.CODER_TYPE%>" var="coderType"/>
    <c:if test="${cf:contains(fields, coderType)}">
        <tr class="<%=(i%2==0 ? "odd" : "even")%> error">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%><br />
                </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr class="<%=(i%2==0 ? "odd" : "even")%>">
            <td class="field">
                <c:if test="${cf:contains(reqFields, coderType)}">*</c:if>
                Student/Professional:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name="${coderType}" list="${coderTypes}" valueField="id" textField="description"/>
            </td>
        </tr>
        <%i++;%>
    </c:if>

    </tbody>
    </table>

    <div align="center" id="legend">
        * = required
    </div>

    <c:if test="${!cf:contains(regUser.terms, regTerms)}">
        <p>
            <strong>Terms of Use</strong>
        </p>
        <c:set value="<%=Constants.TERMS_OF_USE_ID%>" var="termsId"/>
        <iframe src="/tc?<%=Constants.MODULE_KEY%>=Terms&amp;${termsId}=<%=Constants.REG_TERMS_ID%>"></iframe>
        <div align="center">
            <div class="error">
                <tc-webtag:errorIterator id="err" name="${termsId}">${err}</tc-webtag:errorIterator>
            </div>
            <input type="checkbox" name="${termsId}"/>I agree
        </div>
    </c:if>

    <div align="center" id="submitContainer">
        <button onclick="document.mainForm.submit();return false;">Submit</button>
    </div>
    
    </div>
</div>
</form>
    

</body>
</html>