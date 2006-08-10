<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder | Activation</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
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

      <strong>Email sent</strong><br>
      An email has been sent with your login credentials.
   <br><br>

   </div>
</div>

</body>
</html>