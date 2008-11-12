<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>
<div id="header">
    	<div id="header-container">
            <h1>Ribbit $100,000 Killer App Challenge</h1>
            <form id="login" method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
               <p> 
               <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />
               <input type="hidden" name="module" value="Login" />

               <input name="<%=Login.USER_NAME%>" type="text" id="username" onkeypress="submitEnter(event)" />
                <input type="<%=Login.PASSWORD%>" name="username" id="password" onkeypress="submitEnter(event)" />
                <a href="onClick(submit);" class="login-button">Login</a></p>
                <p class="login-links"><a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/?module=Main&amp;rt=9">Register</a> | <a href=""http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot Password</a></p>
            </form>
            <ul id="secondary-nav">
                <li class="first"><a href="#">TopCoder</a></li>
                <li> | <a href="#">Rules</a></li>
                <li> | <a href="#">FAQ</a></li>
            </ul> 
        </div>       
	</div>

