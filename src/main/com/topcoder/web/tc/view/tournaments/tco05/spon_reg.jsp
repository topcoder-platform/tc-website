<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
<span class="bigTitle">Registration</span>
<br><br>
<b>Company name:</b>&#160;&#160;
<input type="text" name="" size="30" maxlength="100" onKeyPress="" />
<br><br>
<div align="center">
<iframe width="590" height="300" marginWidth="5" src="/i/tournament/tco05/reg.html"></iframe>
<br><br>
<A href="#">I Agree</A>
<br><br>
</div>
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
