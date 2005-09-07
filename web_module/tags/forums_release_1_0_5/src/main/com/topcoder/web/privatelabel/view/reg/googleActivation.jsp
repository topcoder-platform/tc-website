<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Google Code Jam 2003</title>
<link rel=stylesheet href="http://www.google.com/google.css">

<jsp:include page="../script.jsp" />
<jsp:include page="../nocache.jsp"/>
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
                     <a href="/pl/?module=Static&d1=google&d2=google_overview">Overview</a> &nbsp;|&nbsp;
                     <a href="/pl/?module=Static&d1=google&d2=google_sched">Schedule</a> &nbsp;|&nbsp;
                     <a href="/pl/?module=Static&d1=google&d2=google_rules_overview">Rules</a> &nbsp;|&nbsp;
                     <font color="006633">Registration</font> &nbsp;|&nbsp;
                     <a href="/pl/?module=Static&d1=google&d2=google_faq">FAQ</a> &nbsp;|&nbsp;
                     <a href="/pl/?module=Static&d1=google&d2=google_practice">Practice Arena</a>
                  </font>
                  </div><br><br>
                  <b><font size="+1">Activation Successful!</font></b><br>


                  <p><br /></p>
                  <p><a href="http://www.topcoder.com"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                  <font size="-1">This tournament is brought to you by Google Inc. (<a href="http://www.google.com">http://www.google.com</a>) 2400 Bayshore Parkway, Mountain View, CA 94043 and powered by TopCoder, Inc. (<a href="http://www.topcoder.com">http://www.topcoder.com</a>) 703 Hebron Avenue, Glastonbury, CT 06033.
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
<a href="http://www.topcoder.com/tc?module=Static&d1=about&d2=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>