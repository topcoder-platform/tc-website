<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="registrationInfo" class="com.topcoder.web.privatelabel.model.RegistrationInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>
</head>

<body>
    <table cellpadding="1" cellspacing="3">
        <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="regForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.REGISTRATION_SUBMIT%>"/>
            <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="registrationInfo" property="CompanyId"/>"/>
            <tr>
                <td align="right">
                    Handle
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="Handle"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    First Name
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="FirstName"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Last Name
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="LastName"/>
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
                    <jsp:getProperty name="registrationInfo" property="Email"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Confirm Email Address
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="EmailConfirm"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address1
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="Address1"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Address2
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="Address2"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    City
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="City"/>
                </td>
            </tr>

            <tr>
                <td align="right">
                    Zip Code
                </td>
                <td align="left">
                    <jsp:getProperty name="registrationInfo" property="Zip"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <a href="javascript: document.regForm.submit();">submit</a>
                </td>
            </tr>

        </form>

    </table>


</body>

</html>