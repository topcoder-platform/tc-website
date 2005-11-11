<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
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
    <b>Step 1 of 5</b>

    <div class="regBreadOn">General</div>

    <div class="regBreadOff">Demographics</div>

    <div class="regBreadOff">Confirm</div>

    <div class="regBreadOff">Success</div>

    <div class="regBreadOff">Activation</div>
</div>
<br><br><br>

<table cellpadding="0" cellspacing="5" class="bodyText" align="center" border="0">
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_REG_DEMOG%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
<tc-webtag:hiddenInput name="<%=Constants.LOCALE%>"/>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" style="width: 160px;">
        <span class="errorText">*</span> Login
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>"
                             editable="<%=regInfo.isNew()%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> First Name
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Last Name
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<%if (regInfo.isNew()) { %>
<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Password
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15"
                             maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/> (<%=Constants.MIN_PASSWORD_LENGTH%>
        to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Confirm Password
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15"
                             maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
    </td>
</tr>
<% } %>
<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Email Address
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Confirm Email Address
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Address1
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        Address2
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        Address3
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="30" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> City
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="100"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">Province</td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="50"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ZIP%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Postal Code
    </td>
    <td align="left" nowrap="nowrap">
        <tc-webtag:textInput name="<%=Constants.ZIP%>" size="10" maxlength="15"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="right" nowrap="nowrap">
        <span class="errorText">*</span> Country
    </td>
    <td align="left" nowrap="nowrap">
        <% ResultSetContainer countryRsc = (ResultSetContainer) request.getAttribute("countryList"); %>
        <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=countryRsc%>" fieldText="country_name"
                             fieldValue="country_code"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center" nowrap="nowrap">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CODER_TYPE%>"><%=err%><br></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td align="center" valign="bottom" colspan="2" nowrap="nowrap">
        <span class="errorText">*</span> Student: <input type="radio" name="<%=Constants.CODER_TYPE%>"
                                                         value="<%=Constants.STUDENT%>" <%=regInfo.isStudent()?"checked":""%>>
        Professional: <input type="radio" name="<%=Constants.CODER_TYPE%>"
                             value="<%=Constants.PROFESSIONAL%>" <%=regInfo.isProfessional()?"checked":""%>>
    </td>
</tr>
<tr>
    <td align="center" valign="bottom" colspan="2" nowrap="nowrap">
        <span class="errorText">* Required</span>
    </td>
</tr>
<tr>
    <td colspan="2" align="center" nowrap="nowrap">
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