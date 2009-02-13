<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder | Password</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.frmPass.submit();
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
               Have you forgotten your password?  Enter the
               information below.  We will immediately send your password to you via Email.
            </p>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <form method="post" name="frmPass" action="/tc">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="PasswordEmail"/>
                    <tr>
                        <td class="errorText">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="bodyText">
                            First Name
                        </td>
                        <td>
                             <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="errorText">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="bodyText">
                            Last Name
                        </td>
                        <td>
                             <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
                        </td>
                    </tr>

                    <tr>
                        <td class="errorText">
                            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%></tc-webtag:errorIterator>
                        </td>
                    </tr>
                    <tr>
                        <td class="bodyText">
                            Email Address
                        </td>
                        <td>
                             <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/>
                        </td>
                    </tr>
                    <tr><td><br/></td></tr>
                    <tr>
                        <td colspan="2" align="center" class="bodyText">
                            <p>(This must be the same information you used when you registered.)</p>
                        </td>
                    </tr>
                    <tr><td><br/></td></tr>
                    <tr>
                        <td colspan="2" align="center" class="bodyText">
                            <a href="JavaScript:document.frmPass.submit()" class="bodyText">Submit</a>
                        </td>
                    </tr>
                </form>
            </table>
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

