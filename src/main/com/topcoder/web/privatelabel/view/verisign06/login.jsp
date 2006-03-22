<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>VeriSign Internal SRMs, Powered by TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
      <span class="bigTitle">Registration</span>
      <br/><br/>
      Click <A href="/pl/?module=Static&d1=verisign06&d2=reg">here</a> to register for the VeriSign Internal Coding Competitions.
      <br/><br/>
      <b>Update your registration information</b><br>
     
      If you have already registered for the VeriSign Internal Coding Competitions and would like to update your registration information, please login below: 
      <br/><br/>
      <form>
      <table align="center">
        <tr><td class="bodyText" align="left">Handle:</td><td><input name="handle" type="text" size="15" maxlength="30" /></td><td>&#160;</td></tr>
        <tr><td class="bodyText" align="left">Password:</td><td><input name="pword" type="password" size="15" maxlength="30" /></td><td class="bodyText"><a href="">Login&#160;&gt;</a></td></tr>
        <tr><td class="bodyText" colspan="3">&#160;</td></tr>
        <tr><td class="bodyText" colspan="3" align="center"><A href="">Forgot your password?</A></td></tr>
      </table>
      </form>
         
         
         
         
         
         <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

         <br/><br/>

      </td>


         
         
<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
<jsp:include page="right.jsp" />

</td>
      
   </tr>
   
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
