<%@ page import="com.topcoder.shared.util.ApplicationServer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
	<head>
		<title>Launch TopCoder Arena</title>
		<style type="text/css" media="all">
			* { font-family: Arial, Sans-Serif; }
			p { font-size: 85%; margin: 0; padding: 0; padding-bottom: 1em; }
			a { font-weight: bold; text-decoration: none; color: blue; }
			a:hover { text-decoration: underline; }
			body { margin: 1em; padding: 0; }
			#message { border-bottom: 1px solid #ccc; margin-bottom: 1em; }
			h3 { font-size: 100%; margin: 0; padding: 0; }
			h4 { font-size: 85%; margin: 0; padding: 0; }
			img { border: none; }
			p.button { padding-left: 1em; }
		</style>
	</head>
	<body>
		<div id='message'>
			<h3>Launch TopCoder Arena</h3>
			<p>This page should present you with a button to start the competition arena applet.</p>
			
			<p><em>WARNING:</em> You may minimize this browser window, but do not close it.  Doing so will close the applet!</p>
			
			<p><object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
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
				<param name="tunnel" value="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001"/>
				<param name="companyName" value="TopCoder"/>
				<embed type="application/x-java-applet;version=1.4"
					code="com.topcoder.client.contestApplet.LaunchApplet.class"
					codebase="/contest/classes"
					name="LaunchApplet"
					archive="ContestApplet.jar"
					host="www.topcoder.com"
					port="5001"
					tunnel="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001"
					companyName="TopCoder"
					width="239"
					height="26"
					align="middle"
					vspace="0"
					hspace="0"
					scriptable="false"
					pluginspage="http://java.sun.com/j2se/1.4/jre/index.html">
					<noembed></noembed>
				</embed>
			</object></p>
		</div>
		
		<div id='notes'>
			<p><em>NOTE:</em> If a red button to "Load Competition Arena" does not appear above, 
			you may not have the appropriate Plug-in software installed.  
			<a target=_blank href='/tc?module=Static&d1=help&d2=index'>
			Click here for more information</a>.</p>
		</div>
		
	</body>
</html>
