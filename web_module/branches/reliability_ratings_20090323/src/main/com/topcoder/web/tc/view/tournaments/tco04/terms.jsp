<%@  page language="java"  %>
<%@ page import="com.topcoder.web.tc.Constants"%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<% int termsId = ((Integer)request.getAttribute(Constants.TERMS_OF_USE_ID)).intValue();%>
<% String agreeProcessor = null;
    if (termsId == Constants.TCO04_ALGORITHM_TERMS_OF_USE_ID) agreeProcessor="TCO04AlgorithmTermsAgree";
    else if (termsId == Constants.TCO04_COMPONENT_TERMS_OF_USE_ID) agreeProcessor="TCO04ComponentTermsAgree";
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>
<a name="top"></a>
<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="rules"/>
</jsp:include>

			<table width="500" align="center">
				<tr>
					<td>
						<p align="left">To complete your registration for the 2004 TopCoder Open you must <b>read and agree to</b> the terms listed below.</p>

         			<p align="center"><textarea name="terms" rows="20" cols="80" readonly ><%=request.getAttribute("terms")%></textarea></p>

         			<p align="center"><a href="<%=sessionInfo.getServletPath()%>?<%=Constants.MODULE_KEY%>=<%=agreeProcessor%>">I agree</a> to these terms and wish to participate in the 2004 TopCoder Open.
                     <br/><br/>
         		</td>
         	</tr>
         </table>





<jsp:include page="../../foot.jsp" />

</body>

</html>
