<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="script.jsp"/>
<script language="JavaScript">
  function submitEnter(e){
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.login.submit();
     return false;
    } else return true;
  }
</script>
</HEAD>

<BODY BGCOLOR="#000000" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">            
   <TR>
      <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A><IMG SRC="/i/ev/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
      <TD WIDTH="206" BGCOLOR="#000000"><screen:servletLink target="_parent"><IMG SRC="/i/ev/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="13"/></screen:servletLink></TD>
      <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>        
   </TR>             
</TABLE>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="statTextBig" width="100%" valign="top" ALIGN="center"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
 <P><BR/></P><P><BR/></P>
                  <TABLE WIDTH="250" BORDER="0" CELLPADDING="0" CELLSPACING="0">
                     <TR>
                        <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText" HEIGHT="18">&#160;&#160;&#160;Candidate Evaluation Application</TD>  
                     </TR>
                  </TABLE>                
                  <TABLE WIDTH="250" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#333333">
                     <TR>
                        <TD CLASS="time" ALIGN="center" VALIGN="middle">&#160;
                           <% if((String)request.getAttribute(Constants.MESSAGE_PARAMETER) != null){ %>
                              <p CLASS="statText">
                                 <%= request.getAttribute(Constants.MESSAGE_PARAMETER).toString() %>
                              </p>
                           <% }else if((String)request.getParameter(Constants.MESSAGE_PARAMETER) != null){ %>
                              <p CLASS="statText">
                                 <%= request.getParameter(Constants.MESSAGE_PARAMETER) %>
                              </p>
                           <% } %>
                           <screen:form NAME="login" METHOD="POST" ACTION="<%=Constants.CONTROLLER_URL%>">
                              <INPUT type="hidden" name='<%=Constants.REQUEST_PROCESSOR%>' value='Login'/>
                              <INPUT type="hidden" name='<%=Constants.FIRST_ATTEMPT%>' value='false'/>
                              <% if((String)request.getAttribute(Constants.REDIRECT) != null){ %>
                                 <INPUT type="hidden" name='<%=Constants.REDIRECT%>' value='<%= request.getAttribute(Constants.REDIRECT).toString() %>'/>
                              <% }else if((String)request.getParameter(Constants.REDIRECT) != null){ %>
                                 <INPUT type="hidden" name='<%=Constants.REDIRECT%>' value='<%= request.getParameter(Constants.REDIRECT).toString() %>'/>
                              <% } %>
                              <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" ALIGN="center">
                                 <TR>
                                    <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right" NOWRAP="">&#160;&#160;User Name:&#160;&#160;</TD>
                                    <TD HEIGHT="20" VALIGN="TOP" COLSPAN="2"><INPUT CLASS="dropdown" MAXLENGTH="15" SIZE="12" NAME="<%=Constants.HANDLE%>" TYPE="TEXT" onKeyPress="submitEnter(event)" VALUE=""/></TD>
                                 </TR>
                                 <TR>
                                    <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="14" ALIGN="right">&#160;&#160;Password:&#160;&#160;</TD>
                                    <TD HEIGHT="20" VALIGN="TOP"><INPUT CLASS="dropdown" MAXLENGTH="15" SIZE="12" NAME="<%=Constants.PASSWORD%>" TYPE="Password" onKeyPress="submitEnter(event)" VALUE=""/></TD>
                                    <TD CLASS="statTextBig" VALIGN="top" NOWRAP="">&#160;<A HREF="Javascript:document.login.submit()" CLASS="statTextBig"><FONT COLOR="#CCCCCC">Login &gt;</FONT></A>&#160;&#160;</TD>                    
                                 </TR>
                              </TABLE>
                           </screen:form>
                        <P><BR/></P>
                        </TD>
                     </TR>           
                    </TABLE>
 <P><BR/></P><P><BR/></P>   
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

</BODY>
</HTML>
