<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.request.UserEdit"
         autoFlush="false"
         buffer="64kb"
         errorPage="../exc/InternalError.jsp" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
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
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" WIDTH="100%" valign="top"><IMG SRC="/i/clear.gif" WIDTH="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Account Administration - Create/Modify User</B></FONT><BR>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>                    
<FORM method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>" name="frmUserEdit">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <input type="hidden" name="module" value="UserEdit"/>
    <% String id = (String)request.getAttribute("id");
       if( id != null ) { %>
          <input type="hidden" name="id" value="<%=id%>"/>
    <% } %>
<!-- LOGIN -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="username"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>User Name</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput editable='<%=""+(id==null)%>' name="username" size="30" maxlength="15"/></TD>
    </TR>

<!-- PASSWORD -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="password"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Password</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="password" size="30" maxlength="15"/></TD>
    </TR>

<!-- PASSWORD VERIFICATION -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="password-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Confirm password</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput passw="true" name="password-once-more" size="30" maxlength="15"/></TD>
    </TR>

<!-- FIRST NAME -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="first-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>First Name</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="first-name" maxlength="30" size="30"/></TD>
    </TR>

<!-- LAST NAME -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="last-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Last Name</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="last-name" size="30" maxlength="30"/></TD>
  </TR>

<!-- EMAIL -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><B>Email</B>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email" size="30" maxlength="100"/></TD>
  </TR>

  <!-- EMAIL VERIFICATION -->
    <TR>
        <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><B>Re-type Email</B>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email-once-more" size="30" maxlength="100"/></TD>
  </TR>

<!-- PHONE -->
   <TR>
     <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="phone"><%=err%><br></tc-webtag:errorIterator>
     </TD>
  </TR>
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Phone</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="phone" size="30" maxlength="100"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&#160;</TD>
  </TR>  
    <% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute(UserEdit.KEY_USER_PERMS);
       if( rsc != null ) { %>

    <TR><TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" background="/i/graybv_lite_bg.gif" HEIGHT="16">&#160;<FONT COLOR="#FFFFFF"><B>Additional Permissions</B></FONT></TD></TR>
    <TR><TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD></TR>
    <tc-webtag:iterator list="<%=rsc%>" id="row" >
      <TR><% String checked = row.getItem("has_permission").compareTo("1")==0 ? " checked=\"1\"" : " "; %>
        <TD COLSPAN="4" CLASS="bodyText" HEIGHT="15" VALIGN="middle">
          <input type="checkbox" name="perm-<%=row.getItem("role_id")%>"<%=checked%>>&#160;<%=row.getItem("description")%></input>
        </TD>
        <input type="hidden" name="permid-<%=row.getItem("role_id")%>"/>
      </TR>
    </tc-webtag:iterator>
    <% } %>
    <TR><TD COLSPAN="4"><HR NOSHADE="0"></TD></TR>   
    <TR><TD COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD></TR>   

  <TR>
     <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="bodyText"><input type="button" onClick="Javascript:clearForm(document.frmUserEdit)" name="clear" value=" Clear ">&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
  </TR>
</TABLE>
</FORM>

<P><BR></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="30"><IMG SRC="/i/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="../includes/foot.jsp"/>

</BODY>
</HTML>
