<!-- Top Include Begins -->

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<a name="top"/>
<!-- Global Links begins -->
<table border="0" cellspacing="0" cellpadding="3" width="100%">
    <tr valign="top" >
        <td width="100%" class="globalNavSmall" align="right">

<jsp:usebean id="CoderRatingStyle" class="com.topcoder.web.hs.model.CoderRatingStyleBean" scope="application" />
<jsp:usebean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />

<% String style = CoderRatingStyle.getStyle(SessionInfo.getRating()); %>

<% if(SessionInfo.isLoggedIn()) { %>
            <strong><font color="orange">Hello,</font> <span class="<%=style%>"><jsp:getproperty name="SessionInfo" property="Handle" /></span></strong>
            &nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Logout" class="globalNavSmall">Logout</a>
<% } else { %>
            &nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Login" class="globalNavSmall">Login</a>
<% } %>

<% if(SessionInfo.isGuest()) { %>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Static&amp;d1=registration&amp;d2=registration" class="globalNavSmall">Register</a>&#160;&#160;
<% } else if(SessionInfo.isStudent()) { %>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=UpdateStudent" class="globalNavSmall">Update Profile</a>&#160;&#160;
<% } else if(SessionInfo.isCoach()) { %>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=UpdateCoach" class="globalNavSmall">Update Profile</a>&#160;&#160;
<% } else { // assuming admin %>
        &nbsp;&nbsp;|&nbsp;&nbsp;<font color="#666666">Register</font>&#160;&#160;
<% } %>

        </td>
    </tr>
</table>
<!-- Global Links ends -->

<!-- Logo begins -->
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000000" width="100%">
    <tr valign="middle">
        <td width="168" height="50"><a href="?module=Home"><img src="/i/top_tchs_logo.gif" width="168" height="36" alt="TopCoder High School" hspace="10" border="0"></a></td>
        <td width="99%" height="50" align="right"><img src="/i/top_banner2.gif" width="500" height="50" alt="" border="0"></td>
    </tr>
</table>
<!-- Logo begins -->

<!-- Main Links begins -->
<table cellspacing="0" cellpadding="3" width="100%" class="rednavBar" border="0">
    <tr valign="middle">
        <td width="49%" class="rednav">&#160;</td>

        <td class="rednav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="?module=Home" class="rednav">Home</a></td>

<% if(SessionInfo.isLoggedIn()) { %>
        <td class="rednav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="?module=Static&d1=tour&d2=mem_tour" class="rednav">Competition Guide</a></td>
<% } %>

        <td class="rednav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="Javascript:openWin('?module=Static&d1=arena&d2=quick_launch','comp',300,225);" class="rednav">Quick Launch&#160;&gt;&gt;</a></td>

        <td width="49%" class="rednav">&#160;</td>
    </tr>
</table>
<!-- Main Links ends -->

<!-- Top Include Ends -->
