<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@page import="com.topcoder.web.corp.request.Registration,
                com.topcoder.web.corp.Constants,
                java.util.HashMap,
                com.topcoder.web.common.tag.BaseTag" %>
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
<FORM action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>" method="POST" name="frmPrimReg">
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
<% boolean extFieldsEditable = "true".equalsIgnoreCase((String)request.getAttribute("ext-fields-editable")); %>
<% String _extFieldsEditable = ""+extFieldsEditable; %>
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
           <tc-webtag:errorIterator id="err" refname="prim-title"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Title</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-title" size="30" maxlength="30"/></TD>
  </TR>

<!-- COMPANY NAME -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="prim-company-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR align="right" valign="middle">
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Company</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-name" editable="<%=_extFieldsEditable%>" size="30" maxlength="50"/></TD>
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
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-1" editable="<%=_extFieldsEditable%>" size="30" maxlength="50"/></TD>
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
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-address-2" editable="<%=_extFieldsEditable%>" size="30" maxlength="50"/></TD>
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
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-city" editable="<%=_extFieldsEditable%>" size="30" maxlength="30"/></TD>
  </TR>

<% HashMap defaults = (HashMap)request.getAttribute(BaseTag.CONTAINER_NAME_FOR_DEFAULTS);
   String defaultState = (defaults==null?null: (String)defaults.get("prim-company-state"));
   String defaultCountry = (defaults==null?null: (String)defaults.get("prim-company-country"));
   boolean selected;
%>
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
    <% if( extFieldsEditable ) { %>
        <select name="prim-company-state">
            <option value="-1"></option>
            <tc-webtag:queryIterator command="cmd-states-list" id="resultRow">
              <% String stateCode = resultRow.getItem("state_code").toString(); selected = stateCode.equals(defaultState); %>
              <option value="<%=stateCode%>"<%=selected?"selected":""%>><%=resultRow.getItem("state_name")%></option>
            </tc-webtag:queryIterator>
        </select>
    <% }
       else { %>
        <tc-webtag:queryIterator command="cmd-states-list" id="resultRow">
          <% String stateCode = resultRow.getItem("state_code").toString(); selected = stateCode.equals(defaultState);
             if( selected ) { %>
               <%=resultRow.getItem("state_name")%>
          <% }
          %>
        </tc-webtag:queryIterator>
    <% }
    %>
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
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="prim-company-zip"  editable="<%=_extFieldsEditable%>"size="10" maxlength="10"/></TD>
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
    <% if( extFieldsEditable ) { %>
        <select name="prim-company-country">
            <option value="-1"></option>
            <tc-webtag:queryIterator command="cmd-countries-list" id="resultRow">
              <% String countryCode = resultRow.getItem("country_code").toString(); selected = countryCode.equals(defaultCountry); %>
              <option value="<%=countryCode%>"<%=selected?"selected":""%>><%=resultRow.getItem("country_name")%></option>
            </tc-webtag:queryIterator>
        </select>
    <% }
       else { %>
        <tc-webtag:queryIterator command="cmd-countries-list" id="resultRow">
          <% String countryCode = resultRow.getItem("country_code").toString(); selected = countryCode.equals(defaultCountry);
             if( selected ) { %>
               <%=resultRow.getItem("country_name")%>
          <% }
          %>
        </tc-webtag:queryIterator>
    <% }
    %>
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
       <%
       }%>
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
