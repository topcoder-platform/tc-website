<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>DoubleClick</title>
<jsp:include page="../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body>

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="collegiate"/>
   <jsp:param name="tabLev2" value="rules"/>
</jsp:include>

<div CLASS="dc_bodyTable">
<table width="750" cellspacing="0" border="0" align="center">
   <tr>
      <td  valign="top">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
      </td>

      <td  valign="top" width="100%">
         <div CLASS="dc_bodyText">
         <p align="left" class="pageTitle">Rules</p>
         </div>
      </td>

   </tr>
</table>
</div>

<jsp:include page="foot.jsp" />

</body>
</html>