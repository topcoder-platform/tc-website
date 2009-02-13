<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.authentication.FindUser" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>

<html>
<head>
    <title>Password Recovery</title>

    <SCRIPT type="text/javascript">
        function send() {
            if (!document.frm.<%= FindUser.HAS_MAIL_ACCESS %>[0].checked
                    && !document.frm.<%= FindUser.HAS_MAIL_ACCESS %>[1].checked) {
                alert("Please reply whether you have access or not to your email account.");
                return;
            }
            document.frm.submit();
        }

        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frm.submit();
                return false;
            } else return true;
        }
    </SCRIPT>


    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
    <A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0"/></A>
</div>

<div align="center">
    <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

        <table cellspacing="0" cellpadding="0" class="pageTitleTable">
            <tr>
                <td width="100%" class="pageTitle">
                    <img border="0" src="/i/header_registration_w.gif" alt="registration_w"/></td>
                <td align=right class="pageSubtitle">&#160;&#160;</td>
            </tr>
        </table>
        <strong>Password Recovery</strong><br>
        Have you forgotten your password? No longer have access to the email account you used when you registered?
        Enter your information below, and we will help you get back in the game!
        <br><br>

        <form method="post" name="frm" action="/tc">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="FindUser"/>

            <div align="center">
                <table cellpadding="0" cellspacing="0" border="0" class="regFields">
                    <tr>
                        <td class="value" colspan="2">Do you still have access to the email account used when
                            registering?</td>
                    </tr>
                    <tr>
                        <td class="value">&#160;</td>
                        <td class="value">
                            <input type="radio" value="true" name="<%= FindUser.HAS_MAIL_ACCESS %>" <%= "true".equals(request.getAttribute(FindUser.HAS_MAIL_ACCESS)) ? "checked" : "" %> >
                                Yes</input>
                            <input type="radio" value="false" name="<%= FindUser.HAS_MAIL_ACCESS %>" <%= "false".equals(request.getAttribute(FindUser.HAS_MAIL_ACCESS)) ? "checked" : "" %> >
                                No</input>
                        </td>
                    </tr>
                    <tr>
                        <td class="value" colspan="2"><br>If you remember your username, please enter it:</td>
                    </tr>
                    <tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_HANDLE %>">
                        <tr>
                            <td colspan="2"><span class="bigRed"><%=err%></span></td>
                        </tr>
                    </tc-webtag:errorIterator>
                    <tr>
                        <td class="name">Username:</td>
                        <td class="value">
                            <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
                    </tr>
                    <tr>
                        <td class="value" colspan="2"><br>If you don't remember your username, please enter as much <br>
                            information as posible in order to identify you:</td>
                    </tr>
                    <tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_INFO %>">
                        <tr>
                            <td colspan="2"><span class="bigRed"><%=err%></span></td>
                        </tr>
                    </tc-webtag:errorIterator>
                    <tr>
                        <td class="name">First Name:</td>
                        <td class="value">
                            <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
                    </tr>
                    <tr>
                        <td class="name">Last Name:</td>
                        <td class="value">
                            <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
                    </tr>
                    <tr>
                        <td class="name">Email Address:</td>
                        <td class="value">
                            <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/></td>
                    </tr>
                    <tr>
                        <td class="value">&#160;</td>
                        <td class="value"><a href="JavaScript:send()" class="bodyText">Submit</a></td>
                    </tr>
                </table>
        </form>
    </div>

</div>
</div>

</body>
</html>