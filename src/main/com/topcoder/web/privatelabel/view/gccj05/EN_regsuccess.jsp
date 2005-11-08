<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.FullRegInfo" scope="session" />
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<title>Google Code Jam China, Powered by TopCoder</title>
</head>
<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
   <tr>
      <td width="49%">&#160;</td>
      <td align="center">
         <table border="0" width=100% cellpadding=0 cellspacing=0>
            <tr>
               <td width="49%"></td>
               <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gccj05_logo.gif" alt="Google Coder Jam China logo"></td>
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

         <!-- Tab bar links-->
         <div align="center">
         <jsp:include page="EN_links.jsp" >
         <jsp:param name="selectedTab" value="registration"/>
         </jsp:include>
         </div>

         <br><br>

         <span class="bigTitle">Registration</span>
         <span valign=top>
         <jsp:include page="EN_right_reg.jsp" />
         </span>

         <br><br>
         <div style="float: left;">
            <b>Step 4 of 5</b>
            <div class="regBreadOff">General</div>
            <div class="regBreadOff">Demographics</div>
            <div class="regBreadOff">Confirm</div>
            <div class="regBreadOn">Success</div>
            <div class="regBreadOff">Activation</div>
         </div>


<table cellpadding="0" cellspacing="0" class="bodyText" align="center" border="0" style="padding-right: 40px;">
<tr>
<td>
In order to be eligible to compete in the Google Code Jam China,
you must activate your account by following the directions sent to the email
address provided during registration.
<br><br>
<span class="bigRed">You will not be able to compete if you
do not activate your account.</span>
<br><br>
Spend time in the Practice Rooms prior to the Qualification Round by clicking the Competition Arena tab above.
<br><br>
If you encounter any problems, please contact us at <A href="mailto:gccj05@topcoder.com?subject=Question regarding Google Code Jam China">gccj05@topcoder.com</A>.
<br><br>
Good luck to you in the Arena!
</td>
</tr>
</table>

         <br><br>
         <br><br>
         To find out more detailed information about the Google Code Jam China, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Terms and Conditions</a>.
         </div>
      </td>
      <td width="49%">&#160;</td>
   <tr>
</table>
<jsp:include page="EN_foot.jsp" />
</body>
</html>