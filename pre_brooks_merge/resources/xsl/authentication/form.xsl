<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="Form">

                        <table border="0" cellpadding="0" cellspacing="5">

                        <form name="frmLogin" method="post" onsubmit="return doCheckLogin()">
                            
                        <xsl:attribute name="action">https://<xsl:value-of select="/TC/Host"/></xsl:attribute>
                        <input type="hidden" name="t" value="authentication"/>
                        <input type="hidden" name="c" value="submit_login"/>
                        
                        <xsl:if test="not(/TC/ErrorURL='')">
                            <input type="hidden" name="errorURL">
                                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/ErrorURL"/></xsl:attribute>
                            </input>
                        </xsl:if>

<SCRIPT type="text/javascript"> // Hide begins

<![CDATA[
  var login;
  var focusSet=false;
  login=document.frmLogin
  function doCheckLogin() {
    if(login.Handle.value==""){alert("Please enter a Handle.");login.Handle.focus();return false;}
    if(login.Password.value==""){alert("Please enter a Password.");login.Password.focus();return false;}
    setBrowser();
    return true;
  }
  function sendMail() {login.Command.value="MailActivation";setBrowser();login.submit(); }
  function setBrowser() {
    nav=window.navigator;
    login.AppName.value=nav.appName;F
    login.AppVersion.value=nav.appVersion;
    login.UserAgent.value=nav.userAgent;
  }
  function setFocus() {
    if(!focusSet) login.Handle.focus()
  }
  function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     login.submit();
     return false;
    } else return true;
  }
]]>

//-- End Hide </SCRIPT>

                            <tr valign="middle">
                                <td class="statTextBig" align="right">Handle:</td>
                                <td colspan="2" align="left"><input class="dropdown" maxlength="15" size="12" name="Handle" type="TEXT" value="" onkeypress="submitEnter(event)"/></td>
                            </tr>
                  
                            <tr valign="middle">
                                <td class="statTextBig" align="right">Password:</td>
                                <td align="left"><input class="dropdown" maxlength="15" size="12" name="Password" type="Password" value="" onkeypress="submitEnter(event)"/></td>
                                <td class="statTextBig" align="left"><A href="Javascript:login.submit()" class="statTextBig">Login&#160;&gt;</A></td>
                            </tr></form>
                        </table>

</xsl:template>
</xsl:stylesheet>

