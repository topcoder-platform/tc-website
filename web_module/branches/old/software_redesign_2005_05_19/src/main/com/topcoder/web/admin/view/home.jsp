<%@ page import="com.topcoder.web.admin.Constants"%>
                 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>
    <body>
        <jsp:include page="top.jsp"/>
        <table>
            <tr valign="top">
                <td>
                    <jsp:include page="left.jsp"/>
                </td>
                <td>
                    <table>
                        <tr>
                            <td align="left" class="huge">
                                <br /><br /><br />

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
