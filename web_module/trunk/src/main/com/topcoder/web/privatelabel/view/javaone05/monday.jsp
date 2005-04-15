<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet type="text/css" href="http://java.sun.com/javaone/javaone2004.css">
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

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
               <td valign="top" width="164"><jsp:include page="links.jsp" /></td>
               <td valign="top">
            <!-- start breadcrumb -->
                    <table border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0" >
                        <tr><td width="19"><img src="/i/clear.gif" width="634" height="20"></td></tr>
                  </table>
              <!-- end breadcrumb -->
                    <p></p>
                    <img src="/i/clear.gif" width="7" height="1"><img src="/i/events/javaone04/coding_challenge.gif" width="351" height="27" border="0"><img src="/i/clear.gif" width="140" height="1"><a href="/"><img src="/i/events/javaone04/pbtc_logo.gif" width="130" height="27" border="0"/></a>
                    <p></p>
                    <p class ="regmiddle"><strong><font size="4">Web Services Winners - Monday June 28</font></strong></p>
                  
                  <p class ="regmiddle">Monday | <a href="/pl/?&module=Static&d1=javaone04&d2=javaone_tuesday">Tuesday</a> | <a href="/pl/?&module=Static&d1=javaone04&d2=javaone_wednesday">Wednesday</a></p>
                  
         <table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Placement</td>
                    <td width="70%" class="sidebarTitle">Winner</td>
                    <td width="70%" class="sidebarTitle">Score</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText" valign="top">Grand Prize Winner</td>
                    <td width="70%" class="sidebarText">Matthew McEachen</td>
                    <td width="70%" class="sidebarText">186.94</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st Runner Up</td>
                    <td width="70%" class="sidebarText">Kevin Forbes</td>
                    <td width="70%" class="sidebarText">175.33</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (tie)</td>
                    <td width="70%" class="sidebarText">Douglas Wokoun</td>
                    <td width="70%" class="sidebarText">0.00</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (tie)</td>
                    <td width="70%" class="sidebarText">Ian Cardenas</td>
                    <td width="70%" class="sidebarText">0.00</td>
                </tr>
            </table>
            
            <p class ="regmiddle"><a href="/pl/?&module=Static&d1=javaone04&d2=javaone_mondayphotos">View Photos</a> from the event.</p>
            

               
               
               </td>
            </tr>
         </table>
         <jsp:include page="foot.jsp" />
      </div>
   </body>
</html>