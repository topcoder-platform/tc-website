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
			<h3>Java not found!</h3>
			<p>Java could not be automatically detected on your machine.  This page will attempt to automatically 
			install Java and Java Web Start.  If the download and installation does not occur automatically, 
			click the link below to go to the Sun website where you can download the latest version of Java.</p>
			<object codebase='http://java.sun.com/update/1.4.2/jinstall-1_4_2-windows-i586.cab'
				classid='clsid:5852F5ED-8BF4-11D4-A245-0080C6F74284' height='0' width='0'>
				<embed type='application/x-java-applet;version=1.4' width='275' height='50' align='middle'></embed>
				<param name='app' value='http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp'>
				<param name='back' value='true'>
				<p><a target=_blank href='http://java.sun.com/j2se/1.4.2/download.html'>
				Download Java and Java Web Start</a></p>
			</object>
		</div>
		<div id='notes'>
			<p>If you believe that Java is in fact installed on your machine, you can try running the arena 
			using <a href='http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp'>Java Web Start</a> or as a 
			<a href='/tc?module=Static&d1=applet&d2=applet'>Java Applet</a>.</p>
		</div>
	</body>
</html>
