<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Technical Assessment Environment</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">
<meta http-equiv="refresh" content="0; url=http://www.topcoder.com/techassess/techassess?module=Login&cm=<%=request.getParameter("company")%>" />
</head>

<body id="testApplet" onLoad="focus()">

<div align="center">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td rowspan="2"><img border="0" height="54" width="10" src="/i/corp/testHeadTopLeft.gif" alt=""></td>
        <td id="testHead"><img alt="0" border="0" height="36" width="114" src="/i/corp/clear.gif"></td>
        <td id="testHead" width="100%"><img alt="0" border="0" height="36" width="10" src="/i/corp/clear.gif"></td>
        <td align="right"><img border="0" height="36" width="171" src="/i/corp/testHeadTCLogo.gif" alt="TopCoder"></td>
        <td rowspan="2"><img alt="0" border="0" height="54" width="10" src="/i/corp/testHeadTopRight.gif" alt=""></td>
      </tr>

    <tr>
        <td align="left"><img border="0" height="18" width="114" src="/i/corp/testHeadTabLeft.gif" alt=""></td>
        <td width="100%"><img border="0" alt="" height="18" width="10" src="/i/corp/clear.gif"></td>
        <td align="right"><img border="0" height="18" width="171" src="/i/corp/clear.gif"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td><img border="0" alt="" height="15" width="10" src="/i/corp/clear.gif"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%" id="testBody">
    <tr>
        <td><img src="/i/corp/testBodyTopLeft.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td background="/i/testBodyTop.gif" width="100%"><img src="/i/corp/clear.gif" alt="" width="10" height="10" alt="0" border="0"></td>
        <td><img src="/i/corp/testBodyTopRight.gif" alt="" width="10" height="10" alt="0" border="0"></td>
      <tr>

    <tr>
        <td background="/i/testBodyLeft.gif" width="10"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" align="center" class="bodyText">
            The Technical Assessment Tool has moved.  Please click <a href="http://www.topcoder.com/techassess/techassess?module=Login&cm=<%=request.getParameter("company")%>">here</a> to be taken to the new URL.
        <!--
            <table border="0" cellpadding="0" cellspacing="0" width="50%" align="center">
                <tr>
                    <td class="bodyText">
                        <h1 id="bodyTitle">Technical Assessment Environment</h1>

                        <p>This page should present you with a button to start the applet.</p>

                        <p><strong>NOTE:</strong> If an orange button to <strong>Load Technical Assessment Environment</strong> does <strong>not</strong> appear below, you may not have the
                        appropriate Plug-in software installed.

                        <script type="text/javascript">
                            function getReq(){u='/?t=support&amp;c=software_req';window.open(u);close();}
                        </script>
                        <a href="http://java.sun.com/products/plugin/" target="_blank">Get more information</a></p>

                        <div align="center">
                        <p>
                        <%
                            String host = request.getParameter("host");
                            if ((host==null) || host.equals("")) host="corporate.topcoder.com";

                            if(ApplicationServer.SERVER_NAME.equals("172.16.20.23"))
                            {
                                //dev
                                host = "172.16.210.55";
                            }


                            String port = request.getParameter("port");
                            if ((port==null) || port.equals("")) port="8001";

                            String tunnel = request.getParameter("tunnel");
                            if ((tunnel==null) || tunnel.equals("")) tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=screening&port=8001";

                            String companyID = request.getParameter("company");
                            if ((companyID==null) || companyID.equals("")) companyID="1";
                        %>

                        <OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="270" height="26" name="LaunchApplet" align="middle" vspace="0" hspace="0" codebase="http://java.sun.com/products/plugin/autodl/jinstall-1_4-windows-i586.cab#Version=1,4,0,0">
                        <PARAM name="type" value="application/x-java-applet;version=1.4" >
                        <PARAM name="code" value="com.topcoder.client.screening.tool.view.screeningClient.LaunchApplet.class" >
                        <PARAM name="codebase" value="/contest/classes">
                        <PARAM name="name" value="LaunchApplet" >
                        <PARAM name="archive" value="ScreeningClient.jar" >
                        <PARAM name="scriptable" value="false" > 
                        <PARAM name="HOST" value="<%=host%>">
                        <PARAM name="PORT" value="<%=port%>">
                        <PARAM name="TUNNEL" value="<%=tunnel%>">
                        <PARAM name="COMPANYID" value="<%=companyID%>">

                        <EMBED type="application/x-java-applet;version=1.3"
                        code="com.topcoder.client.screening.tool.view.screeningClient.LaunchApplet.class"
                        codebase="/contest/classes"
                        name="LaunchApplet"
                        archive="ScreeningClient.jar"
                        HOST="<%=host%>"
                        PORT="<%=port%>"
                        TUNNEL="<%=tunnel%>"
                        COMPANYID="<%=companyID%>"
                        width="270"
                        height="26"
                        align="middle"
                        vspace="0"
                        hspace="0"
                        scriptable="false"
                        pluginspage="http://java.sun.com/j2se/1.3/jre/index.html">
                        <NOEMBED>
                        </NOEMBED>
                        </OBJECT></p>
                        </div>

                        <p><strong>You may minimize this browser window, but do not close it.</strong> Doing so will close the applet.</p>
                    </td>
                </tr>
            </table>
            -->
        </td>
        <td  background="/i/testBodyRight.gif" width="10"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
    </tr>

    <tr>
        <td width="10"><img src="/i/corp/testBodyBottomLeft.gif" alt="" width="10" height="10" border="0"></td>
        <td width="100%" background="/i/testBodyBottom.gif"><img src="/i/corp/clear.gif" alt="" width="10" height="10" border="0"></td>
        <td width="10"><img src="/i/corp/testBodyBottomRight.gif" alt="" width="10" height="10" border="0"></td>
    <tr>
</table>

</div>

</body>
</html>
