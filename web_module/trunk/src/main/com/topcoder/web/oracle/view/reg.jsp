<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/oracle/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Oracle</title>

    <link type="text/css" rel="stylesheet" href="/i/oracle/css/main.css">
    <link type="text/css" rel="stylesheet" href="/i/oracle/css/stats.css">

</head>

<body>

<div align="center">

    <h1>Contest Registration</h1>

    <div align="center">
        Please read through the following terms and then click <strong>"I Agree"</strong> when you're done.
        <br><br>

        <form name="terms" method="POST" action="${sessionInfo.servletPath}">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
            <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>


            <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

            <br><br>
            <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
            <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
        <br/></tc-webtag:errorIterator></span>
            <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/>I agree
            <br><br>
            <input type="image" src="/i/layout/btnSubmit.png" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'">
            <br><br>


        </form>
    </div>

</div>

</body>
</html>



</body>
</html>