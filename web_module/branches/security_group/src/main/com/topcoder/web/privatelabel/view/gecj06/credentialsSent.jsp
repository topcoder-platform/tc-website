<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gecj06.css"/>
<title>Google Code Jam Europe 2006, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gecj06/logo_CodeJamEurope.gif" alt="Google Code Jam Europe logo"></td>
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
         <div style="float: left">
         <span class="bigTitle">Registration</span>
         </div>
         <div style="float: right">
         <jsp:include page="right_reg.jsp" />
         </div>
         <br><br>

Your login credentials have been sent to the provided email address.


         <br><br><br><br><br><br><br><br><br><br>
         To find out more detailed information about Google Code Jam Europe 2006, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=gecj06&d2=rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>