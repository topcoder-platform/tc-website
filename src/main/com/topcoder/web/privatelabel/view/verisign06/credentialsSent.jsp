<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../script.jsp" />
    <title>VeriSign Internal SRMs, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>
<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
<td width="49%">&#160;</td>
<td>
<div class="greenBigBox">

         <!-- Tab bar links-->
         <div align=center>
         <jsp:include page="links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

         <br><br>
         <div style="float: left">
         <span class="bigTitle">Registration</span>
         </div>
         <div style="float: right">
         <jsp:include page="right_reg.jsp" />
         </div>
         <br><br>

Your login credentials have been sent to the provided email address.


         <br><br><br><br><br><br><br><br><br><br>
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>