<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>
<div id="inner-container">
            <form id="login">
                <input name="username" type="text" id="username" />
                <input type="password" name="username" id="password" />
                <input type="button" class="login-button" name="login" />
                <p class="login-links"><a href="https://www.topcoder.com/reg/?module=Main&rt=2">Register</a><br /><a href="http://www.topcoder.com/tc?module=RecoverPassword ">Forgot Password</a></p>
            </form>
            <h2 class="killerapp">$100,000 Killer App Challenge</h2>
</div>
<div id="contentwrapper">

