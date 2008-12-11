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
<jsp:param name="tabLev3" value="microsoft"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td align="center">
			<table width="510" border=0 cellpadding=20 cellspacing=0>
				<tr>
					<td class="bodyText">
        			<img src="/i/tournament/tco04/microsoft_header.jpg" width=510 height=136 border=0>
					
					<p class=pageTitle>Microsoft Positions Available</p>
					<p>It's amazing what you can do when you have the right resources. Our workplace 
        				is a fun and challenging environment - one powered by innovative people a lot like you.</p>
					<ul>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=col_progmanager">Program Manager</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=col_softdeseng">Software Design Engineer</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=col_sdet">Software Design Engineer in Test</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=col_ste">Software Test Engineer</a></li>
						<li><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=microsoft&d4=col_tpm">Technical Product Manager</a></li>
					</ul>
   					</td>
   				</tr>
   			</table>
   			<p></p>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>       	
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="microsoft"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../../foot.jsp" />

</body>

</html>
