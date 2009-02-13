<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.ResumeRegInfo" scope="session"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
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
    <div class="regBreadOff">General</div>

    <div class="regBreadOff">Demographics</div>

    <div class="regBreadOn">Confirm</div>

    <div class="regBreadOff">Success</div>

    <div class="regBreadOff">Activation</div>
    <br><br>
    <span class="bigRed">NOTE: You are not registered yet. You MUST click SUBMIT at the bottom of this page to complete the registration.</span>
</td>
<td valign="top" width="100%">
&#160;

<table width="100%" cellpadding="0" cellspacing="5" class="bodyText" align="center">
<form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_06_REG_SUBMIT%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>

<tr>
    <td align="right" width="50%"><b>Personal</b></td>
    <td align="left" width="50%">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_06_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>">edit</a>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        Handle
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="handle"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Given Name
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="firstName"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Surname
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="lastName"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Email Address
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="email"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Confirm Email Address
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="emailConfirm"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Address 1
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address1"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Address 2
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address2"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Address 3
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address3"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        City
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="city"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Province
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="province"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Postal Code
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="zip"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Country
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="countryName"/>
    </td>
</tr>
<tr>
    <td align="right"><b>Demographics</b>
    </td>
    <td align="left">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_06_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>">edit</a>
    </td>
</tr>
<tr>
    <td colspan="2" align="center">

    </td>
</tr>

<tr>
    <td align="right" nowrap>
        Student/Professional
    </td>
    <td align="left">
        <%=regInfo.isStudent() ? "Student" : "Professional"%>
    </td>
</tr>

<pl:responseIterator id="resp" list="${responseList}">
    <tr>
        <td align="right">
            <pl:demographicQuestionText questions="${questionMap}" response="<%=resp%>"/>
        </td>
        <td align="left">
            <pl:demographicAnswerText questions="${questionMap}" response="<%=resp%>"/>
        </td>
    </tr>
</pl:responseIterator>

<tr>
    <td align="right" nowrap>Resume</td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="uploadStatus"/>
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
<br><br><br><br><br><br><br><br>
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