<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">

      <span class="bigTitle">Registration Successful!</span>
      <br/><br/>

In order to be eligible to compete in the VeriSign Internal Coding Competition,
you must activate your account by following the directions sent to the email
address provided during registration.
<br><br>
<span class="bigRed">You <u>will not</u> be able to compete if you do not activate your account.</span>
<br><br>
Spend time in the Practice Rooms prior to the VeriSign Single Round Matches (SRMs) by clicking the Competition Arena tab above.
<br><br>
If you encounter any problems, please contact us at <A href="mailto:verisign@topcoder.com">verisign@topcoder.com</A>.

<br><br>
Good luck to you in the Arena!



         <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

         <br/><br/>

          </div>
      </td>




<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
<jsp:include page="right.jsp" />

</td>

   </tr>

</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
