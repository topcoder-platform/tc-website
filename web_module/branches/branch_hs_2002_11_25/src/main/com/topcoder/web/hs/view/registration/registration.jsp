<%@ include file="head.inc" %>
<P><BR></P>
<P>Welcome to TopCoder High School, a site developed by programmers for high school students who are already interested in computer science.</P>
<P><B>There is no cost to sign up or compete.</B></P>
<FORM ACTION="" METHOD="get" NAME="regForm">
 <INPUT TYPE="hidden" NAME="module" value="Registration">
 <INPUT TYPE="hidden" NAME="c" VALUE="reg">
 <TABLE WIDTH="400" BORDER="0" CELLSPACING="0" CELLPADDING="5" ALIGN="center">
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
   if (checkCoderType()) {
    document.regForm.submit();
   }
  }
  function checkCoderType() {
   if (document.regForm.coderType[0].checked||document.regForm.coderType[1].checked) {
    return true;
   }
   alert("You must specify a coder type");
   return false;
  }
 </SCRIPT>
</FORM>
<%@ include file="tail.inc" %>
