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
                        <jsp:param name="selectedSubtab" value="eligibility"/>
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
            <h2>Eligibility</h2>
            
            <p>
            Registration will open on Monday, August 4th and will close on Friday, August 15th.  Registration is unlimited, however only the first 
            500 eligible individuals to register will be invited to compete.  Official invitations will be emailed on Monday, August 18th.  
            </p>
            <p><br /></p>
      </td>
   </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>