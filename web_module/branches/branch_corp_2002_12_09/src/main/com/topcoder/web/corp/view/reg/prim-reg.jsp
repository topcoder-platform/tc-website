<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@page import="com.topcoder.web.corp.request.Registration" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Portal</TITLE>
<jsp:include page="../script.jsp"/>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="../includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" WIDTH="100%" valign="top"><IMG SRC="/i/p/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Registration</B></FONT><BR/>
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM action="" method="POST">
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">

<!-- FIRST NAME -->
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>First Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-first-name" maxlength="30" size="30"/></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-first-name"
            text="Ensure first name is not empty, consists of letters and has not spaces inside">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- LAST NAME -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Last Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-last-name" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-last-name"
            text="Ensure last name is not empty, consists of letters and has not spaces inside">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- TITLE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Title</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-title" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-title"
            text="Ensure title is not empty, consists of letters and punctuation signs only">
            <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>    

<!-- ADDR LINE1 -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Company Address&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-1" size="30" maxlength="50"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-company-address-1"
            text="Ensure address line 1 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- ADDR LINE2 -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-2" size="30" maxlength="50"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-company-address-2"
            text="Ensure address line 2 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- CITY -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">City&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-city" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-company-city"
            text="Ensure city is not empty, consists of letters, digits and punctuation signs only (no more than 3 words)">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- STATE/PROVINCE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">State&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText"><tc-webtag:textInput name="prim-company-state" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-company-state"
            text="Ensure state is not empty, consists of letters only (no more than 2 words)">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- ZIP CODE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Zip&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-zip" size="10" maxlength="10"/></TD>
  </TR>
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-company-zip"
            text="Ensure ZIP code is not empty and, consists of digits only">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
  </TR>

<!-- COUNTRY -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Country&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText"></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
    </TR>

<!-- PHONE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Phone</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-phone" size="30" maxlength="100"/></TD>
  </TR>
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-phone"
            text="Ensure phone is not empty and, consists of digits only (minus sign is allowed too)">
          <img width="16" height="16" src="err-mark.gif" alt="$e"/>
        </tc-webtag:error></TD>
  </TR>
  <TR valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" background="/i/p/graybv_lite_bg.gif" HEIGHT="16">&#160;<FONT COLOR="#FFFFFF"><B>User Name &amp; Password</B></FONT></TD>
  </TR>
  <TR valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>  
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
    </TR>

<!-- LOGIN -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>User Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-username" size="30" maxlength="15"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-username"
            text="Ensure username is not empty and, consists of letters and digits only. Also it is possible, user with given name already exists">
          <img width="16" height="16" src="err-mark.gif" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- PASSWORD -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="prim-password" size="30" maxlength="15"/></TD>
    <TD CLASS="bodyText" ALIGN="left" VALIGN="top">&#160;</TD>
  </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">Minimum&#160;of&#160; &#160;characters, maximum of <BR></TD>
  </TR>  
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-password"
            text="Ensure password is not empty and, consists of letters and digits only">
          <img width="16" height="16" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- PASSWORD VERIFICATION -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Re-type Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="prim-password-once-more" size="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-password-once-more"
            text="Both of passwords must match">
          <img width="16" height="16" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- EMAIL -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Email</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-email" size="30" maxlength="100"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-email"
            text="Ensure email address is not empty and, has written correct">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
    </TR>

<!-- EMAIL VERIFICATION -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Re-type Email</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-email-once-more" size="30" maxlength="100"/></TD>
  </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2">
        <TABLE BORDER="0"><TR>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:error
            refname="prim-email-once-more"
            text="Ensure both of email addresses match">
          <img width="20" height="20" src="" alt="$e"/>
        </tc-webtag:error></TD>
        <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account activation.<BR></TD>
        </TR></TABLE>
    </TD>
<!--    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account activation.<BR></TD>
-->
  </TR>
    <TR>
        <TD COLSPAN="3"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0" /></TD>
    </TR>  
  <TR ALIGN="right" VALIGN="middle">
     <TD COLSPAN="3" ALIGN="center" VALIGN="middle" CLASS="statText"><input type="button" onClick="" name="clear" value=" Clear ">&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
  </TR>
</TABLE>
</FORM>

<P><BR/></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG SRC="/i/p/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
