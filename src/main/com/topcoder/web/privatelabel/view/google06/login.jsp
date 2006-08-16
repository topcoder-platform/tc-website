<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session"/>
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
    <td width="49%">&#160;</td>
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
    <td width="49%"></td>
</tr>

<!-- Tab bar links-->
<tr>
    <td colspan="3">
        <div align="center">
            <jsp:include page="links.jsp">
                <jsp:param name="selectedTab" value="registration"/>
            </jsp:include>
            <br/>
        </div>
    </td>
</tr>

<tr>
    <td width="49%">&#160;</td>

    <!-- content -->
    <td>
        <div class="pageLayout">

         <span valign="top">
         <jsp:include page="right_reg.jsp"/>
         </span>

            <span class="bigBluetitle">Registration</span>
            <br><br>

            Registration will close on Tuesday, September 5th at 9:00 AM EDT.<br/><br/>
            If you are
            <A href="<%=sessionInfo.getSecureAbsoluteServletPath()%>?module=<%=Constants.GOOGLE_06_REG_MAIN%>&<%=Constants.COMPANY_ID%>=1865&<%=Constants.EVENT_ID%>=8" class="bigRed">not
                currently a TopCoder member</A>
            or do not want to use an existing account, please click
            <a href="<%=sessionInfo.getSecureAbsoluteServletPath()%>?module=<%=Constants.GOOGLE_06_REG_MAIN%>&<%=Constants.COMPANY_ID%>=1865&<%=Constants.EVENT_ID%>=8" class="bigRed">here</a>.
            <br><br>
            If you are currently a TopCoder member and would like to convert your account for use in Google Code Jam
            2006
            or you have an existing Google Code Jam 2006 account and need to change your registration information
            you may login below.<br/><br/>

            If you have already registered and would like to <strong>update your registration information</strong>,
            please login here:
            <br><br>

            <form method="post" name="frmLogin" action="<%=sessionInfo.getSecureAbsoluteServletPath()%>">
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="<%=Constants.GOOGLE_06_LOGIN%>">
                <input type="hidden" name="<%=Constants.EVENT_ID%>" value="8">
                <input type="hidden" name="<%=Constants.COMPANY_ID%>" value="1865">
                <table border="0" cellpadding="3" cellspacing="0" align="center">
                    <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>

                    <tr valign="top">
                        <td class="errorText" colspan="3" align="center">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.HANDLE%>"><%=err%><br>
                            </tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td nowrap class="bodyText" align="right">Handle:</td>
                        <td colspan="2" align="left">
                            <input type="text" name="<%=Constants.HANDLE%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                        </td>
                    </tr>

                    <tr valign="middle">
                        <td nowrap class="bodyText" align="right">Password:</td>
                        <td align="left">
                            <input type="password" name="<%=Constants.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                        </td>
                        <td nowrap class="bodyText">
                            &#160;&#160;<a href="JavaScript:document.frmLogin.submit()" class="bodyText">Login&#160;&gt;</a>
                        </td>
                    </tr>
                    <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                    <tr><td colspan="3" class="bodyText" align="center">
                        <A href="/pl/?module=Google06Credentials&<%=Constants.COMPANY_ID%>=1865">Forgot your Google Code
                            Jam 2006
                            password?</A></td>
                    </tr>
                </table>

                <p><br></p>

                <script>
                    document.frmLogin.<%=Constants.HANDLE%>.focus();
                </script>

            </form>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            To find out more detailed information about the Google&#153; Code Jam 2006, please read the
            <a href="/pl/?&module=Static&d1=google06&d2=rules">Terms and Conditions</a>.
            <br><br>
        </div>
    </td>
    <td width="49%">&#160;</td>
<tr>
<tr>
    <td colspan="3">
        <div align="center">
            <jsp:include page="foot.jsp"/>
        </div>
    </td>
</tr>
</table>
</body>
</html>