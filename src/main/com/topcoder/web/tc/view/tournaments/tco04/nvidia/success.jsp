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
<jsp:param name="tabLev3" value="nvidia"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td align="center">
			<table width="510" border=0 cellpadding=20 cellspacing=0>
				<tr>
					<td class="bodyText">
                    <A href="/?t=sponsor&c=link&link=http://www.nvidia.com/page/home&refer=tco_minisite" target="_blank"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_banner.gif" alt="NVIDA" width="510" height="100" border="0" /></A>
                    <p><span class="bodySubtitle">Thank you for applying to NVIDIA.</span></p>
					<p>Click <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=nvidia&d4=joblisting">here</a> to view more jobs at NVIDIA.</p>
					
				   </td>
   				</tr>
   			</table>

   			<p></p>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>       	
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="nvidia"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../../foot.jsp" />

</body>

</html>
