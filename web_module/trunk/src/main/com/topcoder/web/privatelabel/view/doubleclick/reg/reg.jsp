<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>DoubleClick</title>
<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body>

<jsp:include page="../links.jsp" >
   <jsp:param name="tabLev1" value="collegiate"/>
   <jsp:param name="tabLev2" value="registration"/>
</jsp:include>

<div CLASS="dc_bodySpacer" align="center">
<table width="750" cellpadding="0" cellspacing="0">
   <tr>
      <td CLASS="dc_bodyCell">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
      </td>

      <td width="100%" CLASS="dc_bodyCell">
         <div CLASS="dc_bodyText">
         <p align="left" class="pageTitle">Registration</p>
         <p>Text goes here</p>        
         </div>
      </td>

   </tr>
</table>
</div>

<jsp:include page="../foot.jsp" />

</body>
</html>