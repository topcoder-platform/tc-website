﻿<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gecj06.css"/>
    <script>
        function openWin(url, name, w, h) {
            win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
    <title>Google Code Jam Europe 2006, Powered by TopCoder</title>
</head>

<body>

<table border="0" width="100%" cellpadding="0" cellspacing="0">
<tr>
    <td width="49%">&#160;</td>
    <td align="center">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="49%"></td>
                <td valign="bottom" align="center"><img border="0" src="/i/events/gecj06/logo_CodeJamEurope.gif" alt="Google Code Jam Europe logo"></td>
                <td width="49%"></td>
            </tr>
        </table>
    </td>
    <td width="49%"></td>
</tr>
<tr>
<td width="49%">&#160;</td>
<td>
<div class="greenBigBox">

<!-- Tab bar links-->
<div align="center">
    <jsp:include page="links.jsp">
        <jsp:param name="selectedTab" value="arena"/>
    </jsp:include>
</div>

<br><br>


<span valign="top">
<jsp:include page="right.jsp"/>
</span>
<span class="bigTitle">Competition Arena</span>
         <br><br>
         The Google&#153; Code Jam Europe Arena is no longer available. 
         <%--
                <br><br>
                <A href="/pl/?module=GoogleEurope06Credentials&cid=18317">Forgot your password?</A>
                <br><br>
                You need at least <A href="http://java.sun.com/getjava/index.jsp " target="_blank">Java Runtime version
                1.4</A> to run the Arena. Click <A href="http://java.sun.com/getjava/index.jsp " target="_blank">here</A> if you do not have Java Runtime 1.4
                installed.
                <br><br>
                Using a proxy server? Click <A href="http://www.java.com/en/download/help/proxy_setup.xml"
                                               target="_blank">here</A> to read how to <A
                    href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">configure Java</A>.
                <br><br>
                Click <A href="/pl/?module=Static&d1=gecj06&d2=instructions">here</A> to read to the <A
                    href="/pl/?module=Static&d1=gecj06&d2=instructions">competition instructions</A>.
                <br><br>
                Click <a href="/contest/arena/ContestAppletGoogleEurope.jnlp" target="_blank">here</a> to run the
                Competition Arena as a <a href="/contest/arena/ContestAppletGoogleEurope.jnlp" target="_blank">Java Web
                Start Application</A>.
                <br><br>
                Note: If you wish to install Java Web Start click <a
                    href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
                <br><br>
                Click <a href="Javascript:openWin('?module=Static&d1=gecj06&d2=quick_launch','comp',300,275);">here</a>
                to run the Competition Arena as a <a
                    href="Javascript:openWin('?module=Static&d1=gecj06&d2=quick_launch','comp',300,275);">Java
                Applet</A>.
                <br><br>
                If you experience problems loading or running the Competition Arena please contact
            <A href="mailto:gcje@topcoder.com?subject=Question regarding Google Code Jam Europe">gcje@topcoder.com</A>.
        --%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
To find out more detailed information about the Google&#153; Code Jam Europe, including a list of the prizes, please read the
<a href="/pl/?module=Static&d1=gecj06&d2=rules">Terms and Conditions</a>.

</div>
</td>
<td width="49%">&#160;</td>
<tr>
</table>
<jsp:include page="foot.jsp"/>
</body>
</html>