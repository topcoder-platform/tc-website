<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder Corporate Services</title>

<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
</head>

<body>

<jsp:include page="includes/top.jsp" >
  <jsp:param name="isHomePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
		<td colspan=5 valign=top>
		<table border=0 cellpadding=0 cellspacing=0 align=center width="100%">
			<tr>
		        <td valign=top>
		        <jsp:include page="includes/left.jsp" >
		            <jsp:param name="level1" value="index"/>
		        </jsp:include>
		        </td>

		        <td class=homeBigPromo><img src="/i/corp/bigPromo.jpg" border=0></td>

				<td class=homeRightPromos>
				<table width="170" border=0 cellpadding=0 cellspacing=0 align=right>
					<tr>
						<td><img src="/i/corp/featClientsHead.gif" border=0 /></td>
					</tr>
					<tr>
						<td class=homeRightPromosImg><img src="/i/corp/promos/praxairNrodale.gif" border=0 /></td>
					</tr>
					<tr>
						<td class=homeRightPromosImg><img src="/i/es/animated_emp_promo.gif" border=0 /></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
   </tr>
   <tr>
		<td class=homeGutter>&#160;</td>

		<td class="homeLeftCol">
		<table border=0 cellpadding=0 cellspacing=0 align=center width=250>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>Software</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>
				<br/>
				<A href="">Component Catalogs</A><br/>
				Re-usable software components in the TopCoder Software catalogs drive down cost while increasing the level of quality and speed of delivery.
				<br/><br/>
				<A href="">Application Development</A><br/>
				TopCoder leverages our member base of qualified software developers and our unique competition-based development methodology to create commercial software for our customers.
				<br/><br/>
				</td>
			</tr>
		</table>
		</td>

		<td class="homeCentCol">
		<table border=0 cellpadding=0 cellspacing=0 align=center width=250>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>Employment Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>
				<br/>
				<A href="">Technical Assessment Tool</A><br/>
				The TopCoder Testing Program allows companies to assess the technical abilities of candidates during the interview process, thereby reducing the time incurred by in-house engineers.
				<br/><br/>
				<A href="">Tournament Sponsorship</A><br/>
				TopCoder tournaments draw a global participation base of the top collegiate and professional developers.  TopCoder gathers information about each participant on how they are ranked and rated based on their performance
				<br/><br/>
				</td>
			</tr>
		</table>
		</td>

		<td class="homeRightCol">
		<table border=0 cellpadding=0 cellspacing=0 align=center width=250>
			<tr>
				<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
				<td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>Marketing Services</A></td>
			</tr>
			<tr>
				<td class=homeArrow>&#160;</td>
				<td class=homeText>
				<br/>
				<A href="">Tournament Sponsorship</A><br/>
				TopCoder offers custom programs for technology vendors to increase awareness and adoption through our tournaments.
				<br/><br/>
				<A href="">Private Label Events</A><br/>
				Through our private label events we have the ability to integrate select tools to be used in competition, allowing companies to showcase their tools in software design and development processes.
				<br/><br/>
				</td>
			</tr>
		</table>
		</td>

		<td class=homeGutter>&#160;</td>
	</tr>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>