<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="Form">

              <FORM NAME="frmLogin" METHOD="post" onSubmit="return doCheckLogin()">
                <xsl:attribute name="action">https://<xsl:value-of select="/TC/Host"/></xsl:attribute>
                <INPUT TYPE="hidden" NAME="t" VALUE="authentication"/>
                <INPUT TYPE="hidden" NAME="c" VALUE="submit_login"/>
                <xsl:if test="not(/TC/ErrorURL='')">
                  <INPUT TYPE="hidden" NAME="errorURL">
                    <xsl:attribute name="VALUE"><xsl:value-of select="/TC/ErrorURL"/></xsl:attribute>
                  </INPUT>
                </xsl:if>


<SCRIPT type="text/javascript"><![CDATA[
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
]]></SCRIPT>


                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="132" ALIGN="center">
                  <!-- <TR><TD COLSPAN="3"><IMG ALT="" HEIGHT="20" WIDTH="132" SRC="/IMAGES/LOGIN_TOP.GIF"/></TD></TR> -->
                  <!-- <TR>
                    <TD CLASS="statTextBig" VALIGN="top" ROWSPAN="6"><IMG SRC="/i/login_left.gif" ALT="" WIDTH="31" HEIGHT="149" BORDER="0" HSPACE="15"/></TD>
                    <TD CLASS="statTextBig" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD>
                    <TD CLASS="statTextBig" VALIGN="top" ROWSPAN="6"><IMG SRC="/i/login_right.gif" ALT="" WIDTH="32" HEIGHT="149" BORDER="0" HSPACE="15"/></TD>
                  </TR> -->
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Handle:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="15" SIZE="12" NAME="Handle" TYPE="TEXT" VALUE="" onKeyPress="submitEnter(event)"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top" HEIGHT="14">Password:</TD>
                  </TR>
                  <TR>
                    <TD HEIGHT="25" VALIGN="TOP">
                      <INPUT MAXLENGTH="15" SIZE="12" NAME="Password" TYPE="Password" VALUE="" onKeyPress="submitEnter(event)"/>
                    </TD>
                  </TR>
                  <TR>
                    <TD CLASS="statTextBig" VALIGN="top">
                      <!--<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="45" BORDER="0"/>-->
                      <A HREF="Javascript:login.submit()" CLASS="statTextBig">Login &gt;&gt;</A>
                    </TD>
                  </TR>
                </TABLE>
              </FORM>

</xsl:template>

</xsl:stylesheet>

