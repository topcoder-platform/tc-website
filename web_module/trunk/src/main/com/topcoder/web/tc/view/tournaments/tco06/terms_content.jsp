<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.io.InputStream"%>
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
        InputStream is = termsURL.openStream();
        int count = is.available();
        while (count > 0) {
            for (int i=0; i<count; i++) {
                out.write(is.read());
            }
            count = is.available();
        }
        is.close();
    %>
</body>

</html>



