<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://www.google.com/google.css">

<title>Google Code Jam 2003</title>

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

<jsp:include page="../script.jsp" />

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>
	
	<div align="center">
<%-- Google Header--%>
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif" alt="Google Code Jam logo">

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
                     <a href="/pl/?&module=Static&d1=google&d2=googleLogin">Registration</a> &nbsp;|&nbsp;
                     <a href="/pl/?&module=Static&d1=google&d2=google_faq">FAQ</a> &nbsp;|&nbsp; 
                     <font color="006633">Practice Arena</font>
                  </font>
                  </div><br><br>
                  
                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Practice Arena</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1"><br/>
                        Click <a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,275);">here</a> to run the Practice Arena as a Java Applet.
                        <br/><br/>
                        Click <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">here</a> to run the Practice Arena as a Java Web Start Application.
                        <br/><br/>
                        Note:  If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
                        </font></p>

                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
                              </font></p>
                        </td>
                     </tr>
                  </table>
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
<a href="/?t=about_tc&c=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</p>
</div>
</body>
</html>