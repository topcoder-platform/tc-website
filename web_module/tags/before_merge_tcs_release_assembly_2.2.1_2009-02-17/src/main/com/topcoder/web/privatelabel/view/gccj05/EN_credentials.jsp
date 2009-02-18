﻿<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
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

                <span class="bigTitle">Forgot your password?</span>
                <span valign=top>
         <jsp:include page="EN_right_reg.jsp"/>
         </span>

                <br><br>
                Please enter your email address below. You should receive an email shortly with your username and
                password.
                <br><br><br><br>

                <table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
                    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="GET"
                          name="regForm">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>"
                               value="<%=Constants.GOOGLE_CHINA_05_CREDENTIALS%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.COMPANY_ID%>"/>
                        <tr>
                            <td colspan="2" class="errorText" align="center">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%><br>
                                </tc-webtag:errorIterator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" nowrap>
                                Email Address
                            </td>
                            <td align="left">
                                <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="15"
                                                     maxlength="<%=Constants.MAX_EMAIL_LENGTH%>"/>
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