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
<table class="dc_bodyTable">
   <tr>
      <td CLASS="dc_headerPic">
      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
      </td>

      <td class="dc_bodyText">
         <p class="pageTitle">Registration</p>
         <p>Description of registration goes here</p>

         <table width="100%" cellpadding="0" cellspacing="3">
            <tr>
               <td class="dc_regTableQuestion">reg question</td>
               <td class="dc_regTableAnswer">answer</td>
            </tr>
            <tr>
               <td class="dc_regTableQuestion">reg question</td>
               <td class="dc_regTableAnswer">answer</td>
            </tr>
         </table>
              
      </td>

   </tr>
</table>
</div>

<jsp:include page="../foot.jsp" />

</body>
</html>