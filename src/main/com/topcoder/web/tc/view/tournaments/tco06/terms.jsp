<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% int termsId = ((Integer)request.getAttribute(Constants.TERMS_OF_USE_ID)).intValue();%>
<% String agreeProcessor = null;
    if (termsId == Constants.TCO06_ALGORITHM_TERMS_OF_USE_ID) agreeProcessor="TCO06AlgorithmTermsAgree";
    else if (termsId == Constants.TCO06_COMPONENT_TERMS_OF_USE_ID) agreeProcessor="TCO06ComponentTermsAgree";
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="rules"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            <p class=bigTitle>Registration</p>

			<p align="left">To complete your registration for the 2006 TopCoder Open you must <b>read and agree to</b> the terms listed below.</p>

            <div align="center">
                <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tco06&d3=terms_content&<%=Constants.TERMS_OF_USE_ID%>=<%=termsId%>"></iframe>
            </div>

			<p align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=<%=agreeProcessor%>">I agree</a> to these terms and wish to participate in the 2006 TopCoder Open.

			</div>
		</td>

<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
