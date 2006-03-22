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

      Confirm your Registration Information:<br><br>
      <form>
      <table align="center">
        <tr><td class="bodyText" align="right">First Name:&#160;</td><td class="bodyText">Trixie</td></tr>
        <tr><td class="bodyText" align="right">Last Name:&#160;</td><td class="bodyText">Jones</td></tr>
        <tr><td class="bodyText" align="right">Handle:&#160;</td><td class="bodyText">trixieJ</td></tr>
        <tr><td class="bodyText" align="right">Password:&#160;</td><td class="bodyText">******</td></tr>
        <tr><td class="bodyText" align="right">Email:&#160;</td><td class="bodyText">trixie@email.com</td></tr>
        <tr><td class="bodyText" align="right">Title:&#160;</td><td class="bodyText">CEO</td></tr>
        <tr><td class="bodyText" align="right">Location:&#160;</td><td class="bodyText">Boston</td></tr>
        <tr><td class="bodyText" align="right">Business Unit:&#160;</td><td class="bodyText">VCS</td></tr>
        <tr><td class="bodyText" colspan="2">&#160;</td></tr>
        <tr><td class="bodyText" align="right"><input name="location" type="submit" value="Edit" /></td>
            <td class="bodyText" align="left"><input name="location" type="submit" value="Submit" /></td></tr>
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
