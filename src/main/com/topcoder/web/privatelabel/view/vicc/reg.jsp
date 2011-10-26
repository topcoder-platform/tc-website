<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page import="java.util.List" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session"/>
<% List questionList = (List) request.getAttribute("questionList");%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Code Fest, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/vicc.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="registration"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
<tr valign="top">
<td valign="top" align="center">
<div class="bodySpacer">

<span class="bigTitle">Registration</span>
<br/><br/>

Register for the VeriSign Code Fest.  Please use your VeriSign email address when registering:<br/><br/>

<form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.VICC_REG_CONFIRM%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
<table>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" width="50%" nowrap>
        <span class="errorText">*</span> Handle
    </td>
    <td align="left" width="50%" class="bodyText">
        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="<%=Constants.MAX_HANDLE_LENGTH%>" editable="<%=String.valueOf(regInfo.isNew())%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.GIVEN_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Given Name
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.GIVEN_NAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.MIDDLE_NAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.SURNAME%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Surname
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.SURNAME%>" size="15" maxlength="50"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Password
    </td>
    <td class="bodyText" align="left">
        <tc-webtag:textInput name="<%=Constants.PASSWORD%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
        (<%=Constants.MIN_PASSWORD_LENGTH%> to <%=Constants.MAX_PASSWORD_LENGTH%> characters)
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.PASSWORD_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Confirm Password
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.PASSWORD_CONFIRM%>" passw="true" size="15" maxlength="<%=Constants.MAX_PASSWORD_LENGTH%>"/>
    </td>
</tr>
<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Email Address
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<tr>
    <td colspan="2" class="errorText" align="center">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL_CONFIRM%>"><%=err%><br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="bodyText" align="right" nowrap>
        <span class="errorText">*</span> Confirm Email Address
    </td>
    <td align="left">
        <tc-webtag:textInput name="<%=Constants.EMAIL_CONFIRM%>" size="15" maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
    </td>
</tr>

<pl:questionIterator id="question" list="<%=questionList%>">
    <tr>
        <td colspan="2" class="errorText" align="center">
            <tc-webtag:errorIterator id="err" name="<%=Constants.DEMOG_PREFIX+question.getId()%>"><%=err%><br/>
            </tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td align="right" class="bodyText">
            <%if (question.isRequired()) {%><span class="errorText">*</span><%}%>
            <%=question.getText()%>
        </td>
        <td align="left">
            <pl:demographicInput question="<%=question%>"/>
        </td>
    </tr>
</pl:questionIterator>

<tr>
    <td class="bodyText" colspan="2">&#160;</td>
</tr>
<tr>
    <td class="bodyText" colspan="2" align="center"><input name="location" type="submit" value="Submit"/></td>
</tr>
</table>
</form>


<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<br/><br/>

</div>
</td>


<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
    <jsp:include page="right.jsp"/>

</td>

</tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
