<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="yahoo"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td align="center">
			<table width="510" border=0 cellpadding=20 cellspacing=0>
				<tr>
					<td class="bodyText">
                    <a href="/?t=sponsor&c=link&link=http://careers.yahoo.com/&refer=tco_minisite" target="_blank"><img src="/i/tournament/tco04/yahoo_header.gif" width="510" height="75" border="0" alt="Yahoo!" /></a>
                    <p class=pageTitle>Yahoo! Positions Available</p>
					<ul>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo&d4=ty_sde">Technical Yahoo! - Software Development Engineers</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo&d4=ty_mea">Technical Yahoo! - Mail Engineers & Architects & SW Mgrs & QA</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo&d4=ty_saqe">Technical Yahoo! - Search, Architect, QA Engineers</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo&d4=y_lo">Yahoo! Inc. - Launch & Overture</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=yahoo&d4=y_ye">Yahoo! Inc. - positions available throughout Yahoo! Engineering</a></li>
					</ul>
				   </td>
   				</tr>
   			</table>

   			<p></p>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>       	
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="yahoo"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../../foot.jsp" />

</body>

</html>
