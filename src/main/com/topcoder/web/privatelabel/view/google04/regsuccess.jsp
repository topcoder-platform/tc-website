<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.privatelabel.view.tag.DemographicInput,
                 com.topcoder.web.common.BaseProcessor, 
                 com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="/privatelabel.tld" prefix="pl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004</title>
<jsp:include page="../script.jsp" />
</head>
<body>

<SCRIPT type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.frmLogin.submit();
     return false;
    } else return true;
  }
</SCRIPT>

<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="http://www.google.com/codejam/codejam_logo.gif" alt="Google Code Jam logo"></td>
					<td width="49%" valign=bottom align=right><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" border="0"></a></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>
			
			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="overview"/>
			</jsp:include>
			</div>
                          
<b><font size="+1">Registration Successful!</font></b><br>

<p><font size="-1">
<br/>

<b>If you converted your TopCoder account:</b><br/>
Your account is active.<br/><br/>

<b>For new accounts:</b><br/>
In order to be eligible to compete in the Google Code Jam 2003,
you must activate your account by following the directions sent to the email
address provided during registration. You <u>will not</u> be able to compete if you
do not activate your account.

<br/><br/>

Spend time in the Practice Rooms prior to the Qualification Round by clicking the Practice Arena tab above.<br/><br/>

Good luck to you in the Arena!
</font></p>
			<br/><br/>
			
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>

<p>
<div class=footerHolder> 
<small> &copy;2004 Google - 
<a href="http://www.google.com/">Home</a> - 
<a href="http://www.google.com/about.html">All About Google</a> - 
<a href="/?t=about_tc&c=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</div>
</p>

</body>
</html>