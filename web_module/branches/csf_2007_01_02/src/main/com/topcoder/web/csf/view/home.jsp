<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="content">
    <div class="">
        <div class="msLogo">
            <img src="/i/microsoft.png" alt="Microsoft" />
        </div>
        <div class="csfLogo">
            <img src="/i/csf.png" alt="Connected Services Framework Competition Series" />
        </div>
        <img src="/i/sandboxLogo.gif" alt="Connected Services Sandbox" />
    </div>

    <h1>H1</h1>
    <h1>H2</h1>
    <h1>H3</h1>
    <p>paragraph</p>
    <a href="">link</A>
    
    <jsp:include page="foot.jsp"/>

</div>
</div>

</body>
</html>