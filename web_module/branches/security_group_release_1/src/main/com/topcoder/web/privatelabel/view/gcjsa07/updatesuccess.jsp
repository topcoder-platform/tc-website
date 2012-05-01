<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gcjsa07.css"/>
    <title>Google Code Jam Latin America 2007, Powered by TopCoder</title>
    <jsp:include page="../script.jsp"/>
</head>

<body>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center">
                        <img border=0 src="/i/events/gcjsa07/codejamlogo.png" alt="Google Code Jam logo"></td>
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

                                <div class="regBreadOff">Confirm</div>

                                <div class="regBreadOn">Success</div>

                                <div class="regBreadOff">Activation</div>
                            </td>
                            <td valign="top" width="100%">

                                You have successfully updated your account.

                                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                <br><br><br><br><br><br><br><br><br><br><br><br><br>
                            </td>
                        </tr>
                    </table>
                    To find out more detailed information about Google Code Jam Latin America 2007, please read the
                    <a href="/pl/?module=Static&d1=gcjsa07&d2=rules">Terms and Conditions</a>.
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