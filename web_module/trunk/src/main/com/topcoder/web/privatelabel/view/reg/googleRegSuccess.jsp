<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Google Code Jam 2003</title>

<link rel=stylesheet href="http://www.google.com/google.css">

<jsp:include page="../script.jsp" />
<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<style><!--
body,td,font,p,a
{
    font-family:arial,sans-serif
	}
.sidebarBox
{
	border: 1px solid #95D597;
	}
.sidebarText
{
	color: #333;
	line-height: 14px;
	background-color: #EEEEEE;
	}
.sidebarTitle
{
	color: #333;
	background-color: #CCCCCC;
	}
//-->
</style>

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>
	
	<div align="center">
<%-- Google Header--%>
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif">

<table border=0 cellspacing=5 width="740">
   <tr> 
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content> 
                  <div align="center">
	            <font size="-1">
                     <a href="/pl/?&module=Static&d1=google&d2=google_overview">Overview</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_sched">Schedule</a> &nbsp;|&nbsp; 
                     <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Rules</a> &nbsp;|&nbsp; 
                     <font color="006633">Register Now</font> &nbsp;|&nbsp; 
                     <a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);">Practice Arena</a>
                  </font>
                  </div><br><br>
                  <b><font size="+1">Registration Successful!</font></b><br>

<p><font size="-1">
<br/>

<b>In order to be eligible to compete in the Google Extreme Coding Challenge,
you must activate your account by following the directions sent to the email
address provided during registration. You <u>will not</u> be able to compete if you
do not activate your account.</b>

<br/><br/>

If you would like to upload a resume, click <a href="JavaScript:void window.open('<jsp:getProperty name="sessionInfo" property="ServletPath"/>resume?&<%=Constants.MODULE_KEY%>=ViewUpload&<%=Constants.COMPANY_ID%>=1865','Resume_Upload','top=2,left=2,width=350,height=300,status=0');">here</a><br/><br/>

Spend time in the Practice Rooms prior to the Qualification Round by clicking the Practice Arena tab above.<br/><br/>

Good luck to you in the Arena!
</font></p>


                  <p><br /></p>
                  <p><a href="http://www.topcoder.com"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                  <font size="-1">This tournament is brought to you by TopCoder, Inc. (<a href="http://www.topcoder.com">http://www.topcoder.com</a>) 703 Hebron Avenue, Glastonbury, CT 06033 and Google Inc. (<a href="http://www.google.com">http://www.google.com</a>) 2400 Bayshore Parkway, Mountain View, CA 94043.
                  </font></p>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</div>
<p><div class=footer> 
<small> &copy;2003 Google - 
<a href="http://www.google.com/">Home</a> - 
<a href="http://www.google.com/about.html">All About Google</a> - 
<a href="http://www.topcoder.com/?t=about_tc&c=index">About TopCoder</a> - 
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</p>
</div>
</body>
</html>