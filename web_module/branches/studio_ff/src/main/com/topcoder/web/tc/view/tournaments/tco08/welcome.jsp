<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style type="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #ffffff;
background: #000000 url(/i/tournament/tco08/commercialBG.jpg) top center no-repeat;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#content{
background: transparent;
border-top: 1px solid black;
padding: 20px 10px;
}

a:link, a:visited {
 text-decoration: none;
 color: #ffffff;
}

a:hover, a:active {
 text-decoration: underline;
 color: #ac1414;
}
#footer { 
    height: 80px; 
    margin: 20px; 
    background: transparent; 
    text-align: center; 
    font-size: 12px; 
}

#footer a { 
    text-decoration: none; 
    color: #FFF; 
    font-weight: bold; 
}

#footer a:hover { color: #ff0000; }

#copyright { 
    margin-top: 1em; 
    font-size: 11px;
    color: #ccc;
}
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="content">

            <script type="text/javascript">
            var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="480" height="640" id="commercial" align="middle">'
            + '<param name="allowScriptAccess" value="always" />'
            + '<param name="movie" value="/flash/tournament/tco08/commercial.swf" />'
            + '<param name="quality" value="high" />'
            + '<param name="bgcolor" value="#000000" />'
            + '<param name="allowFullScreen" value="true" />'
            + '<embed src="/flash/tournament/tco08/commercial.swf" quality="high" bgcolor="#000000" allowFullScreen="true" width="480" height="640" name="commercial" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
            + '</object>';
            doWrite(s);
            </script>
    
    </div>
</div>

<div id="footer">

    <div id="footercontent">
        <p>
            <a href="/" class="footerLinks">Home</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=index" class="footerLinks">About TopCoder</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" class="footerLinks">Press Room</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=contactus" class="footerLinks">Contact Us</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=privacy" class="footerLinks">Privacy</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=terms" class="footerLinks">Terms</a>
        </p>
        <p>
            <a href="/tc" class="footerLinks">Developer Center</a>&#160;&#160;|&#160;&#160;
            <a href="/corp/?module=Static&amp;d1=corp&amp;d2=index" class="footerLinks">Corporate Services</a>
        </p>
        <p id="copyright">Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></p>
    </div><%-- #footercontent --%>

</div><%-- #footer --%>

</body>

</html>
