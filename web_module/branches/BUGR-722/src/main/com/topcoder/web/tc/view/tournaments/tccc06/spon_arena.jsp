<%@  page language="java"  %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="competitionArena"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
	<tr valign="top">
		<td valign="top" align="center">
		<div class="bodySpacer">

<span class="bigTitle">Competition Arena</span>
<br><br>
Click <a href="Javascript:openWin('?module=Static&d1=tournaments&d2=tccc06&d3=spon_quick_launch','comp',300,275);">here</a> to run the Competition Arena as a <a href="Javascript:openWin('?module=Static&d1=tournaments&d2=tccc06&d3=spon_quick_launch','comp',300,275);">Java Applet</A>.
<br/><br/>
Click <a href="/contest/arena/ContestAppletSponsor.jnlp" target="_blank">here</a> to run the Competition Arena as a <a href="/contest/arena/ContestAppletSponsor.jnlp" target="_blank">Java Web Start Application</A>.
<br/><br/>
Note:  If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
<br/><br/>
If you experience problems loading or running the Competition Arena please contact  <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
<br><br><br><br><br><br><br><br>

See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=spon_rules">rules and regulations</A> for more details.
<br><br><br><br><br><br><br><br>
        </div>
		</td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<%--
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
--%>
</td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
