<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/home.css"/>
</head>
<body>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
<%-- Header --%>
	<tr>
		<td colspan=7>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeTopBar align=right><A href="/?t=about_tc&c=index" class="loginLinks">About TopCoder</A></td>
			</tr>
			<tr>
				<td class=homeLogo><img src="/i/logo_r.gif" border=0 /></td>
			</tr>
			<tr>
				<td class=homeRedBar>&#160;</td>
			</tr>
		</table>
		</td>
	</tr>

<%-- Banners --%>
	<tr>
		<td width="50%" rowspan=2>&#160;</td>
		<td class=homeLeftBan><A href="/tc"><img src="/i/home/tab_developercenter.gif" border=0 /></A></td>
		<td class=homeGutter rowspan=2>&#160;</td>
		<td class=homeCentBan><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" border=0 /></A></td>
		<td class=homeGutter rowspan=2>&#160;</td>
		<td class=homeRightBan><A href="/?t=news_events&c=index"><img src="/i/home/tab_newsevents.gif" border=0 /></A></td>
		<td width="50%" rowspan=2>&#160;</td>
	</tr>
<%-- Body --%>
	<tr>
<%-- Left Column --%>
		<td class=homeLeftCol>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr><td class=homeBigPromo><A href="/tc"><img src="/i/home/promos/developercenter.gif" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="/tc?module=Static&d1=dev&d2=ad_overview"><img src="/i/home/promos/earncash.jpg" border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/tc" class=homeTitleLink>Algorithm Competitions</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm competitions.</td>
			</tr>

			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=development&c=index" class=homeTitleLink>Software Competitions</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Compete in software <A href="/?t=development&c=index">component</A> or <A href="/?t=development&c=index">application</A> competitions and get paid for what you build! You can also earn money by <A href="/?t=development&c=index">reviewing</A> software components.</td>
			</tr>

			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/tc?module=Static&d1=contracting&d2=index" class=homeTitleLink>Looking for your next Gig?</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Just <A href="/tc?module=Static&d1=contracting&d2=index">register here</A> and TopCoder will contact you about temporary and permanent positions that fit your skills.</td>
			</tr>

			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/tc?module=Static&d1=about&d2=jobs" class=homeTitleLink>Work for TopCoder</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Take a look at the <A href="/tc?module=Static&d1=about&d2=jobs">job openings</A> at TopCoder and see if there's a position that is right for you.</td>
			</tr>
		</table>
		</td>
<%-- Center Column --%>
		<td class=homeCentCol>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr><td class=homeBigPromo><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/promos/techAssessTool.jpg" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp"><img src="/i/home/promos/compSubscriptions.jpg" border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class=homeTitleLink>Software</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Developers from all over the world are competing to build your next application. Learn how TopCoder delivers high-quality <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>">software</A> at a lower cost than the competition.</td>
			</tr>

			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class=homeTitleLink>Marketing Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Is your company looking to interact with developers from around the world? TopCoder offers many <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">opportunities</A> to do just that.</td>
			</tr>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=tces_home" class=homeTitleLink>Employment Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A> talent? Let TopCoder bring you together with software engineers looking for jobs.</td>
			</tr>
		</table>
		</td>
<%-- Right Column --%>
		<td class=homeRightCol>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr><td class=homeBigPromo><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/home/promos/tco04Finals.gif" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=spec_showdown"><img src="/i/home/promos/tco04SS_sm.gif" border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>October Events:</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText><br/>
				<b>10/06</b> - SRM 214<br/><br/>
				<b>10/16</b> - SRM 215<br/><br/>
				<b>10/18</b> - SRM 216<br/><br/>
				<b>10/27</b> - SRM 217
				</td>
			</tr>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=news_events&c=index" class=homeTitleLink>Press Room Highlights</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText><br/>
				Google's creative search for elite programmers <A href="/?&t=news_events&c=art_10_25_04">...more</A><br/>[October 25 - Associated Press]<br/><br/>
				Google holds coding contest <A href="/?&t=news_events&c=art_10_19_04">...more</A><br/>[October 19 - SJ Mercury]<br/><br/>
				Dream Job and Juicy Premiums for Young, Crackshot Programmers [Translation] <A href="/i/pressroom/tendances_tomek.pdf">...more</A><br/>[October - Tendances Carriere]<br/><br/>
				Google announces 50 Google Code Jam Finalists <A href="/?&t=news_events&c=pr_10_05_04">...more</A><br/>[October 5]<br/><br/>
				Coders win, winners code <A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank">...more</A><br/>[October 5 - NewsForge]<br/><br/>
				Triple Threat <A href="/?&t=news_events&c=art_10_03_04">...more</A><br/>[October - SD Magazine]<br/><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
<%-- Footer --%>
    <tr><td class="homeFooter" colspan=7>
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=news_events&c=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=contacts&c=index" class="footerLinks">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=about_tc&c=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=about_tc&c=terms" class="footerLinks">Terms</A>
			<br/>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A>
    <tr><td width="100%" class="copyright" colspan=7>Copyright &#169; 2001-2004, TopCoder, Inc. All rights reserved.</td></tr>
</table>


</body>
</html>
