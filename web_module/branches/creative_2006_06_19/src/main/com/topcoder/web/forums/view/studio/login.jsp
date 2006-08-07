<%@ page contentType="text/html; charset=ISO-8859-1"
       import="com.topcoder.web.common.BaseServlet,
              com.topcoder.web.forums.controller.request.*,
                java.util.*"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%
  String nextpage = (String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
  if(nextpage==null) nextpage = request.getHeader("Referer");
  if(nextpage==null) nextpage = "http://"+request.getServerName();
  String message = (String)request.getAttribute("message");
  if(message==null) message = "";
%>

<SCRIPT type="text/javascript">
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
</SCRIPT>

<html>
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>TopCoder Studio</title>

<jsp:include page="style.jsp">
    <jsp:param name="key" value="tc_creative_forums"/>
</jsp:include>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="left.jsp">
    <jsp:param name="node" value="forums"/>
</jsp:include>

<div class="contentOuter">
   <div class="contentInner">
<h1>Login</h1>

<div align="center">
    <div style="width: 500px;" align="left">
        <strong>Forgot your password?</strong>
        If you cannot remember your password, <a href="/tc?module=PasswordEmail" class="bodyText">click here</a> and we can send it to you via email.
        <br><br>

        <strong>New to TopCoder?</strong><br>
        <a href="https://www.branch3.topcoder.com/reg/">Register now</a>. After you complete the
        registration process, we will send your account activation code via email.
        <br><br>

        <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
            <tc-webtag:hiddenInput name="module" value="Login"/>
       		<tc-webtag:hiddenInput name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%=nextpage%>"/>

            <div align="center">
                <span class="bigRed"><%=message%></span>
                <table border="0" cellpadding="2" cellspacing="0">
                    <tbody><tr>
                        <td class="name" align="right">
                            Handle:
                        </td>
                        <td class="value">
                            <input name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" type="text">
                        </td>

                    </tr>
                    <tr>
                        <td class="name" align="right">
                            Password:
                        </td>
                        <td class="value">
                            <input name="<%=Login.PASSWORD%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" type="password">
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                        	<input name="<%=Login.REMEMBER_USER%>" type="checkbox">Remember Me
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <button onclick="document.frmLogin.submit();return false;">Login</button>
                        </td>
                    </tr>
                </tbody></table>

                <br><br>

                <script type="text/javascript">
                    document.frmLogin.<%=Login.USER_NAME%>.focus();
                </script>

            </div>

        </form>
    </div>
 </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>
</body>
</html>
