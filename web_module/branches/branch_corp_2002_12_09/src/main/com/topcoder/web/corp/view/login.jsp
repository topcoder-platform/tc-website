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

 <TD valign="top" bgcolor="#CCCCCC" width="100%" class="bodyText">
   <IMG BORDER="0" VSPACE="5" HEIGHT="1" width="400" src="/i/clear.gif"><BR>
      <FORM NAME="login" METHOD="POST" action="<%=appContext%>/?module=login">
        <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="50%" ALIGN="left">
           <TR>
              <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right">User Name:&#160;&#160;</TD>
              <TD HEIGHT="20" VALIGN="TOP">
                <tc-webtag:textInput name="handle" maxlength="15" size="12"/>
              </TD>
              <TD>&#160;<b>
                <tc-webtag:error refname="handle" text="Login name must not be empty"/>
              </b><TD>
           </TR>
           <TR>
              <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right">Password:&#160;&#160;</TD>
              <TD HEIGHT="20" VALIGN="TOP">
                 <tc-webtag:textInput name="passw" passw="true" maxlength="15" size="12"/>
              </TD>
              <TD>&#160;<b>
               <tc-webtag:error refname="passw" text="Login/password combination entered is invalid"/>
              </b></TD>
           </TR>
           <TR>
              <TD>&#160;</TD>
              <TD CLASS="statTextBig" VALIGN="top" colspan="2">&#160;
                 <INPUT NAME="submit" TYPE="submit" VALUE="Log me in"/>
              </TD>
           </TR>
        </TABLE>
        <INPUT NAME="module" TYPE="hidden" VALUE="login"/>
     </FORM>
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
