<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contactUs"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
    
                        <h1>Contact Us</h1>

                        <div align="center" style="margin-bottom:20px;">
                            <table cellpadding="10" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td align="left" colspan="2">
                                            <strong>Corporate Address</strong><br />
                                            TopCoder, Inc.<br />
                                            95 Glastonbury Blvd<br />
                                            Glastonbury, CT 06033 U.S.A.<br />
                                            tel: 860.633.5540<br />
                                            fax: 860.657.4276
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <strong>Membership</strong><br />
                                            Email: <a href="mailto:service@topcoder.com?subject=TopCoder%20Studio%20Membership">service@topcoder.com</a>
                                        </td>
                                        <td align="left">
                                            <strong>Competition Support</strong><br />
                                            Email: <a href="mailto:studioadmin@topcoder.com">studioadmin@topcoder.com</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <strong>General questions</strong><br />
                                            Email:
                                            <a href="mailto:service@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">service@topcoder.com</a>
                                        </td>
                                        <td align="left">
                                            <strong>Sales</strong><br />
                                            Email: <a href="mailto:studiosales@topcoder.com">studiosales@topcoder.com</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>