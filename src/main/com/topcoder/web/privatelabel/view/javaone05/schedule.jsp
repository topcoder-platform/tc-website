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
               <p class ="regmiddle"><strong><font size="4">Schedule</font></strong></p>
               
         <table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="33%" class="sidebarTitle">Date</td>
                    <td width="34%" class="sidebarTitle">Problem Set Theme</td>
                    <td width="33%" class="sidebarTitle">Time</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Monday, June 27</td>
                    <td width="34%" class="sidebarText">Web Services - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 3:30 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Monday, June 27</td>
                    <td width="34%" class="sidebarText">Web Services - Competition</td>
                    <td width="33%" class="sidebarText">4:30 pm - 6:00 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Tuesday, June 28</td>
                    <td width="34%" class="sidebarText">Enterprise Services - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 3:30 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Tuesday, June 28</td>
                    <td width="34%" class="sidebarText">Enterprise Services - Competition</td>
                    <td width="33%" class="sidebarText">4:30 pm - 6:00 pm</td>
                </tr>
                
                <tr>
                    <td width="33%" class="sidebarText">Wednesday, June 29</td>
                    <td width="34%" class="sidebarText">Mobility - Qualification</td>
                    <td width="33%" class="sidebarText">11:00 am - 3:30 pm</td>
                </tr>

                <tr>
                    <td width="33%" class="sidebarText">Wednesday, June 29</td>
                    <td width="34%" class="sidebarText">Mobility - Competition</td>
                    <td width="33%" class="sidebarText">4:30 pm - 6:00 pm</td>
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