<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="nvidia"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
            <table width="510" border="0" cellpadding="15" cellspacing="0">
                <tr>
                    <td  colspan="2" align="center" width="480"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_banner.gif" alt="NVIDA" width="510" height="100" border="0" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" width="480"><img src="/i/tournament/tco03/sponsors/nvidia/nvidia_visualize.gif" alt="NVIDIA" width="510" height="18" border="0" />
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="bodyText" align="left" width="100%">
                     <p>Thank you for your job application.
                     <br><br>
                     If you have any questions or concerns, please feel free to email them to <A href="mailto:service@topcoder.com">service@topcoder.com</A>.
                     <br><br>
                     <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=nvidia">...back to sponsor page</A>
                     <br><br><br><br>
                     </p>
                     </td>
                     
                  </tr>
            </table>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="nvidia"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
