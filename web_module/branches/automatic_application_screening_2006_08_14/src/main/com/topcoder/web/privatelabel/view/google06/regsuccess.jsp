<%@ page contentType="text/html;charset=utf-8" %>
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

                            <div class="regBreadOff">Confirm</div>

                            <div class="regBreadOn">Success</div>

                            <div class="regBreadOff">Activation</div>
                        </td>
                        <td valign="top" width="100%">

                            In order to be eligible to compete in the Google Code Jam 2006,
                            you must activate your account by following the directions sent to the email
                            address provided during registration.

                            <br><br>
                            <span class="bigRed">You <u>will not</u> be able to compete if you do not activate your account.</span>
                            <br><br>

                            Spend time in the Practice Rooms prior to the Qualification Round by clicking the
                            Competition Arena tab above.
                            <br><br>
                            If you encounter any problems, please contact us at <A href="mailto:gcj@topcoder.com">gcj@topcoder.com</A>.
                            <br><br>
                            Good luck to you in the Arena!

                        </td>
                    </tr>
                </table>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br><br>
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