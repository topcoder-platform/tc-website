<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.corp.request.Login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Portal</TITLE>
<jsp:include page="script.jsp"/>
</HEAD>
<% String appContext = request.getContextPath(); %> 
<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1"></TD>
      <!-- Gutter Ends -->

<!-- Body Area -->
<TD valign="top" bgcolor="#CCCCCC" width="100%" class="statTextBig"><IMG BORDER="0" VSPACE="5" HEIGHT="1" width="400" src="/i/clear.gif"><BR>
    <TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
        <TR>
            <TD ALIGN="right" WIDTH="11" VALIGN="top"><img BORDER="0" height="8" width="1" src="/i/clear.gif"><BR><IMG BORDER="0" HEIGHT="26" WIDTH="11" SRC="/i/steelblue_top_left1.gif"></TD>
            <TD ALIGN="left" WIDTH="75" VALIGN="bottom"><img BORDER="0" height="8" width="1" src="/i/clear.gif"><BR><IMG BORDER="0" HEIGHT="26" WIDTH="180" SRC="/i/header_login.gif" ALT="login"></TD>
            <TD WIDTH="100%" VALIGN="middle" CLASS="bodyTextBold"><IMG BORDER="0" HEIGHT="1" WIDTH="240" ALT="" SRC="/i/clear.gif"><BR>&nbsp;<SPAN CLASS="bodySubhead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN></TD>
            <TD ALIGN="right" WIDTH="10" VALIGN="top"><IMG BORDER="0" HEIGHT="26" WIDTH="10" ALT="" SRC="/i/clear.gif"></TD>
        </TR>
    </TABLE>
    <TABLE WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif" BGCOLOR="#000033" CELLPADDING="0" CELLSPACING="0" BORDER="0">
        <TR>
            <TD WIDTH="11" VALIGN="top"><IMG BORDER="0" HEIGHT="1" WIDTH="11" ALT="" SRC="/i/clear.gif"></TD>
            <TD WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" COLSPAN="2" CLASS="statTextBig">
                <IMG BORDER="0" HEIGHT="1" WIDTH="380" ALT="" SRC="/i/clear.gif">
                <BR>
                <P CLASS="statText"><SPAN CLASS="statTextBig">Forgot your password?</SPAN><BR>
                If you cannot remember your password <A CLASS="statText" HREF="#">click here</A> and we can send it to you via email.
                </P>
                <P CLASS="statText"><SPAN CLASS="statTextBig">New to TopCoder?</SPAN><BR>Click here to 
                    <A CLASS="statText" HREF="<%=appContext%>/?module=Static&d1=reg&d2=Registration">register now</A>. 
                After you complete the registration process, we will
                send your account activation code via email.
                </P><BR><BR>
                <FORM METHOD="post" NAME="frmLogin" action="<%=appContext%>/?module=Login">
                    <INPUT NAME="module" TYPE="hidden" VALUE="Login"/>
                    <TABLE ALIGN="center" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                        <TR>
                            <TD ALIGN="right" HEIGHT="14" VALIGN="middle" CLASS="statTextBig">Handle:&nbsp;&nbsp;</TD>
                            <TD COLSPAN="2" VALIGN="TOP" HEIGHT="20">
                               <tc-webtag:textInput name="handle" maxlength="15" size="12" class="dropdown"/>
                            </TD>
                        </TR>
                        <TR>
                            <TD ALIGN="right" HEIGHT="14" VALIGN="middle" CLASS="statTextBig">Password:&nbsp;&nbsp;</TD>
                            <TD VALIGN="TOP" HEIGHT="20">
                               <tc-webtag:textInput name="passw" passw="true" maxlength="15" size="12" class="dropdown"/>
                            </TD>
                            <TD VALIGN="top" CLASS="statTextBig">&nbsp;&nbsp;<A CLASS="statTextBig" HREF="JavaScript:document.frmLogin.submit()">Login &gt;</A></TD>
                        </TR>
                    </TABLE>
                </FORM>
                <P><BR></P>
            </TD>
            <TD WIDTH="10" VALIGN="top"><IMG BORDER="0" HEIGHT="1" WIDTH="10" ALT="" SRC="/i/clear.gif"></TD>
        </TR>
        <TR>
            <TD WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif" BGCOLOR="#000033" VALIGN="top" COLSPAN="4"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/clear.gif"></TD>
        </TR>
        <TR>
            <TD ALIGN="right" WIDTH="11" BGCOLOR="#CCCCCC" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="8" WIDTH="11" ALT="" SRC="/i/clear.gif"></TD>
            <TD WIDTH="14" BGCOLOR="#000033" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG BORDER="0" HEIGHT="8" WIDTH="14" ALT="" SRC="/i/table_mid_left2x.gif"></TD>
            <TD WIDTH="100%" BGCOLOR="#000033" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"></TD>
            <TD WIDTH="10" BGCOLOR="#CCCCCC" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"></TD>
        </TR>
        <TR>
            <TD BGCOLOR="#CCCCCC" ALIGN="right" WIDTH="11" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="8" WIDTH="11" ALT="" SRC="/i/clear.gif"></TD>
            <TD WIDTH="14" BGCOLOR="#CCCCCC" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="8" WIDTH="14" ALT="" SRC="/i/table_btm_left2.gif"></TD>
            <TD WIDTH="100%" BGCOLOR="#CCCCCC" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"></TD>
            <TD WIDTH="10" BGCOLOR="#CCCCCC" BACKGROUND="" VALIGN="top"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"></TD>
        </TR>
    </TABLE>
</TD>
<!-- Body Area Ends -->

      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="includes/foot.jsp"/>

</BODY>
</HTML>
