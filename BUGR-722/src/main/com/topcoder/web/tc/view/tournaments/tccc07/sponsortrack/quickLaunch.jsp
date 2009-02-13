<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html id="quickLaunch">

<head>
    <jsp:include page="/script.jsp"/>


    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Competition Arena</title>

    <SCRIPT type="text/javascript">
        function getReq() {
            u = '?module=Static&amp;d1=faq&amp;d2=soft_req';
            window.open(u);
            close();
        }
    </SCRIPT>

</head>

<body>

<table width="100%" cellspacing="0" cellpadding="10" border="0">
    <tr>
        <td class="bodyText" width="100%">
            <h2>Competition Arena</h2>

            <p>This page should present you with a button to start the competition arena applet.</p>

            <p>NOTE: If a red button to "Load Competition Arena" does <strong>not</strong> appear below, you may not
                have the appropriate
                Plug-in software installed.</p>

            <div align="center">
		<object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
			width="239"
			height="26"
			name="LaunchApplet"
			align="middle"
			vspace="0"
			hspace="0"
			codebase="http://java.sun.com/update/1.4.2/jinstall-1_4_2-windows-i586.cab">
		
			<param name="name" value="LaunchApplet"/>
			<param name="code" value="com.topcoder.client.contestApplet.LaunchApplet.class"/>
			<param name="codebase" value="/contest/classes"/>
		
			<param name="archive" value="ContestApplet.jar"/>
			<param name="type" value="application/x-java-applet;version=1.4"/>
			<param name="scriptable" value="false"/>
			<param name="host" value="www.topcoder.com"/>
			<param name="port" value="5001"/>
			<param name="tunnel" value="http://tunnel1.topcoder.com/servlets-examples/tunnel?host=newlistener+port=5001"/>
			<param name="companyName" value="TopCoder"/>
			<PARAM name="sponsorName" value="TCCC07Sponsor">
			<embed type="application/x-java-applet;version=1.4"
			code="com.topcoder.client.contestApplet.LaunchApplet.class"
			codebase="/contest/classes"
			name="LaunchApplet"
			archive="ContestApplet.jar"
			host="www.topcoder.com"
			port="5001"
			tunnel="http://tunnel1.topcoder.com/servlets-examples/tunnel?host=newlistener+port=5001"
			companyName="TopCoder"
			sponsorName="TCCC07Sponsor"
			width="239"
			height="26"
			align="middle"
			vspace="0"
			hspace="0"
			scriptable="false"
			pluginspage="http://java.sun.com/j2se/1.4/jre/index.html">
			<noembed></noembed>
			</embed>
		</object>
            </div>
            <p><strong>You may minimize this browser window, but do not close it.</strong> Doing so will close the
                applet.</p>
        </td>
    </tr>
</table>

</body>

</html>
