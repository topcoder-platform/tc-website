<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>

<jsp:include page="script.jsp" />

<script language="JavaScript" type="text/javascript">
  function submitEnter(e){
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.login.submit();
     return false;
    } else return true;
  }
</script>

</head>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">            
    <tr><td colspan="3" class="globalNavSmall"><img src="/i/clear.gif" width="1" height="15" border="0"/></td></tr>

    <tr>
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><screen:servletLink target="_parent"><img src="/i/logo_testing.gif" width="206" height="49" border="0" alt="TopCoder Testing Application" vspace="13"></screen:servletLink></TD>
        <td width="100%"><img src="/i/clear.gif" width="1" height="1" alt="" border="0"></td>
    </tr>             

    <tr><td colspan="3" class="testTop"><img src="/i/clear.gif" width="1" height="18" border="0"/></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter begins -->
        <td><img src="/i/clear.gif" width="25" alt="" height="1"></td>
<!-- Gutter ends -->

<!-- Center Column begins -->
        <td width="100%" align="center"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <p><br></p>
            <p><br></p>
            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Testing Application</td></tr>
                <tr valign="middle">
                    <td class="statText" align="center">
                    <% if((String)request.getAttribute(Constants.MESSAGE_PARAMETER) != null){ %>
                        <p><%= request.getAttribute(Constants.MESSAGE_PARAMETER).toString() %></p>
                    <% }else if((String)request.getParameter(Constants.MESSAGE_PARAMETER) != null){ %>
                        <p><%= request.getParameter(Constants.MESSAGE_PARAMETER) %></p>
                    <% } %>
                        <screen:form name="login" method="post" action="<%=Constants.CONTROLLER_URL%>">
                        <input type="hidden" name='<%=Constants.REQUEST_PROCESSOR%>' value='Login'>
                        <input type="hidden" name='<%=Constants.FIRST_ATTEMPT%>' value='false'>
                    <% if((String)request.getAttribute(Constants.REDIRECT) != null){ %>
                        <input type="hidden" name='<%=Constants.REDIRECT%>' value='<%= request.getAttribute(Constants.REDIRECT).toString() %>'>
                    <% }else if((String)request.getParameter(Constants.REDIRECT) != null){ %>
                        <input type="hidden" name='<%=Constants.REDIRECT%>' value='<%= request.getParameter(Constants.REDIRECT).toString() %>'>
                    <% } %>

                       <table border="0" cellpadding="3" cellspacing="0" align="center">
                            <tr valign="middle">
                                <td class="loginText" align="right">User Name:</td>
                                <td align="left"><input maxlength="15" size="12" name="<%=Constants.HANDLE%>" type="text" onKeyPress="submitEnter(event)" value=""></td>
                                <td class="loginText">&#160</td>
                            </tr>

                            <tr valign="middle">
                                <td class="loginText" align="right">Password:</td>
                                <td align="left"><input maxlength="15" size="12" name="<%=Constants.PASSWORD%>" type="Password" onKeyPress="submitEnter(event)" value=""></td>
                                <td class="loginText"><a href="Javascript:document.login.submit();" class="loginText">Login&#160;&gt;</a></td>
                            </tr>
                        </table>
                        </screen:form>
                    </td>
                </tr>           
            </table>
            <p><br></p>
            <p><br></p>   
            <p><br></p>   
        </td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
        <td width="10"><img src="/i/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="includes/foot.jsp" />
<!-- Footer ends -->

</body>
</html>
