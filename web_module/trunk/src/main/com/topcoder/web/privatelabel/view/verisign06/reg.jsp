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

      Register for the VeriSign Internal SRM:<br><br>
      <form>
      <table>
        <tr><td class="bodyText">First Name:</td><td><input name="first" type="text" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">Last Name:</td><td><input name="last" type="text" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">TopCoder Handle:&#160;</td><td><input name="handle" type="text" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">TopCoder Password:&#160;</td><td><input name="handle" type="password" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">Email:</td><td><input name="email" type="text" size="15" maxlength="40" /></td></tr>
        <tr><td class="bodyText">Title:</td><td><input name="title" type="text" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">Location:</td><td><input name="location" type="text" size="15" maxlength="30" /></td></tr>
        <tr><td class="bodyText">Business Unit:</td><td><select name="unit" size="1">
            <option>VCS</option>
            <option>VSS</option>
            <option>VIS</option>
            <option>O&amp;I</option>
            <option>Corp</option></select></td></tr>
        <tr><td class="bodyText" colspan="2">&#160;</td></tr>
        <tr><td class="bodyText" colspan="2" align="center"><input name="location" type="submit" value="Submit" /></td></tr>
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
