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
				<td class=homeTopBar><A href="/" class="loginLinks">About TopCoder</A></td>
			</tr>
			<tr>
				<td class=homeLogo><img src="http://www.topcoder.com/i/logo_r.gif" border=0 /></td>
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
			<tr><td class=homeBigPromo><A href="/tc"><img src="/i/promos/developercenter.gif" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="/tc?module=Static&d1=dev&d2=ad_overview"><img src="/i/promos/earncash.jpg" border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/tc" class=homeTitleLink>Algorithm Competitions</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>How do you stand up among your peers? <A href="/tc">Compete</A> to be the best coder in the world through our algorithm competitions.</td>
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
				<td class=homeTitle><A href="http://software.topcoder.com/components/subscriptions.jsp" class=homeTitleLink>Component Catalog Subscriptions</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Now you can buy infrastructure components in both .NET and Java to serve as the building blocks for software components.  Only $12.95 a month for personal <A href="http://software.topcoder.com/components/subscriptions.jsp">subscriptions</A></td>
			</tr>
		</table>
		</td>
<%-- Center Column --%>
		<td class=homeCentCol>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr><td class=homeBigPromo><A href="/corp/?module=Static&d1=corp&d2=testing&d3=index"><img src="/i/promos/techAssessTool.jpg" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="http://software.topcoder.com/components/subscriptions.jsp"><img src="/i/promos/compSubscriptions.jpg" border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class=homeTitleLink>Software</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Some of the best developers in the world are competing to build your next application. Learn how TopCoder delivers high-quality <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>">software</A> at a lower cost than the competition.</td>
			</tr>

			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class=homeTitleLink>Marketing Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Is your company looking to interact with the most talented developers from around the world? TopCoder offers many <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">opportunities</A> to do just that.</td>
			</tr>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=tces_home" class=homeTitleLink>Employment Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A> the best talent?  Let TopCoder bring you together with software engineers looking for jobs.</td>
			</tr>
		</table>
		</td>
<%-- Right Column --%>
		<td class=homeRightCol>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr><td class=homeBigPromo><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/promos/tco04Finals.gif" border=0 /></A></td></tr>
			<tr><td class=homeSmallPromo><A href="/"><img src="/i/clear.gif" width=270 height=105 border=0 /></A></td></tr>
		</table>
		<table width="100%" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>Upcoming Events:</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText><br/>
				<b>10/06</b> - SRM 214<br/><br/>
				<b>10/16</b> - SRM 215<br/><br/>
				<b>10/18</b> - SRM 216<br/><br/>
				<b>10/27</b> - SRM 217<br/><br/>
				<b>11/11-12</b> - TCO Onsite Finals
				</td>
			</tr>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=news_events&c=index" class=homeTitleLink>Press Room Highlights</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText><br/>
				Google announces 50 Google Code Jam Finalists <A href="/?&t=news_events&c=pr_10_05_04">...more</A><br/>[October 5]<br/><br/>
				Coders win, winners code <A href="http://www.newsforge.com/article.pl?sid=04/09/30/187225" target="_blank">...more</A><br/>[October 5 - NewsForge]<br/><br/>
				Triple Threat <A href="/?&t=news_events&c=art_10_03_04">...more</A><br/>[October - SD Magazine]<br/><br/>
				Hometown hero <A href="http://www.brainerddispatch.com/stories/100204/bus_1002040018.shtml" target="_blank">...more</A><br/>[October 2 - Brainerd Dispatch]<br/><br/>
				TopCoder Developing Application for CRPF Spinal Cord Injury Research Group <A href="/?&t=news_events&c=pr_09_27_04">...more</A><br/>[September 27]<br/><br/>
				Outsourcing trend touches independents, too <A href="http://searchcio.techtarget.com/originalContent/0,289142,sid19_gci1006375,00.html" target="_blank">...more</A><br/>[September 15 - Search CIO]<br/><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
<%-- Footer --%>
    <tr><td class="homeFooter" colspan=7>
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=news_events&c=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=contacts&c=index" class="footerLinks">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=about_tc&c=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=about_tc&c=terms" class="footerLinks">Terms</A>
			<br/>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/" class="footerLinks">Corporate Services</A>
    <tr><td width="100%" class="copyright" colspan=7>Copyright &#169; 2001-2004, TopCoder, Inc. All rights reserved.</td></tr>
</table>


</body>
</html>