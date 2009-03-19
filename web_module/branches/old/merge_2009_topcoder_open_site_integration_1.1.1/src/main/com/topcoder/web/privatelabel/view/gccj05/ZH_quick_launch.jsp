<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<html id="quickLaunch">

<head>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Competition Arena</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
    function getReq(){u='?module=Static&d1=faq&d2=soft_req';window.open(u);close();}
</SCRIPT>

</head>

<body>

<table width="100%" cellspacing="0" cellpadding="10" border="0">
    <tr>
        <td class="bodyText" width="100%">
            <h2>竞技场</h2>

            <p>这个网页中应该有个按钮，点击那个按钮可以启动竞技场程序。</p>

            <p>注意：如果下面没有一个红色的“加载竞技场”，您可能没有安装需要的插件。</p>

            <div align="center">
        <OBJECT classid = "clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
        width="239"
        height="26"
        name="LaunchApplet"
        align="middle"
        vspace="0"
        hspace="0"
        codebase = "http://java.sun.com/update/1.5.0/jinstall-1_5-windows-i586.cab#Version=1,5,0,0"
        <PARAM value="LaunchApplet" name="name">
        <PARAM value="com.topcoder.client.contestApplet.LaunchApplet.class" name="code">
        <PARAM name="codebase" value="http://www.topcoder.com/contest/classes">
        <PARAM value="GoogleChinaContestApplet.jar" name="archive">
        <PARAM value="application/x-java-applet;version=1.5" name="type">
        <PARAM value="false" name="scriptable">
        <PARAM name="host" value="www.topcoder.com">
        <PARAM name="port" value="7001">
        <PARAM name="tunnel" value="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=7001">
        <PARAM name="companyName" value="GoogleChina">
        <PARAM name="poweredbyview" value="true">
        <PARAM name="com.topcoder.client.contestApplet.editors.NoPluginManager" value="true">

        <EMBED type="application/x-java-applet;version=1.5"
            code="com.topcoder.client.contestApplet.LaunchApplet.class"
            codebase="http://www.topcoder.com/contest/classes"
            name="LaunchApplet"
            archive="GoogleChinaContestApplet.jar"
            host="www.topcoder.com"
            port="7001"
            tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=7001"
            companyName="GoogleChina"
            poweredbyview="true"
            com.topcoder.client.contestApplet.editors.NoPluginManager="true"
            width="239"
            height="26"
            align="middle"
            vspace="0"
            hspace="0"
            scriptable="false"
            pluginspage="http://java.sun.com/j2se/1.5/jre/index.html">
        <NOEMBED>
        </NOEMBED>
        </EMBED>
        </OBJECT>
        </div>
            <p><strong>您可以最小化这个浏览器窗口，但是请不要关闭它。关闭这个窗口的同时竞技场程序也会被关闭。</p>
        </td>
    </tr>
</table>

</body>

</html>
