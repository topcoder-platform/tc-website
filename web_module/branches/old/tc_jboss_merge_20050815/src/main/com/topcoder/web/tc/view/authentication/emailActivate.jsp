<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.legacy.reg.bean.Registration"%>
<%@ page contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder | Activation</title>

<jsp:include page="../script.jsp" />

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

<!-- Top begins -->
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="login"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="recover_password"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" class="bodyText"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <p>
              We have determined that there is a problem with the email address currently associated with your account.
              In order to participate in TopCoder, you will have to maintain a valid email address.  Please enter your
              handle, password and valid email address below.  Your account will be updated and an email sent to the
              provided address.  Once you receive the email you will be able to reactivate your account.

                  <form method="post" name="emailForm" action="/tc">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitEmailActivate">
                    <%
                      String message = (String)request.getAttribute("message");
                      if(message==null) message = "";
                      String username = request.getParameter(Login.USER_NAME);
                      if(username==null) username = "";
                     %>

                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                            <tr valign="top">
                                <td class="errorText" colspan="3">
                                    <p><%= message %></p>
                                </td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">Handle:</td>
                                <td colspan="2" align="left"><input type="text" name="<%=Login.USER_NAME%>" value="<%= username %>" maxlength="15" size="15" onKeyPress="submitEnter(event)"></td>
                            </tr>

                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">Password:</td>
                                <td colspan="2" align="left"><input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="15" size="15" onKeyPress="submitEnter(event)"></td>
                            </tr>
                            <tr valign="middle">
                                <td nowrap class="bodyText" align="right">Email:</td>
                                <td nowrap class="bodyText"><input type="text" name="<%=Constants.EMAIL%>" value="" maxlength="100" size="25" onKeyPress="submitEnter(event)"></td>
                                <td nowrap class="bodyText">&#160;&#160;<a href="JavaScript:document.emailForm.submit()" class="bodyText">Send&#160;&gt;</a></td>
                            </tr>


                           <tr><td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
                        </table>


                  </form>

            </p>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0"></td>
<!-- Left Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>