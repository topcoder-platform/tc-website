<%@ taglib uri="/registration-taglib.tld" prefix="reg" %>
<jsp:useBean id="student" type="com.topcoder.web.hs.model.StudentRegistrationBean" scope="request"/>
<%@ include file="head.inc" %>
<h3>Registration for Students Confirmation page</h3>
<BR>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="module" VALUE="StudentRegistration">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="confirm">
 <INPUT TYPE="hidden" NAME="first_name" VALUE="<jsp:getProperty name="student" property="FirstName"/>">
 <INPUT TYPE="hidden" NAME="last_name" VALUE="<jsp:getProperty name="student" property="LastName"/>">
 <INPUT TYPE="hidden" NAME="state_code" VALUE="<jsp:getProperty name="student" property="StateCode"/>">
 <INPUT TYPE="hidden" NAME="school_id" VALUE="<jsp:getProperty name="student" property="SchoolId"/>">
 <INPUT TYPE="hidden" NAME="handle" VALUE="<jsp:getProperty name="student" property="Handle"/>">
 <INPUT TYPE="hidden" NAME="change_password" VALUE="<jsp:getProperty name="student" property="ChangePassword"/>">
 <INPUT TYPE="hidden" NAME="password" VALUE="<jsp:getProperty name="student" property="Password"/>">
 <INPUT TYPE="hidden" NAME="confirm_password" VALUE="<jsp:getProperty name="student" property="ConfirmPassword"/>">
 <INPUT TYPE="hidden" NAME="email" VALUE="<jsp:getProperty name="student" property="Email"/>">
 <INPUT TYPE="hidden" NAME="confirm_email" VALUE="<jsp:getProperty name="student" property="ConfirmEmail"/>">
 <INPUT TYPE="hidden" NAME="editor_id" VALUE="<jsp:getProperty name="student" property="EditorId"/>">
 <INPUT TYPE="hidden" NAME="language_id" VALUE="<jsp:getProperty name="student" property="LanguageId"/>">
 <INPUT TYPE="hidden" NAME="terms" VALUE="true">
 <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" ALIGN="center">
  <TR VALIG="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Contact Information</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">First Name&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="FirstName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="LastName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=student.getSchoolId()%>" list="<%=student.getSchoolList()%>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">State&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=student.getStateCode()%>" list="<%=student.getStateList()%>"/></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Handle &amp; Email</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Handle&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="Handle"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Email&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="student" property="Email"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Editor &amp; Language</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Editor&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=student.getEditorId()%>" list="<%=student.getEditorList()%>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Language&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=student.getLanguageId()%>" list="<%=student.getLanguageList()%>"/></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD ALIGN="right" VALIGN="middle"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
    <INPUT TYPE="button" ONCLICK="Javascript:backStudent();" NAME="backButton" VALUE="Back">
    <INPUT TYPE="button" ONCLICK="Javascript:confirmStudent();" NAME="confirmButton" VALUE="Confirm">
   </TD>
  </TR>
 </TABLE>
 <SCRIPT type="text/javascript">
  function backStudent() {
   document.regForm.cmd.value="";
   document.regForm.submit();
  }
  function confirmStudent() {
   document.regForm.submit();
  }
 </SCRIPT>
</FORM>
<%@ include file="tail.inc" %>

