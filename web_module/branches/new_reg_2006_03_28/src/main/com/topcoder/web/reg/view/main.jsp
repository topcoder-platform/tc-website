<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
</head>

<body>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="mainForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Secondary"/>


<c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
<c:if test="${cf:contains(fields, givenName)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Given Name: <tc-webtag:textInput name="gn" size="15" maxlength="15" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.SURNAME%>" var="surname"/>
<c:if test="${cf:contains(fields, surname)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Surname:
        <tc-webtag:textInput name="<%=Constants.SURNAME%>" size="15" maxlength="<%=Constants.MAX_SURNAME_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.TITLE%>" var="title"/>
<c:if test="${cf:contains(fields, title)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Title:
        <tc-webtag:textInput name="<%=Constants.TITLE%>" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.COMPANY_NAME%>" var="companyName"/>
<c:if test="${cf:contains(fields, companyName)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Company:
        <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS1%>" var="address1"/>
<c:if test="${cf:contains(fields, address1)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Address1:
        <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS2%>" var="address2"/>
<c:if test="${cf:contains(fields, address2)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Address2:
        <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.ADDRESS3%>" var="address3"/>
<c:if test="${cf:contains(fields, address3)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Address3:
        <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.CITY%>" var="city"/>
<c:if test="${cf:contains(fields, city)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        City:
        <tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/>
    </p>
</c:if>

<%--todo state goes in here--%>
<c:set value="<%=Constants.POSTAL_CODE%>" var="postalCode"/>
<c:if test="${cf:contains(fields, postalCode)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Postal Code:
        <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" size="15" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.PROVINCE%>" var="province"/>
<c:if test="${cf:contains(fields, province)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Province:
        <tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/>
    </p>
</c:if>

<%--todo put country here --%>
<c:set value="<%=Constants.HANDLE%>" var="handle"/>
<c:if test="${cf:contains(fields, handle)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Handle:
        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.PASSWORD%>" var="password"/>
<c:if test="${cf:contains(fields, password)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Password:
        <tc-webtag:textInput name="<%=Constants.PASSWORD%>" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.PASSWORD_CONFIRM%>" var="passwordConfirm"/>
<c:if test="${cf:contains(fields, passwordConfirm)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Confirm Password:
        <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.EMAIL%>" var="email"/>
<c:if test="${cf:contains(fields, email)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Email Address:
        <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.EMAIL_CONFIRM%>" var="emailConfirm"/>
<c:if test="${cf:contains(fields, emailConfirm)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Confirm Email Address:
        <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.PHONE_NUMBER%>" var="phoneNumber"/>
<c:if test="${cf:contains(fields, phoneNumber)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Phone Number:
        <tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" size="15" maxlength="<%=Constants.MAX_PHONE_LENGTH%>" editable="true"/>
    </p>
</c:if>

<c:set value="<%=Constants.QUOTE%>" var="quote"/>
<c:if test="${cf:contains(fields, quote)}">
    <p>
        <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"><%=err%><br/></tc-webtag:errorIterator>
    </p>

    <p>
        Quote:
        <tc-webtag:textInput name="<%=Constants.QUOTE%>" size="15" maxlength="<%=Constants.MAX_QUOTE_LENGTH%>" editable="true"/>
    </p>

</c:if>

<%--todo put in the notifications here --%>

<%--todo put in the comp country code here --%>

<%--todo put in the coder type choice here --%>

<%-- todo put in the timezone drop down here --%>


<a href="Javascript:document.mainForm.submit();">Submit</a>

</form>

</body>
</html>
