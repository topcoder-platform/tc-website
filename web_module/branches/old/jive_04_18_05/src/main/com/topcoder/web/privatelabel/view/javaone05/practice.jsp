<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link type="text/css" rel=stylesheet href="http://java.sun.com/javaone/javaone2004.css">


<title>2004 JavaOne Coding Challenge</title>



<jsp:include page="../script.jsp" />

</head>
   <body>
      <div align="center">
         <table border=0 cellspacing=0 width="800">
            <tr>
               <td colspan="2" align="left" valign="middle">
               <img src="/i/events/javaone04/banner_top.gif" width="800" height="106" border="0"/>
               </td>
            </tr>

            <tr>
               <td valign="top" width="164">
                  <jsp:include page="links.jsp" /></td>
               <td valign="top">
            <!-- start breadcrumb -->
                    <table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
                        <tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
                  </table>
              <!-- end breadcrumb -->
                 <p></p>
                 <img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0">
                 <img src="/i/clear.gif" width="140" height="1"><a href="/"><img src="/i/events/javaone04/pbtc_logo.gif" width="130" height="27" border="0"/></a>                    
                 <p></p>
                    <p class="regmiddle"><strong><font size="4">Practice Arena</font></strong></p>
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
            </tr>
         </table>
         <jsp:include page="foot.jsp" />
      </div>
   </body>
</html>