<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">

   <tr>

<!-- Verizon logo-->
      <td width="147" bgcolor="#000000" rowspan="2" colspan="3" valign="top"><img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="141" border="0"/></td>

<!-- Top Nav-->
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="40" border="0"/></td>
   </tr>

   <tr>
<!-- Top Ad -->
      <td width="100%" bgcolor="#CC0001" colspan="2" align="left">
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr>
               <td width="100%"><img src="/i/events/verizon2003/vcc03_logo.gif" width="550" height="101" border="0"/></td>
               <td align="right" valign="middle"><img src="/i/events/verizon2003/pbtc.gif" width="146" height="34" border="0"/></td>
            </tr>
          </table>
      </td>
   </tr>
   
   <tr>
<!-- Top Bar -->
      <td width="147" bgcolor="#000000" colspan="3"><img src="/i/clear.gif" width="147" height="20" border="0"/></td>
      <td width="100%" bgcolor="#000000" colspan="2"><img src="/i/clear.gif" width="100%" height="20" border="0"/></td>
   </tr>
   
   <tr>
<!-- Left Column-->
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1"/></td>
      <td valign="top" bgcolor="#666666">
         <table  border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td bgcolor="#666666" valign="top"><img src="/i/clear.gif" width="127" height="10" border="0"/></td></tr>
            <tr><td>      
                     <jsp:include page="verizonLinks.jsp" >
                        <jsp:param name="selectedTab" value="rules"/>
                        <jsp:param name="selectedSubtab" value="general"/>
                     </jsp:include>
            </tr>
            <tr><td class="bodyText" bgcolor="#ffffff"><img src="/i/events/verizon2003/vcc03_right.gif" width="127" height="300" border="0"/></td></tr>
         </table><br />
       </td>
      <td width="10" bgcolor="#666666"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
       
<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
      <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="100%" height="10" border="0"/><br />
            <h2>Official Rules and Regulations</h2>
            
            <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

            <p>The 2003 Verizon Coding Challenge is being offered by Verizon Communications ("Verizon") and TopCoder, Inc. ("TopCoder").  Verizon is 
            using the results of the Coding Challenge to identify possible employees for their Chennai VDSI center.  The Coding Challenge will take place between 
            Monday, August 4 and Friday, August 29, 2003.  It begins with a 2-week online registration, after which up to 500 eligible individuals will be 
            invited to compete in the programming tournament.  The tournament consists of two (2) online elimination rounds and one (1) onsite final round.  
            All participants who compete in Round #1 will receive a Verizon Coding Challenge t-shirt.  In addition, Verizon will award $1,900 USD in cash prizes 
            to the top 4 finalists in the tournament.</p>

            <p><br /></p>
      </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>