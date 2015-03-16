<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<%
        String redirectURL = "https://www.topcoder.com/community/data-science/data-science-tutorials/";
        response.sendRedirect(redirectURL);
    %>

<jsp:include page="../foot.jsp" />

</body>

</html>
