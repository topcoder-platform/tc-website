<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 java.util.List,
                 java.util.Map" %>
<%@ page import="java.util.Locale"%>
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
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
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
    <jsp:include page="ZH_links.jsp">
        <jsp:param name="selectedTab" value="registration"/>
    </jsp:include>
</div>

<br><br>

<span class="bigTitle">注册</span>
<span valign=top>
         <jsp:include page="ZH_right_reg.jsp"/>
         </span>

<br><br>

<div style="float: left;">
    <b>第三步（共五步）</b>

    <div class="regBreadOff">常规信息</div>

    <div class="regBreadOff">人口统计信息</div>

    <div class="regBreadOn">确认</div>

    <div class="regBreadOff">成功</div>

    <div class="regBreadOff">激活</div>
</div>
<br><br><br>

<table cellpadding="0" cellspacing="5" class="bodyText" align="center" border="0">
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_CHINA_05_REG_SUBMIT%>"/>
<input type="hidden" name="<%=Constants.COMPANY_ID%>" value="<jsp:getProperty name="regInfo" property="companyId"/>"/>
<input type="hidden" name="<%=Constants.EVENT_ID%>" value="<jsp:getProperty name="regInfo" property="eventId"/>"/>
<tc-webtag:hiddenInput name="<%=Constants.LOCALE%>"/>

<tr>
    <td align="right" width="50%"><b>个人信息</b>
    </td>
    <td align="left" width="50%">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_CHINA_05_REG_MAIN%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>&<%=Constants.LOCALE%>=<%=Locale.CHINA.getLanguage()%>">改写</a>
    </td>
</tr>
<tr>
    <td align="right" nowrap>
        帐号名
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="handle"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        名
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="firstName"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        姓
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="lastName"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        电子邮箱地址
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="email"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        确认电子邮箱地址
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="emailConfirm"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        地址1
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address1"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        地址2
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address2"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        地址3
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="address3"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        城市
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="city"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        省份
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="province"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        邮编
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="zip"/>
    </td>
</tr>

<tr>
    <td align="right" nowrap>
        国家
    </td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="countryName"/>
    </td>
</tr>
<tr>
    <td align="right">
        <b>人口统计信息</b>
    </td>
    <td align="left">
        <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=<%=Constants.GOOGLE_CHINA_05_REG_DEMOG%>&<%=Constants.COMPANY_ID%>=<jsp:getProperty name="regInfo" property="companyId"/>&<%=Constants.LOCALE%>=<%=Locale.CHINA.getLanguage()%>">改写</a>
    </td>
</tr>
<tr>
    <td colspan="2" align="center">

    </td>
</tr>

<tr>
    <td align="right" nowrap>
        学生/已工作
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
    <td align="right" nowrap>简历</td>
    <td align="left">
        <jsp:getProperty name="regInfo" property="uploadStatus"/>
    </td>
</tr>
<tr>
    <td colspan="2" align="center">
        <p align="center"><a href="javascript: document.regForm.submit();">提交</a></p>
    </td>
</tr>

</form>
</table>

<br><br>
<br><br>
想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>

