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
                    <p class ="regmiddle"><strong><font size="4">Prizes</font></strong></p>
                  <p class ="regmiddle">From each day's Qualification Round, the top four Qualifiers will be invited back in the evening to compete 
                  in a <br/>one-hour head-to-head competition for these exciting grand prizes. In addition, the first 1000 participants 
                  receive a JavaOne Coding Challenge t-shirt and messenger bag.</p>

                  
         <table width="604" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td width="30%" class="sidebarTitle">Participant(s)</td>
                    <td width="70%" class="sidebarTitle">Prize</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText" valign="top">Grand Prize (3)*</td>
                    <td width="70%" class="sidebarText">
                    <ul>
                    <li>One complimentary full Conference pass to the 2006 JavaOne conference, valued at $1,995 (travel and lodging excluded)</li>
                    <li>A collection of 23 <A href="Javascript:openWin('/pl/?&module=Static&d1=javaone04&d2=book_titles','comp',685,655);">Java Series Publications</a>, valued at over $950** </li>
                    </ul>
                    </td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">1st Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$500 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">2nd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$250 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">3rd Runner Up (3)*</td>
                    <td width="70%" class="sidebarText">$125 gift certificate to redeem in the JavaOne Conference Retail Store</td>
                </tr>

                <tr>
                    <td width="30%" class="sidebarText">First 1,000 Participants</td>
                    <td width="70%" class="sidebarText">One JavaOne Coding Challenge T-Shirt and Messenger Bag</td>
                </tr>
                <tr>
                    <td width="100%" class="sidebarText" colspan="2">
                    *One Grand Prize and one 1st, 2nd, and 3rd Runner-Up prize awarded daily<br/>
                    **Titles subject to change based on availability
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