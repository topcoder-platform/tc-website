<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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

  						<p class ="regmiddle"><a href="/pl/?&module=Static&d1=javaone05&d2=mondayphotos">Monday</a> | <a href="/pl/?&module=Static&d1=javaone05&d2=tuesdayphotos">Tuesday</a> | Wednesday</p>
						
		
            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image1.jpg');"><img src="/i/events/javaone05/wednesday/image1_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image2.jpg');"><img src="/i/events/javaone05/wednesday/image2_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image3.jpg');"><img src="/i/events/javaone05/wednesday/image3_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>                          
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/events/javaone05/wednesday/image1.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image4.jpg');"><img src="/i/events/javaone05/wednesday/image4_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image5.jpg');"><img src="/i/events/javaone05/wednesday/image5_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/javaone05/wednesday/image6.jpg');"><img src="/i/events/javaone05/wednesday/image6_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>                       
                    </td>
                </tr>
            </table>
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