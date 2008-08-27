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
<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>
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
                    <p class ="regmiddle"><strong><font size="4">Prizes</font></strong></p>
                  <p class ="regmiddle">From each day's Qualification Round, the top four Qualifiers will be invited back in the evening to compete
                  in a <br/>one-hour head-to-head competition for these exciting grand prizes. In addition, the first 800 participants
                  receive a JavaOne Coding Challenge, Powered by TopCoder messenger bag and t-shirt.</p>


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
                     <li>A collection of <A href="Javascript:openWin('/pl/?&module=Static&d1=javaone05&d2=book_titles','Books',700,655);">6 books from Sun Microsystems Press</A>, valued at $300**</li>
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
                    <td width="30%" class="sidebarText">First 800 Participants</td>
                    <td width="70%" class="sidebarText">One (1) JavaOne Coding Challenge, Powered by TopCoder Messenger Bag and T-shirt</td>
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