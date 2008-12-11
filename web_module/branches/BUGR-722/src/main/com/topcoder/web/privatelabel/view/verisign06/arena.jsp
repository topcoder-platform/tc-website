<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>VeriSign Internal Coding Competition, Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev2" value="competitionArena"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Competition Arena</span>
                <br/><br/>

<%--
                <A href="/pl/?module=<%=Constants.VERISIGN_06_CREDENTIALS%>&amp;cid=17942">Forgot your password?</A>
                --%>


                You need at least <A href="http://java.sun.com/getjava/index.jsp " target="_blank">Java Runtime version
                1.4</A> to run the Arena. Click <A href="http://java.sun.com/getjava/index.jsp " target="_blank">here</A> if you do not have Java Runtime 1.4
                installed.
                <br><br>
                Using a proxy server? Click <A href="http://www.java.com/en/download/help/proxy_setup.xml"
                                               target="_blank">here</A> to read how to <A
                    href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">configure Java</A>.
                <br><br>
                Click <a href="/contest/arena/ContestAppletVeriSign.jnlp" target="_blank">here</a> to run the
                Competition Arena as a <a href="/contest/arena/ContestAppletVeriSign.jnlp" target="_blank">Java Web
                Start Application</A>.
                <br><br>
                Note: If you wish to install Java Web Start click <a
                    href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
                <br><br>
                Click <a href="Javascript:openWin('?module=Static&d1=verisign06&d2=quick_launch','comp',300,275);">here</a>
                to run the Competition Arena as a <a
                    href="Javascript:openWin('?module=Static&d1=verisign06&d2=quick_launch','comp',300,275);">Java
                Applet</A>.
                <br><br>

                <br/><br/>
                </div>
        </td>

        <!-- Right Column-->
        <td width="180" align="right" style="padding: 0px 15px 0px 0px;">
            <jsp:include page="right.jsp"/>

        </td>

    </tr>

</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
