<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.authentication.Login" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder | Activation</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>

    <SCRIPT type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.emailForm.submit();
                return false;
            } else return true;
        }
    </SCRIPT>

</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
    <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

        <strong>Invalid email addresss.</strong>
        <br><br>
        We have determined that there is a problem with the email address currently associated with your account.
        In order to participate in TopCoder, you will have to maintain a valid email address. Please enter your
        username, password and valid email address below. Your account will be updated and an email sent to the
        provided address. Once you receive the email you will be able to reactivate your account.
        <br><br>

        <div align="center">

            <form method="post" name="emailForm" action="/tc">
                <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitEmailActivate">
                <%
                    String message = (String) request.getAttribute("message");
                    if (message == null) message = "";
                    String username = request.getParameter(Login.USER_NAME);
                    if (username == null) username = "";
                %>

                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                    <tr>
                        <td colspan="2"><span class="bigRed">
                            <%= message %>
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Username:
                        </td>
                        <td class="value">
                            <input type="text" name="<%=Login.USER_NAME%>" value="<%= username %>" maxlength="15" size="15" onkeypress="submitEnter(event)">
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Password:
                        </td>
                        <td class="value">
                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="15" onkeypress="submitEnter(event)">
                        </td>
                    </tr>
                    <tr>
                        <td class="name">
                            Email:
                        </td>
                        <td class="value">
                            <input type="text" name="<%=Constants.EMAIL%>" value="" maxlength="100" size="25" onkeypress="submitEnter(event)">
                        </td>
                        <tr>
                            <td class="value">
                                &#160;
                            </td>
                            <td class="value">
                                <a href="JavaScript:document.emailForm.submit()" class="bodyText">Send</a>
                            </td>
                        </tr>
                </table>

            </form>
        </div>

    </div>
</div>

</body>
</html>