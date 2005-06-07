<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% int termsId = ((Integer)request.getAttribute(Constants.TERMS_OF_USE_ID)).intValue();%>
<% String agreeProcessor = null;
    if (termsId == Constants.TCO05_ALGORITHM_TERMS_OF_USE_ID) agreeProcessor="TCO05AlgorithmTermsAgree";
    else if (termsId == Constants.TCO05_COMPONENT_TERMS_OF_USE_ID) agreeProcessor="TCO05ComponentTermsAgree";
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            <p class=bigTitle>Registration</p>

			<p align="left">To complete your registration for the 2005 TopCoder Open you must <b>read and agree to</b> the terms listed below.</p>

			<p align="center"><textarea name="terms" rows="20" cols="60" readonly wrap="off"><%=request.getAttribute("terms")%></textarea></p>

			<p align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=<%=agreeProcessor%>">I agree</a> to these terms and wish to participate in the 2005 TopCoder Open.

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
