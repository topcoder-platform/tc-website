<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="/hs/includes/global/css.jsp" />
<jsp:include page="/hs/includes/global/top_javascript.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/hs/includes/global/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="/hs/includes/global/left_nav.jsp" />
<jsp:include page="/hs/includes/global/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_register.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="100%">&nbsp;
             </TD></TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
            <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                </TABLE>
            </TD>
            <TD HEIGHT="100%" CLASS="bodyText">
            <!-- Start Body-->
<P>&nbsp;</P>
            <P>Welcome to TopCoder High School, a site developed for high school students who are already interested in computer science.</P>
            <P><B>There is no cost to sign up or compete.</B></P>
  <FORM ACTION="<%="http://"+request.getServerName()%>" METHOD="post" NAME="regForm" >
    <INPUT TYPE="hidden" NAME="c" VALUE="hs_reg_email"/>
  <table width="400" border="0" cellspacing="0" cellpadding="5" align="center">
    <tr>
        <td colspan="2" class="bodyText" align="center" valign="middle"><B>All fields are required</B></td>
    </tr>
    <tr valign="middle">
        <td colspan="2" class="bodyText" valign="middle">&nbsp;</td>
    </tr>
    <tr valign="middle">
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr>
        <td class="bodyText" align="right" valign="middle" >First Name&nbsp;</td>
        <td class="bodyText" align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="firstName" value ="" size="30" maxlength="30"></td>
    </tr>
    <tr>
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr align="right" valign="middle">
        <td class="bodyText" align="right" valign="middle" >Last Name&nbsp;</td>
        <td class="bodyText" align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="lastName" value ="" size="30" maxlength="30"></td>
    </tr>
    <tr>
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr align="right" valign="middle">
        <td class="bodyText" align="right" valign="middle" >School&nbsp;</td>
        <td class="bodyText" align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="school" value ="" size="40" maxlength="60"></td>
    </tr>
    <tr>
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr align="right" valign="middle">
        <td class="bodyText" align="right" valign="middle" >E-mail&nbsp;</td>
        <td colspan="2" class="bodyText" align="left" valign="middle">&nbsp;&nbsp;<input type="text" name="email" value ="" size="40" maxlength="50"></td>
    </tr>
    <tr>
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr align="right" valign="middle">
        <td class="bodyText" align="center" valign="middle" colspan="2">Coach<INPUT TYPE="radio" NAME="coderType" VALUE="coach">&nbsp;&nbsp;  Student<INPUT TYPE="radio" NAME="coderType" VALUE="student"></td>
  </tr>
    <tr>
        <td colspan="2"><img src="/i/clear.gif" width="1" height="1" border="0"></td>
    </tr>
    <tr  valign="middle">
        <td colspan="2" align="center" valign="middle" class="bodyText" ALIGN="center">
        <input type="button" onClick="Javascript:submitForm();" name="go" value="Submit">
        </td>
    </tr>
  </table>
             <SCRIPT type="text/javascript">
                function submitForm() {
                  if (checkEmail() &&
                      checkFirst() &&
                      checkLast() ) {
                         document.regForm.submit();
                         return;
                  }
                }
                function checkEmail() {
                  var email = document.regForm.email.value;
                  if (email.length < 5 || email.indexOf('@')<0 || email.indexOf('.')<0) {
                      alert("Please enter a valid email address.");
                      document.regForm.email.focus();
                      return false;
                  } else {
                      return true;
                  }
                }
                function checkFirst() {
                  if (document.regForm.firstName.value.length==0) {
                      alert("You must enter your first name");
                      document.regForm.firstName.focus();
                      return false;
                  } else {
                      return true;
                  }
                }
                function checkLast() {
                  if (document.regForm.lastName.value.length==0) {
                      alert("You must enter your last name");
                      document.regForm.lastName.focus();
                      return false;
                  } else {
                      return true;
                  }
                }
                function checkSchool() {
                  if (document.regForm.school.value.length==0) {
                      alert("You must enter your school");
                      document.regForm.school.focus();
                      return false;
                  } else {
                      return true;
                  }
                }
              </SCRIPT>

  </FORM>
<P ALIGN="center"><B>This is the temporary TopCoder High School Registration.  You will be contacted by TopCoder when the full registration becomes available.</B></P>
<P><BR></P>
            <!-- End Body-->
            </TD>
             <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                </TABLE>
            </TD>
           </TR>
          </TABLE>
         </TD>
        </TR>

       </TABLE>
        </TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_right.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="" BGCOLOR="#001934" VALIGN="top">
<IMG SRC="/i/hs/right_top_3dots.gif" WIDTH="86" HEIGHT="41" ALT="" BORDER="0" >
<BR/>
<jsp:include page="/hs/includes/resources/right_resources.jsp" /></TD>
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="/hs/includes/global/foot.jsp" />
</BODY>
</HTML>
