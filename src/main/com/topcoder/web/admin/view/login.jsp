<%@ page contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<title>TopCoder Admin Login</title>
<SCRIPT language="JavaScript"><!--
  function submitEnter(e, loginForm) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     loginForm.submit();
     return false;
    } else return true;
  }
  //--></SCRIPT>
</HEAD>

<BODY BGCOLOR="#999999" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="50" BORDER="0"><BR>
                <FORM METHOD="post" NAME="frmLogin" action="/admin">
                    <INPUT NAME="Task" TYPE="hidden" VALUE="Login"/>
                <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="60%" ALIGN="center">
                  <TR>
                  <TD VALIGN="middle" HEIGHT="14" ALIGN="right"><FONT SIZE="2" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">User Name:</FONT>&#160;&#160;</TD>
                    <TD HEIGHT="20" VALIGN="TOP" COLSPAN="2">
                      <input type="text" name="handle" maxlength="15" size="12" class="dropdown" onKeyPress="submitEnter(event, document.frmLogin)"/>
                    </TD>
                  </TR>
                  <TR>
                  <TD VALIGN="middle" HEIGHT="14" ALIGN="right"><FONT SIZE="2" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">Password:</FONT>&#160;&#160;</TD>
                    <TD HEIGHT="20" VALIGN="TOP">
                      <input type="password" name="pass" maxlength="15" size="12" class="dropdown" onKeyPress="submitEnter(event, document.frmLogin)"/>
                    </TD>
                    <TD CLASS="statTextBig" VALIGN="top">
                      <!--<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="45" BORDER="0"/>-->
                      &#160;&#160;
                      <FONT SIZE="2" COLOR="#FFFFFF" FACE="arial, verdana, tahoma">
                        <A HREF="JavaScript:document.frmLogin.submit()">Login &gt;</A>
                      </FONT>
                    </TD>
                  </TR>
                </TABLE>
              </FORM>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->


</BODY>
</HTML>

