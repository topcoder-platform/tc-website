<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.request.Login
                 com.topcoder.web.corp.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="includes/left.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <div align="center">
            <p><br></p>
            <p><br></p>
            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Login</td></tr>
                <tr valign="middle"><form method="post" name="frmLogin" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td class="statText" align="center">
                        <input name="module" type="hidden" value="Login"/>
                        <input name="dest" type="hidden" value="<%=request.getParameter("dest")%>"/>

                       <table border="0" cellpadding="3" cellspacing="0" align="center">
                             <tr valign="middle">
                                <td class="loginText"></td>
                                <td class="errorText"><tc-webtag:errorIterator id="err" refname="passw"><%=err%><br></tc-webtag:errorIterator></td>
                                <td class="loginText">&#160</td>
                            </tr>

                           <tr valign="middle">
                                <td class="loginText" align="right">User Name:</td>
                                <td align="left"><tc-webtag:textInput name="handle" maxlength="15" size="12" class="dropdown" onKeyPress="submitEnter(event, document.frmLogin)"/></td>
                                <td class="loginText">&#160</td>
                            </tr>

                            <tr valign="middle">
                                <td class="loginText" align="right">Password:</td>
                                <td align="left"><tc-webtag:textInput name="passw" passw="true" maxlength="15" size="12" class="dropdown" onKeyPress="submitEnter(event, document.frmLogin)"/></td>
                                <td class="loginText"><a href="JavaScript:document.frmLogin.submit()" class="loginText">Login&#160;&gt;</a></td>
                            </tr>

                           <tr valign="middle">
                                <td colspan="3"><img src="/i/clear.gif" width="10" height="3" alt="" border="0"></td>
                            </tr>

                        </table>
                    </td></form>
                </tr>
            </table>
            <p><br></p>
            <p><br></p>   
            <p><br></p>
            </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
