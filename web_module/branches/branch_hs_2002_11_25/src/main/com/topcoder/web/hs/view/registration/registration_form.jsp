<%@ include file="head.inc" %>
<P>&nbsp;</P>
<P>Welcome to TopCoder High School, a site developed for high school students who are already interested in computer science.</P>
<P><B>There is no cost to sign up or compete.</B></P>
<FORM ACTION="" METHOD="post" NAME="regForm">
 <INPUT TYPE="hidden" NAME="c" VALUE="hs_reg_email"/>
 <TABLE WIDTH="400" BORDER="0" CELLSPACING="0" CELLPADDING="5" ALIGN="center">
  <TR>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="center" VALIGN="middle">
    <B>All fields are required</B>
   </TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="2" CLASS="bodyText" VALIGN="middle">&nbsp;</TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">First Name&nbsp;</TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">&nbsp;&nbsp;<INPUT TYPE="text" NAME="first_name" VALUE="" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">&nbsp;&nbsp;<INPUT TYPE="text" NAME="lastName" VALUE="" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">School&nbsp;</TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">&nbsp;&nbsp;<INPUT TYPE="text" NAME="school" VALUE="" SIZE="40" MAXLENGTH="60"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">E-mail&nbsp;</TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">&nbsp;&nbsp;<INPUT TYPE="text" NAME="email" VALUE="" SIZE="40" MAXLENGTH="50"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="center" VALIGN="middle" COLSPAN="2">Coach<INPUT TYPE="radio" NAME="coderType" VALUE="coach">&nbsp;&nbsp;Student<INPUT TYPE="radio" NAME="coderType" VALUE="student"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
  </TR>
  <TR VALIGN="middle">
   <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText" ALIGN="center">
    <INPUT TYPE="button" ONCLICK="Javascript:submitForm();" NAME="go" VALUE="Submit">
   </TD>
  </TR>
 </TABLE>
 <SCRIPT type="text/javascript">
  function submitForm() {
   if (checkFirstName()&&checkLastName()&&checkEmail()&&checkCoderType()) {
    document.regForm.submit();
   }
  }
  function checkEmail() {
   var email=document.regForm.email.value;
   if (email.length<5||email.indexOf('@')<0||email.indexOf('.')<0) {
    alert("Please enter a valid email address.");
    document.regForm.email.focus();
    return false;
   }
   else {
    return true;
   }
  }
  function checkFirstName() {
   if (document.regForm.firstName.value.length==0) {
    alert("You must enter your first name");
    document.regForm.firstName.focus();
    return false;
   }
   else {
    return true;
   }
  }
  function checkLastName() {
   if (document.regForm.lastName.value.length==0) {
    alert("You must enter your last name");
    document.regForm.lastName.focus();
    return false;
   }
   else {
    return true;
   }
  }
  function checkCoderType() {
  }
 </SCRIPT>
</FORM>
<P ALIGN="center"><B>This is the temporary TopCoder High School Registration.  You will be contacted by TopCoder when the full registration becomes available.</B></P>
<P><BR></P>
<%@ include file="tail.inc" %>