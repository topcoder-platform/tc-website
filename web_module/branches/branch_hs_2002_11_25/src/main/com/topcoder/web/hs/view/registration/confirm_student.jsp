<%@ page errorPage="../home/error.jsp" %>
<jsp:useBean id="student" type="com.topcoder.web.hs.model.StudentRegistrationBean" scope="request"/>
<%@ include file="head.inc" %>
<P><B>Registration for Students Confirmation page</B></P>
<BR>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="first_name" VALUE="<jsp:getProperty name="student" property="FirstName"/>">
 <INPUT TYPE="hidden" NAME="last_name" VALUE="<jsp:getProperty name="student" property="LastName"/>">
 <INPUT TYPE="hidden" NAME="state" VALUE="<jsp:getProperty name="student" property="StateCode"/>">
 <INPUT TYPE="hidden" NAME="school" VALUE="<jsp:getProperty name="student" property="SchoolId"/>">
 <INPUT TYPE="hidden" NAME="handle" VALUE="<jsp:getProperty name="student" property="Handle"/>">
 <INPUT TYPE="hidden" NAME="password" VALUE="<jsp:getProperty name="student" property="Password"/>">
 <INPUT TYPE="hidden" NAME="email" VALUE="<jsp:getProperty name="student" property="Email"/>">
 <INPUT TYPE="hidden" NAME="editor" VALUE="<jsp:getProperty name="student" property="EditorId"/>">
 <INPUT TYPE="hidden" NAME="language" VALUE="<jsp:getProperty name="student" property="LanguageId"/>">
 <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" ALIGN="center">
  <TR VALIG="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16" BACKGROUND="/i/hs/inside_heading_bg">&nbsp;Contact Information</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">First Name&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="FirstName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="LastName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<jsp:getProperty name="student" property="SchoolId"/>" list="<jsp:getProperty name="student" property="SchoolList"/>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">State&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<jsp:getProperty name="student" property="StateCode"/>" list="<jsp:getProperty name="student" property="StateList"/>"/></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16" BACKGROUND="/i/hs/inside_heading_bg">&nbsp;Handle &amp; Password</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Handle&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="Handle"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Email&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="Email"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Editor &amp; Language</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Editor&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<jsp:getProperty name="student" property="EditorId"/>" list="<jsp:getProperty name="student" property="EditorList"/>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Language&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<jsp:getProperty name="student" property="LanguageId"/>" list="<jsp:getProperty name="student" property="LanguageList"/>"/></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD ALIGN="right" VALIGN="middle"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
    <INPUT TYPE="button" ONCLICK="regForm.submit()" NAME="confirmButton" VALUE="Confirm">
   </TD>
  </TR>
 </TABLE>
</FORM>
<%@ include file="tail.inc" %>

