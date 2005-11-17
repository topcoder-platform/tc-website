<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/gccj05.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <title>Google&#153; Code Jam - 中国编程挑战赛, 竞赛软件由 Topcoder&#174;公司提供</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script>
        function openWin(url, name, w, h) {
            win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
</head>

<body>


<table border="0" width=100% cellpadding=0 cellspacing=0>
    <tr>
        <td width="49%">&#160;</td>
        <td align="center">
            <table border="0" width=100% cellpadding=0 cellspacing=0>
                <tr>
                    <td width="49%"></td>
                    <td valign="bottom" align="center"><img border="0" src="/i/events/gccj05/gcjc_logo.gif"
                                                            alt="Google Coder Jam China logo"></td>
                    <td width="49%"></td>
                </tr>
            </table>
        </td>
        <td width="49%"></td>
    </tr>
    <tr>
        <td width="49%">&#160;</td>
        <td>
            <div class=greenBigBox>

                <%-- Tab bar links--%>
                <div align="center">
                    <jsp:include page="ZH_links.jsp">
                        <jsp:param name="selectedTab" value="arena"/>
                    </jsp:include>
                </div>

                <br><br>

                <span class="bigTitle">竞技场</span>
                <span valign=top>
         <jsp:include page="ZH_right.jsp"/>
         </span>

                <br><br>
                <A href="/pl/?module=GoogleIndia05Credentials&cid=8039">忘了密码？</A>
                <br><br>
                你需要至少<A href="http://java.sun.com/getjava/index.jsp " target="_blank">Java Runtime version 1.4</A>来运行平台。点击<A
                    href="http://java.sun.com/getjava/index.jsp " target="_blank">这里</A>如果你还没有安装Java Runtime 1.4。
                <br><br>
                使用代理服务器？点击<A href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">这里</A>阅读如何<A
                    href="http://www.java.com/en/download/help/proxy_setup.xml" target="_blank">配置Java</A>。
                <br><br>
                点击<A href="/pl/?module=Static&d1=gccj05&d2=ZH_instructions">这里</A>阅读<A
                    href="/pl/?module=Static&d1=gccj05&d2=ZH_instructions">竞赛规则</A>。
                <br><br>
                点击<a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,275);">这里</A>运行竞技场，以<a
                    href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,275);">Java
                Applet</A>的方式启动竞技场。
                <br><br>
                点击<a href="/contest/arena/ContestAppletGoogleIndia.jnlp" target="_blank">这里</A>运行竞技场，以<a
                    href="/contest/arena/ContestAppletGoogleIndia.jnlp" target="_blank">Java Web Start Application</A>的方式启动竞技场。
                <br><br>
                注意：如果你想安装Java Web Start，点击<a href="http://java.sun.com/products/javawebstart/index.html"
                                             target="_blank">这里</A>。
                <br><br>
                如果你在运行竞技场时遇到任何问题，请及时电邮联系 <A
                    href="mailto:gcjc@topcoder.com?subject=Question regarding Google Code Jam China">gcjc@topcoder.com</A>.
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                <br><br>
                想要了解更多的 Google&#153; Code Jam - 中国编程挑战赛的信息， <a href="/pl/?module=Static&d1=gccj05&d2=ZH_rules">请点击 竞赛规则</a>.
            </div>
        </td>
        <td width="49%">&#160;</td>
    <tr>
</table>
<jsp:include page="ZH_foot.jsp"/>
</body>
</html>