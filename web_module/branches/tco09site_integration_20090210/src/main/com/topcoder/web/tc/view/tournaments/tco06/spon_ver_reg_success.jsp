<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_ver_links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
	<tr valign="top">
		<td valign="top" align="center">
		<div class="bodySpacer">
            
<span class="bigTitle">Registration</span>
<br><br>
You have successfully registered for the sponsor track of the 2006 TopCoder Open.
        </div>
		</td>
        
         
<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br>
<img src="/i/tournament/tco06/verisign_right.gif" alt="Verisign" border="0" /><br>
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br>
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
</td>
		
	</tr>
	
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
