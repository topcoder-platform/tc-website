<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.screening.model.CandidateInfo" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
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
      <TD VALIGN="top"><screen:img page="/ev/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><screen:img page="/ev/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
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

    String referrer = request.getParameter("referrer");
%>
<screen:form name="candidateSetupForm" action="/screening" method="POST">
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
              <TD COLSPAN="2"><screen:img page="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR> 
           <TR>
              <TD COLSPAN="2" ALIGN="center"><INPUT type="SUBMIT" /></TD>
           </TR>                                
         </TABLE>
<%
    if(info != null)
    {
%>
<P>To add a note <screen:link page="/note_list.jsp" styleClass="bodyText">click here</screen:link></P>
<%
    }
%>
                            
</screen:form>         
<P><BR/></P>   
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><screen:img page="/ev/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
