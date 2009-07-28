<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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
.googleFrame { border: 1px solid #006633; }

.advancersTitle
{
	color: #EEE;
	background-color: #319463;
}

.google_round_id
{
	font-size: 12px;
	color: #FFF;
	font-weight: normal;
	background-color: #666;
	white-space: nowrap;
}
//-->
</style>

<jsp:include page="../script.jsp" />

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>

	<div align="center">
<%-- Google Header--%>
<img src="/i/events/google2003/codejam_logo.gif" alt="Google Code Jam logo">

<table border=0 cellspacing=5 width="740">
   <tr>
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content>
                  <div align="center">

                  <!-- Tab bar links-->
                  <jsp:include page="googlelinks.jsp" >
                     <jsp:param name="selectedTab" value="advancers"/>
                  </jsp:include>

                  </div><br><br>

                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Advancers</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1">


                      <table class=googleFrame bgcolor="#ffffff" cellpadding=5 cellspacing=2 border=0 width="400">
                        <tr>
                           <td class="advancersTitle" align="left" colspan="2">Online Round 2 </td>
                        </tr>
                        <tr>
                           <td class="google_round_id" width="30%">Handle</td>
                           <td class="google_round_id" width="30%" align="right">Score</td>
                        </tr>

<tr><td class="sidebarText" align="left" >ZorbaTHut</td><td class="sidebarText" align="right">1261.21</td></tr>
<tr><td class="sidebarText" align="left" >ChristopherH</td><td class="sidebarText" align="right">1161.37</td></tr>
<tr><td class="sidebarText" align="left" >Yarin</td><td class="sidebarText" align="right">1047.23</td></tr>
<tr><td class="sidebarText" align="left" >DjinnKahn</td><td class="sidebarText" align="right">1041.41</td></tr>
<tr><td class="sidebarText" align="left" >lars</td><td class="sidebarText" align="right">994.69</td></tr>
<tr><td class="sidebarText" align="left" >bstanescu</td><td class="sidebarText" align="right">969.08</td></tr>
<tr><td class="sidebarText" align="left" >SnapDragon</td><td class="sidebarText" align="right">713.71</td></tr>
<tr><td class="sidebarText" align="left" >dgarthur</td><td class="sidebarText" align="right">704.54</td></tr>
<tr><td class="sidebarText" align="left" >mathijs</td><td class="sidebarText" align="right">686.32</td></tr>
<tr><td class="sidebarText" align="left" >ssancho2</td><td class="sidebarText" align="right">671.01</td></tr>
<tr><td class="sidebarText" align="left" >snewman</td><td class="sidebarText" align="right">659.51</td></tr>
<tr><td class="sidebarText" align="left" >Ruberik</td><td class="sidebarText" align="right">659.23</td></tr>
<tr><td class="sidebarText" align="left" >venco</td><td class="sidebarText" align="right">657.47</td></tr>
<tr><td class="sidebarText" align="left" >Wasteland</td><td class="sidebarText" align="right">655.75</td></tr>
<tr><td class="sidebarText" align="left" >po</td><td class="sidebarText" align="right">654.34</td></tr>
<tr><td class="sidebarText" align="left" >bladerunner</td><td class="sidebarText" align="right">644.39</td></tr>
<tr><td class="sidebarText" align="left" >doeth</td><td class="sidebarText" align="right">635.04</td></tr>
<tr><td class="sidebarText" align="left" >antimatter</td><td class="sidebarText" align="right">634.45</td></tr>
<tr><td class="sidebarText" align="left" >gepa</td><td class="sidebarText" align="right">632.61</td></tr>
<tr><td class="sidebarText" align="left" >radeye</td><td class="sidebarText" align="right">630.92</td></tr>
<tr><td class="sidebarText" align="left" >tomek</td><td class="sidebarText" align="right">626.29</td></tr>
<tr><td class="sidebarText" align="left" >jcd1</td><td class="sidebarText" align="right">624.15</td></tr>
<tr><td class="sidebarText" align="left" >AdrianKuegel*</td><td class="sidebarText" align="right">623.41</td></tr>
<tr><td class="sidebarText" align="left" >ValD</td><td class="sidebarText" align="right">620.40</td></tr>
<tr><td class="sidebarText" align="left" >dvickrey</td><td class="sidebarText" align="right">620.08</td></tr>

                     </table>

                        </font></p>

                        <p class="bodyText">* Due to a scheduling conflict, ante will be replacing AdrianKuegel for the final round</p>

                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
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
<a href="/tc?module=Static&d1=about&d2=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>