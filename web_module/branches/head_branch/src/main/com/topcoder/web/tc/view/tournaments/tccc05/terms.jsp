<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% int termsId = ((Integer)request.getAttribute(Constants.TERMS_OF_USE_ID)).intValue();%>
<% String agreeProcessor = null;
    if (termsId == Constants.TCCC05_ALGORITHM_TERMS_OF_USE_ID) agreeProcessor="TCCC05AlgorithmTermsAgree";
    else if (termsId == Constants.TCCC05_COMPONENT_TERMS_OF_USE_ID) agreeProcessor="TCCC05ComponentTermsAgree";
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
</head>
<body>
<a name="top"></a>
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

			<p align="left">To complete your registration for the 2005 TopCoder Collegiate Challenge you must <b>read and agree to</b> the terms listed below.</p>

			<p align="center"><textarea name="terms" rows="20" cols="60" readonly wrap="off"><%=request.getAttribute("terms")%></textarea></p>

			<p align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=<%=agreeProcessor%>">I agree</a> to these terms and wish to participate in the 2005 TopCoder Collegiate Challenge.

			</div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
