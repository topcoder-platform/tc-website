<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tcStyles.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google06.css"/>
    <title>Google Code Jam 2006 Employee Competition, Powered by TopCoder</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>


<table border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center">
                    <img border="0" src="/i/events/google2006/codejamLogo_emp.gif" alt="Google Code Jam Employee Competition"></td>
                    <td width="49%"></td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- Tab bar links-->
    <tr>
        <td>
            <div align="center">
                <jsp:include page="emp_links.jsp">
                    <jsp:param name="selectedTab" value="arena"/>
                </jsp:include>
                <br/>
            </div>
        </td>
    </tr>

    <tr>

        <!-- content -->
        <td>
            <div align="center">
            <div class="pageLayout" align="left">

         <span valign="top">
         <jsp:include page="emp_right.jsp"/>
         </span>

                <span class="bigBluetitle">Competition Arena</span>
                <br><br>
                <%--
                The Google Code Jam 2006 Arena is not available yet.
                --%>
                <A href="/pl/?module=Google06Credentials&<%=Constants.COMPANY_ID%>=1865">Forgot your Google Code Jam
                    2006 password?</A>

                <br><br>
                You need at least <A href="http://java.sun.com/getjava/index.jsp " target="_blank">Java Runtime version
                1.4</A> to run the Arena. Click
                <A href="http://java.sun.com/getjava/index.jsp " target="_blank">here</A> if you do not have Java
                Runtime 1.4
                installed.
                <br><br>
                Using a proxy server? Click
                <A href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">here</A> to read how to
                <A href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">configure Java</A>.
                <br><br>
                Click <A href="/pl/?module=Static&d1=google06&d2=emp_instructions">here</A> to read to the
                <A href="/pl/?module=Static&d1=google06&d2=emp_instructions">competition instructions</A>.
                <br><br>
                Click <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">here</a> to run the Competition
                Arena as a
                <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">Java Web Start Application</A>.
                <br><br>
                Note: If you wish to install Java Web Start click <a
                    href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
                <br><br>
                Click
                <a href="Javascript:openWin('?module=Static&d1=google06&d2=google_quick_launch','comp',300,275);">here</a>
                to run the Competition Arena as a
                <a href="Javascript:openWin('?module=Static&d1=google06&d2=google_quick_launch','comp',300,275);">Java
                    Applet</A>.
                <br><br>
                If you experience problems loading or running the Competition Arena please contact
                <A href="mailto:gcj@topcoder.com?subject=Question regarding Google Code Jam 2006">gcj@topcoder.com</A>.


                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br><br><br><br>
                To find out more detailed information about the Google&#153; Code Jam 2006 Employee Competition, please read the
                <a href="/pl/?&module=Static&d1=google06&d2=emp_rules">Terms and Conditions</a>.
                <br><br>
            </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div align="center">
                <jsp:include page="foot.jsp"/>
            </div>
        </td>
    </tr>
</table>
</body>
</html>