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
			<p>Java Web Start was detected on your machine and is the preferred method for running 
			the TopCoder Arena.  To launch the arena using Web Start, click the link 
			below.</p>
			<p class='button'><a href='http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp'>
			<img src='http://www.topcoder.com/i/load_comp_arena.gif'/></a></p>
		</div>
		<div id='notes'>
			<p>If you have problems running the arena as a Java Web Start application, 
			you can try running it in the web browser as a 
			<a href='/tc?module=Static&d1=applet&d2=applet'>Java Applet</a>.</p>
			<p>Java versions 1.4 and higher are supported.  Check for the latest Java 
			updates at <a target=_blank href='http://www.java.com/'>http://www.java.com/</a></p>
		</div>
	</body>
</html>
