<%@ page errorPage="../home/error.jsp" %>
<%@ taglib uri="/registration-taglib.tld" prefix="reg" %>
<jsp:useBean id="student" type="com.topcoder.web.hs.model.StudentRegistrationBean" scope="request"/>
<%@ include file="head.inc" %>
<P><B>Registration for Students</B></P>
<P>Welcome to TopCoder HighSchool. Before you register, there are a few things we think you should know: First, and most importantly, TopCoder is a commercial site. We charge sponsors for the right to advertise on our site. This money pays for the operation of the site and the prizes awarded in competitions.</P>
<P>This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much demographic information as possible without making the registration process overly burdensome. Furthermore, we require that you verify the accuracy of the information you provide. This does not mean that sponsors have access to your personal information; they do not. It means that we want to give them as accurate aggregate information as possible.</P>
<P>While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more than just money to our member base. We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.</P>
<P>We are also very strict about the way in which sponsors present themselves to the member base - no annoying banners, pop-ups, etc. We work with sponsors to get their message across in an appealing and non-intrusive manner. Because we take our relationship with sponsors seriously, we believe that they have value to provide.  We ask that you listen to what they have to say.</P>
<P>Please read the Terms of Use and Privacy Policy, and let me be the first to say good luck in the arena.</P>
<P>Jack Hughes</P>
<P><I>Founder and Chairman, TopCoder, Inc.</I></P>
<P><BR></P>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="module" VALUE="StudentRegistration">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="register">
 <INPUT TYPE="hidden" NAME="pick" VALUE="">
 <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="1" ALIGN="center">
  <TR>
   <TD CLASS="bodyTextBig" WIDTH="150" ALIGN="right" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="2" BORDER="0"></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">All fields below are required.</TD>
  </TR>
  <TR VALIGN="middle">
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="first_name" VALUE="<jsp:getProperty name="student" property="FirstName"/>" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="last_name" VALUE="<jsp:getProperty name="student" property="LastName"/>" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">State&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
<reg:listSelect name="state" class="dropdown" onChange="Javascript:changeState()" list="<%=student.getStateList()%>" selected="<%=student.getStateCode()%>"/>
   </TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
<reg:listSelect name="school" class="dropdown" list="<%=student.getSchoolList()%>" selected="<%=student.getSchoolId()%>"/>
   </TD>
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
   <TD class="bodyText" ALIGN="right" VALIGN="middle">Handle&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="handle" VALUE="<jsp:getProperty name="student" property="Handle"/>" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"><BR></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Password&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="password" VALUE="<jsp:getProperty name="student" property="Password"/>" SIZE="30" MAXLENGTH="15"></TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="top">&nbsp;</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Re-type Password&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="confirm_password" VALUE="<jsp:getProperty name="student" property="Password"/>" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" width="1" height="1" border="0"></td>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">Minimum&nbsp;of&nbsp;7&nbsp;characters, maximum of 15</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"><BR></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Email&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="email" VALUE="<jsp:getProperty name="student" property="Email"/>" SIZE="30" MAXLENGTH="100"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Re-type Email&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="confirm_email" VALUE="<jsp:getProperty name="student" property="Email"/>" SIZE="30" MAXLENGTH="100"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account activation.</TD>
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
   <TD COLSPAN="2" CLASS="bodyText" align="left" valign="middle">
<reg:listSelect name="editor" class="dropdown" list="<%=student.getEditorList()%>" selected="<%=student.getEditorId()%>"/>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of editor types. UNIX users comfortable with vi may opt for JVI. Those more familiar with the behavior of Windows Notepad should choose Standard.</TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Default Language&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">
<reg:listSelect name="language" class="dropdown" list="<%=student.getLanguageList()%>" selected="<%=student.getLanguageId()%>"/>
   </TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">The competition applet allows for a choice of programming languages. The language you choose will be your default.</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" HEIGHT="16">&nbsp;Terms</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="errorText" ALIGN="center" VALIGN="middle">
    <TEXTAREA NAME="TermDesc" ROWS="10" COLS="80" READONLY CLASS="bodyText">
<jsp:include page="terms.txt"/>
    </TEXTAREA>
   </TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="top"></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="center"><INPUT TYPE="checkbox" NAME="terms">&nbsp;I Agree to the Terms and Conditions stated above</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><BR><BR></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
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
   if (checkName()&&checkSchool()&&checkHandle()&&
       checkPassword()&&checkEmail()&&checkTerms()) {
    document.regForm.submit();
   }
  }
  function checkName() {
   if (document.regForm.first_name.value.length==0) {
    alert("You must enter your first name");
    document.regForm.firstName.focus();
    return(false);
   }
   if (document.regForm.last_name.value.length==0) {
    alert("You must enter your last name");
    document.regForm.lastName.focus();
    return(false);
   }
   return(true);
  }
  function checkSchool() {
   if (document.regForm.state.selectedIndex==0) {
    alert("Please pick a state");
    document.regForm.state.focus();
    return(false);
   }
   if (document.regForm.school.selectedIndex==0) {
    alert("Please pick a school");
    document.regForm.school.focus();
    return(false);
   }
   return(true);
  }
  function checkHandle() {
   if (document.regForm.handle.value.length==0) {
    alert("You must enter a handle");
    document.regForm.handle.focus();
    return(false);
   }
   return(true);
  }
  function checkEmail() {
   var email=document.regForm.email.value;
   if (email.length<5||email.indexOf('@')<0||email.indexOf('.')<0) {
    alert("Please enter a valid email address.");
    document.regForm.email.focus();
    return(false);
   }
   if (email!=document.regForm.confirm_email.value) {
    alert("Email addresses do not match.");
    document.regForm.email.focus();
    return(false);
   }
   return(true);
  }
  function checkPassword() {
   var pass=document.regForm.password.value;
   if (pass.length<7||pass.length>15) {
    alert("Password must be between 7 and 15 characters.");
    document.regForm.password.focus();
    return(false);
   }
   if (pass!=document.regForm.confirm_password.value) {
    alert("Passwords do not match.");
    document.regForm.password.focus();
    return(false);
   }
   return(true);
  }
  function checkTerms() {
   if (!document.regForm.terms.checked) {
    alert("Please agree to the terms and conditions");
    document.regForm.terms.focus();
    return(false);
   }
   return(true);
  }
 </SCRIPT>
</FORM>
<P><BR></P>
<%@ include file="tail.inc" %>
