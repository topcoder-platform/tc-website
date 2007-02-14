<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<style type="text/css">
#message {
float:right; 
width: 180px; 
margin: 0px 0px 20px 20px;
color: #8B0A50;
font-size: 11px;
}
#message a:link, #message a:visited {
color: #8B0A50;
text-decoration: underline;
font-weight: bold;
}
#message a:hover, #message a:active {
color: #FF0000;
text-decoration: none;
font-weight: bold;
}
</style>

<div id="message" style="" align="center">
    <div style="margin-bottom: 10px;">
    <A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco07/message.png" alt="TCO07" /></A>
    </div>
    You are not registered for the <strong>TCO07 Studio Competition</strong>.
    <br>Would you like to <strong><a href="" class="tco07MessageLink">register</a></strong>?
<%--
    You are registered for the TCO07 Studio Competition.
--%>
<%--
    Sorry, you are ineligible for the <strong>TCO07 Studio Competition</strong>.
    <br>If this is a mistake, contact <A href="mailto:service@topcoder.com.">service@topcoder.com</A>.
--%>
</div>