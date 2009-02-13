<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>TopCoder Registration</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>

    <script type="text/javascript">
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
    </script>

</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>


    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="registration-signup"><span>Registration Signup: Personal Information</span></h3>
                </div>
            </div>
            
            <div id="box-body">

        <p><b>Forgot your password?</b><br/>
        If you cannot remember your password <A href="/tc?module=RecoverPassword" class="bodyText">click here</A>
        and we can help you restore your account.</p>
        <br><br>
        <strong>New to TopCoder?</strong><br>
        <A href="${sessionInfo.secureAbsoluteServletPath}">Register now</A>. After you complete the registration
        process, we will send your account activation code via email.
        <br><br>

        <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
            <input type="hidden" name="module" value="Login">

            <div align="center">
                <span class="bigRed"><%= message %></span>
                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                    <tr>
                        <td class="name">
                            Handle:
                        </td>
                        <td class="value">
                            <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)">
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Password:
                        </td>
                        <td class="value">
                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)">
                        </td>
                    </tr>
                    <tr>
                        <td class="value">
                            &#160;
                        </td>
                        <td class="value">
                            <a href="#" onclick="document.frmLogin.submit();return false;" class="bodyText">Login</a>
                        </td>
                    </tr>
                </table>

                <p><br/></p>

                <script type="text/javascript">
                    document.frmLogin.<%=Login.USER_NAME%>.focus();
                </script>
                </div>

        </form>

    </div>
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
