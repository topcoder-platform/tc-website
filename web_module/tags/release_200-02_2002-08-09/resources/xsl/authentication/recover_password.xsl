<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="body.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <TITLE>TopCoder Home</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <xsl:call-template name="Preload"/>
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>


        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
              <!-- Global Seconday Nav Ends -->
              <!-- Left Column Include Begins -->
              <xsl:call-template name="BodyLeft"/>
              <!-- Left Column Include Ends -->
              <!-- Global Seconday Nav Ends -->
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
            <!-- Gutter Ends -->
      <!-- Body Area -->
      <!-- Center Column Begins -->
      <TD class="statTextBig" width="100%" bgcolor="#CCCCCC" valign="top">
        <IMG src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">login</xsl:with-param>
  <xsl:with-param name="title">&#160;Recover Password</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
            <TR>
              <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
              <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="380" HEIGHT="1" BORDER="0"/><BR/>
                    <P CLASS="statText">
                      Have you forgotten your password?  Enter the
                      information below.  We will immediately send your password to you via Email.
                    </P>


<SCRIPT TYPE="text/javascript"><![CDATA[
  var frmRecover;
  var authorizedSubmit=false;
  function doSubmitRecover() {if(doCheckRecover())doSubmit()}
  function doCheckRecover() {
    if(frmRecover.FirstName.value==""){alert("Please enter a First Name.");frmRecover.FirstName.focus();return false;}
    if(frmRecover.LastName.value==""){alert("Please enter a Last Name.");frmRecover.LastName.focus();return false;}
    if(frmRecover.Email.value==""){alert("Please enter an Email Address.");frmRecover.Email.focus();return false;}
    return true;
  }
  function sendMail() {frmRecover.Command.value="MailActivation";doSubmit(); }
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


                    <CENTER>
                      <TABLE CELLPADDING="2" CELLSPACING="0" BORDER="0">
                       <FORM NAME="frmRecoverPassword" METHOD="post" doSubmit="return authorizedSubmit">
                       <xsl:attribute name="ACTION">/index</xsl:attribute>
                       <INPUT TYPE="HIDDEN" NAME="t" VALUE="authentication"/>
                       <INPUT TYPE="HIDDEN" NAME="c" VALUE="send_password"/>
                       <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                         <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
                       </INPUT>
                       <SCRIPT TYPE="text/javascript"><![CDATA[frmRecover=document.frmRecoverPassword]]></SCRIPT>
                       <TR>
                         <TD><IMG BORDER="0" HEIGHT="5" SRC="/i/clear.gif" WIDTH="1" ALT=""/></TD>
                       </TR>
                       <TR>
                         <TD ALIGN="right" class="statText">First Name:</TD>
                         <TD>
                           <INPUT TYPE="text" NAME="FirstName" SIZE="20" MAXLENGTH="30">
                             <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/FirstName"/></xsl:attribute>
                           </INPUT>
                         </TD>
                       </TR>
                       <TR>
                         <TD class="statText" ALIGN="right">Last Name:</TD>
                         <TD>
                           <INPUT TYPE="text" NAME="LastName" SIZE="20" MAXLENGTH="30">
                             <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/LastName"/></xsl:attribute>
                           </INPUT>
                         </TD>
                       </TR>
                       <TR>
                         <TD class="statText" ALIGN="right">Email Address:</TD>
                         <TD>
                           <INPUT TYPE="text" NAME="Email" SIZE="20" MAXLENGTH="40" onKeyPress="return submitEnter(event)">
                             <xsl:attribute name="VALUE"><xsl:value-of select="/TC/RECOVER_PASSWORD_ERROR/Email"/></xsl:attribute>
                           </INPUT>
                         </TD>
                       </TR>
                       </FORM>
                       <TR>
                         <TD COLSPAN="2"><IMG ALT="" BORDER="0" HEIGHT="5" SRC="/images/clear.gif" WIDTH="1"/></TD>
                       </TR>
                       <TR>
                         <TD><BR/></TD>
                         <TD class="statText"><A HREF="JavaScript:doSubmitRecover()" class="statText">Submit &gt;&gt;</A></TD>
                       </TR>
                       <xsl:if test="/TC/RECOVER_PASSWORD_ERROR/UserNotFound='true'">
                         <TR>
                           <TD class="statText" COLSPAN="2">
                             <b>Sorry, there was no user found with this first name, last name and email address.  
                             No email was sent.</b>
                           </TD>
                         </TR>
                       </xsl:if>
                       <TR>
                         <TD class="statText" COLSPAN="2">
                           (This must be the same information you used when you registered.)
                           <IMG ALT="" BORDER="0" HEIGHT="1" SRC="/images/clear.gif" WIDTH="300"/>
                         </TD>
                       </TR>
                      </TABLE>
                    </CENTER>
                    

                    <P><BR/></P>
                  </TD>
                  <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR> 
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
              </TABLE>
            </TD>
            <!-- Center Column Ends -->
            <!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/></TD>
            <!-- Right Column Include Begins -->
            <!-- Gutter -->
              <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"/></TD>
              <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1"/><BR/>
            <!-- Right Column Include Begins -->
            <xsl:call-template name="BodyRight"/>
            <!-- Right Column Include Ends -->
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>


        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
