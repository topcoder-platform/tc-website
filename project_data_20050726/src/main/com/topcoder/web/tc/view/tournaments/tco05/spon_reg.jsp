<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
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
<br /><br />
<%--
Registration is not currently open, the registration period is from August 1, 2005 9:00 AM EDT to August 16, 2005 9:00 AM EDT.
--%>
<form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="regForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCO05SponsorTermsAgree"/>
    <b>Company name:</b>&#160;&#160;
    <tc-webtag:errorIterator id="err" name="<%=Constants.COMPANY_NAME%>"><%=err%><br /></tc-webtag:errorIterator>
    <br />
    <tc-webtag:textInput name="<%=Constants.COMPANY_NAME%>" size="30" maxlength="100"/>
    <br /><br />
    <div align="center">
    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Terms&<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.TCO05_SPONSOR_TERMS_ID%>"></iframe>
    <br /><br />
    <A href="Javascript:document.regForm.submit();">I Agree</A>
    <br /><br />
</form>
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
