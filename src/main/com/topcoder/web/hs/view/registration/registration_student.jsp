<%@ taglib uri="/registration-taglib.tld" prefix="reg" %>
<jsp:useBean id="student" type="com.topcoder.web.hs.model.StudentRegistrationBean" scope="request"/>
<%@ include file="head.inc" %>
<h3>Registration for Students</h3>
<P>Welcome to TopCoder High School.  TopCoder, Inc., the leader in identifying and promoting computer programming talent through competition, is excited to offer TopCoder High School.  TopCoder's unprecedented competition field is now being offered to high school students who are interested in programming.  Register now for the ability to participate in these competitions.</P>
<P>Please read the Terms of Use and Privacy Policy carefully.  And let me be the first to say, "Good luck to you in the Arena."</P>
<P>Jack Hughes</P>
<P><I>Founder and Chairman, TopCoder, Inc.</I></P>
<P><BR></P>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="module" VALUE="StudentRegistration">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="register">
 <INPUT TYPE="hidden" NAME="change_password" VALUE="true">
 <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" ALIGN="center">
  <TR>
   <TD CLASS="bodyTextBig" WIDTH="150" ALIGN="right" VALIGN="middle"><IMG src="/i/hs/clear.gif" WIDTH="150" HEIGHT="2" BORDER="0"></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">All fields below are required.</TD>
  </TR>
  <TR VALIGN="middle">
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
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="FirstName"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">First Name&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="first_name" VALUE="<jsp:getProperty name="student" property="FirstName"/>" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="LastName"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="last_name" VALUE="<jsp:getProperty name="student" property="LastName"/>" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="StateCode"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">State&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
<reg:listSelect name="state_code" class="dropdown" onChange="Javascript:changeState()" list="<%=student.getStateList()%>" selected="<%=student.getStateCode()%>"/>
   </TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="SchoolId"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
<reg:listSelect name="school_id" class="dropdown" list="<%=student.getSchoolList()%>" selected="<%=student.getSchoolId().toString()%>"/>
   </TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Handle &amp; Password</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="Handle"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD class="bodyText" ALIGN="right" VALIGN="middle">Handle&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="handle" VALUE="<jsp:getProperty name="student" property="Handle"/>" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2"><BR></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="Password"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Password&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="password" VALUE="<jsp:getProperty name="student" property="Password"/>" SIZE="30" MAXLENGTH="15"></TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="top">&nbsp;</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="ConfirmPassword"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Re-type Password&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="confirm_password" VALUE="<jsp:getProperty name="student" property="ConfirmPassword"/>" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" width="1" height="1" border="0"></td>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">Minimum&nbsp;of&nbsp;7&nbsp;characters, maximum of 15</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2"><BR></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="Email"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Email&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="email" VALUE="<jsp:getProperty name="student" property="Email"/>" SIZE="30" MAXLENGTH="100"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="ConfirmEmail"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Re-type Email&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="confirm_email" VALUE="<jsp:getProperty name="student" property="ConfirmEmail"/>" SIZE="30" MAXLENGTH="100"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top"><!--An email will be sent to authorize your account activation.--></TD>
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
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="EditorId"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Editor&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" align="left" valign="middle">
<reg:listSelect name="editor_id" class="dropdown" list="<%=student.getEditorList()%>" selected="<%=student.getEditorId().toString()%>"/>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of editor types. UNIX users comfortable with vi may opt for JVI. Those more familiar with the behavior of Windows Notepad should choose Standard.</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
   <reg:errorIterator id="error" name="LanguageId"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Language&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
<reg:listSelect name="language_id" class="dropdown" list="<%=student.getLanguageList()%>" selected="<%=student.getLanguageId().toString()%>"/>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of programming languages. The language you choose will be your default.</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Terms</TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="bodyText" ALIGN="center" VALIGN="middle">
    <TEXTAREA CLASS="bodyText" ROWS="10" COLS="80" READONLY>
     <jsp:getProperty name="student" property="TermsOfUse"/>
    </TEXTAREA>
   </TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle">
    <reg:errorIterator id="error" name="AgreeTerms"><%=error%><BR></reg:errorIterator>
   </TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="top"></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="center"><INPUT TYPE="checkbox" NAME="terms" VALUE="true">&nbsp;I Agree to the Terms and Conditions stated above</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><BR><BR></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD></TD>
   <TD><IMG src="/i/hs/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
    <!--A HREF="?module=Registration" CLASS="statTextBig" ONCLICK="Javascript:submitForm();"><B>[ continue &gt;</B></A-->
    <INPUT TYPE="button" ONCLICK="Javascript:submitForm();" NAME="continueButton" VALUE="Continue">
   </TD>
  </TR>
 </TABLE>
 <SCRIPT type="text/javascript">
  function changeState() {
   document.regForm.cmd.value="";
   document.regForm.submit();
  }
  function submitForm() {
   document.regForm.submit();
  }
 </SCRIPT>
</FORM>
<P><BR></P>
<%@ include file="tail.inc" %>
