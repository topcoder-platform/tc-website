<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%" valign=bottom align=right><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" border="0"></a></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>
			
			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="arena"/>
			</jsp:include>
			</div>


			<br/><br/>
			<span class=bigTitle>Competition Arena</span>
			<span valign=top>
			<table class=smallBoxTable align=right cellspacing=0 cellpadding=0>
				<tr>
					<td align=center nowrap=nowrap class=smallBlueBox>
					<span class=bodyTextBlue>Important Dates</span>
					<br/><br/>
					<b>Registration Starts</b><br/>
					Wednesday, September 1st
					<br/><br/>
					<b>Qualification Round</b><br/>
					Wednesday, September 15th
					<br/><br/>
					<b>Championship Round</b><br/>
					Friday, October 15th
					</td>
				</tr>
				<tr><td>&#160;</td></tr>
				<tr>
					<td align=center nowrap=nowrap class=smallGreenBox>
					<span class=bodyTextGreen>$30,000 in<br/>Cash Prizes!</span>
					<br/><br/>
					<b>1st Place - $10,000</b><br/>
					2nd Place - $5,000<br/>
					3rd Place - $2,500<br/>
					4th Place - $1,000
					<br/><br/>
					5th to 50th Place<br/>get $250 each!
					</td>
				</tr>
			</table>
			</span>
			<br/><br/>

			Click <a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,275);">here</a> to run the Competition Arena as a Java Applet.
			<br/><br/>
			Click <a href="/contest/arena/ContestAppletGoogle.jnlp" target="_blank">here</a> to run the Competition Arena as a Java Web Start Application.
			<br/><br/>
			Note:  If you wish to install Java Web Start click <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank">here</a>.
			<br/><br/>
			If you experience problems loading or running the Competition Arena please contact  <A href="mailto:googlecodejam@topcoder.com">googlecodejam@topcoder.com</A>.
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>