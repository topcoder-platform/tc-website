<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

        <h1>Contest Registration</h1>

        <div align="center">
        After reading the terms below, pleace click <strong>"I Agree"</strong> to register.
        <br><br>
        
        <form name="terms" method="POST" action="${sessionInfo.servletPath}">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
        <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
        
        
        <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>
        
        <br><br>
        <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
        <br /></tc-webtag:errorIterator></span>
        <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/>I Agree
        <br><br>
        <button type="submit">Submit</button>
        </form>

        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>