<%@ page import="java.net.URL,
                 com.topcoder.web.tc.Constants,
                 java.io.InputStream"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>2006 TopCoder Open Sponsor Track - Registration</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<STYLE TYPE="text/css">
html.termsHTML, body.termsBody
{
color: #FFFFFF;
background: #032F6B;
padding: 0px;
margin: 0px;
}
</STYLE>
</head>
<body class="termsBody">

    <%
        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+Constants.TERMS_OF_USE_ID+"="+Constants.TCO06_SPONSOR_TERMS_ID);
        InputStream is = termsURL.openStream();
        int count = is.available();
        for (int i=0; i<count; i++) {
            out.write(is.read());
        }
        is.close();
    %>

</body>
</html>
