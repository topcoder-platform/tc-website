<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ page import="com.topcoder.web.common.TCWebException" %>
<%@ page language="java"
         session="true"
         isErrorPage="true"
        %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>
<title>TopCoder Admin</title>
    <% if (exception == null) exception = (Throwable) request.getAttribute("exception");
        if (exception != null) {
            if (!(exception instanceof TCWebException) || ((TCWebException) exception).isVerbose()) {
                exception.printStackTrace();
            }
        }
    %>
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

