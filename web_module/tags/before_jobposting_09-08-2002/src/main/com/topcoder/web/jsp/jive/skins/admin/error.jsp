
<%@ page isErrorPage="true" %>

<%@ page import="java.util.*,
                 java.net.*,
                 com.coolservlets.forum.*,
                 com.coolservlets.forum.util.*,
				 com.coolservlets.forum.util.admin.*"
%>

<%	//////////////////
	// get parameters
	String errorMessage = ParamUtils.getParameter(request,"msg");
%>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style/global.css">
</head>

<body background="images/shadowBack.gif" bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">

<%	///////////////////////
	// pageTitleInfo variable (used by include/pageTitle.jsp)
	String[] pageTitleInfo = { "Error" };
%>
<%	///////////////////
	// pageTitle include
%><%@ include file="include/pageTitle.jsp" %>

<p>

<%	if( errorMessage != null ) { %>

	error message: <%= errorMessage %>

<%	} else { %>

	<%	String message = exception.getMessage(); %>
	<%	if( message == null ) { %>
	<%		message = ""; %>
	<%	} %>

	<%	if( exception instanceof UnauthorizedException ) { %>
	
		You are not authorized to take that action.
	
	<%	} else { %>
	
		A general error occured. (exception: <%= exception %>)
	
	<%	} %>
	
<%	} %>

</body>
</html>
