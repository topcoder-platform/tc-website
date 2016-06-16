<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<%
  response.sendRedirect("https://www.topcoder.com");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Terms &amp; Revisions at TopCoder</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<%
	String redirectURL = "http://www.topcoder.com/community/how-it-works/terms/";
	response.sendRedirect(redirectURL);
%>

</body>

</html>
