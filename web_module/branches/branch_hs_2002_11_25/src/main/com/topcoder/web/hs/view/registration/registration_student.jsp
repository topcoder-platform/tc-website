<%@ include file="head.inc" %>
<% Map data=(Map)request.getAttribute("STUDENT_DATA");
   ResultSetContainer rsc;
   ResultSetContainer.ResultSetRow rsr;
   ArrayList states=new ArrayList();
   ArrayList schools=new ArrayList();
   ArrayList codes=new ArrayList();
   rsc=(ResultSetContainer)data.get("state_schools");
   for (Iterator i=rsc.iterator();i.hasNext();) {
    rsr=(ResultSetContainer.ResultSetRow)i.next();
    String name=(String)rsr.getItem("state_name").getResultData();
    if (states.size()==0||!((String)states.get(states.size()-1)).equals(name)) {
     states.add(name);
     schools.add(new ArrayList());
     codes.add(new ArrayList());
    }
    ArrayList state_schools=(ArrayList)schools.get(schools.size()-1);
    state_schools.add(rsr.getItem("short_name").getResultData());
    ArrayList school_codes=(ArrayList)codes.get(codes.size()-1);
    school_codes.add(rsr.getItem("school_id").getResultData());
   } %>
<SCRIPT type="text/javascript">
 var schools=new Array(<%=schools.size()%>)
 var codes=new Array(<%=codes.size()%>)
 <% for (int i=0;i<schools.size();i++) {
     ArrayList state_schools=(ArrayList)schools.get(i);
     ArrayList school_codes=(ArrayList)codes.get(i); %>
 schools[<%=i%>]=new Array(<%=state_schools.size()%>)
 codes[<%=i%>]=new Array(<%=school_codes.size()%>)
  <% for (int j=0;j<state_schools.size();j++) { %>
 schools[<%=i%>][<%=j%>]="<%=state_schools.get(j)%>"
 codes[<%=i%>][<%=j%>]=<%=school_codes.get(j)%>
  <% }
    } %>
 function changeState() {
  var idx=state.selectedIndex
  if (idx==-1) {
   school.disabled=true
   school.options.length=0
  }
  else {
   school.disabled=false
   school.options.length=schools[idx].size
   for (i=0;i<schools[idx].size;i++) {
    school.options(i).text=schools[idx][i]
    school.options(i).value=codes[idx][i]
   } 
  }
</SCRIPT>
<P><B>Registration for Students</B></P>
<P>Welcome to TopCoder HighSchool. Before you register, there are a few things we think you should know: First, and most importantly, TopCoder is a commercial site. We charge sponsors for the right to advertise on our site. This money pays for the operation of the site and the prizes awarded in competitions.</P>
<P>This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much demographic information as possible without making the registration process overly burdensome. Furthermore, we require that you verify the accuracy of the information you provide. This does not mean that sponsors have access to your personal information; they do not. It means that we want to give them as accurate aggregate information as possible.</P>
<P>While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more than just money to our member base. We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.</P>
<P>We are also very strict about the way in which sponsors present themselves to the member base - no annoying banners, pop-ups, etc. We work with sponsors to get their message across in an appealing and non-intrusive manner. Because we take our relationship with sponsors seriously, we believe that they have value to provide.  We ask that you listen to what they have to say.</P>
<P>Please read the Terms of Use and Privacy Policy, and let me be the first to say good luck in the arena.</P>
<P>Jack Hughes</P>
<P><I>Founder and Chairman, TopCoder, Inc.</I></P>
<P><BR></P>
<FORM ACTION="?module=Registration" METHOD="post" NAME="regForm">
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="firstName" VALUE="" SIZE="30" MAXLENGTH="30"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Last Name&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="lastName" VALUE="" SIZE="30" MAXLENGTH="30"></TD>
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
    <SELECT NAME="state" CLASS="dropdown" ONCHANGE="Javascript:changeState()">
     <OPTION value="-1">Pick a state</OPTION>
     <% for (int i=0;i<states.size();i++) { %>
     <OPTION value="<%=i%>"><%=(String)states.get(i)%></OPTION>
     <% } %>
    </SELECT>
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
    <SELECT DISABLED NAME="school" CLASS="dropdown">
     <OPTION VALUE=""></OPTION>
    </SELECT>
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="handle" VALUE="" SIZE="30" MAXLENGTH="15"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"><BR></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Password&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="password" VALUE="" SIZE="30" MAXLENGTH="15"></TD>
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="password" NAME="confirmPassword" VALUE="" SIZE="30" MAXLENGTH="15"></TD>
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
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="email" VALUE="" SIZE="30" MAXLENGTH="100"></TD>
  </TR>
  <TR>
   <TD></TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="errorText" ALIGN="left" VALIGN="middle"></TD>
  </TR>
  <TR ALIGN="right" VALIGN="middle">
   <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Re-type Email&nbsp;</TD>
   <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
   <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><INPUT TYPE="text" NAME="confirmEmail" VALUE="" SIZE="30" MAXLENGTH="100"></TD>
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
    <SELECT NAME="editor" CLASS="dropdown">
     <% rsc=(ResultSetContainer)data.get("editor_list");
        for (Iterator i=rsc.iterator();i.hasNext();) {
         rsr=(ResultSetContainer.ResultSetRow)i.next();
         Integer id=(Integer)rsr.getItem("editor_id").getResultData();
         String desc=(String)rsr.getItem("editor_desc").getResultData(); %>
     <OPTION VALUE="<%=id%>"><%=desc%></OPTION>
     <% } %>
    </SELECT>
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
    <SELECT NAME="language" CLASS="dropdown">
     <% rsc=(ResultSetContainer)data.get("language_list");
        for (Iterator i=rsc.iterator();i.hasNext();) {
         rsr=(ResultSetContainer.ResultSetRow)i.next();
         Integer id=(Integer)rsr.getItem("language_id").getResultData();
         String name=(String)rsr.getItem("language_name").getResultData(); %>
     <OPTION VALUE="<%=id%>"><%=name%></OPTION>
     <% } %>
    </SELECT>
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
  function submitForm() {
   if (checkName()&&checkEmail()&&checkPassword()) {
    document.regForm.submit();
   }
  }
  function checkName() {
   if (document.regForm.firstName.value.length==0) {
    alert("You must enter your first name");
    document.regForm.firstName.focus();
    return false;
   }
   if (document.regForm.lastName.value.length==0) {
    alert("You must enter your last name");
    document.regForm.lastName.focus();
    return false;
   }
   return true;
  }
  function checkEmail() {
   var email=document.regForm.email.value;
   if (email.length<5||email.indexOf('@')<0||email.indexOf('.')<0) {
    alert("Please enter a valid email address.");
    document.regForm.email.focus();
    return false;
   }
   if (email!=document.regForm.confirmEmail.value) {
    alert("Email addresses do not match.");
    document.regForm.email.focus();
    return false;
   }
   return true;
  }
  function checkPassword() {
   var pass=document.regForm.password.value;
   if (pass.length<7||pass.length>15) {
    alert("Password must be between 7 and 15 characters.");
    document.regForm.password.focus();
    return false;
   }
   if (pass!=document.regForm.confirmPassword.value) {
    alert("Passwords do not match.");
    document.regForm.password.focus();
   }
  }
 </SCRIPT>
</FORM>
<P><BR></P>
<%@ include file="tail.inc" %>
