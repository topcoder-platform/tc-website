<%@ page import="com.topcoder.shared.util.ApplicationServer"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
<head>

<script language="JavaScript"><!--
	var javascriptVersion1_1 = false;
// --></script>

<script language="JavaScript1.1"><!--
	javascriptVersion1_1 = true;
// --></script>

<script langauge="JavaScript"><!--	
	var detectableWithVB = false;
	var pluginFound = false;
	
	function goURL(daURL) {
		if(javascriptVersion1_1) {
			window.location.replace(daURL);
		} else {
			window.location = daURL;
		}
		return;
	}
	
	function redirectCheck(pluginFound, redirectURL, redirectIfFound) {
		if( redirectURL && ((pluginFound && redirectIfFound) || (!pluginFound && !redirectIfFound)) ) {
			goURL(redirectURL);
			return pluginFound;
		} else {
			return pluginFound;
		}	
	}
	
	function canDetectPlugins() {
		if( detectableWithVB || (navigator.plugins && navigator.plugins.length > 0) ) {
			return true;
		} else {
			return false;
		}
	}
	
	function detectJavaWebStartWithMimeTypes() {
		if (navigator.mimeTypes && navigator.mimeTypes.length) {
			if (navigator.mimeTypes['application/x-java-jnlp-file']) {
				return true;
			}
		}
		return false;
	}
	
	function detectJavaWebStart(redirectURL, redirectIfFound) {
		pluginFound = detectJavaWebStartWithMimeTypes();
		if(!pluginFound && detectableWithVB) {
			pluginFound = detectActiveXControl('JavaWebStart.isInstalled');
		}
		return redirectCheck(pluginFound, redirectURL, redirectIfFound);
	}
	
	function detectJava(redirectURL, redirectIfFound) {
		pluginFound = detectPlugin('Java','Plug-in');
		if(!pluginFound && detectableWithVB) {
			pluginFound = detectActiveXControl('JavaPlugin');
		}
		return redirectCheck(pluginFound, redirectURL, redirectIfFound);
	}
	
	function detectPlugin() {
		var daPlugins = detectPlugin.arguments;
		var pluginFound = false;
		if (navigator.plugins && navigator.plugins.length > 0) {
			var pluginsArrayLength = navigator.plugins.length;
			for (pluginsArrayCounter=0; pluginsArrayCounter < pluginsArrayLength; pluginsArrayCounter++ ) {
				var numFound = 0;
				for(namesCounter=0; namesCounter < daPlugins.length; namesCounter++) {
					if( (navigator.plugins[pluginsArrayCounter].name.indexOf(daPlugins[namesCounter]) >= 0) || (navigator.plugins[pluginsArrayCounter].description.indexOf(daPlugins[namesCounter]) >= 0) ) {
						numFound++;
					}
				}
				if(numFound == daPlugins.length) {
					pluginFound = true;
					break;
				}
			}
		}
		return pluginFound;
	}
	
	if ((navigator.userAgent.indexOf('MSIE') != -1) && (navigator.userAgent.indexOf('Win') != -1)) {
		document.writeln('<script language="VBscript">');
	
		document.writeln('\'do a one-time test for a version of VBScript that can handle this code');
		document.writeln('detectableWithVB = False');
		document.writeln('If ScriptEngineMajorVersion >= 2 then');
		document.writeln('  detectableWithVB = True');
		document.writeln('End If');
	
		document.writeln('\'this next function will detect most plugins');
		document.writeln('Function detectActiveXControl(activeXControlName)');
		document.writeln('  on error resume next');
		document.writeln('  detectActiveXControl = False');
		document.writeln('  If detectableWithVB Then');
		document.writeln('     detectActiveXControl = IsObject(CreateObject(activeXControlName))');
		document.writeln('  End If');
		document.writeln('End Function');
	
		document.writeln('</scr' + 'ipt>');
	}
	
	support = 0;
	
	if(canDetectPlugins()) {
		if (detectJavaWebStart()) {
			support = 2;
		}
		else if (detectJava()) {
			support = 1;
		}
	}
// --></script>

<meta http-equiv="Refresh" content="10; URL=/tc?module=Static&d1=applet&d2=no-support"/>
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

<p>Detecting your level of Java support...</p>
<p>If your browser does not support JavaScript, you will be redirected to 
<a href="/tc?module=Static&d1=applet&d2=no-support">this page</a> in 10 seconds.</p>

<script language="JavaScript"><!--
	if (support == 1) { // java but no webstart
		goURL("/tc?module=Static&d1=applet&d2=partial-support");
	}
	else if (support == 2) { // java and webstart
		goURL("/tc?module=Static&d1=applet&d2=full-support");
	}
	else { // no java or webstart
		goURL("/tc?module=Static&d1=applet&d2=no-support");
	}
// --></script>

<noscript>
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
</noscript>

</body>
</html>
