<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@page import="com.topcoder.web.corp.request.Registration" %>
<% String appContext = request.getContextPath(); %>
<HTML>
<HEAD>
<TITLE>TopCoder - Portal</TITLE>
<jsp:include page="../script.jsp"/>
<script TYPE="text/javascript">
function getPermissions(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open(url,name,size);
    return;
  }
</SCRIPT>


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
<FONT SIZE="3" COLOR="#666666"><B>Account Administration - Create/Modify User</B></FONT><BR>
<P>
                       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
                       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>                    
<FORM method="POST" action="<%=appContext%>/">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <input type="hidden" name="module" value="UserEdit"/>
    <% String id = (String)request.getAttribute("id");
       if( id != null ) { %>
          <input type="hidden" name="id" value="<%=id%>"/>
       <%
       }%>
<!-- LOGIN -->
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>User Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="username" size="30" maxlength="15"/></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="username"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- PASSWORD -->
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Password</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="password" size="30" maxlength="15"/></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="password"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- FIRST NAME -->
    <TR>
      <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>First Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
      <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="first-name" maxlength="30" size="30"/></TD>
    </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="first-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- LAST NAME -->
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Last Name</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="last-name" size="30" maxlength="30"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="last-name"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>   

<!-- EMAIL -->
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><B>E-mail</B>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email" size="30" maxlength="100"/></TD>
  </TR>
    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>

<!-- EMAIL VERIFICATION 
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><B>Confirm E-mail</B>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="email-once-more" size="30" maxlength="100"/></TD>
  </TR>

    <TR>
        <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
        <TD colspan="2" class="errorText" align="left" valign="middle">
           <tc-webtag:errorIterator id="err" refname="email-once-more"><%=err%><br></tc-webtag:errorIterator>
        </TD>
    </TR>
-->

<!-- PHONE -->
  <TR>
    <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Phone</b>&#160;</TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
    <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><tc-webtag:textInput name="phone" size="30" maxlength="100"/></TD>
  </TR>
   <TR>
     <TD></TD><TD><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
     <TD colspan="2" class="errorText" align="left" valign="middle">
        <tc-webtag:errorIterator id="err" refname="phone"><%=err%><br></tc-webtag:errorIterator>
     </TD>
  </TR>
  <TR>
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle">&#160;</TD>
  </TR>  
  <TR>
    <TD COLSPAN="4" CLASS="bodyText" VALIGN="middle" background="/i/p/graybv_lite_bg.gif" HEIGHT="16">&#160;<FONT COLOR="#FFFFFF"><B>Current Permissions</B></FONT></TD>
  </TR>
  <TR>
    <TD COLSPAN="4"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" CLASS="bodyText" HEIGHT="15" VALIGN="middle">&#160;Permission 1</TD>
  </TR>
  <TR>
    <TD COLSPAN="4" CLASS="bodyText" HEIGHT="15" VALIGN="middle">&#160;Permission 2</TD>
  </TR>
  <TR>
     <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="bodyText"><a HREF="JavaScript:getPermissions('<%=appContext%>/?module=Static&d1=acc_admin&d2=permissions','300','400')" class="bodyText">Add/Remove Permissions</A></td>
  </TR>
    <TR>
        <TD COLSPAN="4"><HR NOSHADE="0"></TD>
    </TR>   
    <TR>
        <TD COLSPAN="4"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
    </TR>   
    
  <TR>
     <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="bodyText"><input type="button" onClick="" name="clear" value=" Clear ">&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
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
