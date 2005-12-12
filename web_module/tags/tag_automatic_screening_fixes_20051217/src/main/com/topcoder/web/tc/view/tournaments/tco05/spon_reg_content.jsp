<%@ page import="java.net.URL,
                 com.topcoder.web.tc.Constants,
                 java.io.InputStream"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>Registration</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

    <%
        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+Constants.TERMS_OF_USE_ID+"=16842");
        InputStream is = termsURL.openStream();
        int count = is.available();
        for (int i=0; i<count; i++) {
            out.write(is.read());
        }
        is.close();
    %>

</body>
</html>
