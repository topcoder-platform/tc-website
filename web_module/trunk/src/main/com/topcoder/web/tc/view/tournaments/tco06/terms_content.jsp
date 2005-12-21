<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>

<body>

    <%

        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+ Constants.TERMS_OF_USE_ID+"="+request.getParameter(Constants.TERMS_OF_USE_ID));
        StringBuffer buf = new StringBuffer(1000);
        BufferedReader ir = new BufferedReader(new InputStreamReader(termsURL.openStream()));
        while (ir.ready()) {
            out.write(ir.readLine());
            out.write("\n");
        }
        ir.close();
    %>
</body>

</html>



