<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>DoubleClick</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="../links.jsp" >
   <jsp:param name="tabLev1" value="student"/>
   <jsp:param name="tabLev2" value="registration"/>
</jsp:include>

<div class="dc_bodyTable">
   <div CLASS="dc_headerPic">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
   </div>

   <div CLASS="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>You have successfully activated your account.</p>

   </div>
</div>

<jsp:include page="../foot.jsp" />

</body>
</html>