<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<jsp:usebean id="responseList" class="java.util.List" scope="request" />
<jsp:usebean id="questionMap" class="java.util.Map" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>
</head>

<body>
    <table cellpadding="1" cellspacing="3">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.SIMPLE_REG_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="CompanyId"/>"/>
            <input type="hidden" name="<%=Constants.HANDLE%>" value="<jsp:getProperty name="regInfo" property="Handle"/>"/>
            <input type="hidden" name="<%=Constants.LAST_NAME%>" value="<jsp:getProperty name="regInfo" property="FirstName"/>"/>
            <input type="hidden" name="<%=Constants.FIRST_NAME%>" value="<jsp:getProperty name="regInfo" property="LastName"/>"/>
            <input type="hidden" name="<%=Constants.PASSWORD%>" value="<jsp:getProperty name="regInfo" property="Password"/>"/>
            <input type="hidden" name="<%=Constants.PASSWORD_CONFIRM%>" value="<jsp:getProperty name="regInfo" property="PasswordConfirm"/>"/>
            <input type="hidden" name="<%=Constants.EMAIL%>" value="<jsp:getProperty name="regInfo" property="Email"/>"/>
            <input type="hidden" name="<%=Constants.EMAIL_CONFIRM%>" value="<jsp:getProperty name="regInfo" property="EmailConfirm"/>"/>
            <input type="hidden" name="<%=Constants.ADDRESS1%>" value="<jsp:getProperty name="regInfo" property="Address1"/>"/>
            <input type="hidden" name="<%=Constants.ADDRESS2%>" value="<jsp:getProperty name="regInfo" property="Address2"/>"/>
            <input type="hidden" name="<%=Constants.CITY%>" value="<jsp:getProperty name="regInfo" property="City"/>"/>
            <input type="hidden" name="<%=Constants.ZIP%>" value="<jsp:getProperty name="regInfo" property="Zip"/>"/>
            <input type="hidden" name="<%=Constants.STATE_CODE%>" value="<jsp:getProperty name="regInfo" property="StateCode"/>"/>
            <input type="hidden" name="<%=Constants.COUNTRY_CODE%>" value="<jsp:getProperty name="regInfo" property="CountryCode"/>"/>

            <tr>
                <td align="right">
                    Handle
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Handle"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    First Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="FirstName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Middle Initial
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="MiddleName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Last Name
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="LastName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right">
                    Confirm Password
                </td>
                <td align="left">
                    ********
                </td>
            </tr>

            <tr>
                <td align="right">
                    Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Email"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Confirm Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="EmailConfirm"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address1
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address1"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address2
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address2"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address3
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Address3"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    City
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="City"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Zip Code
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="Zip"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    State
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="StateName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Country
                </td>
                <td align="left">
                    <jsp:getProperty name="regInfo" property="CountryName"/>
                </td>
            </tr>

            <pl:responseIterator id="response" list="responseList">
                <tr>
                    <td align="right">
                        <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=response%>"/>
                    </td>
                    <td align="left">
                        <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=response%>"/>
                    </td>
                </tr>
            </pl:responseIterator>


            <tr>
                <td colspan="2">
                    <a href="javascript: document.regForm.submit();">submit</a>
                </td>
            </tr>

        </form>

    </table>


</body>

</html>