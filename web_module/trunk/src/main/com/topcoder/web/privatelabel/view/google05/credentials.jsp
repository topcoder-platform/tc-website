<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google05.css"/>
<title>Google Code Jam 2005, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


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
         <div class=greenBigBox>

         <!-- Tab bar links-->
         <div align=center>
         <jsp:include page="links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

			<br><br>
			<div style="float: left">
			<span class="bigTitle">Registration</span>
         </div>
			<div style="float: right">
			<jsp:include page="right_reg.jsp" />
			</div>
			<br><br>

         Please enter your email address below.  You should receive an email shortly with your username and password.
         <br><br>

			<table cellpadding="0" cellspacing="5" class="bodyText" align="center" width="100%" border="0">
			<form action="" method="GET" name="regForm">
            <tr>
                <td colspan="2" class="errorText" align="center">
                </td>
            </tr>
            <tr>
                <td align="right" width="40%" nowrap>
                    Email Address
                </td>
                <td width="60%">
                    <input type="text" name="" size="30" maxlength="100" onKeyPress="" />
                </td>
            </tr>
            <tr><td></td><td><a href="javascript: document.regForm.submit();">Send Email</a></td></tr>
            </form>
		</table>


         <br><br>
         To find out more detailed information about the Google Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google05&d2=rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>