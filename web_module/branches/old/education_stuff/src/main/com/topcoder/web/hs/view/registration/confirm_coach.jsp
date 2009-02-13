<%@ taglib uri="/registration-taglib.tld" prefix="reg" %>
<jsp:useBean id="coach" type="com.topcoder.web.hs.model.CoachRegistrationBean" scope="request"/>
<%@ include file="head.inc" %>
<h3>Registration for Coaches Confirmation page</h3>
<BR>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="module" VALUE="CoachRegistration">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="confirm">
 <INPUT TYPE="hidden" NAME="first_name" VALUE="<jsp:getProperty name="coach" property="FirstName"/>">
 <INPUT TYPE="hidden" NAME="last_name" VALUE="<jsp:getProperty name="coach" property="LastName"/>">
 <INPUT TYPE="hidden" NAME="state_code" VALUE="<jsp:getProperty name="coach" property="StateCode"/>">
 <INPUT TYPE="hidden" NAME="school_id" VALUE="<jsp:getProperty name="coach" property="SchoolId"/>">
 <INPUT TYPE="hidden" NAME="handle" VALUE="<jsp:getProperty name="coach" property="Handle"/>">
 <INPUT TYPE="hidden" NAME="password" VALUE="<jsp:getProperty name="coach" property="Password"/>">
 <INPUT TYPE="hidden" NAME="confirm_password" VALUE="<jsp:getProperty name="coach" property="ConfirmPassword"/>">
 <INPUT TYPE="hidden" NAME="email" VALUE="<jsp:getProperty name="coach" property="Email"/>">
 <INPUT TYPE="hidden" NAME="confirm_email" VALUE="<jsp:getProperty name="coach" property="ConfirmEmail"/>">
 <INPUT TYPE="hidden" NAME="editor_id" VALUE="<jsp:getProperty name="coach" property="EditorId"/>">
 <INPUT TYPE="hidden" NAME="language_id" VALUE="<jsp:getProperty name="coach" property="LanguageId"/>">
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="coach" property="FirstName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="coach" property="LastName"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=coach.getSchoolId()%>" list="<%=coach.getSchoolList()%>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">State&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=coach.getStateCode()%>" list="<%=coach.getStateList()%>"/></TD>
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="coach" property="Handle"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Email&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="coach" property="Email"/></TD>
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=coach.getEditorId()%>" list="<%=coach.getEditorList()%>"/></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Language&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><reg:listText value="<%=coach.getLanguageId()%>" list="<%=coach.getLanguageList()%>"/></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD ALIGN="right" VALIGN="middle"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
    <INPUT TYPE="button" ONCLICK="Javascript:backCoach();" NAME="backButton" VALUE="Back">
    <INPUT TYPE="button" ONCLICK="Javascript:confirmCoach();" NAME="confirmButton" VALUE="Confirm">
   </TD>
  </TR>
 </TABLE>
 <SCRIPT type="text/javascript">
  function backCoach() {
   document.regForm.cmd.value="";
   document.regForm.submit();
  }
  function confirmCoach() {
   document.regForm.submit();
  }
 </SCRIPT>
</FORM>
<%@ include file="tail.inc" %>
