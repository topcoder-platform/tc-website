<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.request.Login,
                 com.topcoder.web.corp.Constants" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="includes/left.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <div align="center">
            <p><br></p>
            <p><br></p>
            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Login</td></tr>
                <tr valign="middle">
                <form method="post" name="frmLogin" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td class="statText" align="center">

<%
    String nextpage = (String)request.getAttribute("nextpage");
    if(nextpage==null) nextpage = request.getParameter("nextpage");
    if(nextpage==null) nextpage = request.getHeader("Referer");
    if(nextpage==null) nextpage = "http://"+request.getServerName();
    String message = (String)request.getAttribute("message");
    if(message==null) message = "";
    String username = request.getParameter("username");
    if(username==null) username = "";
%>

<%--<form name="loginform" action="<%= "https://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">--%>
<form name="loginform" action="<%= "http://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">
<input type="hidden" name="module" value="Login">
<input type="hidden" name="nextpage" value="<%= nextpage %>">
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
   <TD CLASS="bodyText"><font size="+1" color="#ff2010"><%= message %></font></TD>
</TR>
</TABLE>
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
    <TD CLASS="bodyText"><B>Handle</B><BR><INPUT TYPE="text" NAME="username" VALUE="<%= username %>" SIZE="25" onKeyPress="submitEnter(event)"></TD>
</TR>
<TR>
    <TD CLASS="bodyText"><B>Password</B><BR><INPUT TYPE="password" NAME="password" SIZE="25" onKeyPress="submitEnter(event)"><BR><B><A HREF="javascript:document.loginform.submit()" CLASS="statTextBig">Login&gt;&gt;</A></B></TD>
</TR>
</TABLE>
</form>
<script>
  document.loginform.<%=username.equals("")?"username":"password"%>.focus();
</script>




                    </td>
                    </form>
                </tr>
            </table>
            <p><br></p>
            <p><br></p>
            <p><br></p>
            </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>









<HTML>
<HEAD>
	<title>TopCoder | High School</title>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="../includes/css.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
<jsp:include page="../includes/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/headinginside_login.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="4096">&nbsp;
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
                    <TD WIDTH="10"><IMG SRC="/i/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                </TABLE>
            </TD>
            <TD HEIGHT="100%"><BR><BR>
                        <P CLASS="bodyText">New to TopCoder?  Click <A HREF="?module=Static&d1=registration&d2=registration">here</A> to register now.</P><BR>

<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<%
    String nextpage = (String)request.getAttribute(Login.KEY_DESTINATION_PAGE);
    if(nextpage==null) nextpage = request.getParameter(Login.KEY_DESTINATION_PAGE);
    if(nextpage==null) nextpage = request.getHeader("Referer");
    if(nextpage==null) nextpage = "http://"+request.getServerName()+request.getAttribute("canonpath");
    String message = (String)request.getAttribute("message");
    if(message==null) message = "";
    String username = request.getParameter(Login.KEY_USER_HANDLE);
    if(username==null) username = SessionInfo.getHandle();
    if(username==null) username = "";
%>

<script>
  function submitEnter(e){
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     loginform.submit();
     return false;
    } else return true;
  }
</script>
<%--<form name="loginform" action="<%= "https://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">--%>
<form name="loginform" action="<%= "http://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">
<input type="hidden" name="module" value="Login">
<input type="hidden" name="nextpage" value="<%= nextpage %>">
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
   <TD CLASS="bodyText"><font size=+1 color=#ff2010><%= message %></font></TD>
</TR>
</TABLE>
<TABLE CELLSPACING="5" CELLPADDING="5" BORDER="0" ALIGN="center">
<TR>
    <TD CLASS="bodyText"><B>Handle</B><BR><INPUT TYPE="text" NAME="username" VALUE="<%= username %>" SIZE="25" onKeyPress="submitEnter(event)"></TD>
</TR>
<TR>
    <TD CLASS="bodyText"><B>Password</B><BR><INPUT TYPE="password" NAME="password" SIZE="25" onKeyPress="submitEnter(event)"><BR><B><A HREF="javascript:document.loginform.submit()" CLASS="statTextBig">Login&gt;&gt;</A></B></TD>
</TR>
</TABLE>
</form>
<script>
  document.loginform.<%=username.equals("")?"username":"password"%>.focus();
</script>

            </TD>
             <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                    <TD WIDTH="10"><IMG SRC="/i/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                </TABLE>
            </TD>
           </TR>
          </TABLE>
         </TD>
        </TR>

       </TABLE>
        </TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/frame_1pix_bg_lg_top.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/frame_1pix_bg_lg_top_right.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="" BGCOLOR="#001934" VALIGN="top">

<jsp:include page="../includes/right_resources.jsp" /></TD>
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
