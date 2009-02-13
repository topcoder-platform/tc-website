<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
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
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_login.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="4096">&nbsp;
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
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                </TABLE>
            </TD>
            <TD HEIGHT="100%"><BR><BR>
                        <P CLASS="bodyText">New to TopCoder?  Click <A HREF="?module=Static&d1=registration&d2=registration">here</A> to register now.</P><BR>

<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<%
String nextpage = (String)request.getAttribute("nextpage");
if(nextpage==null) nextpage = request.getParameter("nextpage");
if(nextpage==null) nextpage = request.getHeader("Referer");
if(nextpage==null) nextpage = "http://"+request.getServerName()+request.getAttribute("canonpath");
String message = (String)request.getAttribute("message");
if(message==null) message = "";
String username = request.getParameter("username");
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
<form name="loginform" action="<%= "https://"+request.getServerName()+request.getAttribute("canonpath") %>" method="POST">
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
<BR>
<jsp:include page="../includes/right_resources.jsp" /></TD>
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
