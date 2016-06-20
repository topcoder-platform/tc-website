<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
        String redirectURL = "https://www.topcoder.com/community/data-science/data-science-tutorials/";
        response.sendRedirect(redirectURL);
%>
<html>
<head>
<title>Algorithm Tutorials</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>


<jsp:include page="../foot.jsp" />

</body>

</html>
