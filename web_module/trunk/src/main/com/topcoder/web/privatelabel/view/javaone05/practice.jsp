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
                 <p></p>
                 <img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone05/coding_challenge.gif" width="351" height="27" border="0">
                 <img src="/i/clear.gif" width="140" height="1"><a href="/"><img src="/i/events/javaone05/pbtc_logo.gif" width="130" height="27" border="0"/></a>
                 <p></p>
               <p class ="regmiddle"><strong><font size="4">Practice Arena</font></strong></p>
               
                  <p class="regmiddle">Practice now for the JavaOne Coding Challenge!  In the practice room, you get to code, compile, test, 
                  and submit algorithmic problems similar to the ones in the JavaOne Coding Challenge. Log in anytime and give yourself a 
                  better chance at walking away with one of the grand prizes.</p>
               
               <div align="left"><img src="/i/clear.gif" width="12" height="5">
               <OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" 
               width="239" 
               height="26" 
               name="LaunchApplet" 
               align="middle" vspace="0" 
               hspace="0" 
               codebase="http://java.sun.com/products/plugin/1.3/jinstall-13-win32.cab#Version=1,3,0,0">
               <PARAM value="LaunchApplet" name="name">
               <PARAM value="com.topcoder.client.contestApplet.LaunchApplet.class" name="code">
               <PARAM name="codebase" value="/contest/classes">
               <PARAM value="JavaOneContestApplet.jar" name="archive">
               <PARAM value="application/x-java-applet;version=1.3" name="type">
               <PARAM value="false" name="scriptable">
               <PARAM name="host" value="www.topcoder.com">
               <PARAM name="port" value="6001">
               <PARAM name="tunnel" value="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=6001">
               <PARAM name="companyName" value="SunPractice">
               
               <EMBED type="application/x-java-applet;version=1.3" 
                  code="com.topcoder.client.contestApplet.LaunchApplet.class" 
                  codebase="/contest/classes" 
                  name="LaunchApplet" 
                  archive="JavaOneContestApplet.jar" 
                  host="www.topcoder.com" 
                  port="6001" 
                  tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=6001" 
                  companyName="SunPractice" 
                  width="239" 
                  height="26" 
                  align="middle" 
                  vspace="0" 
                  hspace="0" 
                  scriptable="false" 
                  pluginspage="http://java.sun.com/j2se/1.3/jre/index.html">
               <NOEMBED>
               </NOEMBED>
               </EMBED>
               </OBJECT>
               </DIV>
               
               <p class="regmiddle">Click <a href="/contest/arena/JavaOneApplet.jnlp">here</a> to run the Practice Arena as a Java Web Start Application.</p>
               
                <p class="regmiddle">Note: If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.jsp" target="_blank">here</a>. </p>

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