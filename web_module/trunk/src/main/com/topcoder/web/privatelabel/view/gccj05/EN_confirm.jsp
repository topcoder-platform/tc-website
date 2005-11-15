<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 java.util.List,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.ResumeRegInfo" scope="session"/>
<% List responseList = (List) request.getAttribute("responseList");%>
<% Map questionMap = (Map) request.getAttribute("questionMap");%>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Google Code Jam China, Powered by TopCoder</title>
</head>

<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                        alt="Google Coder Jam China logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
<td width="49%">&#160;</td>
<td>
<div class=greenBigBox>

<!-- Tab bar links-->
<div align="center">
    <jsp:include page="EN_links.jsp">
        <jsp:param name="selectedTab" value="registration"/>
    </jsp:include>
</div>

<br><br>

<span class="bigTitle">Registration</span>
<span valign=top>
         <jsp:include page="EN_right_reg.jsp"/>
         </span>

<br><br>

<div style="float: left;">
    <b>Step 3 of 5</b>

    <div class="regBreadOff">General</div>

    <div class="regBreadOff">Demographics</div>

    <div class="regBreadOn">Confirm</div>

    <div class="regBreadOff">Success</div>

    <div class="regBreadOff">Activation</div>
</div>
<br><br><br>

<table cellpadding="0" cellspacing="5" class="bodyText" align="center" border="0">
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_REG_SUBMIT%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
<tc-webtag:hiddenInput name="<%=Constants.LOCALE%>"/>
<tr>
    <td align="right" width="50%"><b>Personal</b>
    </td>
    <td align="left" width="50%">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_CHINA_05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>&<%=Constants.LOCALE%>=<%=regInfo.getLocale().getLanguage()%>">edit<a/>
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
        PIN/Zip Code
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
    <td align="right">
        <b>Demographics</b>
    </td>
    <td align="left">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_CHINA_05_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>&<%=Constants.LOCALE%>=<%=regInfo.getLocale().getLanguage()%>">edit</a>
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

<pl:responseIterator id="resp" list="<%=responseList%>">
    <tr>
        <td align="right" nowrap>
            <pl:demographicQuestionText questions="<%=questionMap%>" response="<%=resp%>"/>
        </td>
        <td align="left">
            <pl:demographicAnswerText questions="<%=questionMap%>" response="<%=resp%>"/>
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

<br><br>
<br><br>
To find out more detailed information about the Google&#153; Code Jam China, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Terms and Conditions</a>.
</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="EN_foot.jsp"/>
</body>
</html>

