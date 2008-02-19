<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
<html>
<head>
    <title>Password Recovery</title>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
    <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: center;">

        <table cellspacing="0" cellpadding="0" class="pageTitleTable">
            <tr>
                <td width="100%" class="pageTitle">
                    <img border="0" src="/i/header_registration_w.gif" alt="registration_w"/></td>
                <td align=right class="pageSubtitle">&#160;&#160;</td>
            </tr>
        </table>
        <br>
        An email has been sent to the email address associated with your TopCoder account.
        <br>Please check your email and follow the link to reset your password.
        <br><br>
        <Span class="bigRed">You must do this in the next <%= Constants.PASSWORD_RECOVERY_EXPIRE %> minutes or your key will expire.</span>
    </div>
</div>
</body>
</html>