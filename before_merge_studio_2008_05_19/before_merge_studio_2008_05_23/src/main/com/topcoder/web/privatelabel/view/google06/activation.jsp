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
                            <span class="bigBluetitle">Activation Successful!</span>
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

                            <div class="regBreadOff">Success</div>

                            <div class="regBreadOn">Activation</div>
                        </td>
                        <td valign="top" width="100%">

                            You may practice for the contest by clicking the Competition Arena link above.
                            <br><br>
                            If you encounter any problems, please contact us at <A href="mailto:gcj@topcoder.com">gcj@topcoder.com</A>.


                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                            <br><br><br><br><br><br><br><br><br>
                        </td>
                    </tr>
                </table>
                To find out more detailed information about Google Code Jam 2006, please read the
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