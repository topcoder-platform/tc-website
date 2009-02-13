<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<jsp:include page="../../script.jsp" />
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="competitionArena"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

<span class="bigTitle">Competition Arena</span>
<br><br>
Click <a href="Javascript:openWin('?module=Static&d1=tournaments&d2=tco05&d3=spon_quick_launch','comp',300,275);">here</a> to run the Competition Arena as a <a href="Javascript:openWin('?module=Static&d1=tournaments&d2=tco05&d3=spon_quick_launch','comp',300,275);">Java Applet</A>.
<br/><br/>
Click <a href="/contest/arena/ContestAppletSponsor.jnlp" target="_blank">here</a> to run the Competition Arena as a <a href="/contest/arena/ContestAppletSponsor.jnlp" target="_blank">Java Web Start Application</A>.
<br/><br/>
Note:  If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
<br/><br/>
If you experience problems loading or running the Competition Arena please contact  <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
<br><br><br><br>
See the official <A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_rules">rules and regulations</A> for more details.
        </div>
		</td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<img src="/i/tournament/tco05/sun_right.gif" alt="Sun" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/nsa_right.gif" alt="NSA" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/yahoo_right.gif" alt="Yahoo" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/verisign_right.gif" alt="Verisign" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<jsp:include page="../../calendar.jsp" />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
</td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
