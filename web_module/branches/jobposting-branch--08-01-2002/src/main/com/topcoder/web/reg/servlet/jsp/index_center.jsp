<%@ include file="nocache.jsp" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.ejb.AuthenticationServices.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<jsp:setProperty name="Registration" property="Step" value="<%=Registration.STEP_1%>" />
<SCRIPT type="text/javascript">
var usIndex=0;
var reg;
var focusSet=false;
function setFocus() {if (!focusSet) reg.<%=Registration.FIRST_NAME%>.focus();}
function changeCountry(){if(reg.<%=Registration.STATE%>.selectedIndex!=0&&reg.<%=Registration.STATE%>.value!='ZZ')reg.<%=Registration.COUNTRY%>.selectedIndex=usIndex;}
function changeState(){if(reg.<%=Registration.COUNTRY%>.selectedIndex!=usIndex) reg.<%=Registration.STATE%>.selectedIndex=0}
function lTrim(inStr) {
  var idx=0;
  var result = "";
  for(idx=0; idx<inStr.length&&inStr.charAt(idx)==' '; idx++);
  if (idx==inStr.length-1) idx=0;
  return inStr.substr(idx);
}
function emailValid(address) {
  var result = true;
  var atSym  = address.indexOf('@');
  var period = address.lastIndexOf('.');
  var space  = address.indexOf(' ');
  var length = address.length - 1;
  if (
    (atSym < 1)
    || (period <= atSym+1)
    || (period == length )
    || (space  != -1)
  ) { 
    result = false;
  }
  return result;
}
function checkInputs(){
  if(reg.<%=Registration.FIRST_NAME%>.value==""){alert("Please enter a First Name.");reg.<%=Registration.FIRST_NAME%>.focus();return false;}
  if(reg.<%=Registration.LAST_NAME%>.value==""){alert("Please enter a Last Name.");reg.<%=Registration.LAST_NAME%>.focus();return false;}
  if(reg.<%=Registration.HANDLE%>.value==""){alert("Please enter a Handle.");reg.<%=Registration.HANDLE%>.focus();return false;}
  if(reg.<%=Registration.PASSWORD%>.value==""||reg.<%=Registration.PASSWORD%>.value.length<7)
    {alert("Please enter a Password at least 7 characters long.");reg.<%=Registration.PASSWORD%>.focus();return false;}
  if(reg.<%=Registration.CONFIRM_PASSWORD%>.value==""){alert("Please re-type the Password.");reg.<%=Registration.CONFIRM_PASSWORD%>.focus();return false;}
  if(reg.<%=Registration.PASSWORD%>.value!=reg.<%=Registration.CONFIRM_PASSWORD%>.value)
    {alert("Password and Re-Type Password must be the same.");reg.<%=Registration.PASSWORD%>.focus();return false;}
  if(!emailValid(reg.<%=Registration.EMAIL%>.value)){alert("Please enter a valid Email Address.");reg.<%=Registration.EMAIL%>.focus();return false;}
  if(!emailValid(reg.<%=Registration.CONFIRM_EMAIL%>.value)){alert("Please re-type a valid Email address.");reg.<%=Registration.CONFIRM_EMAIL%>.focus();return false;}
  if(reg.<%=Registration.EMAIL%>.value!=reg.<%=Registration.CONFIRM_EMAIL%>.value)
    {alert("Email and Re-Type Email must be the same valid Email address.");reg.<%=Registration.EMAIL%>.focus();return false;}
  if(reg.<%=Registration.COUNTRY%>.selectedIndex==0) {alert("Please choose a Country.");reg.<%=Registration.COUNTRY%>.focus();return false;}
  if(reg.<%=Registration.ADDRESS1%>.value==""){alert("Please enter an Address.");reg.<%=Registration.ADDRESS1%>.focus();return false;}
  if(reg.<%=Registration.CITY%>.value==""){alert("Please enter a City.");reg.<%=Registration.CITY%>.focus();return false;}
  if(
    (reg.<%=Registration.STATE%>.selectedIndex==0 || reg.<%=Registration.STATE%>.value=='ZZ')
    && reg.<%=Registration.COUNTRY%>.selectedIndex==usIndex
  ) {alert("Please choose a State.");reg.<%=Registration.STATE%>.focus();return false;}
  if(reg.<%=Registration.ZIP%>.value=="" && reg.<%=Registration.COUNTRY%>.selectedIndex==usIndex)
    {alert("Please enter a Zip.");reg.<%=Registration.ZIP%>.focus();return false;}
  if(reg.<%=Registration.PHONE%>.value==""){alert("Please enter a Phone Number.");reg.<%=Registration.PHONE%>.focus();return false;}
  if(reg.<%=Registration.PHONE%>.value!="" && reg.<%=Registration.PHONE%>.value.length<7)
    {alert("A phone number must be at least 7 characters long.");reg.<%=Registration.PHONE%>.focus();return false;}
  if(reg.<%=Registration.EDITOR%>.selectedIndex==0){alert("Please select a default editor.");reg.<%=Registration.EDITOR%>.focus();return false;}
  if(reg.<%=Registration.LANGUAGE%>.selectedIndex==0){alert("Please select a default programming language.");reg.<%=Registration.LANGUAGE%>.focus();return false;}
  var found=false;
  for(i=0;i<reg.elements.length;i++){
    if(reg.elements[i].name=="<%=Registration.CODER_TYPE%>"){
      if (reg.elements[i].checked==true) {
        found=true;
        break;
      } 
    }
  }
  if(!found){alert("Please select a Student or Professional.");reg.<%=Registration.CODER_TYPE%>[0].focus();return false;}
  return true;
}
</SCRIPT>
<img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
          <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
  <form action="<%=response.encodeURL(Controller.ALIAS)%>" method="post" name="frmReg" >  
        <input type="hidden" name="<%=Controller.TASK%>" value="Registration">  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td class="statText" valign="middle" align="left" colspan="9">
Welcome to TopCoder.  Before you register, there are a few things we think
you should know:  First, and most importantly, TopCoder is a commercial
site.  We charge sponsors for the right to advertise on our site.  This
money pays for the operation of the site and the prizes awarded in
competitions.
<br><br>
This has several implications. Because we feel it is our obligation to let
our sponsors know who their message is reaching, we collect as much
demographic information as possible without making the registration process
overly burdensome.  Furthermore, we require that you verify the accuracy of
the information you provide.  This does not mean that sponsors have access
to your personal information; they do not.  It means that we want to give
them as accurate aggregate information as possible.
<br><br>
While we believe that sponsors have every right to expect that what we give
them is accurate and valuable, we also believe that they must bring more
than just money to our member base.  We want sponsors who provide true value
to developers.  TopCoder intends to help developers increase their skill
level as well as increase their value to employers.  Therefore, we are
careful to choose sponsors that represent this philosophy.
<br><br>
We are also very strict about the way in which sponsors present themselves
to the member base - no annoying banners, pop-ups, etc.  We work with
sponsors to get their message across in an appealing and non-intrusive
manner.  Because we take our relationship with sponsors seriously, we
believe that they have value to provide.  We ask that you listen to what
they have to say.
<br><br>
Please read the Terms of Use and Privacy Policy, and let me be the first to
say good luck in the arena.
<br><br>
Jack Hughes
<br>
Founder and Chairman, TopCoder, Inc.
<br><br>



    </td>
  </tr>
  </table><BR>
  <div align="center">
  <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
  <tr>
    <td class="statTextBig" width="150" align="right" valign="middle"><img src="/i/clear.gif" width="150" height="2" border="0"></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">Required fields are in <b>bold</b></td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>    
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Contact Information</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>    
  <% if ( !Registration.isRegister() ) { %>
    <tr><td colspan="4"><img src="/i/clear.gif" width="1" height="1" border="0"></td></tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Member Photo</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <jsp:include page="../includes/modules/member_photo.jsp" >
           <jsp:param name="class" value="statTextBig"/>
        </jsp:include>
      </td>
    </tr>
   <% } %>
     <tr><td colspan="4"><img src="/i/clear.gif" width="1" height="1" border="0"></td></tr>
     <tr>
       <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Resume</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
       <td colspan="2" class="statTextBig" align="left" valign="middle">
         <a href="JavaScript:void window.open('../includes/modules/resume_upload.jsp','Resume_Upload','top=2,left=2,width=300,height=300,status=0');" class="statText">Resume Upload</a>
       </td>
     </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="FirstNameError" /></td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>First Name</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.FIRST_NAME%>" value ="<jsp:getProperty name="Registration" property="FirstName" />" size="30" maxlength="30"></td>
    </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="LastNameError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Last Name</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.LAST_NAME%>" value ="<jsp:getProperty name="Registration" property="LastName" />" size="30" maxlength="30"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="Address1Error" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Address&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.ADDRESS1%>" value ="<jsp:getProperty name="Registration" property="Address1" />" size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="Address2Error" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.ADDRESS2%>" value ="<jsp:getProperty name="Registration" property="Address2" />" size="30" maxlength="50"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="CityError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">City&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.CITY%>" value ="<jsp:getProperty name="Registration" property="City" />" size="30" maxlength="30"></td>
  </tr>



    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="StateError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">State&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" align="left" valign="middle" class="statTextBig">
        <tc:getProperty id="state" name="Registration" property="State" />
    <tc:stateSelect name="<%=Registration.STATE%>" class="dropdown" selectedValue="<%=state%>" onChange="changeCountry()" /></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ZipError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Zip&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.ZIP%>" value ="<jsp:getProperty name="Registration" property="Zip" />" size="10" maxlength="10"></td>
  </tr>


   <tr>
     <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="CountryError" /></td>
  </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Country&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0
"></td>
    <td colspan="2" align="left" valign="middle" class="statTextBig">
      <tc:getProperty id="country" name="Registration" property="Country" />
      <tc:countrySelect class="dropdown" name="<%=Registration.COUNTRY%>" selectedValue="<%=country%>" onChange="changeState()" />
    </td>
    <SCRIPT type="text/javascript">
  reg=window.document.frmReg;
  if ( window.navigator.userAgent.indexOf('Opera') ) {
    for(i=0;i<reg.<%=Registration.COUNTRY%>.length;i++){
      if(reg.<%=Registration.COUNTRY%>[i].value=="840"){usIndex=i;break;}
    }
  } else {
    for(i=0;i<reg.<%=Registration.COUNTRY%>.options.length;i++){
      if(reg.<%=Registration.COUNTRY%>.options[i].value=="<%=Registration.USA%>"){usIndex=i;break;}
    }
  }
    </SCRIPT>
  </tr>


    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="PhoneError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Phone</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.PHONE%>" value ="<jsp:getProperty name="Registration" property="Phone" />" size="30" maxlength="20"></td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Handle &amp; Password</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="HandleError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Handle</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.HANDLE%>" value ="<jsp:getProperty name="Registration" property="Handle" />" size="30" maxlength="15"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="PasswordError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Password</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td class="statTextBig" align="left" valign="middle"><input type="password" name="<%=Registration.PASSWORD%>" value ="<jsp:getProperty name="Registration" property="Password" />" size="30" maxlength="15"></td>
    <td class="statText" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">Minimum&nbsp;of&nbsp;<%=Registration.PASSWORD_MIN_LENGTH%>&nbsp;characters, maximum of <%=Registration.PASSWORD_MAX_LENGTH%><br></td>
  </tr>  
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ConfirmPasswordError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Re-type Password</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="password" name="<%=Registration.CONFIRM_PASSWORD%>" value ="<jsp:getProperty name="Registration" property="ConfirmPassword" />" size="30" maxlength="<%=Registration.PASSWORD_MAX_LENGTH%>"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="EmailError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Email</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.EMAIL%>" value ="<jsp:getProperty name="Registration" property="Email" />" size="30" maxlength="100"></td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="ConfirmEmailError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><b>Re-type Email</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.CONFIRM_EMAIL%>" value ="<jsp:getProperty name="Registration" property="ConfirmEmail" />" size="30" maxlength="100"></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">An email will be sent to authorize your account activation.<br></td>
  </tr>


  <tr>
    <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="QuoteError" /></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Quote&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.QUOTE%>" value ="<jsp:getProperty name="Registration" property="Quote" />" size="30" maxlength="255"></td>
  </tr>


  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Email Notification</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>


  <tc:notification selectedValues="<%=Registration.getNotifications()%>" class="statText">
    <tr>
      <td></td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="errorText" align="left" valign="middle">
      </td>
    </tr>
    <tr>
      <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif"><%=notifyName%>&nbsp;</td>
      <td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
      <td colspan="2" class="statTextBig" align="left" valign="middle">
        <%=notifyControl%>
      </td>
    </tr>
  </tc:notification>


  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Editor &amp; Language</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  


    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="EditorError" /></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Default Editor&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">
        <tc:getProperty id="editor" name="Registration" property="Editor" />
    <tc:editorSelect class="dropdown" name="<%=Registration.EDITOR%>" selectedValue="<%=editor%>" /></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">The competition applet allows for a choice of editor types. UNIX users comfortable with vi may opt for JVI. Those more familiar with the behavior of Windows Notepad should choose Standard.</td>
  </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="LanguageError" /></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Default Language&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle">
        <tc:getProperty id="language" name="Registration" property="Language" />
        <tc:languageSelect class="dropdown" name="<%=Registration.LANGUAGE%>" selectedValue="<%=language%>" /></td>
  </tr>
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">The competition applet allows for a choice of programming languages. The language you choose will be your default.</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Student or Professional (please choose one)</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  
    <tc:getProperty id="coderType" name="Registration" property="CoderType" />
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="CoderTypeError" /></td>
    </tr>
  <tr>
    <td class="statTextBig" align="right" height="18" valign="middle" background="/i/steel_gray_bg.gif"><b>Student</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="radio" name="<%=Registration.CODER_TYPE%>" value ="<%=Registration.CODER_TYPE_STUDENT%>" <%=(coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)?"checked":"")%>></td>
  </tr>  
<%--
  <tr>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statText" align="left" valign="top">By indicating that you are a "Student" member, you must be enrolled full-time at an accredited college or university.</td>
  </tr>
--%>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
  </tr>      
  <tr>
    <td class="statTextBig" align="right" height="18" valign="middle" background="/i/steel_gray_bg.gif"><b>Professional</b>&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colspan="2" class="statTextBig" align="left" valign="middle"><input type="radio" name="<%=Registration.CODER_TYPE%>" value ="<%=Registration.CODER_TYPE_PROFESSIONAL%>" <%=(coderType.equalsIgnoreCase(Registration.CODER_TYPE_PROFESSIONAL)?"checked":"")%>></td>
  </tr>


<%--
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Confirmation Code</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>  
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_gray_bg.gif">Sun Confirmation Code&nbsp;</td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    <td colpsan="2" class="statTextBig" align="left" valign="middle"><input type="text" name="<%=Registration.SUN_CONFIRMATION%>" value ="<jsp:getProperty name="Registration" property="SunConfirm" />" size="30" maxlength="100"></td>
  </tr>
--%>




<% if (Registration.isRegister()) { %>
  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Terms</td>
  </tr>
  <tr valign="middle">
    <td colspan="4" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>

    <tr>
        <%-- <td></td>
        <td>
          <img src="/i/clear.gif" width="1" height="1" border="0">
        </td> --%>
        <td colspan="4" class="errorText" align="center" valign="middle">
          <TEXTAREA NAME="TermDesc" Rows="10" COLS="80" READONLY CLASS="bodyText">
            <jsp:include page="../includes/terms_top.txt" />

            <jsp:include page="../includes/privacy.txt" />

            <jsp:include page="../includes/terms_bottom.txt" />
          </TEXTAREA>
        </td>
    </tr>
    <tr>
        <td></td><td><img src="/i/clear.gif" width="1" height="1" border="0"></td><td colspan="2" class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="TermsError" /></td>
    </tr>
  <tr align="right" valign="middle">
    <td class="statTextBig" align="right" valign="top"><b>I Agree to the Terms and Conditions stated above</b>&nbsp;</td>
        <tc:getProperty id="terms" name="Registration" property="Terms" />
    <td colspan="2" class="statTextBig" align="left" valign="top"><input type="checkbox" name="<%=Registration.TERMS%>" <%=(terms.equalsIgnoreCase(Registration.CHECKBOX_YES)?"checked":"")%>><br><br></td>
  </tr>
<% } %>

  <tr valign="middle">
    <td colspan="4" class="statText" valign="middle">&nbsp;</td>
  </tr>
    <tr align="right" valign="middle">
        <td align="right" valign="middle"></td>
        <td colspan="2" align="left" valign="middle" class="statText"><input type="button" onClick="if(checkInputs())reg.submit();" name="continueButton" value="[ continue &gt;" /></td>
    </tr>
  </table>
  </form>
  </div>
          </TD>
        </TR>
      </TABLE>
<SCRIPT type="text/javascript">setFocus();</SCRIPT>


