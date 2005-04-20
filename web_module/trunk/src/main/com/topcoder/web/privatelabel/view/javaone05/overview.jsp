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
               <p class ="regmiddle"><strong><font size="4">Compete with Code and Win!</font></strong></p>
               
               <p class ="regmiddle">Sun Microsystems has again teamed up with TopCoder to bring the JavaOne&#8480; Coding Challenge to conference attendees.
               This unique event gathers together developers who use Java&#153; technology for coding, competition, and fun. By participating 
               in the JavaOne Coding Challenge, attendees have the opportunity to apply what they learn during the Conference sessions 
               to real-world programming problems that have a Mobility, Enterprise Applications, or Web Services theme. If you are a 
               Java technology developer, you do not want to miss this event. The first 1,000 participants will receive a JavaOne Coding 
               Challenge t-shirt and messenger bag.</p>
               
               <p class ="regmiddle"><strong><font size="4">Let the Coding Begin!</font></strong><br/></p>
               <p class ="regmiddle">Each day offers a qualification round - a 30-minute challenge pitting you against all other participants from the JavaOne Conference.</p>
               
               <p class ="regmiddle">In the onsite Competition Arena, participants will be presented with real-world programming problems and will be 
               given 30 minutes to use the Java programming language to code, compile, test, and submit solutions to the problem sets. 
               The problems will focus on the 3 major themes for the 2005 JavaOne Conference - Mobility, Enterprise Applications, and 
               Web Services. </p>

               <p class ="regmiddle">After each day's qualification round, TopCoder will objectively score the competitors' submissions for accuracy and for length of time to 
               complete the problem. The four individuals with the highest scores 
               will be invited back in the evening to compete head-to-head in the Competition Arena, where they will battle it out for 
               that day's grand prize.</p>
               
               <p class ="regmiddle"><strong><font size="4">Be Recognized</font></strong></p>
               
               <p class ="regmiddle">Have you ever wanted to show your colleagues how much better you are in your Java programming skills? This is the 
               way to show off your stuff. Take your grand prize back to the office and show your peers that you came out on top! 
               The winners of each day's competition will be recognized by posting their name on the Coding Challenge Scoreboard and on the JavaOne website.</p>
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