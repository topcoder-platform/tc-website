<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Message</title>
    </head>
    
    <body>
        <div align="center">
            ${message}
            <br/>            
            <a href="${nextpage}">Continue</a>
        </div>
    </body>
</html>