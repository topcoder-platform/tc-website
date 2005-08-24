<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel=stylesheet href="/css/javaone05.css">
<title>2005 JavaOne Coding Challenge</title>
</head>
<body>
<map name="bannerMap">
<area shape="rect" alt="http://www.sun.com/" coords="697,4,799,72" href="http://www.sun.com/" target="_new">
<area shape="rect" alt="http://java.sun.com/" coords="624,3,694,72" href="http://java.sun.com/" target="_new">
<area shape="rect" alt="http://www.sun.com/javaone" coords="0,7,616,70" href="http://www.sun.com/javaone" target="_new">
</map>

<center>
<table id="main" width="800" cellpadding="0" cellspacing="0" border="0">
            <tr>
               <td colspan="2" align="left" valign="middle">
               <img src="/i/events/javaone05/banner_top.gif" border="0" usemap="#bannerMap" alt="JavaOne - Experiencing Java technology through education, industry, and community">
               </td>
            </tr>
            <tr>
               <td valign="top" width="164"><jsp:include page="links.jsp" /></td>
               <td valign="top" >
                 <table border="0" width="100%" cellpadding="7" cellspacing="0"><tr><td valign="top"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0" /></td>
                 <td align="right" valign="top"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0" /></a></td></tr></table>
  						<p class ="regmiddle"><strong><font size="4">Mobility Winners - Wednesday June 29</font></strong></p>

						<p class ="regmiddle"><a href="/pl/?&module=Static&d1=javaone05&d2=monday">Monday</a> | <a href="/pl/?&module=Static&d1=javaone05&d2=tuesday">Tuesday</a> | Wednesday</p>

			<table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Placement</td>
                    <td width="70%" class="sidebarTitle">Winner</td>
                    <td width="70%" class="sidebarTitle">Score</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText" valign="top">Grand Prize Winner</td>
                    <td width="70%" class="sidebarText">Steve Dieter</td>
                    <td width="70%" class="sidebarText">507.64</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st Runner Up</td>
                    <td width="70%" class="sidebarText">Shinya Taniguchi</td>
                    <td width="70%" class="sidebarText">438.73</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (tie)</td>
                    <td width="70%" class="sidebarText">Kevin Beam</td>
                    <td width="70%" class="sidebarText">128.81</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">3rd Runner Up (tie)</td>
                    <td width="70%" class="sidebarText">Adam Browning</td>
                    <td width="70%" class="sidebarText">0.00</td>
                </tr>
            </table>

			<p class ="regmiddle"><a href="/pl/?&module=Static&d1=javaone05&d2=wednesdayphotos">View Photos</a> from the event.</p>
               </td>
            <tr>
               <td colspan="2" align="left" valign="middle">
                  <jsp:include page="foot.jsp" />
               </td>
            </tr>

         </table>
</center>
   </body>
</html>