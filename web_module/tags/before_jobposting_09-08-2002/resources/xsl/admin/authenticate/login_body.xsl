<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="LoginForm">

  <form name="frmLogin" method="post" onSubmit="return doCheckLogin()">
  <xsl:attribute name="action">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
  <input type="hidden" name="Task" value="authentication"/>
  <input type="hidden" name="Command" value="SubmitLogin"/>
  <input type="hidden" name="LoggedIn">
    <xsl:attribute name="value"><xsl:value-of select="/ADMIN/LoggedIn"/></xsl:attribute>
  </input>
  <input type="hidden" name="AppName" value=""/>
  <input type="hidden" name="AppVersion" value=""/>
  <input type="hidden" name="UserAgent" value=""/>

  <SCRIPT type="text/javascript"><![CDATA[
    var login
    login=document.frmLogin
    function doCheckLogin() {
      if(login.UserName.value==""){alert("Please enter a Handle.");login.UserName.focus();return false;}
      if(login.Password.value==""){alert("Please enter a Password.");login.Password.focus();return false;}
      setBrowser();
      return true; 
    }
    function sendMail() {login.Command.value="MailActivation";setBrowser();login.submit(); }
    function setBrowser() {
      nav=window.navigator;
      login.AppName.value=nav.appName;
      login.AppVersion.value=nav.appVersion;
      login.UserAgent.value=nav.userAgent;
    }
    function setFocus() {
      login.UserName.focus()
    }
  ]]></SCRIPT>
  
  <table cellspacing="0" cellpadding="0" border="0" width="619">
    <tr>
      <td valign="top"><img src="/images/spacer.gif" width="132" height="5" alt="" /></td>
      <td valign="top"><img src="/images/spacer.gif" width="19" height="5" alt="" /></td>
      <td valign="top"><img src="/images/spacer.gif" width="468" height="5" alt="" /></td>
    </tr>
    <tr>
      <td align="left" colspan="3">
        <img src="/images/spacer.gif" width="2" height="1" alt="" />
        <img src="/images/login_header.gif" width="66" height="20" alt="" />
      </td>
    </tr>
    <tr>
      <td colspan="3"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
    </tr>
    <tr>
      <td align="left">
        <table width="132" cellspacing="0" cellpadding="0" border="0">
          <tr>
            <td colspan="3"><img src="/images/login_top.gif" width="132" height="20"  alt=""/></td>
          </tr>
          <tr>
            <td rowspan="3" height="80"><img src="/images/login_left.gif" width="8" height="80"  alt=""/></td>
            <td valign="top" bgcolor="#990000" height="33">
              <input type="text" name="UserName" size="12" maxlength="15">
                <xsl:attribute name="value">
                  <xsl:value-of select="/ADMIN/ERROR/Authentication/LastUserName"/>
                </xsl:attribute>
              </input>
            </td>
            <td rowspan="3" height="80"><img src="/images/login_right.gif" width="8" height="80"  alt=""/></td>
          </tr>
          <tr>
            <td bgcolor="#990000" height="14" valign="top">
              <img src="/images/login_pass.gif" width="116" height="14" alt="" />
            </td>
          </tr>
          <tr>
            <td valign="top" bgcolor="#990000" height="33">


              <input type="password" name="Password" size="12" maxlength="15">
                <xsl:choose>
                  <xsl:when test="contains(/ADMIN/Browser/UserAgent, 'Mac') or contains(/ADMIN/Browser/AppName, 'Microsoft')"></xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="onChange">if(doCheckLogin())document.frmLogin.submit()</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:attribute name="value">
                  <xsl:value-of select="/ADMIN/ERROR/Authentication/LastPassword"/>
                </xsl:attribute>
              </input>


            </td>
          </tr>
          <tr>
            <td colspan="3" height="30">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr>
                  <td><img src="/images/login_l_bottom.gif" width="100" height="30" alt="" /></td>
                  <td>


                    <xsl:choose>
                      <xsl:when test="contains(/ADMIN/Browser/UserAgent, 'Mac')">
                        <a href="JavaScript:document.frmLogin.submit()">
                          <img src="/images/login_r_bottom.gif" width="32" height="30" border="0"/>
                        </a>
                      </xsl:when>
                      <xsl:otherwise>  
                        <input type="image" src="/images/login_r_bottom.gif" width="32" height="30" align="absmiddle" border="0" alt=""/>
                      </xsl:otherwise>  
                    </xsl:choose>


                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td valign="top"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
    </tr>
  </table>
  </form>
  
</xsl:template>

</xsl:stylesheet>



