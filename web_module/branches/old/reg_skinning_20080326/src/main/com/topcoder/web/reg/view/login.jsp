<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <reg_tags:style/>

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

<%-- THE align="center" IS REQUIRED TO EVER CENTER IT, BUT THAT CAN BE OVERRULED TO LEFT OR RIGHT WITH CSS --%>
<div id="pageBranding" align="center">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>">&nbsp;</a>
</div>

<div id="pageAligner" align="center">
    <div id="pageSpacer">
    
    <div id="pageTitle"><div>&nbsp;</div></div>

        <p><strong>Forgot your password?</strong><br />
        If you cannot remember your password <a href="/tc?module=RecoverPassword" class="bodyText">click here</a>
        and we can help you restore your account.</p>

        <p><strong>New to TopCoder?</strong><br />
        <a href="${sessionInfo.secureAbsoluteServletPath}">Register now</a>. After you complete the registration
        process, we will send your account activation code via email.</p>
        
        <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />
            <input type="hidden" name="module" value="Login" />

            <div align="center">

                <div class="error">
                    <%= message %>
                </div>

                <table cellpadding="0" cellspacing="0" border="0" class="loginFields">
                <tbody>
                    <tr class="odd">
                        <td class="field">
                            Handle:
                        </td>
                        <td class="value">
                            <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" />
                        </td>
                    </tr>
                    <tr class="even">
                        <td class="field">
                            Password:
                        </td>
                        <td class="value">
                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)" />
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="value">
                            &#160;
                        </td>
                        <td class="value">
                            <button onclick="document.frmLogin.submit();return false;">Log in</button>
                        </td>
                    </tr>
                </tbody>
                </table>

                <script type="text/javascript">
                    document.frmLogin.<%=Login.USER_NAME%>.focus();
                </script>
            </div>

        </form>

    </div>
</div>

</body>
</html>