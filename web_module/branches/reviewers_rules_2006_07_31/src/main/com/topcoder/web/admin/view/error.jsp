<%@ page import="com.topcoder.web.common.BaseServlet"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
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
                            <td><%=(String)request.getAttribute(BaseServlet.MESSAGE_KEY)%></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>

