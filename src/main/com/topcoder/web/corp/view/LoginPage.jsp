<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.request.Login,
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
                <tr valign="middle">
                <form method="post" name="frmLogin" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td class="statText" align="center">

<%
    String nextpage = (String)request.getAttribute(Login.KEY_DESTINATION_PAGE);
    if(nextpage==null) nextpage = request.getParameter(Login.KEY_DESTINATION_PAGE);
    if(nextpage==null) nextpage = request.getHeader("Referer");
    if(nextpage==null) nextpage = "http://"+request.getServerName();
    String message = (String)request.getAttribute("message");
    if(message==null) message = "";
    String username = request.getParameter(Login.KEY_USER_HANDLE);
    if(username==null) username = "";
%>

<%--<form name="loginform" action="<%= "https://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">--%>
<form name="loginform" method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
<input type="hidden" name="<%=Login.KEY_DESTINATION_PAGE%>" value="<%= nextpage %>">
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
   <TD CLASS="bodyText"><font size="+1" color="#ff2010"><%= message %></font></TD>
</TR>
</TABLE>
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
    <TD CLASS="bodyText"><B>User Name</B><BR><INPUT TYPE="text" NAME="<%=Login.KEY_USER_HANDLE%>" VALUE="<%= username %>" SIZE="25" onKeyPress="submitEnter(event,document.loginform)"></TD>
</TR>
<TR>
    <TD CLASS="bodyText"><B>Password</B><BR><INPUT TYPE="password" NAME="<%=Login.KEY_USER_PASS%>" SIZE="25" onKeyPress="submitEnter(event,document.loginform)"><BR><B><A HREF="javascript:document.loginform.submit()" CLASS="statTextBig">Login&gt;&gt;</A></B></TD>
</TR>
</TABLE>
</form>
<script>
  document.loginform.<%=username.equals("")?Login.KEY_USER_HANDLE:Login.KEY_USER_PASS%>.focus();
</script>




                    </td>
                    </form>
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

