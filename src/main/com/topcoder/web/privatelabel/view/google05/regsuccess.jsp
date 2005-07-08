<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google05.css"/>
<title>Google Code Jam 2005, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>

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

<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2005/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class="greenBigBox">

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="registration"/>
			</jsp:include>
			</div>

<br><br>
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
   <tr>
      <td valign="top" colspan="2">
      <span class="bigTitle">Registration Successful!</span>
      <br><br>
      </td>
      <td valign="top" rowspan="2"><jsp:include page="right_reg.jsp" /></td>
   </tr>
   <tr>
      <td valign="top">
      <table cellpadding="0" cellspacing="0" border="0" align="left" style="margin-right: 20px;">
         <tr><td class="bcOff">General</td></tr>
         <tr><td class="bcOff">Demographics</td></tr>
         <tr><td class="bcOff">Confirm</td></tr>
         <tr><td class="bcOn">Success</td></tr>
         <tr><td class="bcOff">Activation</td></tr>
      </table>
      </td>
      <td valign="top" width="100%">

<b>If you converted your TopCoder / Code Jam 2003 or 2004 account:</b><br>
Your account is active.<br><br>

<b>For new accounts:</b><br>
In order to be eligible to compete in the Google Code Jam 2005,
you must activate your account by following the directions sent to the email
address provided during registration. You <u>will not</u> be able to compete if you
do not activate your account.

<br><br>

Spend time in the Practice Rooms prior to the Qualification Round by clicking the Competition Arena tab above.<br><br>

If you encounter any problems, please contact us at <A href="mailto:googlecodejam@topcoder.com">googlecodejam@topcoder.com</A>.<br><br>

Good luck to you in the Arena!
</font></p>

			<br><br>
			To find out more detailed information about the Google Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google05&d2=rules">Terms and Conditions</a>.
         <br><br><br><br><br>
         </td>
      </tr>
   </table>
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>