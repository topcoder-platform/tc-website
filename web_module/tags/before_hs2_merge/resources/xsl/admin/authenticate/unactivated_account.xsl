<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="login_body.xsl"/>
<xsl:template match="/">
<html>

<head>
<title>Invalid Login</title>



<xsl:call-template name="CSS"/>



</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

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

  

<xsl:call-template name="LoginForm"/>

<table width="619" cellspacing="0" cellpadding="0" border="0">
  <tr>
    <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" /></td>
  </tr>
  <tr>
    <td width="619" align="left"><img src="/images/unactivated_account.gif" width="619" height="20" /></td>
  </tr>
</table>
<br/>
<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td colspan="2" align="center">
    <table>
      <tr>
        <td width="490" align="left"><img src="/images/whatnow_header.gif" width="610" height="20" /></td>
      </tr>
      <tr>
        <td>
          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
          <ul>      
            <li><a href="Javascript:sendMail()">Resend</a> my activation code to my email address.</li>
            <SCRIPT type="text/javascript">setContactSubject('4')</SCRIPT>
            <li><a href="JavaScript:doSubmitNavBar('contact','')">Contact Us.</a></li>
            <li>
              Enter activation code from email:
              <FORM NAME="frmActivate" METHOD="POST">
                <xsl:attribute name="ACTION">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute>
                <INPUT TYPE="HIDDEN" NAME="Task" VALUE="authentication"/>
                <INPUT TYPE="HIDDEN" NAME="Command" VALUE="SubmitLogin"/>
                <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                  <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
                </INPUT>
                <INPUT TYPE="HIDDEN" NAME="AppName" VALUE=""/>
                <INPUT TYPE="HIDDEN" NAME="AppVersion" VALUE=""/>
                <INPUT TYPE="HIDDEN" NAME="UserAgent" VALUE=""/>
                <INPUT TYPE="text" NAME="ActivationCode" SIZE="15" MAXLENGTH="50"/>
                <img src="/images/spacer.gif" width="10" height="19" border="0"/>
                <a href="JavaScript:document.frmActivate.submit()">
                  <img src="/images/submit_button.gif" width="70" height="19" border="0"/>
                </a>
              </FORM>
            </li>
          </ul>
          </font>
        </td>
      </tr>
    </table>
  </td>
 </tr>
</table> 
     		
   
  
  </td>
  
    <td width="100%"><img src="/images/spacer.gif" width="1" height="1"/></td>

 </tr>
</table> 

<xsl:call-template name="Bottom"/>

</body>

</html>
</xsl:template>
</xsl:stylesheet>
