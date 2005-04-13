<jsp:include page="nocache.jsp" />
<%@ page errorPage="error.jsp" %>
<%@ page session="true" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.tc.controller.legacy.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.common.web.data.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />

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
  <% if (Registration.isRegister())  {%>
    if(reg.<%=Registration.HANDLE%>.value==""){alert("Please enter a Handle.");reg.<%=Registration.HANDLE%>.focus();return false;}
  <% } %>
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
  if(reg.<%=Registration.LANGUAGE%>.selectedIndex==0){alert("Please bSelectb a default programming language.");reg.<%=Registration.LANGUAGE%>.focus();return false;}
  var found=false;
  for(i=0;i<reg.elements.length;i++){
    if(reg.elements[i].name=="<%=Registration.CODER_TYPE%>"){
      if (reg.elements[i].checked==true) {
        found=true;
        break;
      }
    }
  }
  if(!found){alert("Please bSelectb a Student or Professional.");reg.<%=Registration.CODER_TYPE%>[0].focus();return false;}
  return true;
}
</SCRIPT>

            <img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
            <form action="<%=response.encodeURL(Controller.ALIAS)%>" method="post" name="frmReg" >
            <input type="hidden" name="<%=Controller.TASK%>" value="Registration">
            <input type="hidden" name="<%=Controller.STEP%>" value="<%=Registration.STEP_1%>" />
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="statText" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"><br>
                        <p>Welcome to TopCoder. Before you register, there are a few things we think you should know:  First, and most importantly, TopCoder is a commercial
                        site.  We charge sponsors for the right to advertise on our site.  This money pays for the operation of the site and the prizes awarded in competitions.</p>

                        <p>This has several implications. Because we feel it is our obligation to let our sponsors know who their message is reaching, we collect as much
                        demographic information as possible without making the Registration process overly burdensome.  Furthermore, we require that you verify the accuracy of
                        the information you provide.  This does not mean that sponsors have access to your personal information; they do not.  It means that we want to give
                        them as accurate aggregate information as possible.</p>

                        <p>While we believe that sponsors have every right to expect that what we give them is accurate and valuable, we also believe that they must bring more
                        than just money to our member base.  We want sponsors who provide true value to developers.  TopCoder intends to help developers increase their skill
                        level as well as increase their value to employers. Therefore, we are careful to choose sponsors that represent this philosophy.</p>

                        <p>We are also very strict about the way in which sponsors present themselves to the member base&#151;no annoying banners, pop-ups, etc. We work with
                        sponsors to get their message across in an appealing and non-intrusive manner.  Because we take our relationship with sponsors seriously, we
                        believe that they have value to provide.  We ask that you listen to what they have to say.</p>

                        <p>Please read the <A href="/tc?module=Static&d1=about&d2=terms" class="statTextBig">Terms of Use</A> and <A href="/tc?module=Static&d1=about&d2=privacy"class="statTextBig">Privacy Policy</A>, and let me be the first to say good luck in the arena.</p>

                        <p>Jack Hughes<br>
                        Founder and Chairman, TopCoder, Inc.</p>
                    </td>
                </tr>
            </table>

             <div align="center"><br>Required fields are in <strong>bold</strong><br/>&#160;</div>

            <table border="0" cellspacing="0" cellpadding="3" width="100%">

<!-- Upload Member Photo -->
                <% if ( !Registration.isRegister() ) { %>

                <tr><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Member Photo</td></tr>

                <tr valign="middle">
                    <td></td>
                    <td class="errorText"></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel" width="200">Member Photo</td>
                    <td class="statText" width="99%">Let other TopCoder Members know what you look like. Send us a head shot that is at least 200 pixels (3 inches) across.
                        <a href="JavaScript:void window.open('/tc?module=Static&d1=member_photos&d2=index','Photo_Info','top=2,left=2,resizable=yes,width=600,height=700,status=0');" class="statTextBig">Click here</a>
                        for more info about member photos.</td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText">
                        <jsp:include page="member_photo.jsp" >
                            <jsp:param name="class" value="statTextBig"/>
                        </jsp:include>
                    </td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText" valign="middle">&nbsp;</td></tr>

<!-- Upload Resume -->
                <tr><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Resume</td></tr>

                <tr valign="middle">
                    <td></td>
                    <td class="errorText"></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Resume</td>
                    <td class="statText">

                    <% if (Registration.hasResume()) { %>

                        <a href="JavaScript:void window.open('/Resume?t=ViewUploadTask','Resume_Upload','top=2,left=2,resizable=yes,width=400,height=200,status=0');" class="statTextBig">Upload</a>
                        a new resume.<br/>

                       <a href="/Resume?t=DownloadTask" class="statTextBig">Download</a> your resume.

                    <% } else { %>

                        <a href="JavaScript:void window.open('/Resume?t=ViewUploadTask','Resume_Upload','top=2,left=2,resizable=yes,width=400,height=200,status=0');" class="statTextBig">Upload</a>
                        your resume.

                    <% } %>

                    </td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText" valign="middle">&nbsp;</td></tr>

                <% } %>

<!-- First Name -->
                <tr><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Contact Information</td></tr>

                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="firstNameError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel" width="200">First Name<br><img src="/i/clear.gif" alt="" width="200" height="1" border="0"></td>
                    <td class="statText" width="99%"><input type="text" name="<%=Registration.FIRST_NAME%>" value ="<jsp:getProperty name="Registration" property="firstName" />" size="30" maxlength="30"></td>
                </tr>

<!-- Last Name -->
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="lastNameError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Last Name</td>
                    <td class="statText"><input type="text" name="<%=Registration.LAST_NAME%>" value ="<jsp:getProperty name="Registration" property="lastName" />" size="30" maxlength="30"></td>
                </tr>

<!-- Address -->
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="address1Error" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Address</td>
                    <td class="statText"><input type="text" name="<%=Registration.ADDRESS1%>" value ="<jsp:getProperty name="Registration" property="address1" />" size="30" maxlength="50"></td>
                </tr>

                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="address2Error" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText"><input type="text" name="<%=Registration.ADDRESS2%>" value ="<jsp:getProperty name="Registration" property="address2" />" size="30" maxlength="50"></td>
                </tr>

<!-- City -->
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="cityError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">City</td>
                    <td class="statText"><input type="text" name="<%=Registration.CITY%>" value ="<jsp:getProperty name="Registration" property="city" />" size="30" maxlength="30"></td>
                </tr>

<!-- State -->
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="stateError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">State</td>
                    <td class="statText">
                        <tc:getProperty id="state" name="Registration" property="State" />
                        <tc:stateSelect name="<%=Registration.STATE%>" styleClass="dropdown" selectedValue="<%=state%>" onChange="changeCountry()" /></td>
                </tr>

<!-- Zip -->
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="zipError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Zip</td>
                    <td class="statText"><input type="text" name="<%=Registration.ZIP%>" value ="<jsp:getProperty name="Registration" property="zip" />" size="10" maxlength="10"></td>
                </tr>

<!-- Country -->
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="countryError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Country</td>
                    <td class="statText">
                        <tc:getProperty id="country" name="Registration" property="Country" />
                        <tc:countrySelect styleClass="dropdown" name="<%=Registration.COUNTRY%>" selectedValue="<%=country%>" onChange="changeState()" />
                    </td>

<script type="text/javascript">
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
</script>
                </tr>

<!-- Phone -->
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="phoneError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Phone</td>
                    <td class="statText"><input type="text" name="<%=Registration.PHONE%>" value ="<jsp:getProperty name="Registration" property="phone" />" size="30" maxlength="20"></td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText" valign="middle">&nbsp;</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">Handle &amp; Password</td></tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="handleError" /></td>
                </tr>

<!-- Handle -->
                <% if (Registration.isRegister()) { %>

                <tr>
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText" valign="top">Please choose your handle carefully, because once your account is created, your handle can not be changed.
                    Also note that creating more than one account is a violation of our terms of use.<br></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Handle</td>
                    <td class="statText"><input type="text" name="<%=Registration.HANDLE%>" value ="<jsp:getProperty name="Registration" property="handle" />" size="30" maxlength="15"></td>
                </tr>

                <% } else { %>

                <tr valign="middle">
                    <td class="registerLabel">Handle</td>
                    <td class="statText">

                    <% if (Registration.isValidHandle(Registration.getHandle())
                           && Registration.getHandle().toLowerCase().indexOf("guest") < 0
                           && Registration.getHandle().length()>1
                           && !Registration.containsAllPunctuation(Registration.getHandle())
                           && Registration.getHandleError().equals("")) {  %>

                        <jsp:getProperty name="Registration" property="handle" />

                    <% } else { %>

                        <input type="text" name="<%=Registration.HANDLE%>" value ="<jsp:getProperty name="Registration" property="handle" />" size="30" maxlength="15">

                    <% } %>
                    </td>
                </tr>

                <% } %>

<!-- Password -->
                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="passwordError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Password</td>
                    <td class="statText"><input type="password" name="<%=Registration.PASSWORD%>" value ="<jsp:getProperty name="Registration" property="password" />" size="30" maxlength="15"></td>
                </tr>

                <tr>
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText" valign="top">Minimum&nbsp;of&nbsp;<%=Registration.PASSWORD_MIN_LENGTH%>&nbsp;characters, maximum of <%=Registration.PASSWORD_MAX_LENGTH%><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="confirmPasswordError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Re-type Password</td>
                    <td class="statText"><input type="password" name="<%=Registration.CONFIRM_PASSWORD%>" value ="<jsp:getProperty name="Registration" property="confirmPassword" />" size="30" maxlength="<%=Registration.PASSWORD_MAX_LENGTH%>"></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="emailError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Email</td>
                    <td class="statText"><input type="text" name="<%=Registration.EMAIL%>" value ="<jsp:getProperty name="Registration" property="email" />" size="30" maxlength="100"></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="confirmEmailError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Re-type Email</td>
                    <td class="statText"><input type="text" name="<%=Registration.CONFIRM_EMAIL%>" value ="<jsp:getProperty name="Registration" property="confirmEmail" />" size="30" maxlength="100"></td>
                </tr>

                <tr>
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText" valign="top">An email will be sent to authorize your account activation.<br></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="quoteError" /></td>
                </tr>

                <tr>
                    <td class="registerLabel">Quote</td>
                    <td class="statText"><input type="text" name="<%=Registration.QUOTE%>" value ="<jsp:getProperty name="Registration" property="quote" />" size="30" maxlength="255"></td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText" valign="middle">&nbsp;</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">Email Notification</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>

                <tc:notification selectedValues="<%=Registration.getNotifications()%>" styleClass="bodyText">

                <tr>
                    <td class="registerLabel"><%=notifyName%>&nbsp;</td>
                    <td class="statText"><%=notifyControl%></td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"></td>
                </tr>

                </tc:notification>

                <tr valign="middle"><td colspan="2" class="statText" valign="middle">&nbsp;</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">Competition Preferences</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="languageError" /></td>
                </tr>

                <tr>
                    <td class="registerLabel">Default Language&nbsp;</td>
                    <td class="statText">
                        <tc:getProperty id="language" name="Registration" property="Language" />
                        <tc:languageSelect styleClass="dropdown" name="<%=Registration.LANGUAGE%>" selectedValue="<%=language%>" />
                    </td>
                </tr>

                <tr>
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText" valign="top">The competition applet allows for a choice of programming languages. The language you choose will be your default.</td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText">&nbsp;</td></tr>

                <% if (Registration.isEdit()) { %>
                <tr valign="middle"><td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="compCountryError" /></td>
                </tr>

                <tr>
                    <td class="registerLabel">Country to Represent&nbsp;</td>
                    <td class="statText">
                        <tc:getProperty id="compCountry" name="Registration" property="CompCountry" />
                        <tc:countrySelect styleClass="dropdown" name="<%=Registration.COMP_COUNTRY%>" selectedValue="<%=compCountry%>" />
                    </td>
                </tr>

                <tr>
                    <td class="registerLabel">&nbsp;</td>
                    <td class="statText" valign="top">Choose the country you would like to represent for statistics on the TopCoder website.</td>
                </tr>

                <tr valign="middle"><td colspan="2" class="statText">&nbsp;</td></tr>
                <% } %>


                <tr valign="middle"><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Student or Professional (please choose one)</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>

                <tc:getProperty id="coderType" name="Registration" property="CoderType" />

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="coderTypeError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="registerLabel">Student</td>
                    <td class="statText">
                        <input type="radio" name="<%=Registration.CODER_TYPE%>" value ="<%=Registration.CODER_TYPE_STUDENT%>" <%=(coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)?"checked":"")%>>
                        (Currently a full-time student)
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"></td>
                </tr>

                <tr>
                    <td class="registerLabel">Professional</td>
                    <td class="statText">
                        <input type="radio" name="<%=Registration.CODER_TYPE%>" value ="<%=Registration.CODER_TYPE_PROFESSIONAL%>" <%=(coderType.equalsIgnoreCase(Registration.CODER_TYPE_PROFESSIONAL)?"checked":"")%>>
                        (Not currently a full-time student)
                    </td>
                </tr>

                <% if (Registration.isRegister()) { %>

                <a name="terms"></a><tr valign="middle"><td colspan="2" class="statText">&nbsp;</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif" height="16">Terms</td></tr>

                <tr valign="middle"><td colspan="2" class="statTextBig"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>

                <tr>
                    <td colspan="2" class="errorText" align="center" valign="middle">
                        <textarea name="TermDesc" rows="10" cols="70" readonly class="bodyText">
                            <jsp:include page="privacy.jsp" />
                        </textarea>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="termsError" /></td>
                </tr>

                <tr valign="middle">
                    <td class="statTextBig" colspan="2" align="left">I Agree to the Terms and Conditions stated above&nbsp;
                        <tc:getProperty id="terms" name="Registration" property="Terms" />
                        <input type="checkbox" name="<%=Registration.TERMS%>" <%=(terms.equalsIgnoreCase(Registration.CHECKBOX_YES)?"checked":"")%>>
                    </td>
                </tr>

                <% } %>

                <tr valign="middle"><td colspan="2" class="statText">&nbsp;</td></tr>

                <tr valign="middle"><td colspan="2" align="center" class="statText"><input type="button" onclick="if(checkInputs())reg.submit();" name="continueButton" value="Continue" /></td></tr>
            </table>
            </form>

            <script type="text/javascript">setFocus();</script>


