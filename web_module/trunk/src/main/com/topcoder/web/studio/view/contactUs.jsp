<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">

        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contactUs"/>
        </jsp:include>

        <div id="contentIn" class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Contact Us</h1>

                <div align="center" style="margin-bottom:20px;">
                    <table cellpadding="10" cellspacing="0">
                        <tbody>
                            <tr>
                                <td colspan="2">
                                    <strong>Corporate Address</strong><br>
                                    TopCoder, Inc.<br>
                                    703 Hebron Avenue<br>
                                    Glastonbury, CT 06033 U.S.A.<br>
                                    tel: 860.633.5540<br>
                                    fax: 860.657.4276
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Membership</strong><br>
                                    Email: <A href="mailto:service@topcoder.com?subject=TopCoder%20Studio%20Membership">service@topcoder.com</A>
                                </td>
                                <td>
                                    <strong>Competition Support</strong><br>
                                    Email: <A href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</A>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>General questions</strong><br>
                                    Email:
                                    <A href="mailto:service@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">service@topcoder.com</A>
                                </td>
                                <td>
                                    <strong>Sales</strong><br>
                                    Email: <A href="mailto:studiosales@topcoder.com">studiosales@topcoder.com</A>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="foot.jsp"/>

        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>