<HTML>
  <HEAD>
    <TITLE>Login to Project Tracker</TITLE>
  </HEAD>

<BODY>
<% Object message = request.getAttribute("message"); %>
<%= (message == null ? "" : "<p class='notice'>" + message + "</p>") %>

<FORM NAME="frmLogin" METHOD="POST" ACTION="/ProjectCtxServlet">
<INPUT TYPE="hidden" NAME="pt_page" VALUE="login" />
<TABLE CLASS="layoutTable" ID="loginLayout">
	<TR>
		<TH CLASS="fieldLabel">Handle</TH>
		<TD><INPUT TYPE="text" NAME="handle" SIZE="15" /></TD>
	</TR>
	<TR>
		<TH CLASS="fieldLabel">Password</TH>
		<TD><INPUT TYPE="password" NAME="password" SIZE="15" /></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="formButtons">
		<INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="10">
		<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="Login" />
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>

</HTML>