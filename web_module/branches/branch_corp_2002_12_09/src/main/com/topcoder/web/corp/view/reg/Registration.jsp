<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@page import="com.topcoder.web.corp.request.Registration,
                com.topcoder.web.corp.Constants" %>
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
<FONT SIZE="3" COLOR="#666666"><B>Registration</B></FONT><BR>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>" method="POST">
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">

<!-- FIRST NAME -->
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>First Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-first-name" maxlength="30" size="30"/></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-first-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- LAST NAME -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Last Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-last-name" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-last-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- TITLE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Title</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-title" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-title"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>    

<!-- COMPANY NAME -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Company&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-name" size="30" maxlength="50"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- ADDR LINE1 -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Company Address&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-1" size="30" maxlength="50"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-address-1"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- ADDR LINE2 -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-2" size="30" maxlength="50"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-address-2"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- CITY -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">City&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-city" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-city"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- STATE/PROVINCE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">State&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
        <select name="prim-company-state">
            <option value="-1"></option>
            <tc-webtag:queryIterator command="cmd-states-list" id="resultRow">
              <option value="<%=resultRow.getItem("state_code")%>"><%=resultRow.getItem("state_name")%></option>
            </tc-webtag:queryIterator>
        </select>
    </TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-state"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- ZIP CODE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Zip&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-zip" size="10" maxlength="10"/></TD>
  </TR>
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
         <tc-webtag:errorIterator id="err" refname="prim-company-zip"><%=err%><br></tc-webtag:errorIterator>
     </TD>
  </TR>

<!-- COUNTRY -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC">Country&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
        <select name="prim-company-country">
            <option value="-1"></option>
            <tc-webtag:queryIterator command="cmd-countries-list" id="resultRow">
              <option value="<%=resultRow.getItem("country_code")%>"><%=resultRow.getItem("country_name")%></option>
            </tc-webtag:queryIterator>
        </select>
    </TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
             <tc-webtag:errorIterator id="err" refname="prim-company-country"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- PHONE -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Phone</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-phone" size="30" maxlength="100"/></TD>
  </TR>
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="prim-phone"><%=err%><br></tc-webtag:errorIterator>
     </TD>
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
           <tc-webtag:errorIterator id="err" refname="prim-username"><%=err%><br></tc-webtag:errorIterator>
        </TD>
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
           <tc-webtag:errorIterator id="err" refname="prim-password"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- PASSWORD VERIFICATION -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Re-type Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="prim-password-once-more" size="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-password-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- EMAIL -->
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Email</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-email" size="30" maxlength="100"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-email"><%=err%><br></tc-webtag:errorIterator>
        </TD>
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
           <tc-webtag:errorIterator id="err" refname="prim-email-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
        <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account activation.<BR></TD>
        </TR></TABLE>
    </TD>
<!--    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">An email will be sent to authorize your account activation.<BR></TD>
-->
  </TR>
    <TR>
        <TD COLSPAN="3"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0" /></TD>
        <INPUT type="hidden" name="module" value="Registration"/>
    </TR>  
  <TR ALIGN="right" VALIGN="middle">
     <TD COLSPAN="3" ALIGN="center" VALIGN="middle" CLASS="statText"><input type="button" onClick="" name="clear" value=" Clear ">&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
  </TR>
</TABLE>
</FORM>

<P><BR></P>    
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
