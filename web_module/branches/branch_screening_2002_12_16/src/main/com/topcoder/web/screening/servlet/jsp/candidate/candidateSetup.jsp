<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.screening.model.CandidateInfo" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Setup</TITLE>
<SCRIPT language="JavaScript">
<!--

//returns an integer between 0 and number-1
function rand(number) {
        return Math.floor(Math.random()*number);
};

//string containing every value we can use in a password
var valueSpace = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 

//generates a random password of 8 alphanumeric values
function generatePassword() {
    var newPass = "";
    for(var i = 0; i < 8; ++i) {
        newPass = newPass + valueSpace.charAt(rand(valueSpace.length));
    }

    document.candidateSetupForm.password.value = newPass;
}

//validates the fields in this form
function validateFields() {
    var email = document.candidateSetupForm.emailAddress.value;
    var valid = true;
    if(email.length < 5) {
        alert("Email Address is too short.  Use 'joe@topcoder.com' format");
        valid = false;
    }

    var index = email.indexOf('@');
    if(index == -1) {
        alert("Email Address needs '@' in it.  Use 'joe@topcoder.com' format");
        valid = false;
    }
    else if(index == 0) {
        alert("Email Address must have information before '@'. Use 'joe@topcoder.com' format");
        valid = false;
    }

    index = email.indexOf('.', index + 2);
    if(index == -1) {
        alert("Email Address needs '.' in it. Use 'joe@topcoder.com' format");
        valid = false;
    }

    if((email.length <= index + 1) || (valueSpace.indexOf(email.charAt(index + 1)) == -1)) {
        alert("Email Address must have characters after the '.' Use 'joe@topcoder.com' format");
        valid = false;
    }

    var password = document.candidateSetupForm.password.value;
    if(password.length == 0) {
        alert("Password does not exist");
        valid = false;
    }

    //check for characters not allowed...
    for(var i = 0; i < password.length; ++i) {
        if(valueSpace.indexOf(password.charAt(i)) == -1) {
            alert("Character '" + password.charAt(i) + "' is not a valid character to use in a password. Use only '" + valueSpace + "'");
            valid = false;
            break;
        }
    }

    return valid;
}
//--></SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><strong>Create a New Session - </strong></FONT><FONT SIZE="3" COLOR="#990000"><strong>Set-Up a Candidate</strong></FONT> 
<P>
            Create a new candidate or update the existing one.
</P><BR>
<%
    CandidateInfo info = (CandidateInfo)request.getAttribute("candidateInfo");
    String emailAddress = "";
    String password = "";
    if(info != null) {
       emailAddress = info.getEmailAddress();
       password = info.getPassword();
    }

    String referrer = request.getParameter("rp");
%>
<FORM name="candidateSetupForm" action="/MainServlet" method="POST" onSubmit="return validateFields();">
        <INPUT type="hidden" name="rp" value="UpdateCandidate" />
<%
    if(referrer != null) {
%>
        <INPUT type="hidden" name="referrer" value="<%=referrer%>" />
<%
    }
    
    //only want it there if we are not new
    if(info != null) {
%>
        <INPUT type="hidden" name="candidateId" value="<%=info.getCandidateId()%>" />
<%    
    }
%>


         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><strong>Email Address</strong>&#160;&#160;</TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="emailAddress" value="<%=emailAddress%>" size="30" maxlength="30"></TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;</TD>
           </TR>
           <TR>
              <TD></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><strong>Password</strong>&#160;&#160;</TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="password" value="<%=password%>" size="30" maxlength="30"></TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<A HREF="#" onClick="generatePassword()" CLASS="bodyText">Generate a Password</A></TD>
           </TR>
           <TR>
              <TD></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
            <TR>
              <TD COLSPAN="2"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR> 
           <TR>
              <TD COLSPAN="2" ALIGN="center"><INPUT type="SUBMIT" /></TD>
           </TR>                                
         </TABLE>
<%
    if(info != null)
    {
%>
<P>To add a note <A HREF="/eval/note_list.jsp" CLASS="bodyText">click here</A></P>
<%
    }
%>
                            
</FORM>         
<P><BR/></P>   
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
