<%@ page
         contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.request.Registration"
         autoFlush="false"
         buffer="64kb"
         errorPage="../exc/InternalError.jsp"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder Corporate</TITLE>
<script language="JavaScript" src="/js/script.js"></script>
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
<FORM action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>" method="POST" name="frmPrimReg">
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
<!-- FIRST NAME -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="first-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>First Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="first-name" maxlength="30" size="30"/></TD>
    </TR>

<!-- LAST NAME -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="last-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Last Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="last-name" size="30" maxlength="30"/></TD>
  </TR>

<!-- TITLE -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="title"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Title</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="title" size="30" maxlength="30"/></TD>
  </TR>

<!-- COMPANY NAME -->
    <% boolean extFieldsEditable = "true".equalsIgnoreCase((String)request.getAttribute("ext-fields-editable")); %>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Company</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-name" editable='<%=""+extFieldsEditable%>' size="30" maxlength="50"/></TD>
  </TR>

<!-- ADDR LINE1 -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-address-1"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Work Address</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-1" editable='<%=""+extFieldsEditable%>' size="30" maxlength="50"/></TD>
  </TR>

<!-- ADDR LINE2 -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-address-2"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-2" editable='<%=""+extFieldsEditable%>' size="30" maxlength="50"/></TD>
  </TR>

<!-- CITY -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-city"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>City</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-city" editable='<%=""+extFieldsEditable%>' size="30" maxlength="30"/></TD>
  </TR>

<!-- STATE/PROVINCE -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-state"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>State</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
      <% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("rsc-states-list"); %>
      <tc-webtag:rscSelect name="prim-company-state" list="<%=rsc%>" selectedOnly='<%=""+!extFieldsEditable%>' fieldText="state_name" fieldValue="state_code"/>
    </TD>
  </TR>

<!-- ZIP CODE -->
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
         <tc-webtag:errorIterator id="err" refname="prim-company-zip"><%=err%><br></tc-webtag:errorIterator>
     </TD>
  </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Zip</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-zip"  editable='<%=""+extFieldsEditable%>' size="10" maxlength="10"/></TD>
  </TR>

<!-- COUNTRY -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
             <tc-webtag:errorIterator id="err" refname="prim-company-country"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Country</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" ALIGN="left" VALIGN="middle" CLASS="bodyText">
      <% rsc = (ResultSetContainer)request.getAttribute("rsc-countries-list"); %>
      <tc-webtag:rscSelect name="prim-company-country" list="<%=rsc%>" selectedOnly='<%=""+!extFieldsEditable%>' fieldText="country_name" fieldValue="country_code"/>
    </TD>
  </TR>

<!-- PHONE -->
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="phone"><%=err%><br></tc-webtag:errorIterator>
     </TD>
  </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Phone</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="phone" size="30" maxlength="100"/></TD>
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
    <% String id = (String)request.getAttribute("id");
       if( id != null ) { %>
          <input type="hidden" name="id" value="<%=id%>"/>
    <% } %>

<!-- LOGIN -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="username"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>User Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput editable='<%=""+(id==null)%>' name="username" size="30" maxlength="15"/></TD>
  </TR>

<!-- PASSWORD -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="password"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="password" size="30" maxlength="15"/></TD>
    <TD CLASS="bodyText" ALIGN="left" VALIGN="top">&#160;</TD>
  </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="top">Minimum&#160;of&#160;7&#160;characters, maximum of 15<BR></TD>
  </TR>  

<!-- PASSWORD VERIFICATION -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="password-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Re-type Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="password-once-more" size="30"/></TD>
  </TR>

<!-- EMAIL -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Email</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email" size="30" maxlength="100"/></TD>
  </TR>

<!-- EMAIL VERIFICATION -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Re-type Email</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email-once-more" size="30" maxlength="100"/></TD>
  </TR>

  <TR valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" background="/i/p/graybv_lite_bg.gif" HEIGHT="16">&#160;<FONT COLOR="#FFFFFF"><B>Terms of Use</B></FONT></TD>
  </TR>
  <TR align="right" valign="middle">
    <TD COLSPAN="4" CLASS="bodyText" ALIGN="center" VALIGN="middle"><tc-webtag:textArea name="<%=Constants.KEY_TERMS%>" rows="10" cols="80" readOnly="true" class="bodyText"/></TD>
  </TR>

    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="<%=Constants.KEY_AGREE_TO_TERMS%>"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>I Agree to the Terms and Conditions stated above</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:chkBox name="<%=Constants.KEY_AGREE_TO_TERMS%>"/></TD>
  </TR>

    <TR>
        <TD COLSPAN="3"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0" /></TD>
        <INPUT type="hidden" name="module" value="Registration"/>
    </TR>
  <TR ALIGN="right" VALIGN="middle">
     <TD COLSPAN="3" ALIGN="center" VALIGN="middle" CLASS="statText"><input type="button" onClick="Javascript:clearForm(document.frmPrimReg)" name="clear" value=" Clear "/>&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
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
