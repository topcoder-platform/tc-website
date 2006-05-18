<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

     <jsp:include page="/page_title.jsp">
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="&#160;"/>
     </jsp:include>

   <div id="regBcContainer">
      <div class="regBc">
         <div class="title">Step <strong>5</strong> of <strong>6</strong></div>
         <div class="off">Select Your Registration</div>
         <div class="off">General</div>
         <div class="off">Demographics</div>
         <div class="off">Confirm</div>
         <div class="on">Success</div>
         <div class="off">Activation</div>
      </div>
   </div>

   <div style="width:400px;">
   <strong>Your account has been successfully activated. Thank You!</strong>
   </div>
</div>

<br><br>
</body>
</html>
