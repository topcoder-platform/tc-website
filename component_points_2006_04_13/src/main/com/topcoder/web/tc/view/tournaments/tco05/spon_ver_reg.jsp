<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_ver_links.jsp" >
<jsp:param name="tabLev2" value="registration"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">

<span class="bigTitle">Registration</span>
<br /><br />
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCO05VerisignTermsAgree"/>
    <tc-webtag:hiddenInput name="<%=Constants.COMPANY_NAME%>" value="VeriSign"/>
    <div align="center">
    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_reg_content"></iframe>
    <br /><br />
    <A href="Javascript:document.regForm.submit();">I Agree</A>
    <br /><br />
        </div>
</form>
		</td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/verisign_right.gif" alt="Verisign" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<jsp:include page="../../calendar.jsp" />
</td>

	</tr>

</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
