<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gicj06.css"/>
<title>Google Code Jam India 2006, Powered by TopCoder</title>
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
                <td valign="bottom" align="center"><img border="0" src="/i/events/gicj06/logo_CodeJam.gif" alt="Google Code Jam India logo"></td>
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
      <span class="bigTitle">Update Successful!</span>
      <br><br>
      </td>
      <td valign="top" rowspan="2"><jsp:include page="right_reg.jsp" /></td>
   </tr>
   <tr>
      <td valign="top">
         <div class="regBreadOff">General</div>
         <div class="regBreadOff">Demographics</div>
         <div class="regBreadOff">Confirm</div>
         <div class="regBreadOn">Success</div>
         <div class="regBreadOff">Activation</div>
      </td>
      <td valign="top" width="100%">

          You have successfully updated your account.

         <br><br>
         <br><br><br><br><br>
         </td>
         </tr>
         </table>
         To find out more detailed information about Google Code Jam India 2006, including a list of the prizes, please
          read the <a href="/pl/?&module=Static&d1=gicj06&d2=rules">Terms and Conditions</a>.
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