<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
</head>

<body>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="selectionForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Main"/>


        <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
        <c:if test="${cf:contains(registrationTypeList, givenName)}">
            <p>
                <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
            </p>
            <p>
                <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>" size="15" maxlength="<%=Constants.MAX_GIVEN_NAME_LENGTH%>" editable="true>"/>
            </p>
        </c:if>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.SURNAME%>" size="15" maxlength="<%=Constants.MAX_SURNAME_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.TITLE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.TITLE%>" size="15" maxlength="<%=Constants.MAX_TITLE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="15" maxlength="<%=Constants.MAX_COMPANY_NAME_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>
<%--todo state goes in here--%>
        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" size="15" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <%--todo put country here --%>
        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.PASSWORD%>" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" size="15" maxlength="<%=Constants.MAX_PHONE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>

        <p>
            <tc-webtag:errorIterator id="err" name="<%=Constants.QUOTE%>"><%=err%><br/></tc-webtag:errorIterator>
        </p>
        <p>
            <tc-webtag:textInput name="<%=Constants.QUOTE%>" size="15" maxlength="<%=Constants.MAX_QUOTE_LENGTH%>" editable="<%=regInfo.isNew()%>"/>
        </p>


        <%--todo put in the notifications here --%>

        <%--todo put in the comp country code here --%>

        <%--todo put in the coder type choice here --%>

        <%-- todo put in the timezone drop down here --%>




        <c:set value="<%=Constants.REGISTRATION_TYPE%>" var="regTypeKey"/>
        <c:forEach items="${registrationTypeList}" var="type">
            <tc-webtag:chkBox name="${regTypeKey}${type.id}"/> <c:out value="${type.description}" /> <br />
        </c:forEach>

        <a href="Javascript:document.selectionForm.submit();">Submit</a>

    </form>

</body>
</html>
