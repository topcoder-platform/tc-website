<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:template match="/">
<html>

<head>
<title>Recover Password</title>



<xsl:call-template name="CSS"/>



</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="document.frmRecoverPassword.FirstName.focus()">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
   <td colspan="2" valign="top">




<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="TopLoggedIn"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="TopLoggedOut"/>
  </xsl:otherwise>
</xsl:choose>




  </td>
  <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
 </tr> 
<tr>
 <td valign="top">


<table width="156" cellpadding="0" cellspacing="0" border="0">



<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="Home_LO"/>
  </xsl:when>
</xsl:choose>



      <tr>
        <td valign="top">
          <xsl:call-template name="LeftSideNavBarForm"/>
        </td>
      </tr>
    </table>

  </td>
  <td valign="top">



<SCRIPT TYPE="text/javascript"><![CDATA[
  var frmRecover;
  var authorizedSubmit=false;
  function doSubmitRecover() {if(doCheckRecover())doSubmit()}
  function doCheckRecover() {
    if(frmRecover.FirstName.value==""){alert("Please enter a First Name.");frmRecover.FirstName.focus();return false;}
    if(frmRecover.LastName.value==""){alert("Please enter a Last Name.");frmRecover.LastName.focus();return false;}
    if(frmRecover.Email.value==""){alert("Please enter an Email Address.");frmRecover.Email.focus();return false;}
    setBrowser();
    return true;
  }
  function sendMail() {frmRecover.Command.value="MailActivation";setBrowser();doSubmit(); }
  function setBrowser() {
    nav=window.navigator;
    frmRecover.AppName.value=nav.appName;
    frmRecover.AppVersion.value=nav.appVersion;
    frmRecover.UserAgent.value=nav.userAgent;
  }
  function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     doSubmitRecover();
     return false;
    } else return true;
  }
  function doSubmit(){authorizedSubmit=true;frmRecover.submit();}
]]></SCRIPT>

<table width="619" cellspacing="0" cellpadding="0" border="0">
<tr>
  <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" /></td>
</tr>
<tr>
  <td width="619" align="left"><img src="/images/recover_password.gif" width="619" height="20" /></td>
</tr>
<tr>
  <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="3" /></td>
</tr>
<tr>
  <td valign="top"><font face="arial, verdana, helvetica, sans-serif" color="#ffffff" size="2">
    Have you forgotten your password?  Enter the 
    information below.  We will immediately send your password to you via Email.
  </font></td>
</tr>
</table><br/>
 

<center>
<table CELLPADDING="2" CELLSPACING="0" BORDER="0">
 <form name="frmRecoverPassword" METHOD="post" doSubmit="return authorizedSubmit">
 <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute>
 <INPUT TYPE="HIDDEN" NAME="Task" VALUE="authentication"/>
 <INPUT TYPE="HIDDEN" NAME="Command" VALUE="SendPassword"/>
 <INPUT TYPE="HIDDEN" NAME="LoggedIn">
   <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
 </INPUT>
 <INPUT TYPE="HIDDEN" NAME="AppName" VALUE=""/>
 <INPUT TYPE="HIDDEN" NAME="AppVersion" VALUE=""/>
 <INPUT TYPE="HIDDEN" NAME="UserAgent" VALUE=""/>
<SCRIPT TYPE="text/javascript"><![CDATA[frmRecover=document.frmRecoverPassword]]></SCRIPT>
 <tr>
   <td><img border="0" height="5" src="/images/spacer.gif" width="1"/></td>
 </tr>
 <tr>
   <td align="right">  
     <font face="arial, verdana, helvetica, sans-serif" color="#ffffff" size="2">First Name: </font>
   </td>
   <td>
     <INPUT TYPE="text" NAME="FirstName" SIZE="20" MAXLENGTH="30">
     <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/FirstName"/></xsl:attribute>
     </INPUT>
   </td>
 </tr>
 <tr>
   <td align="right">
     <font face="arial, verdana, helvetica, sans-serif" color="#ffffff" size="2">Last Name: </font>
   </td>
   <td>
     <INPUT TYPE="text" NAME="LastName" SIZE="20" MAXLENGTH="30">
     <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/LastName"/></xsl:attribute>
     </INPUT>
   </td>
 </tr>
 <tr>
   <td align="right">
     <font face="arial, verdana, helvetica, sans-serif" color="#ffffff" size="2">Email Address: </font>
   </td>
   <td>
     <INPUT TYPE="text" NAME="Email" SIZE="20" MAXLENGTH="40" onKeyPress="return submitEnter(event)">
     <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/Email"/></xsl:attribute>
     </INPUT>
   </td>
 </tr>
 </form>
 <tr>
   <td colspan="2">
     <img alt="" border="0" height="5" src="/images/spacer.gif" width="1"/>
   </td>
 </tr>
 <tr>
   <td colspan="2">
     <p>
       <font face="arial, verdana, helvetica, sans-serif" color="#ffffff" size="1">
         (This must be the same address you used when you registered.)
       </font>
     </p>
     <img alt="" border="0" height="1" src="/images/spacer.gif" width="300"/>
   </td>
 </tr>
 <tr>
   <td><br/></td>
   <td>
     <a href="JavaScript:doSubmitRecover()">
       <img src="/images/submit_button.gif" width="70" height="19" border="0"/>
     </a>
   </td>
 </tr>
</table>
</center> 
 

   </td>
   <td width="100%"><img src="/images/spacer.gif" width="1" height="1"/></td>
 </tr>
 <tr>
   <td></td>
   <td>
     <br/>
     <xsl:choose>
       <xsl:when test="/TC/RECOVER_PASSWORD_ERROR/UserNotFound='true'">
         <font face="arial, verdana, helvetica, sans-serif" color="#ff0000" size="2">
           Sorry, there was no user found with this first name, last name and email address.<br/>
           No email was sent.
         </font>
       </xsl:when>
       <xsl:otherwise><br/><br/></xsl:otherwise>
     </xsl:choose>
   </td>
 </tr>
</table> 

<xsl:call-template name="Bottom"/>

</body>

</html>
</xsl:template>
</xsl:stylesheet>
