<!-- Top Include Begins -->
<SCRIPT>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</SCRIPT>
<A NAME="top"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#6C6D71" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#6C6D71" WIDTH="100%">
    <TR VALIGN="top" >
		<TD WIDTH="100%" BGCOLOR="#6C6D71" ALIGN="right" BACKGROUND="/i/hs/top_gray_1pix_bg.gif">
<SPAN CLASS="smallFoot">        

<jsp:useBean id="CoderRatingStyle" class="com.topcoder.web.hs.model.CoderRatingStyleBean" scope="application" />
<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<% String style = CoderRatingStyle.getStyle(SessionInfo.getRating()); %>
<% if(SessionInfo.isLoggedIn()) { %>
        <font color="orange">Hello,</font> <span class="<%=style%>"><jsp:getProperty name="SessionInfo" property="Handle" /></span>
        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Logout" CLASS="globalNavSmall">Logout</A>
<% } else { %>
        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Login" CLASS="globalNavSmall">Login</A>
<% } %>

        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Static&d1=about&d2=about" CLASS="globalNavSmall">about [TCHS]</A>   
        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Static&d1=contacts&d2=contacts" CLASS="globalNavSmall">contacts</A>   
        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Home" CLASS="globalNavSmall">[TCHS] home</A>   
        &nbsp;&nbsp;::&nbsp;&nbsp;   <A HREF="?module=Static&d1=coaches_corner&d2=coaches_corner" CLASS="globalNavSmall">Coach's Corner</A>&nbsp;&nbsp;</SPAN>
        </TD>
    </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934" WIDTH="100%">
    <TR VALIGN="middle">
        <TD WIDTH="100%" HEIGHT="50" BGCOLOR="#000000">&nbsp;&nbsp;<A HREF="?module=Home"><IMG SRC="/i/hs/top_tchs_logo.gif" WIDTH="168" HEIGHT="36" ALT="" BORDER="0"></A></TD>
	<TD WIDTH="100%" HEIGHT="50" BGCOLOR="#000000" ALIGN="right"><IMG SRC="/i/hs/top_banner2.gif" WIDTH="500" HEIGHT="50" ALT="" BORDER="0"></TD>
     </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
    <TR VALIGN="middle">
        <TD WIDTH="100%" HEIGHT="21" BGCOLOR="#000000" BACKGROUND="/i/hs/top_rednav_bg.gif">
<% if(SessionInfo.isGuest()) { %>
        &nbsp;&nbsp;&nbsp;<A HREF="?module=Static&d1=registration&d2=registration" CLASS="rednav">Register</A> 
<% } else if(SessionInfo.isStudent()) { %>
        &nbsp;&nbsp;&nbsp;<A HREF="?module=UpdateStudent" CLASS="rednav">Update Profile</A> 
<% } else if(SessionInfo.isCoach()) { %>
        &nbsp;&nbsp;&nbsp;<A HREF="?module=UpdateCoach" CLASS="rednav">Update Profile</A> 
<% } else { // assuming admin %>
        &nbsp;&nbsp;&nbsp;<A CLASS="rednav">Register</A>
<% } %>

        &nbsp;&nbsp;&nbsp;<A HREF="?module=Static&d1=arena&d2=arena_main" CLASS="rednav">Competition Arena</A> 

<% if(SessionInfo.isLoggedIn()) { %>
        &nbsp;&nbsp;&nbsp;<A HREF="?module=Static&d1=tour&d2=mem_tour" CLASS="rednav">Competition Guide</A>
<% } %>

        &nbsp;&nbsp;&nbsp;<a class="rednav" href="Javascript:openWin('?module=Static&d1=arena&d2=quick_launch','comp',300,225);"><I><FONT COLOR="#FFF600">Quick Launch&gt;&gt;</FONT></I></A>
        </TD>
    </TR>
</TABLE>
</TD></TR></TABLE>
<!-- Top Include Ends -->
