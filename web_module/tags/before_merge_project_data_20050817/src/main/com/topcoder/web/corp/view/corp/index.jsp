<%@ page contentType="text/html; charset=ISO-8859-1" import="com.topcoder.web.corp.Constants, com.topcoder.shared.util.ApplicationServer"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder Corporate Services</title>
<jsp:include page="../script.jsp" />
<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
</head>

<body>

<jsp:include page="includes/top.jsp" />

<table border=0 cellpadding=0 cellspacing=0 width="100%">
   <tr>
		<td>
		<table border=0 cellpadding=0 cellspacing=0 align=center width="100%">
			<tr>
		        <td valign=top width="50%">
				<jsp:include page="includes/left.jsp" >
				  <jsp:param name="level1" value="index"/>
				</jsp:include>
				</td>
		        <td class=homeBigPromo><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"><img src="/i/corp/bigPromo.jpg" border=0 /></A></td>
				<td class=homeRightPromos width="50%">
				<table width="170" border=0 cellpadding=0 cellspacing=0 align=right>
					<tr><td><img src="/i/corp/featClientsHead.gif" border=0 /></td></tr>
					<tr><td class=homeClientPromo><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp"><img src="/i/corp/promos/praxairNrodale.gif" border=0 /></A></td></tr>
					<tr><td><A href="/i/tournament/tco04/onsite_movies/rhughes.mov"><img src="/i/corp/promos/rhughesMovie.gif" alt="" border=0 /></A></td></tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
   </tr>
   <tr>
		<td>
		<table border=0 cellpadding=0 cellspacing=0 align=center width="100%">
			<tr>
				<td class=homeGutter width="49%">&#160;</td>

				<td class="homeLeftCol">
				<table border=0 cellpadding=0 cellspacing=0 align=center width=250>
					<tr>
						<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
						<td class=homeTitle><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class=homeTitleLink>Software</A></td>
					</tr>
					<tr>
						<td class=homeArrow>&#160;</td>
						<td class=homeText>
						<br/>
						<A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Component Catalogs</A><br/>
						Re-usable software components in the TopCoder Software catalogs drive down cost while increasing the level of quality and speed of delivery.
						<br/><br/>
						<A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/applications/index.jsp">Application Development</A><br/>
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
						<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=tces_home" class=homeTitleLink>Employment Services</A></td>
					</tr>
					<tr>
						<td class=homeArrow>&#160;</td>
						<td class=homeText>
						<br/>
						<A href="/corp/?module=Static&d1=corp&d2=tces_home">Sourcing</A><br/>
						TopCoder tournaments and private label events allow companies to rate and rank a large pool of candidates and hire the top performers.
						<br/><br/>
						<A href="/corp/?module=Static&d1=corp&d2=testing&d3=index">Screening</A><br/>
						The TopCoder Technical Assessment Tool offers a way to rate and rank candidates based on their problem solving skills and programming ability.
						<br/><br/>
						<A href="/corp/?module=Static&d1=corp&d2=placement&d3=index">Placement</A><br/>
						TopCoder works with companies to fill both full-time and contract positions. Clients provide us with a description of the position they need filled and we locate the most qualified members.
						<br/><br/>
						</td>
					</tr>
				</table>
				</td>

				<td class="homeRightCol">
				<table border=0 cellpadding=0 cellspacing=0 align=center width=250>
					<tr>
						<td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
						<td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class=homeTitleLink>Marketing Services</A></td>
					</tr>
					<tr>
						<td class=homeArrow>&#160;</td>
						<td class=homeText>
						<br/>
						<A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">Reaching the TopCoder Community</A><br/>
						TopCoder offers custom programs for technology vendors to increase awareness and adoption through our tournaments. Through our private label events we have the ability to integrate select tools to be used in competition, allowing companies to showcase their tools in software design and development processes.
						<br/><br/>
						</td>
					</tr>
				</table>
				</td>
				<td class=homeGutter width="49%">&#160;</td>
			</tr>
		</table>
	</tr>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>