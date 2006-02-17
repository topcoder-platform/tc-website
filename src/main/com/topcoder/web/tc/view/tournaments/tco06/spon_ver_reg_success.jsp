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
You have successfully registered for the VeriSign Internal Competition.
        </div>
		</td>
        
         
<!-- Right Column-->
<td width="180" align="right" style="padding: 0px 15px 0px 0px;">
<jsp:include page="right_ver.jsp" />

</td>
		
	</tr>
	
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
