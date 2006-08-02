<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="../left.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
<h1>Login</h1>

        <div align="center">
            <div style="width: 500px;" align="left">
                <strong>Forgot your password?</strong>
                If you cannot remember your password
                <a href="/tc?module=PasswordEmail" class="bodyText">click
                    here</a> and we can
                send it
                to you via email.
                <br><br>

                <strong>New to TopCoder?</strong><br>
                <a href="https://www.branch3.topcoder.com/reg/">Register now</a>. After you complete the
                registration process,
                we
                will send your account activation code via email.
                <br><br>

                <form method="post" name="frmLogin" action="https://www.branch3.topcoder.com/">
                    <input name="nextpage" value="/?module=ViewSubmission&amp;ct=1500" type="hidden">
                    <input name="module" value="Login" type="hidden">

                    <div align="center">

                        <span class="bigRed">In order to continue, you must provide your user name and password.</span>
                        <table border="0" cellpadding="2" cellspacing="0">
                            <tbody><tr>
                                <td class="name" align="right">
                                    Handle:
                                </td>
                                <td class="value">
                                    <input name="username" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" type="text">
                                </td>

                            </tr>
                            <tr>
                                <td class="name" align="right">
                                    Password:
                                </td>
                                <td class="value">
                                    <input name="password" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" type="password">
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2" align="center"><input name="rem" type="checkbox">
                                    Remember
                                    Me</td>
                            </tr>

                            <tr>
                                <td colspan="2" align="center">
                                    <button onclick="document.frmLogin.submit();return false;">Login</button>

                                </td>
                            </tr>
                        </tbody></table>

                        <br><br>

                        <script type="text/javascript">
                            document.frmLogin.username.focus();
                        </script>

                    </div>

                </form>
            </div>
         </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>
</body>
</html>
