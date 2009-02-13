<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.io.InputStream"%>
<%@ page language="java"  %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Logo Design Contest</title>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>

<style type="text/css">
.pageSpacer
{
   width: 510px;
	padding: 15px 0px 10px 0px;
   text-align: left;
}
.logoBox {
   text-align: center;
}

</style>

</head>

<body>

    <%
        URL termsURL = new URL(sessionInfo.getAbsoluteServletPath()+"?module=Terms&"+ Constants.TERMS_OF_USE_ID+"="+Constants.TCO06_LOGO_TERMS_ID);
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



