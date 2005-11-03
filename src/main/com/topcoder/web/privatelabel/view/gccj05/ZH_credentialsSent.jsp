<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
<title>Google&#153; ?????????, ????? Topcoder????</title>
</head>
<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
   <tr>
      <td width="49%">&#160;</td>
      <td align="center">
         <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
               <td width="49%"></td>
               <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gccj05_logo.gif" alt="Google China Code Jam logo"></td>
               <td width="49%"></td>
            </tr>
         </table>
      </td>
      <td width="49%"></td>
   </tr>
   <tr>
      <td width="49%">&#160;</td>
      <td>
         <div class=greenBigBox>

         <%-- Tab bar links--%>
         <div align="center">
         <jsp:include page="ZH_links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

         <br><br>

         <span class="bigTitle">Registration</span>
         <span valign=top>
         <jsp:include page="ZH_right_reg.jsp" />
         </span>

         <br><br>
            Your login credentials have been sent to the provided email address.
         <br><br>
         <br><br>
         <br><br>
         To find out more detailed information about the Google China Code Jam 2005, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="ZH_foot.jsp" />
</body>
</html>