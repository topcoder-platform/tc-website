<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006, Powered by TopCoder</title>
    <jsp:include page="../script.jsp"/>
</head>

<body>

<SCRIPT type="text/javascript">
    function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.frmLogin.submit();
            return false;
        } else return true;
    }
</SCRIPT>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center">
                    <img border=0 src="/i/events/google2006/codejamLogo.gif" alt="Google Code Jam logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
</tr>

<!-- Tab bar links-->
<tr>
    <td>
        <div align="center">
            <jsp:include page="links.jsp">
                <jsp:param name="selectedTab" value="registration"/>
            </jsp:include>
            <br/>
        </div>
    </td>
</tr>

<tr>

<!-- content -->
<td>
<div align="center">
<div class="pageLayout" align="left">

<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
    <td valign="top" colspan="2">
        <span class="bigBluetitle">Registration</span>
        <br><br>
    </td>
    <td valign="top" rowspan="2">
        <jsp:include page="right_reg.jsp"/>
    </td>
</tr>
<tr>
<td valign="top">
    <div class="regBreadOn">General</div>

    <div class="regBreadOff">Demographics</div>

    <div class="regBreadOff">Confirm</div>

    <div class="regBreadOff">Success</div>

    <div class="regBreadOff">Activation</div>
</td>
<td valign="top" width="100%">
<table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_06_REG_DEMOG%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
<% if (regInfo.isNew()) { %>
<tr>
    <td colspan="2" class="errorText" align="center">
        It is against the rules to create more <br>than one account for this event.
    </td>
</tr>
<% } %>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" width="50%" nowrap>
        <span class="errorText">*</span> Handle (Username)
    </td>
    <td align="left" width="50%">
        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="<%=String.valueOf(regInfo.isNew())%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Given Name
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Surname
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.SURNAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Password
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
        (<%=Constants.MIN_PASSWORD_LENGTH%> to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Confirm Password
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Email Address
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Confirm Email Address
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PHONE_NUMBER%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        Phone Number
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.PHONE_NUMBER%>" size="15"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Address1
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        Address2
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        Address3
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> City
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="100"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        State
    </td>
    <td align="left">
        <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="${stateList}" fieldText="state_name" fieldValue="state_code"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>Province</td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="50"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Postal Code
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" size="10" maxlength="15"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        <span class="errorText">*</span> Country
    </td>
    <td align="left">
        <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="${countryList}" fieldText="country_name" fieldValue="country_code"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>">${err}<br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" valign=bottom nowrap>
        <span class="errorText">*</span> Student/Professional
    </td>
    <td align="left" valign=bottom>
        Student:
        <input type="radio" name="<%=Constants.CODER_TYPE%>" value="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>>
        Professional:
        <input type="radio" name="<%=Constants.CODER_TYPE%>" value="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>>
    </td>
</tr>
<tr>
    <td align="right" valign=bottom nowrap>
        <span class="errorText">* Required</span>
    </td>
    <td align="left" valign=bottom>
        &nbsp;
    </td>
</tr>
<tr>
    <td colspan="2" align="center">
        <p align="center"><a href="javascript: document.regForm.submit();">Submit</a></p>
    </td>
</tr>
</form>
</table>
</td>
</tr>
</table>
<br><br><br><br><br>
<br><br>
To find out more detailed information about the Google&#153; Code Jam 2006, please read the
<a href="/pl/?&module=Static&d1=google06&d2=rules">Terms and Conditions</a>.
<br><br>
</div>
</div>
</td>
</tr>

<tr>
    <td>
        <div align="center">
            <jsp:include page="foot.jsp"/>
        </div>
    </td>
</tr>
</table>
</body>
</html>