<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Mozilla/4.77 [en] (X11; U; Linux 2.4.16 i686) [Netscape]">
</head>
<body text="#000000" bgcolor="#666666" link="#0000EF" vlink="#59188E" alink="#FF0000">

<jsp:include page="MemberHeader.jsp" flush="true" />

<%
    String errorMsg = request.getParameter("errorMsg");
    if(errorMsg != null) {
	out.print(errorMsg);
    } else {
	out.print("An internal error occured");
    }
%>
</body>
</html>
